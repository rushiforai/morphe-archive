/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.reactions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val REACTION_EFFECTS = "$EXTENSION_PACKAGE/misc/ReactionEffects;"
internal const val ANIMATIONS_KEY = "view_animations"

@Suppress("unused")
val reactionEffectsOffPatch = bytecodePatch(
    name = "Turn off reaction effects",
    description = "Adds a switch, off by default, that stops the burst and fly-in effect Telegram plays when someone reacts. The reaction still shows on the message.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val show = resolveReactionEffectsOff()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        insertEffectSkip(MutableMethod(ImmutableMethod.of(show)))
        insertEffectSkip(show)
        enableStatus("reactionEffectsOff")
    }
}

/** The extension answers first, and a skip returns the way Telegram does with animations off. */
internal fun insertEffectSkip(target: MutableMethod) {
    target.addInstructionsWithLabels(0, """
        invoke-static {}, $REACTION_EFFECTS->skipped()Z
        move-result v0
        if-eqz v0, :hush_stock
        return-void
    """, ExternalLabel("hush_stock", target.getInstruction(0)))
}

/**
 * ReactionsEffectOverlay.show(fragment, layout, cell, from, x, y, reaction, account, type) returns
 * early when interface animations are off, and calls itself once to add the short burst to a long
 * effect. Its class is renamed in every build, so it's found by that shape.
 */
internal fun BytecodePatchContext.resolveReactionEffectsOff(): MutableMethod {
    requireStatusMethod("reactionEffectsOff")
    controlHook(REACTION_EFFECTS, "skipped", listOf(), "Z")
    val found = mutableListOf<Pair<String, String>>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
        cls.methods.filter { m ->
            val p = m.parameterTypes.map(CharSequence::toString)
            AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" && p.size == 9 &&
                p[2] == "Landroid/view/View;" && p[3] == "Landroid/view/View;" && p[4] == "F" && p[5] == "F" && p[7] == "I" && p[8] == "I" &&
                m.controlBody().let { body -> body.any { it.controlString() == ANIMATIONS_KEY } && body.any { it.controlRef() == ref(m) } }
        }.forEach { found += cls.type to ref(it) }
    }
    val (type, wanted) = found.controlSingle("reaction effect overlay")
    val show = mutableClassDefBy(type).methods.single { ref(it) == wanted }
    controlShape(show.implementation!!.registerCount > 9, "the reaction effect overlay has no register to answer in")
    controlShape(ControlFlow.of(show).normal.none { 0 in it }, "something jumps back to the start of the reaction effect overlay")
    return show
}

private fun ref(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"
