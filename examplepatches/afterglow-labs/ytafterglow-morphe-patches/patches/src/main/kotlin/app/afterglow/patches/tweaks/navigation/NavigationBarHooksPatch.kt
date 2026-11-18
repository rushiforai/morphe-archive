/*
 * YTAfterglow for Android.
 *
 * Hooks adapted from the Change header, Navigation bar (toolbar) and Hide player overlay
 * buttons (Cast) patches of Morphe patches v2.2.0 (https://github.com/MorpheApp/morphe-patches,
 * GPLv3), which were forked from ReVanced patches (https://github.com/ReVanced/revanced-patches,
 * GPLv3). Modified for YTAfterglow: rewritten for patcher 2.1.0 and YouTube 21.43.523, driven by
 * the iOS settings of the "Navigation bar" tweak, without the reference's protobuf code. Not an
 * official Morphe or ReVanced file.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

package app.afterglow.patches.tweaks.navigation

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val NAVIGATION_BAR_HOOKS = "$EXTENSION_PACKAGE/navigation/NavigationBarHooks;"

/**
 * The hooks of the iOS "Navigation bar" settings (the top bar): noCast, noNotifsButton,
 * noSearchButton, noVoiceSearchButton, noYTLogo, premiumYTLogo and stickyNavbar. The named
 * "Navigation bar" patch in TweakPatches.kt depends on this patch; the extension checks that
 * tweak id and each setting at runtime.
 */
internal val navigationBarHooksPatch = bytecodePatch(
    description = "Hooks YouTube's toolbar for the Afterglow Navigation bar settings.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)

    execute {
        // region YouTube logo (noYTLogo, premiumYTLogo)

        // Resolve every match before changing any method.
        val headerLogo = HeaderLogoFingerprint.method
        val setLogoIndex = HeaderLogoFingerprint.instructionMatches.last().index
        val regularLogoAttribute = HeaderLogoFingerprint.instructionMatches[1].literal
        val logoIconTable = HeaderLogoIconTableFingerprint.method

        // noYTLogo: the drawable is replaced right before setImageDrawable, on every path into it.
        val setLogo = headerLogo.instruction<FiveRegisterInstruction>(setLogoIndex)
        headerLogo.addInstructionsAtControlFlowLabel(
            setLogoIndex,
            """
                ${invokeStatic(setLogo.registerC, setLogo.registerD, method = "$NAVIGATION_BAR_HOOKS->headerLogo(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;")}
                move-result-object v${setLogo.registerD}
            """,
        )

        // premiumYTLogo: every load of ?attr/ytWordmarkHeader goes through the extension.
        listOf(headerLogo, logoIconTable).forEach { method ->
            method.overrideLiteralLoads(regularLogoAttribute, "$NAVIGATION_BAR_HOOKS->headerLogoAttribute(I)I")
        }

        // endregion

        // region Toolbar buttons (noNotifsButton, noSearchButton)

        val toolbar = ToolbarButtonFingerprint.method
        val iconIndex = ToolbarButtonFingerprint.instructionMatches[3].index
        val imageViewIndex = ToolbarButtonFingerprint.instructionMatches[6].index
        val iconRegister = toolbar.instruction<OneRegisterInstruction>(iconIndex).registerA
        val imageViewRegister = toolbar.instruction<OneRegisterInstruction>(imageViewIndex).registerA
        // The later index first, so the earlier one does not move. Each value is passed where
        // its type is known: YouTube reuses the icon register before the ImageView is loaded.
        toolbar.addInstructionsAtControlFlowLabel(
            imageViewIndex + 1,
            invokeStatic(imageViewRegister, method = "$NAVIGATION_BAR_HOOKS->toolbarButtonView(Landroid/widget/ImageView;)V"),
        )
        toolbar.addInstructionsAtControlFlowLabel(
            iconIndex + 1,
            invokeStatic(iconRegister, method = "$NAVIGATION_BAR_HOOKS->toolbarButtonIcon(Ljava/lang/Enum;)V"),
        )

        // The classic toolbar search item (setShowAsAction is replaced by the extension's call).
        ClassicSearchButtonFingerprint.let {
            val index = it.instructionMatches.first().index
            val call = it.method.instruction<FiveRegisterInstruction>(index)
            it.method.replaceInstruction(
                index,
                invokeStatic(call.registerC, call.registerD, method = "$NAVIGATION_BAR_HOOKS->classicSearchItem(Landroid/view/MenuItem;I)V"),
            )
        }

        // endregion

        // region Voice search (noVoiceSearchButton)

        val searchButtons = SearchBoxButtonsFingerprint.method
        val micVisibilityIndex = SearchBoxButtonsFingerprint.instructionMatches[2].index
        val micVisibility = searchButtons.instruction<FiveRegisterInstruction>(micVisibilityIndex)
        // The field the microphone is read from, right before its setVisibility.
        val micField = (micVisibilityIndex - 1 downTo 0).map { searchButtons.implementation!!.instructions[it] }
            .first { it.opcode == Opcode.IGET_OBJECT && (it as TwoRegisterInstruction).registerA == micVisibility.registerC }
            .let { (it as ReferenceInstruction).reference as FieldReference }
        val searchFragmentView = SearchFragmentViewFingerprint.method
        val results = SearchResultsVoiceButtonFingerprint.method
        val resultsMicIndex = SearchResultsVoiceButtonFingerprint.instructionMatches[3].index

        searchButtons.replaceInstruction(
            micVisibilityIndex,
            invokeStatic(micVisibility.registerC, micVisibility.registerD, method = "$NAVIGATION_BAR_HOOKS->voiceSearchVisibility(Landroid/view/View;I)V"),
        )
        val micStores = searchFragmentView.implementation!!.instructions.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.IPUT_OBJECT &&
                ((instruction as ReferenceInstruction).reference as FieldReference).let { it.name == micField.name && it.definingClass == micField.definingClass }
        }.map { it.index }
        if (micStores.isEmpty()) throw PatchException("The search fragment never stores its microphone $micField")
        micStores.reversed().forEach { index ->
            val register = searchFragmentView.instruction<TwoRegisterInstruction>(index).registerA
            searchFragmentView.addInstructions(
                index + 1,
                invokeStatic(register, method = "$NAVIGATION_BAR_HOOKS->voiceSearchButton(Landroid/view/View;)V"),
            )
        }
        results.addInstructions(
            resultsMicIndex + 1,
            invokeStatic(results.instruction<OneRegisterInstruction>(resultsMicIndex).registerA, method = "$NAVIGATION_BAR_HOOKS->voiceSearchButton(Landroid/view/View;)V"),
        )

        // endregion

        // region Cast (noCast)

        CastMenuItemFingerprint.let {
            val index = it.instructionMatches.last().index
            val menuItem = it.method.instruction<FiveRegisterInstruction>(index).registerC
            it.method.addInstructionsAtControlFlowLabel(
                index,
                invokeStatic(menuItem, method = "$NAVIGATION_BAR_HOOKS->castMenuItem(Landroid/view/MenuItem;)V"),
            )
        }
        CastMenuItemVisibilityFingerprint.let {
            val index = it.instructionMatches.last().index
            val visible = it.method.instruction<FiveRegisterInstruction>(index).registerD
            it.method.addInstructionsAtControlFlowLabel(
                index,
                """
                    ${invokeStatic(visible, method = "$NAVIGATION_BAR_HOOKS->castMenuItemVisible(Z)Z")}
                    move-result v$visible
                """,
            )
        }
        // Resolve once: validation must not re-match the adjacent instructions after
        // the first visibility hook has inserted code between them.
        PlayerCastButtonFingerprint.match().let {
            listOf(it.instructionMatches[3], it.instructionMatches[1]).forEach { match ->
                val visibility = it.method.instruction<FiveRegisterInstruction>(match.index).registerD
                it.method.addInstructionsAtControlFlowLabel(
                    match.index,
                    """
                        ${invokeStatic(visibility, method = "$NAVIGATION_BAR_HOOKS->castButtonVisibility(I)I")}
                        move-result v$visibility
                    """,
                )
            }
        }
        listOf(CastPlayerFlagFingerprint to 45690091L, CastActionFlagFingerprint to 45690090L).forEach { (fingerprint, flag) ->
            fingerprint.matchAll().forEach { match ->
                literalLoads(match.method, flag).reversed().forEach { index ->
                    match.method.overrideFlagRead(index, "$NAVIGATION_BAR_HOOKS->castFlag(Z)Z")
                }
            }
        }

        // endregion

        // region Sticky navigation bar (stickyNavbar)

        // AppBarLayout's scroll range getters (total, down pre-scroll and down scroll range) are its
        // only int methods without parameters that read a child's scroll flags.
        val appBar = mutableClassDefBy(APP_BAR_LAYOUT)
        val scrollRanges = appBar.methods.filter { method ->
            method.returnType == "I" && method.parameterTypes.isEmpty() && readsScrollFlags(method)
        }
        if (scrollRanges.size != 3) throw PatchException("Expected 3 AppBarLayout scroll range getters, found ${scrollRanges.size}")
        scrollRanges.forEach { method ->
            val implementation = method.implementation!!
            if (implementation.registerCount - 1 < 1) throw PatchException("$method has no free register")
            method.addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p0 .. p0 }, $NAVIGATION_BAR_HOOKS->pinsAppBar(Landroid/view/View;)Z
                    move-result v0
                    if-eqz v0, :afterglow_scroll_range
                    const/4 v0, 0x0
                    return v0
                    :afterglow_scroll_range
                    nop
                """,
            )
        }

        // endregion
    }
}

private const val APP_BAR_LAYOUT = "Lcom/google/android/material/appbar/AppBarLayout;"

/** Margin fields of the layout params, which AppBarLayout reads next to the scroll flags. */
private val LAYOUT_PARAMS_FIELDS = setOf("topMargin", "bottomMargin", "leftMargin", "rightMargin", "width", "height", "gravity", "weight")

/** True when the method casts a child's layout params and reads an int of that class that is not a margin. */
private fun readsScrollFlags(method: MutableMethod): Boolean {
    val instructions = method.implementation?.instructions ?: return false
    val castTypes = instructions.filter { it.opcode == Opcode.CHECK_CAST }
        .map { ((it as ReferenceInstruction).reference as TypeReference).type }.toSet()
    return instructions.any { instruction ->
        instruction.opcode == Opcode.IGET &&
            ((instruction as ReferenceInstruction).reference as FieldReference).let {
                it.type == "I" && it.definingClass in castTypes && it.name !in LAYOUT_PARAMS_FIELDS
            }
    }
}
