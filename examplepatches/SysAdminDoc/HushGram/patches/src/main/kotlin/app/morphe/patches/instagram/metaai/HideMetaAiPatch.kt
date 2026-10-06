/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.metaai

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.instagram.feed.filterParsedFeedItems
import app.morphe.patches.instagram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.instagram.misc.extension.classesHolding
import app.morphe.patches.instagram.misc.extension.enableStatus
import app.morphe.patches.instagram.misc.extension.instagramExtensionPatch
import app.morphe.patches.instagram.misc.extension.requireStatusMethod
import app.morphe.patches.instagram.misc.flags.FlagRead
import app.morphe.patches.instagram.misc.flags.answerFlagReads
import app.morphe.patches.instagram.misc.flags.findFlagReads
import app.morphe.patches.instagram.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PATCH = "Hide Meta AI"
private const val META_AI = "$EXTENSION_PACKAGE/metaai/MetaAi;"
internal const val SEARCH_FLAG = "$META_AI->searchFlag(I)Z"
internal const val META_AI_FILTER = "$META_AI->filter(Ljava/lang/Object;)Ljava/lang/Object;"
internal const val FOLLOW_UP_BAR = "$META_AI->followUpBar(Landroid/view/View;)Landroid/view/View;"
internal const val HOME_BUTTON = "$META_AI->homeButton(Ljava/lang/String;)Ljava/lang/String;"

/** Home's top bar setup holds both on 449, and its Meta AI button is the second one's case. */
internal val HOME_BAR_SETUP = listOf("MainFeedActionBarDelegate:configureActionBar", "meta_ai")
private const val ITERATOR_NEXT = "Ljava/util/Iterator;->next()Ljava/lang/Object;"
private const val STRING_LENGTH = "Ljava/lang/String;->length()I"
private const val STRING_EQUALS = "Ljava/lang/String;->equals(Ljava/lang/Object;)Z"

/** Two strings only the search results page's bottom bar setup holds on 449. */
internal val FOLLOW_UP_SETUP = listOf("keyboardHeightChangeDetector", "bottomSearchSuggestionPillsHelper")
private const val FIND_VIEW = "Landroid/view/View;->findViewById(I)Landroid/view/View;"
private const val INFLATE = "Landroid/view/ViewStub;->inflate()Landroid/view/View;"
private const val VIEW_STUB = "Landroid/view/ViewStub;"

/** How far before the stub's lookup the check that it's there may come: 449 puts one call between them. */
private const val CHECK_WITHIN = 6

/**
 * The server flags the search switch answers off on Instagram 449. Three decide whether a search bar
 * offers Meta AI: the Search tab's, which also covers its results and Meta AI's answers there, the
 * messages inbox's "ask Meta AI" bar, and the Meta AI ring at the end of the inbox's bar. The fourth
 * puts a Meta AI chats ("hatch") button in Home's top bar when the server's list has no messages
 * button, and the same item in the bar's settings list.
 */
internal val SEARCH_FLAGS = listOf(0x81068600111f6bL, 0x8104190006113aL, 0x810417001b1130L, 0x8116ad0001713eL)

/** Meta AI's feed item kinds: Vibes videos, Meta AI chats and Imagine pictures of you. */
internal val META_AI_UNITS = listOf("VIBES_IN_FEED_UNIT", "HATCH_IMMERSIVE_IN_FEED_UNIT", "MEMU_IN_FEED_UNIT")

@Suppress("unused")
val hideMetaAiPatch = bytecodePatch(
    name = "Hide Meta AI",
    description = "Takes Meta AI out of the search bars, in the Search tab and at the top of your messages, so they " +
        "search the plain way, drops the Ask a follow-up bar under search results and Meta AI's buttons in Home's " +
        "top bar and the message composer, hides its optional row in your inbox, and removes Meta AI's posts from your home feed. " +
        "Search and posts have separate switches. The search switch applies after Instagram restarts.",
) {
    category("Interface")
    dependsOn(settingsPatch, instagramExtensionPatch)
    compatibleWith(*AppCompatibilities.instagram())

    execute {
        // Every read is found and checked, and SettingsStatus is confirmed to carry the switch's
        // method, before any hook changes an instruction.
        requireStatusMethod("metaAi")
        val reads = findSearchFlagReads()
        val followUp = findFollowUpBarCheck()
        val homeButtons = findHomeButtonNames()
        val composer = findComposerButtonVisibility()
        val inbox = findOptionalInboxRow()
        filterParsedFeedItems(PATCH, META_AI_FILTER, META_AI_UNITS)
        answerSearchFlagReads(reads)
        dropFollowUpBar(followUp)
        dropHomeButton(homeButtons)
        holdComposerButtons(composer)
        holdOptionalInboxRow(inbox)
        enableStatus("metaAi")
    }
}

/**
 * Every place the app loads one of [SEARCH_FLAGS] and reads it as a boolean (see [findFlagReads]).
 * Fails when a flag is never read, or is loaded for any other use.
 */
internal fun BytecodePatchContext.findSearchFlagReads(): List<FlagRead> = findFlagReads(PATCH, SEARCH_FLAGS)

/** Passes each read's answer through MetaAi.searchFlag, right after its move-result. */
internal fun BytecodePatchContext.answerSearchFlagReads(reads: List<FlagRead>) = answerFlagReads(reads, SEARCH_FLAG)

/** A value one of the hooks passes through: the method, and the index and register of the instruction that last sets it. */
internal class HookSite(
    val type: String,
    val name: String,
    val parameters: List<String>,
    val returnType: String,
    val moveResult: Int,
    val register: Int,
)

/**
 * The check, in the search results page's bottom bar setup (the one method holding
 * [FOLLOW_UP_SETUP]), that the bar's stub is in the page: a findViewById whose answer is tested for
 * null before a static lookup of the same id hands the stub to inflate(). A null there leaves the
 * page without the bar, the way it is when the layout has no stub, and every later use of the bar
 * checks for that. The pills inside the bar come from a second stub, found inside the bar through a
 * findViewById and a cast, which is never inflated once the bar isn't.
 */
internal fun BytecodePatchContext.findFollowUpBarCheck(): HookSite {
    val setups = mutableListOf<Pair<ClassDef, Method>>()
    classesHolding(*FOLLOW_UP_SETUP.toTypedArray()).forEach { classDef ->
        classDef.methods.forEach { method ->
            if (method.strings().containsAll(FOLLOW_UP_SETUP)) setups += classDef to method
        }
    }
    val (classDef, method) = setups.singleOrNull()
        ?: refuse("${setups.size} methods hold ${FOLLOW_UP_SETUP.joinToString(" and ")}, not one")
    val where = "${classDef.type}->${method.name}"
    val code = method.implementation!!.instructions.toList()
    val lookups = code.indices.filter { index ->
        val call = code[index].methodReference() ?: return@filter false
        code[index].opcode == Opcode.INVOKE_STATIC && call.returnType == VIEW_STUB &&
            call.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/View;", "I") &&
            code.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
            code.getOrNull(index + 2)?.methodReference()?.toString() == INFLATE
    }
    val lookup = lookups.singleOrNull() ?: refuse("$where looks up a stub to inflate ${lookups.size} times, not once")
    val find = (lookup - 1 downTo maxOf(0, lookup - CHECK_WITHIN))
        .firstOrNull { code[it].methodReference()?.toString() == FIND_VIEW }
        ?: refuse("$where inflates its stub without checking it's there")
    if (code[find].arguments() != code[lookup].arguments()) refuse("$where checks one view and inflates another")
    val result = code[find + 1]
    if (result.opcode != Opcode.MOVE_RESULT_OBJECT) refuse("$where drops the check's answer")
    val register = (result as OneRegisterInstruction).registerA
    val test = code[find + 2]
    if (test.opcode != Opcode.IF_EQZ || (test as OneRegisterInstruction).registerA != register) {
        refuse("$where doesn't test the stub for null")
    }
    return HookSite(
        classDef.type, method.name, method.parameterTypes.map(CharSequence::toString), method.returnType,
        find + 1, register,
    )
}

/** Passes the stub check's answer through MetaAi.followUpBar, right after its move-result. */
internal fun BytecodePatchContext.dropFollowUpBar(check: HookSite) = passThrough(check, FOLLOW_UP_BAR)

/**
 * Where Home's top bar setup (the one method holding [HOME_BAR_SETUP]) takes each button name from
 * the server's list: an Iterator.next() cast to String, tested for null and then for an empty name,
 * the name the "meta_ai" case compares. A null there is skipped like an empty name, so the bar is
 * built without that button. Another loop in the method, over the names the bar ended up with, casts
 * them without the null test.
 */
internal fun BytecodePatchContext.findHomeButtonNames(): HookSite {
    val setups = mutableListOf<Pair<ClassDef, Method>>()
    classesHolding(*HOME_BAR_SETUP.toTypedArray()).forEach { classDef ->
        classDef.methods.forEach { method ->
            if (method.strings().containsAll(HOME_BAR_SETUP)) setups += classDef to method
        }
    }
    val (classDef, method) = setups.singleOrNull()
        ?: refuse("${setups.size} methods hold ${HOME_BAR_SETUP.joinToString(" and ")}, not one")
    val where = "${classDef.type}->${method.name}"
    val code = method.implementation!!.instructions.toList()
    val casts = code.indices.filter { index ->
        if (code[index].opcode != Opcode.CHECK_CAST || index < 2) return@filter false
        val register = (code[index] as OneRegisterInstruction).registerA
        val test = code.getOrNull(index + 1)
        code[index - 2].methodReference()?.toString() == ITERATOR_NEXT &&
            code[index - 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
            (code[index - 1] as OneRegisterInstruction).registerA == register &&
            ((code[index] as ReferenceInstruction).reference.toString() == "Ljava/lang/String;") &&
            test?.opcode == Opcode.IF_EQZ && (test as OneRegisterInstruction).registerA == register &&
            code.getOrNull(index + 2)?.methodReference()?.toString() == STRING_LENGTH &&
            code[index + 2].arguments() == listOf(register)
    }
    val cast = casts.singleOrNull() ?: refuse("$where takes ${casts.size} button names from a list, not one")
    val register = (code[cast] as OneRegisterInstruction).registerA
    val comparedToMetaAi = code.indices.any { index ->
        val name = ((code[index] as? ReferenceInstruction)?.reference as? StringReference)?.string
        name == "meta_ai" && code.getOrNull(index + 1)?.methodReference()?.toString() == STRING_EQUALS &&
            code[index + 1].arguments() == listOf(register, (code[index] as OneRegisterInstruction).registerA)
    }
    if (!comparedToMetaAi) refuse("$where never compares the name it takes with \"meta_ai\"")
    return HookSite(
        classDef.type, method.name, method.parameterTypes.map(CharSequence::toString), method.returnType,
        cast, register,
    )
}

/** Passes each of Home's button names through MetaAi.homeButton, right after its cast. */
internal fun BytecodePatchContext.dropHomeButton(names: HookSite) = passThrough(names, HOME_BUTTON)

/** Puts [hook] on [site]'s register right after the instruction that sets it, and the answer back in it. */
private fun BytecodePatchContext.passThrough(site: HookSite, hook: String) {
    val method = mutableClassDefBy(site.type).methods.single {
        it.name == site.name && it.returnType == site.returnType &&
            it.parameterTypes.map(CharSequence::toString) == site.parameters
    }
    method.addInstructions(
        site.moveResult + 1,
        """
            invoke-static/range { v${site.register} .. v${site.register} }, $hook
            move-result-object v${site.register}
        """,
    )
}

private fun Method.strings(): Set<String> = implementation?.instructions
    ?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }?.toSet() ?: emptySet()

private fun Instruction.methodReference(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

/** The registers an invoke passes, in order. */
private fun Instruction.arguments(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> emptyList()
}

private fun refuse(detail: String): Nothing = throw PatchException("$PATCH: $detail")
