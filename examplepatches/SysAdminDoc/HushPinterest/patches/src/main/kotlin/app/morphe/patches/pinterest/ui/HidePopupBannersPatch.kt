/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.parameterRegister
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireParameterIntact
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val PATCH = "Hide pop-up banners"

/** The view that hosts Pinterest's education steps and its pop-up banner. It keeps its name. */
internal const val EDUCATION_CONTAINER = "Lcom/pinterest/education/view/EducationNewContainerView;"

/** Pinterest's pop-up banner, such as "Shop recommended merchants". It keeps its name. */
internal const val BANNER_OVERLAY = "Lcom/pinterest/gestalt/bannerOverlay/GestaltBannerOverlay;"

/**
 * What the banner's listener setter takes: the whole banner, its X, then its two buttons. The
 * setter's own name is made up per build, so the show method is found by this shape instead.
 */
internal val BANNER_LISTENERS = List(4) { "Landroid/view/View\$OnClickListener;" }

internal const val POPUP_BANNER_HOOK ="$UI_HOOKS->popupBanner(Landroid/view/View;)V"

/**
 * Hands the banner to the extension as the container's show method returns. The method shows the
 * banner, wires its X to Pinterest's own dismissal, then runs the rest of its steps, so the hook goes
 * at the method's one return, after anything that could re-register what the X takes down.
 */
@Suppress("unused")
val hidePopupBannersPatch = bytecodePatch(
    name = PATCH,
    description = "Closes pop-up banners such as \"Shop recommended merchants\" the way their X does, so " +
        "Pinterest records that you dismissed them. Starts off. Turn it on in HushPinterest settings > Interface.",
) {
    category("Feed")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hidePopupBanners")
        requireStatusMethod("popupBanners")
        val container = classDefByOrNull(EDUCATION_CONTAINER)
            ?: throw PatchException("$PATCH: $EDUCATION_CONTAINER is missing")
        val field = container.fields.filter { it.type == BANNER_OVERLAY }
            .one("$PATCH: the education container's banner field")
        val show = container.methods.filter { method ->
            AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
                method.parameterTypes.firstOrNull()?.toString() == EDUCATION_CONTAINER &&
                method.calls().any { it.definingClass == BANNER_OVERLAY && it.returnType == "V" && it.parameters() == BANNER_LISTENERS }
        }.one("$PATCH: the method that shows the banner")
        val body = show.instructions()
        val returnAt = body.indices.filter { body[it].opcode == Opcode.RETURN_VOID }
            .one("$PATCH: the show method's return")
        show.requireParameterIntact(PATCH, 0, listOf(returnAt))
        val register = show.freeLocalsAt(PATCH, returnAt, 1).single()
        mutable(show).addInstructionsAtControlFlowLabel(returnAt, """
            move-object/from16 v$register, ${show.parameterRegister(0)}
            iget-object v$register, v$register, $EDUCATION_CONTAINER->${field.name}:$BANNER_OVERLAY
            invoke-static { v$register }, $POPUP_BANNER_HOOK
        """)
        enableCapability("popupBanners")
        enableStatus("hidePopupBanners")
    }
}
