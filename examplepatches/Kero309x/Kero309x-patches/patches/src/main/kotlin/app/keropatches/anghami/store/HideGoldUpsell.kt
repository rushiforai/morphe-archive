// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.anghami.store

import app.keropatches.anghami.AnghamiApp
import app.keropatches.core.PatchCategory
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/**
 * The section-header binder, which is the only place a Gold call to action is
 * drawn.
 *
 * A section can carry an optional Gold promotion. The binder reads it once to
 * decide whether the call-to-action container is shown, and again to label the
 * button. Those two reads are the whole surface: no other class reads the field,
 * so hiding the call to action does not touch anything else.
 */
private object SectionHeaderFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/TitleModel;",
    name = "_bind",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Lcom/anghami/model/adapter/TitleModel${'$'}TitleViewHolder;"),
)

/** The optional Gold promotion carried by a section payload. */
private const val GOLD_CTA_FIELD =
    "Lcom/anghami/ghost/pojo/section/Section;->goldCTA:Lcom/anghami/ghost/pojo/GoldCTA;"

/**
 * Replaces the read that decides whether the promotion is shown with a null.
 *
 * The binder branches on this read immediately: a null takes the "nothing to
 * advertise" path, which hides the container and returns. Writing the null into
 * the same register leaves the following branch untouched, so no label, no stack
 * map frame and no other register is affected. The second read, inside the block
 * that is now unreachable, is deliberately left alone.
 */
private fun MutableMethod.hidePromotion() {
    val index = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.IGET_OBJECT &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == GOLD_CTA_FIELD
    }

    check(index >= 0) {
        "No read of the Gold call to action in $definingClass->$name$returnType; " +
            "the code changed."
    }

    val register = (instructions[index] as OneRegisterInstruction).registerA
    replaceInstruction(index, "const/4 v$register, 0x0")
}

/**
 * Hides the call to action that advertises the Gold tier.
 *
 * Gold is granted by the server. The client can neither grant it nor make it
 * work, so a build that reports a free account as Gold only draws promotions
 * whose destinations then fail the server-side check. This patch leaves the
 * account's real plan alone and closes the one local surface that advertises
 * Gold: the optional button a section header can show.
 *
 * Decorations are deliberately out of scope. The Gold badge a profile, ranked
 * user or story author carries says something true about that person, so it is
 * not an advertisement and is left as the server sent it.
 */
@Suppress("unused")
val hideGoldUpsellPatch = bytecodePatch(
    name = "Hide Gold upsell",
    description = "Hides the Gold call to action that section headers can show.",
    default = true,
) {
    compatibleWith(AnghamiApp.compatibility)
    category(PatchCategory.STORE.label)

    execute {
        SectionHeaderFingerprint.method.hidePromotion()
    }
}
