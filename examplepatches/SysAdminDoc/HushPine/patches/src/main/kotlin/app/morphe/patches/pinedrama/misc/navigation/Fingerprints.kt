/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.patches.pinedrama.misc.navigation

import app.morphe.patcher.Fingerprint
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val MAIN_ACTIVITY = "Lcom/ss/android/ugc/aweme/main/MainActivity;"

/**
 * The main activity's onNewIntent, which a link reaches while the app is already running. The
 * feed lock reads it to let one linked video through. Not obfuscated: both the class and the
 * lifecycle method keep their names, and the method takes the Intent in p1.
 */
internal object MainNewIntentFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    name = "onNewIntent",
    returnType = "V",
    parameters = listOf("Landroid/content/Intent;"),
)

internal const val MAIN_ACTIVITY_ASSEM = "Lcom/ss/android/ugc/aweme/main/assems/MainActivityBusinessAssem;"
internal const val PUSH_TAB_EXTRA = "com.ss.android.ugc.aweme.intent.extra.EXTRA_AWEME_PUSH_TAB"
private const val INTENT = "Landroid/content/Intent;"

/**
 * The main activity's onCreate, where a cold start works out the tab it opens on: the tab a
 * notification names ([PUSH_TAB_EXTRA]), else a saved one, else one PineDrama's landing rules pick,
 * else "HOME". Every one of those paths meets at a comparison with "HOME", and the tag ends up in
 * the cold-boot tab switch together with the activity's intent.
 */
internal object ColdStartTabFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY_ASSEM,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    strings = listOf(PUSH_TAB_EXTRA),
    custom = { method, _ -> method.coldStartTab() != null },
)

/**
 * Where the start page asks in [ColdStartTabFingerprint]'s method: right after the
 * `const-string "HOME"` every path meets at ([insertAt]), with the register holding the tag and
 * the one holding the activity. Two things say that register holds the activity there: the
 * cold-boot switch's intent comes from its getIntent(), and PineDrama passes it to the splash theme
 * restore right after the comparison.
 */
internal class ColdStartTab(val insertAt: Int, val tag: Int, val activity: Int)

internal fun Method.coldStartTab(): ColdStartTab? {
    val instructions = implementation?.instructions?.toList() ?: return null
    val switchAt = instructions.indices.firstOrNull { i ->
        i >= 3 && instructions[i].opcode == Opcode.INVOKE_VIRTUAL &&
            instructions[i].getReference<MethodReference>()?.let { call ->
                val parameters = call.parameterTypes.map(CharSequence::toString)
                call.definingClass == definingClass && call.returnType == "V" && parameters.size == 3 &&
                    parameters[0] == INTENT && parameters[2] == "Ljava/lang/String;"
            } == true &&
            instructions[i - 1].opcode == Opcode.SGET_OBJECT &&
            instructions[i - 1].getReference<FieldReference>()?.name == "COLD_BOOT"
    } ?: return null
    val switch = instructions[switchAt] as FiveRegisterInstruction
    if (switch.registerCount != 4) return null
    val intentResult = instructions[switchAt - 2]
    if (intentResult.opcode != Opcode.MOVE_RESULT_OBJECT) return null
    if ((intentResult as OneRegisterInstruction).registerA != switch.registerD) return null
    val getIntent = instructions[switchAt - 3]
    val readsIntent = getIntent.opcode == Opcode.INVOKE_VIRTUAL && getIntent.getReference<MethodReference>()?.let {
        it.name == "getIntent" && it.returnType == INTENT && it.parameterTypes.isEmpty()
    } == true
    if (!readsIntent) return null
    val activity = (getIntent as FiveRegisterInstruction).registerC
    val tag = switch.registerF
    val join = instructions.indices.firstOrNull { i ->
        i + 4 < switchAt && instructions[i].opcode == Opcode.CONST_STRING &&
            instructions[i].getReference<StringReference>()?.string == "HOME" &&
            instructions[i + 1].opcode == Opcode.INVOKE_STATIC &&
            (instructions[i + 1] as FiveRegisterInstruction).let { compare ->
                compare.registerCount == 2 && compare.registerD == tag &&
                    compare.registerC == (instructions[i] as OneRegisterInstruction).registerA
            }
    } ?: return null
    val restore = instructions[join + 4]
    val restoresTheActivity = restore.opcode == Opcode.INVOKE_STATIC &&
        (restore as FiveRegisterInstruction).registerCount == 2 && restore.registerC == activity &&
        restore.getReference<MethodReference>()?.let {
            it.returnType == "V" && it.parameterTypes.map(CharSequence::toString).getOrNull(1) == "Z"
        } == true
    if (!restoresTheActivity) return null
    // A jump to the comparison itself would skip anything put in front of it.
    if (join + 1 in branchTargets()) return null
    // The hook hands over the saved state from p1, the method's last register, so nothing before
    // it may write that register, a wide write into the one below included.
    val savedState = implementation!!.registerCount - 1
    val overwritten = instructions.take(join + 1).any { instruction ->
        if (!instruction.opcode.setsRegister()) return@any false
        val written = (instruction as? OneRegisterInstruction)?.registerA ?: return@any false
        written == savedState || (instruction.opcode.setsWideRegister() && written + 1 == savedState)
    }
    if (overwritten) return null
    return ColdStartTab(join + 1, tag, activity)
}

/** The indexes of every instruction a branch, a switch case or an exception handler can land on. */
internal fun Method.branchTargets(): Set<Int> {
    val implementation = implementation ?: return emptySet()
    val instructions = implementation.instructions.toList()
    val addresses = IntArray(instructions.size)
    var address = 0
    instructions.forEachIndexed { index, instruction ->
        addresses[index] = address
        address += instruction.codeUnits
    }
    val indexAt = addresses.withIndex().associate { it.value to it.index }
    val targets = HashSet<Int>()
    instructions.forEachIndexed { index, instruction ->
        if (instruction !is OffsetInstruction) return@forEachIndexed
        val target = addresses[index] + instruction.codeOffset
        if (instruction.opcode == Opcode.PACKED_SWITCH || instruction.opcode == Opcode.SPARSE_SWITCH) {
            val payload = instructions[indexAt.getValue(target)] as SwitchPayload
            payload.switchElements.forEach { element -> indexAt[addresses[index] + element.offset]?.let(targets::add) }
        } else {
            indexAt[target]?.let(targets::add)
        }
    }
    implementation.tryBlocks.forEach { block ->
        block.exceptionHandlers.forEach { handler -> indexAt[handler.handlerCodeAddress]?.let(targets::add) }
    }
    return targets
}

internal const val HOME_VIEW_PAGER_ASSEM = "Lcom/ss/android/ugc/aweme/main/assems/mainfragment/HomeViewPagerAssem;"
internal const val HOME_PAGE_EX_SERVICE = "Lcom/ss/android/ugc/aweme/homepage/IHomePageExService;"
internal const val HOX = "Lcom/bytedance/hox/Hox;"

/**
 * The home pager's view setup, where it picks the feed tab across the top it opens on. For a
 * signed-in account outside teen mode that is the tab PineDrama's home page service names, else
 * "For You", handed to Hox's tab switch by its tag. The start page answers there.
 */
internal object FirstTopTabFingerprint : Fingerprint(
    definingClass = HOME_VIEW_PAGER_ASSEM,
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    strings = listOf("For You"),
    custom = { method, _ -> method.firstTopTab() != null },
)

/** Where the home pager opens its first feed tab: the tab switch's index and the register with the tag. */
internal class FirstTopTab(val switchAt: Int, val tag: Int)

/**
 * The first tab switch in [FirstTopTabFingerprint]'s method: the call on Hox that takes a Bundle,
 * the tab's tag and a flag, a few steps after PineDrama asks its home page service for a default
 * tab and moves a non-null answer into the register "For You" was loaded into. Null when any of
 * that no longer holds, so the patch stops instead of handing over the wrong register.
 */
internal fun Method.firstTopTab(): FirstTopTab? {
    val instructions = implementation?.instructions?.toList() ?: return null
    val service = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_INTERFACE && instruction.getReference<MethodReference>()?.let {
            it.definingClass == HOME_PAGE_EX_SERVICE && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
        } == true
    }
    if (service < 0 || instructions.getOrNull(service + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT) return null
    val answer = (instructions[service + 1] as OneRegisterInstruction).registerA
    val switchAt = (service + 2 until minOf(instructions.size, service + 6)).firstOrNull { index ->
        val instruction = instructions[index]
        instruction.opcode == Opcode.INVOKE_VIRTUAL && instruction.getReference<MethodReference>()?.let {
            it.definingClass == HOX && it.returnType == "V" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/os/Bundle;", "Ljava/lang/String;", "Z")
        } == true
    } ?: return null
    val tag = (instructions[switchAt] as FiveRegisterInstruction).registerE
    val answered = instructions.subList(service + 2, switchAt).any {
        it.opcode == Opcode.MOVE_OBJECT && (it as TwoRegisterInstruction).registerA == tag && it.registerB == answer
    }
    val defaulted = instructions.subList(0, service).any {
        it.opcode == Opcode.CONST_STRING && (it as OneRegisterInstruction).registerA == tag &&
            it.getReference<StringReference>()?.string == "For You"
    }
    return if (answered && defaulted) FirstTopTab(switchAt, tag) else null
}

internal const val SHARE_PREF_CACHE = "Lcom/ss/android/ugc/aweme/app/SharePrefCache;"
internal const val TOP_TAB_PROTOCOL = "Lcom/bytedance/tiktok/homepage/mainfragment/TopTabProtocol;"

/**
 * The home pager's default page, which it moves to once the first frame is up and again when
 * its tab list is set: the tab PineDrama's home page service names, Following when PineDrama's own
 * "change follow tab" preference is on for a signed-in account, else the tab its strip shows,
 * found among the top tabs by tag. A sibling method reads the same preference for reports, but
 * never looks at the strip's tabs.
 */
internal object DefaultPageFingerprint : Fingerprint(
    definingClass = HOME_VIEW_PAGER_ASSEM,
    returnType = "I",
    parameters = listOf(),
    custom = { method, _ ->
        method.followTabChoice() != null && method.implementation!!.instructions.any {
            it.getReference<MethodReference>()?.let { reference ->
                reference.definingClass == TOP_TAB_PROTOCOL && reference.name == "getTag"
            } == true
        }
    },
)

/** Where the default page has read PineDrama's "change follow tab" preference: the next index and the register. */
internal class FollowTabChoice(val insertAt: Int, val register: Int)

/**
 * The read of PineDrama's "change follow tab" preference in [DefaultPageFingerprint]'s method: its
 * getter on SharePrefCache, the unboxing a few steps on, and the register the answer lands in.
 * Null when the answer isn't moved into a register or a jump lands right after it.
 */
internal fun Method.followTabChoice(): FollowTabChoice? {
    val instructions = implementation?.instructions?.toList() ?: return null
    val read = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_VIRTUAL && instruction.getReference<MethodReference>()?.let {
            it.definingClass == SHARE_PREF_CACHE && it.name == "getIsChangeFollowTab" && it.parameterTypes.isEmpty()
        } == true
    }
    if (read < 0) return null
    val unbox = (read + 1 until minOf(instructions.size, read + 8)).firstOrNull { index ->
        instructions[index].getReference<MethodReference>()?.let {
            it.definingClass == "Ljava/lang/Boolean;" && it.name == "booleanValue"
        } == true
    } ?: return null
    val result = instructions.getOrNull(unbox + 1)
    if (result?.opcode != Opcode.MOVE_RESULT) return null
    val insertAt = unbox + 2
    if (insertAt >= instructions.size || insertAt in branchTargets()) return null
    return FollowTabChoice(insertAt, (result as OneRegisterInstruction).registerA)
}
