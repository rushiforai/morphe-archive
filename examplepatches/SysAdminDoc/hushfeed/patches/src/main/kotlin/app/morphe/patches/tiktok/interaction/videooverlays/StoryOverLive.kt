/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.interaction.videooverlays

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.misc.theme.declaredVersions
import app.morphe.util.addInstruction
import app.morphe.util.addInstructionsWithLabels
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val STORY_OVER_LIVE_PATCH = "Remove avatar rings"
private const val STORY_OVER_LIVE = "Lapp/morphe/extension/tiktok/feed/StoryOverLive;"
private const val AVATAR_COMPONENT_VIEW = "Lcom/ss/android/ugc/aweme/avatar/AvatarComponentView;"

/**
 * The tap on the picture at the top of a creator's profile (#233), a static `(listener, View)V`
 * in one of R8's merged click listener classes. It logs "click_head", then asks the picture's
 * AvatarComponentView for its map of what it shows and opens the LIVE when that holds LIVE
 * (the "c68718.d0" jump token), before it ever looks for a story.
 */
internal object ProfileAvatarClickFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("click_head", "c68718.d0"),
    custom = { method, _ -> storyOverLiveSite(method) != null },
)

/** Where the hook goes: the LIVE key's load, and the map and scratch registers it uses. */
internal data class StoryOverLiveSite(val index: Int, val map: Int, val scratch: Int, val view: Int)

/**
 * The `sget-object LIVE` that the LIVE check's `Map.containsKey` takes, in a static method whose
 * last parameter is the tapped View, on the map that `getCurrentActiveBusiness` handed back.
 * Null when the method isn't that shape, or when the View's register is written before the check.
 */
internal fun storyOverLiveSite(method: Method): StoryOverLiveSite? {
    if (!AccessFlags.STATIC.isSet(method.accessFlags)) return null
    if (method.parameterTypes.lastOrNull()?.toString() != "Landroid/view/View;") return null
    val implementation = method.implementation ?: return null
    val code = implementation.instructions.toList()
    val view = implementation.registerCount - 1
    for (index in 0 until code.size - 1) {
        val load = code[index]
        if (load.opcode != Opcode.SGET_OBJECT) continue
        val key = load.getReference<FieldReference>() ?: continue
        if (key.name != "LIVE" || key.type != key.definingClass) continue
        val check = code[index + 1]
        val contains = check.getReference<MethodReference>() ?: continue
        if (check.opcode != Opcode.INVOKE_INTERFACE || contains.definingClass != "Ljava/util/Map;" ||
            contains.name != "containsKey"
        ) {
            continue
        }
        val call = check as FiveRegisterInstruction
        val scratch = (load as OneRegisterInstruction).registerA
        if (call.registerCount != 2 || call.registerD != scratch || call.registerC == scratch) continue
        if (!readsBusinessInto(code, index, call.registerC)) continue
        if (code.take(index).any { it.writes(view) }) return null
        return StoryOverLiveSite(index, call.registerC, scratch, view)
    }
    return null
}

/** Whether the map register last came from AvatarComponentView's getCurrentActiveBusiness. */
private fun readsBusinessInto(code: List<Instruction>, before: Int, map: Int): Boolean {
    for (index in before - 1 downTo 1) {
        val instruction = code[index]
        if (!instruction.writes(map)) continue
        if (instruction.opcode != Opcode.MOVE_RESULT_OBJECT) return false
        val call = code[index - 1].getReference<MethodReference>() ?: return false
        return call.definingClass == AVATAR_COMPONENT_VIEW && call.name == "getCurrentActiveBusiness" &&
            call.parameterTypes.isEmpty() && call.returnType == "Ljava/util/Map;"
    }
    return false
}

private fun Instruction.writes(register: Int) = opcode.setsRegister() &&
    (this as? OneRegisterInstruction)?.registerA.let {
        it == register || (opcode.setsWideRegister() && it == register - 1)
    }

/**
 * Hooks the profile picture's tap for the Story first switch (#233) and says whether the hook
 * went in. Required on a declared build, where the anchors test holds it, and left out with a
 * note on any other, so a reworked profile there doesn't take the rings down with it. The row
 * shows only when the hook went in.
 */
internal fun BytecodePatchContext.hookStoryOverLiveOn(versionName: String): Boolean {
    if (!hookStoryOverLive(versionName)) return false
    SettingsStatusLoadFingerprint.method.addInstruction(
        0,
        "invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableStoryOverLive()V",
    )
    return true
}

/** The hook alone, without the settings flag that shows the row, so a probe patch can run it. */
internal fun BytecodePatchContext.hookStoryOverLive(versionName: String): Boolean {
    val tap = if (versionName in declaredVersions()) {
        ProfileAvatarClickFingerprint.method
    } else {
        ProfileAvatarClickFingerprint.methodOrNull
    }
    if (tap == null) {
        println("[$STORY_OVER_LIVE_PATCH] Left out the Story first switch on $versionName: no profile picture tap found.")
        return false
    }
    tap.openStoryBeforeLive()
    return true
}

/**
 * Asks StoryOverLive ahead of the LIVE check, with the map and the tapped View. A yes means the
 * Story opened and the tap returns; a no runs TikTok's own check from the LIVE key's load on. The
 * scratch register is the one that load writes next, so nothing live is overwritten.
 */
internal fun MutableMethod.openStoryBeforeLive() {
    val site = storyOverLiveSite(this)
        ?: throw PatchException("$STORY_OVER_LIVE_PATCH: the profile picture's LIVE check is gone.")
    addInstructionsWithLabels(
        site.index,
        """
            move-object/from16 v${site.scratch}, v${site.view}
            invoke-static { v${site.map}, v${site.scratch} }, $STORY_OVER_LIVE->openStory(Ljava/util/Map;Landroid/view/View;)Z
            move-result v${site.scratch}
            if-eqz v${site.scratch}, :stock
            return-void
        """,
        ExternalLabel("stock", getInstruction(site.index)),
    )
}
