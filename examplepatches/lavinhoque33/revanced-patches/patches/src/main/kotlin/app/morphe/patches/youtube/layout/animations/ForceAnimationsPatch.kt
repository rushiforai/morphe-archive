/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3872
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.patches.youtube.layout.animations

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.shared.mapping.resourceMappingPatch
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.patch.PatchList.FORCE_ANIMATIONS
import app.morphe.patches.youtube.utils.playservice.is_20_41_or_greater
import app.morphe.patches.youtube.utils.playservice.is_20_49_or_greater
import app.morphe.patches.youtube.utils.playservice.versionCheckPatch
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findInstructionIndicesReversedOrThrow
import app.morphe.util.insertLiteralOverride
import app.morphe.util.insertLiteralOverrideAtInlinedSites
import app.morphe.util.Utils.printWarn
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val EXTENSION_CLASS = "Lapp/morphe/extension/youtube/patches/ForceAnimationsPatch;"
private const val EXTENSION_ANIMATIONS_MODE_CLASS =
    $$"Lapp/morphe/extension/youtube/patches/ForceAnimationsPatch$AnimationsMode;"
private const val EXTENSION_SETTINGS_CLASS = "Lapp/morphe/extension/youtube/settings/Settings;"
private const val EXTENSION_ENUM_SETTING_CLASS = "Lapp/morphe/extension/shared/settings/EnumSetting;"

/**
 * Adds a static method to the extension class that takes one value of [type] and returns it,
 * or another value for the "Force animations" setting.
 *
 * @param smali Code that runs after `v0` is set to the setting value. `v1` is free and `p0` is the value.
 */
private fun BytecodePatchContext.addForceAnimationsMethod(name: String, type: String, smali: String) {
    mutableClassDefBy { it.type == EXTENSION_CLASS }.methods.add(
        ImmutableMethod(
            EXTENSION_CLASS,
            name,
            listOf(ImmutableMethodParameter(type, null, null)),
            type,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(3),
        ).toMutable().apply {
            addInstructionsWithLabels(
                0,
                """
                    sget-object v0, $EXTENSION_SETTINGS_CLASS->FORCE_ANIMATIONS:$EXTENSION_ENUM_SETTING_CLASS
                    invoke-virtual { v0 }, $EXTENSION_ENUM_SETTING_CLASS->get()Ljava/lang/Enum;
                    move-result-object v0
                """ + smali
            )
        }
    )
}

/**
 * Overrides every check of an A/B test feature flag with an extension method.
 * Builds that inline the flag getter into its callers are hooked at each call site.
 * Builds without the flag are left alone.
 */
private fun BytecodePatchContext.overrideFeatureFlag(
    flag: Long,
    fingerprint: Fingerprint,
    extensionMethod: String
) {
    if (insertLiteralOverrideAtInlinedSites(flag, extensionMethod) > 0) return

    runCatching { fingerprint.matchAll() }.getOrNull()?.forEach {
        it.method.insertLiteralOverride(flag, extensionMethod)
    }
}

@Suppress("unused")
val forceAnimationsPatch = bytecodePatch(
    name = FORCE_ANIMATIONS.title,
    description = FORCE_ANIMATIONS.summary,
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        resourceMappingPatch,
        versionCheckPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        addPreference(
            arrayOf(
                "PREFERENCE_SCREEN: GENERAL",
                "SETTINGS: FORCE_ANIMATIONS"
            ),
            FORCE_ANIMATIONS
        )

        // The server can throttle or turn off each animation category, and then the app skips
        // the animation. For the watch transitions the player then jumps between the miniplayer,
        // the maximized player and its other states.
        AnimationDecisionForCategoryFingerprint.method.apply {
            val decisionType = returnType

            findInstructionIndicesReversedOrThrow(Opcode.RETURN_OBJECT).forEach { index ->
                val register = getInstruction<OneRegisterInstruction>(index).registerA

                addInstructionsAtControlFlowLabel(
                    index,
                    """
                        invoke-static { v$register }, $EXTENSION_CLASS->getAnimationDecision(Ljava/lang/Object;)Ljava/lang/Object;
                        move-result-object v$register
                        check-cast v$register, $decisionType
                    """
                )
            }
        }

        // A/B tests can make the page transitions and the Shorts player skip the decision
        // above. Ask for it whenever the decision is overridden.
        overrideFeatureFlag(
            PAGE_TRANSITION_ANIMATION_HINTS_FEATURE_FLAG,
            PageTransitionAnimationHintsFeatureFlagFingerprint,
            "$EXTENSION_CLASS->useAnimationDecision(Z)Z"
        )
        if (is_20_41_or_greater) {
            overrideFeatureFlag(
                SHORTS_ANIMATION_HINTS_FEATURE_FLAG,
                ShortsAnimationHintsFeatureFlagFingerprint,
                "$EXTENSION_CLASS->useAnimationDecision(Z)Z"
            )
        }

        // The server can set the page animation type of a navigation command to none,
        // and then the page transition is not animated even when the decision above is on.
        // When the animations are always on, the default animation is used instead.
        val pageAnimationTypeMethodName = "patch_getPageAnimationType"

        // Older versions do not have this code in the same shape.
        val pageAnimationTypeMethod = runCatching {
            pageAnimationTypeFingerprint(
                PageTransitionEnterAnimationFingerprint.instructionMatches.first().getMethodCalled()
            ).method
        }.getOrNull()

        if (pageAnimationTypeMethod == null) {
            printWarn("\"Force animations\" cannot override the page animation type in this version.")
        } else {
            addForceAnimationsMethod(
                pageAnimationTypeMethodName,
                "I",
                """
                    sget-object v1, $EXTENSION_ANIMATIONS_MODE_CLASS->ALWAYS_ON:$EXTENSION_ANIMATIONS_MODE_CLASS
                    if-ne v0, v1, :server_value
                    const/4 v1, $PAGE_ANIMATION_TYPE_NONE
                    if-ne p0, v1, :server_value
                    const/4 p0, $PAGE_ANIMATION_TYPE_UNSPECIFIED
                    :server_value
                    nop
                    return p0
                """
            )

            pageAnimationTypeMethod.findInstructionIndicesReversedOrThrow(Opcode.RETURN).forEach { index ->
                val register = pageAnimationTypeMethod.getInstruction<OneRegisterInstruction>(index).registerA

                pageAnimationTypeMethod.addInstructionsAtControlFlowLabel(
                    index,
                    """
                        invoke-static { v$register }, $EXTENSION_CLASS->$pageAnimationTypeMethodName(I)I
                        move-result v$register
                    """
                )
            }
        }

        // A/B test: the list below the player stops animating its content when it loads.
        // The flag is turned off when the animations are always on, and on when they are always off.
        if (is_20_49_or_greater) {
            val overrideMethodName = "patch_useFlowLayoutWatchPanel"

            addForceAnimationsMethod(
                overrideMethodName,
                "Z",
                """
                    sget-object v1, $EXTENSION_ANIMATIONS_MODE_CLASS->ALWAYS_ON:$EXTENSION_ANIMATIONS_MODE_CLASS
                    if-ne v0, v1, :not_always_on
                    const/4 p0, 0x0
                    return p0
                    :not_always_on
                    nop
                    sget-object v1, $EXTENSION_ANIMATIONS_MODE_CLASS->ALWAYS_OFF:$EXTENSION_ANIMATIONS_MODE_CLASS
                    if-ne v0, v1, :server_value
                    const/4 p0, 0x1
                    :server_value
                    nop
                    return p0
                """
            )

            overrideFeatureFlag(
                FLOW_LAYOUT_WATCH_PANEL_FEATURE_FLAG,
                FlowLayoutWatchPanelFeatureFlagFingerprint,
                "$EXTENSION_CLASS->$overrideMethodName(Z)Z"
            )
        }
    }
}
