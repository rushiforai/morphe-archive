package app.morphe.patches.discord.bunny

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.seobject.patches.discord.Compatibility.COMPATIBILITY_DISCORD
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/discord/bunny/BunnyBootstrap;"

internal object DiscordReactActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/discord/react_activities/ReactActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

internal object ReactInstanceLoadJSBundleFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/runtime/ReactInstance;",
    name = "loadJSBundle",
    returnType = "V",
    parameters = listOf("Lcom/facebook/react/bridge/JSBundleLoader;"),
)

internal object DiscordVoiceNotificationBuildFingerprint : Fingerprint(
    definingClass = "Lcom/discord/foreground_service/service/ServiceNotification;",
    name = "buildNotification",
    returnType = "Landroid/app/Notification;",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/discord/foreground_service/service/ServiceNotificationConfiguration;",
    ),
)

internal object DiscordCustomFontFamilyOverrideFingerprint : Fingerprint(
    name = "createAssetTypeface",
    returnType = "Landroid/graphics/Typeface;",
    parameters = listOf(
        "Ljava/lang/String;",
        "I",
        "Landroid/content/res/AssetManager;",
    ),
    custom = { method, classDef ->
        (method.accessFlags and 0x8) == 0 &&
            classDef.methods
                .filter { candidate ->
                    candidate.name == "<clinit>" &&
                        candidate.implementation != null
                }
                .flatMap { initializer ->
                    initializer.implementation!!.instructions.mapNotNull { instruction ->
                        (
                            (instruction as? ReferenceInstruction)
                                ?.reference as? StringReference
                        )?.string
                    }
                }
                .toSet()
                .let { strings ->
                    ".ttf" in strings &&
                        ".otf" in strings
                }
    },
)

internal object ReactIntentModuleOpenUrlFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/modules/intent/IntentModule;",
    name = "openURL",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/facebook/react/bridge/Promise;",
    ),
)

internal object ComponentActivityOnActivityResultFingerprint : Fingerprint(
    definingClass = "Landroidx/activity/ComponentActivity;",
    name = "onActivityResult",
    returnType = "V",
    parameters = listOf(
        "I",
        "I",
        "Landroid/content/Intent;",
    ),
)
internal object ReactEditTextUpdateCachedSpannableFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/views/textinput/ReactEditText;",
    name = "updateCachedSpannable",
    returnType = "V",
    parameters = emptyList(),
)

internal object ReactTextInputManagerUpdateExtraDataFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/views/textinput/ReactTextInputManager;",
    name = "updateExtraData",
    returnType = "V",
    parameters = listOf(
        "Lcom/facebook/react/views/textinput/ReactEditText;",
        "Ljava/lang/Object;",
    ),
)

internal object DiscordChatInputRootViewSetHintTextColorFingerprint : Fingerprint(
    definingClass = "Lcom/discord/chat/input/views/ChatInputRootView;",
    name = "setHintTextColor",
    returnType = "V",
    parameters = listOf(
        "I",
    ),
)

internal object DiscordGGSansBoldUpdateDrawStateFingerprint : Fingerprint(
    definingClass = "Lcom/discord/span/utilities/GGSansBoldSpan;",
    name = "updateDrawState",
    returnType = "V",
    parameters = listOf(
        "Landroid/text/TextPaint;",
    ),
)

internal object DiscordGGSansBoldUpdateMeasureStateFingerprint : Fingerprint(
    definingClass = "Lcom/discord/span/utilities/GGSansBoldSpan;",
    name = "updateMeasureState",
    returnType = "V",
    parameters = listOf(
        "Landroid/text/TextPaint;",
    ),
)

internal object DiscordGGSansItalicUpdateDrawStateFingerprint : Fingerprint(
    definingClass = "Lcom/discord/span/utilities/GGSansItalicSpan;",
    name = "updateDrawState",
    returnType = "V",
    parameters = listOf(
        "Landroid/text/TextPaint;",
    ),
)

internal object DiscordGGSansItalicUpdateMeasureStateFingerprint : Fingerprint(
    definingClass = "Lcom/discord/span/utilities/GGSansItalicSpan;",
    name = "updateMeasureState",
    returnType = "V",
    parameters = listOf(
        "Landroid/text/TextPaint;",
    ),
)

internal object ReactTextLayoutManagerSpannableFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/views/text/TextLayoutManager;",
    name = "getOrCreateSpannableForText",
    returnType = "Landroid/text/Spannable;",
    parameters = listOf(
        "Landroid/content/res/AssetManager;",
        "Lcom/facebook/react/common/mapbuffer/MapBuffer;",
        "Lcom/facebook/react/views/text/ReactTextViewManagerCallback;",
    ),
)

internal object DiscordDisplayNameStylesApplyFingerprint : Fingerprint(
    definingClass = "Lcom/discord/chat/presentation/message/utils/DisplayNameStylesUtils;",
    name = "applyDisplayNameStyles",
    returnType = "V",
    parameters = listOf(
        "Landroid/widget/TextView;",
        "Lcom/discord/chat/bridge/displaynamestyles/DisplayNameStyles;",
    ),
)

internal object DiscordThemeModuleUpdateThemeFingerprint : Fingerprint(
    definingClass = "Lcom/discord/theme/ThemeModule;",
    name = "updateTheme",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
    ),
)

internal object DiscordThemeColorCompatContextFingerprint : Fingerprint(
    definingClass = "Lcom/discord/theme/utils/ColorUtilsKt;",
    name = "getColorCompat",
    returnType = "I",
    parameters = listOf(
        "Landroid/content/Context;",
        "I",
    ),
)

internal object DiscordThemeColorCompatResourcesFingerprint : Fingerprint(
    definingClass = "Lcom/discord/theme/utils/ColorUtilsKt;",
    name = "getColorCompat",
    returnType = "I",
    parameters = listOf(
        "Landroid/content/res/Resources;",
        "I",
        "Landroid/content/res/Resources\$Theme;",
    ),
)

internal object ReactBackgroundStyleApplicatorSetBackgroundColorFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/uimanager/BackgroundStyleApplicator;",
    name = "setBackgroundColor",
    returnType = "V",
    parameters = listOf(
        "Landroid/view/View;",
        "Ljava/lang/Integer;",
    ),
)

@Suppress("unused")
val bunnyPatch = bytecodePatch(
    name = "Bunny",
    description = "Revives the Bunny Discord client mod without Xposed or LSPosed.",
) {
    compatibleWith(COMPATIBILITY_DISCORD)
    dependsOn(bunnyBrandingResourcePatch)
    extendWith("extensions/bunny.mpe")

    execute {
        /*
         * Core Bunny startup delivery.
         */
        DiscordReactActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p1}, $EXTENSION_CLASS->onActivityCreate(Landroid/app/Activity;Landroid/os/Bundle;)V",
        )

ReactInstanceLoadJSBundleFingerprint.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->beforeDiscordBundle(Ljava/lang/Object;)V",
        )

        DiscordVoiceNotificationBuildFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range {p2 .. p2}, Lapp/morphe/extension/discord/bunny/voice/VoiceNotificationIntegration;->extendConfiguration(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p2
                check-cast p2, Lcom/discord/foreground_service/service/ServiceNotificationConfiguration;
            """,
        )
        // Bunny font boundary.
        //
        // Resolve Bunny synthetic/custom family names first. A null result
        // falls directly back to the untouched host implementation.
        val bunnyFontBoundary =
            DiscordCustomFontFamilyOverrideFingerprint.method

        val bunnyFontOriginalEntry =
            bunnyFontBoundary.implementation!!.instructions.first()

        bunnyFontBoundary.addInstructionsWithLabels(
            0,
            """
                invoke-static/range {p1 .. p3}, $EXTENSION_CLASS->resolveBunnyTypeface(Ljava/lang/String;ILandroid/content/res/AssetManager;)Landroid/graphics/Typeface;
                move-result-object v0
                if-eqz v0, :bunny_font_native_fallback
                return-object v0
            """,
            ExternalLabel(
                "bunny_font_native_fallback",
                bunnyFontOriginalEntry,
            ),
        )


        /*
         * Discord rendered server-drawer background compatibility.
         *
         * BaseViewManager.setBackgroundColor(View, int) is the RN boundary
         * immediately upstream of BackgroundStyleApplicator. The earlier
         * multicolor census proved the drawer reaches this path as
         * 0xFF121214 on ReactViewGroup.
         */
        /*
         * Exact boundary recovered from the working RN fingerprint APK:
         *
         * Lcom/facebook/react/uimanager/BackgroundStyleApplicator;
         * ->setBackgroundColor(
         *     Landroid/view/View;
         *     Ljava/lang/Integer;
         * )V
         *
         * The diagnostic hooked this method at instruction 0.
         */
        val bunnyReactBackgroundMethod =
            ReactBackgroundStyleApplicatorSetBackgroundColorFingerprint.method

        check(
            bunnyReactBackgroundMethod.implementation != null
        ) {
            "BackgroundStyleApplicator.setBackgroundColor has no implementation"
        }

        bunnyReactBackgroundMethod.addInstruction(
            0,
            "invoke-static/range {p0 .. p1}, $EXTENSION_CLASS->resolveBunnyReactBackgroundColor(Landroid/view/View;Ljava/lang/Integer;)Ljava/lang/Integer;",
        )

        bunnyReactBackgroundMethod.addInstruction(
            1,
            "move-result-object p1",
        )

        /*
         * Authoritative native boundary for Bunny synthetic theme IDs.
         *
         * Keep bn-theme-* on the JS side and translate only the String
         * entering Discord ThemeModule.updateTheme().
         */
        val bunnyNativeThemeUpdateMethod =
            DiscordThemeModuleUpdateThemeFingerprint.method

        check(
            bunnyNativeThemeUpdateMethod.implementation != null
        ) {
            "ThemeModule.updateTheme has no implementation"
        }

        // Insert move-result first, then invoke at index 0, so final runtime
        // order is invoke-static -> move-result-object.
        bunnyNativeThemeUpdateMethod.addInstruction(
            0,
            "move-result-object p1",
        )

        bunnyNativeThemeUpdateMethod.addInstruction(
            0,
            "invoke-static/range {p1 .. p1}, $EXTENSION_CLASS->resolveBunnyNativeThemeName(Ljava/lang/String;)Ljava/lang/String;",
        )

        val bunnyThemeRawContextMethod =
            DiscordThemeColorCompatContextFingerprint.method
        val bunnyThemeRawContextReturns =
            bunnyThemeRawContextMethod.implementation!!.instructions
                .withIndex()
                .filter { it.value.opcode.name == "return" }
                .map { it.index }

        check(bunnyThemeRawContextReturns.size == 1) {
            "Unexpected Context getColorCompat return count: " +
                bunnyThemeRawContextReturns.size
        }
        check(bunnyThemeRawContextMethod.implementation!!.registerCount == 3) {
            "Unexpected Context getColorCompat register count: " +
                bunnyThemeRawContextMethod.implementation!!.registerCount
        }

        val bunnyThemeRawContextReturnIndex =
            bunnyThemeRawContextReturns.single()

        // Stock 341.13 census: return v1; p1 is the resource id.
        bunnyThemeRawContextMethod.addInstruction(
            bunnyThemeRawContextReturnIndex,
            "invoke-static {p1, v1}, $EXTENSION_CLASS->resolveBunnyRawThemeColor(II)I",
        )
        bunnyThemeRawContextMethod.addInstruction(
            bunnyThemeRawContextReturnIndex + 1,
            "move-result v1",
        )

        val bunnyThemeRawResourcesMethod =
            DiscordThemeColorCompatResourcesFingerprint.method
        val bunnyThemeRawResourcesReturns =
            bunnyThemeRawResourcesMethod.implementation!!.instructions
                .withIndex()
                .filter { it.value.opcode.name == "return" }
                .map { it.index }

        check(bunnyThemeRawResourcesReturns.size == 1) {
            "Unexpected Resources getColorCompat return count: " +
                bunnyThemeRawResourcesReturns.size
        }
        check(bunnyThemeRawResourcesMethod.implementation!!.registerCount == 4) {
            "Unexpected Resources getColorCompat register count: " +
                bunnyThemeRawResourcesMethod.implementation!!.registerCount
        }

        val bunnyThemeRawResourcesReturnIndex =
            bunnyThemeRawResourcesReturns.single()

        // Stock 341.13 census: return v1; p1 is the resource id.
        bunnyThemeRawResourcesMethod.addInstruction(
            bunnyThemeRawResourcesReturnIndex,
            "invoke-static {p1, v1}, $EXTENSION_CLASS->resolveBunnyRawThemeColor(II)I",
        )
        bunnyThemeRawResourcesMethod.addInstruction(
            bunnyThemeRawResourcesReturnIndex + 1,
            "move-result v1",
        )

        /*
         * Discord stock census: DarkerTheme and LightTheme each expose
         * exactly 212 zero-argument int property getters. Every one uses two
         * registers and returns v0. Patch the whole verified getter surface
         * structurally instead of hardcoding 424 method names.
         */
        /*
         * Discord native theme owner probe.
         *
         * Diagnostic only. Probe three structurally verified
         * background getters on each possible native owner.
         */
        val bunnyThemeOwnerProbeClasses = listOf(
            "Lcom/discord/theme/DarkerTheme;" to "DarkerTheme",
            "Lcom/discord/theme/DarkTheme;" to "DarkTheme",
            "Lcom/discord/theme/MidnightTheme;" to "MidnightTheme",
            "Lcom/discord/theme/LightTheme;" to "LightTheme",

            "Lcom/discord/theme/DarkerThemeExperiment;" to "DarkerThemeExperiment",
            "Lcom/discord/theme/DarkThemeExperiment;" to "DarkThemeExperiment",
            "Lcom/discord/theme/MidnightThemeExperiment;" to "MidnightThemeExperiment",
            "Lcom/discord/theme/LightThemeExperiment;" to "LightThemeExperiment",
        )

        val bunnyThemeOwnerProbeGetterNames = setOf(
            "getBackgroundBaseLow",
            "getBackgroundBaseLower",
            "getBackgroundBaseLowest",
        )

        bunnyThemeOwnerProbeClasses.forEach { (classDescriptor, ownerLabel) ->
            val themeClass =
                this.mutableClassDefBy(classDescriptor)

            val probeGetters =
                themeClass.methods
                    .filter { method ->
                        method.name in bunnyThemeOwnerProbeGetterNames &&
                            method.parameterTypes.isEmpty() &&
                            method.returnType == "I" &&
                            method.implementation != null &&
                            (method.accessFlags and 0x8) == 0
                    }
                    .sortedBy { it.name }

            check(probeGetters.size == 3) {
                "Unexpected owner-probe getter count for $classDescriptor: " +
                    probeGetters.size
            }

            probeGetters.forEach { method ->
                val implementation =
                    method.implementation!!

                val returnIndices =
                    implementation.instructions
                        .withIndex()
                        .filter { it.value.opcode.name == "return" }
                        .map { it.index }

                check(implementation.registerCount == 2) {
                    "Unexpected owner-probe register count for " +
                        "$classDescriptor${method.name}: " +
                        implementation.registerCount
                }

                check(returnIndices.size == 1) {
                    "Unexpected owner-probe return count for " +
                        "$classDescriptor${method.name}: " +
                        returnIndices.size
                }

                val returnIndex =
                    returnIndices.single()

                method.addInstruction(
                    returnIndex,
                    "const-string p0, \"$ownerLabel:${method.name}\"",
                )
                method.addInstruction(
                    returnIndex + 1,
                    "invoke-static {v0, p0}, $EXTENSION_CLASS->resolveBunnySemanticThemeColor(ILjava/lang/String;)I",
                )
                method.addInstruction(
                    returnIndex + 2,
                    "move-result v0",
                )
            }
        }
        val bunnyThemeSemanticClasses = listOf(
            Triple("Lcom/discord/theme/DarkerTheme;", "D", 212),
            Triple("Lcom/discord/theme/LightTheme;", "L", 212),
            Triple("Lcom/discord/theme/DarkerThemeExperiment;", "D", 141),
        )

        bunnyThemeSemanticClasses.forEach { (classDescriptor, variant, expectedGetterCount) ->
            val themeClass = this.mutableClassDefBy(classDescriptor)
            val themeGetters =
                themeClass.methods
                    .filter { method ->
                        method.name.startsWith("get") &&
                            method.parameterTypes.isEmpty() &&
                            method.returnType == "I" &&
                            method.implementation != null &&
                            (method.accessFlags and 0x8) == 0
                    }
                    .sortedBy { it.name }

            check(themeGetters.size == expectedGetterCount) {
                "Unexpected native theme getter count for $classDescriptor: " +
                    themeGetters.size +
                    " expected=" + expectedGetterCount
            }

            themeGetters.forEach { method ->
                val implementation = method.implementation!!
                val returnIndices =
                    implementation.instructions
                        .withIndex()
                        .filter { it.value.opcode.name == "return" }
                        .map { it.index }

                check(implementation.registerCount == 2) {
                    "Unexpected register count for $classDescriptor${method.name}: " +
                        implementation.registerCount
                }
                check(returnIndices.size == 1) {
                    "Unexpected return count for $classDescriptor${method.name}: " +
                        returnIndices.size
                }

                val returnIndex = returnIndices.single()

                // Stock 341.13 census: every verified getter returns v0.
                // p0 is dead at the method exit, so reuse it as the key
                // register without increasing registerCount or shifting params.
                method.addInstruction(
                    returnIndex,
                    "const-string p0, \"$variant:${method.name}\"",
                )
                method.addInstruction(
                    returnIndex + 1,
                    "invoke-static {v0, p0}, $EXTENSION_CLASS->resolveBunnySemanticThemeColor(ILjava/lang/String;)I",
                )
                method.addInstruction(
                    returnIndex + 2,
                    "move-result v0",
                )
            }
        }

        val globalSpannableMethod =
            ReactTextLayoutManagerSpannableFingerprint.method

        val globalSpannableInstructions =
            globalSpannableMethod.implementation!!.instructions

        val globalSpannableReturns =
            globalSpannableInstructions
                .withIndex()
                .filter { it.value.opcode.name == "return-object" }
                .map { it.index }

        check(globalSpannableReturns.isNotEmpty()) {
            "TextLayoutManager.getOrCreateSpannableForText has no return-object"
        }

        for (
            returnIndex in
            globalSpannableReturns.sortedDescending()
        ) {
            val returnInstruction =
                globalSpannableInstructions[returnIndex]
                    as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

            val spannableRegister =
                returnInstruction.registerA

            globalSpannableMethod.addInstruction(
                returnIndex,
                "invoke-static/range {v$spannableRegister .. v$spannableRegister}, $EXTENSION_CLASS->applyBunnyGlobalColorToSpannable(Landroid/text/Spannable;)V",
            )
        }

        val displayNameStyleMethod =
            DiscordDisplayNameStylesApplyFingerprint.method

        val displayNameStyleInstructions =
            displayNameStyleMethod.implementation!!.instructions

        val displayNameStyleReturnIndices =
            displayNameStyleInstructions
                .withIndex()
                .filter { it.value.opcode.name == "return-void" }
                .map { it.index }

        check(displayNameStyleReturnIndices.size == 2) {
            "Unexpected DisplayNameStylesUtils.applyDisplayNameStyles return count: " +
                displayNameStyleReturnIndices.size
        }

        for (
            returnIndex in
            displayNameStyleReturnIndices.sortedDescending()
        ) {
            displayNameStyleMethod.addInstruction(
                returnIndex,
                "invoke-static/range {p1 .. p1}, $EXTENSION_CLASS->applyBunnyDefaultTextColor(Landroid/widget/TextView;)V",
            )
        }

        val openUrlMethod =
            ReactIntentModuleOpenUrlFingerprint.method

        val originalOpenUrlEntry =
            openUrlMethod.implementation!!.instructions.first()

        openUrlMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static {p1, p2}, $EXTENSION_CLASS->handleBunnyOpenUrl(Ljava/lang/String;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :bunny_font_import_open_url_fallback
                return-void
            """,
            ExternalLabel(
                "bunny_font_import_open_url_fallback",
                originalOpenUrlEntry,
            ),
        )

        val activityResultMethod =
            ComponentActivityOnActivityResultFingerprint.method

        val originalActivityResultEntry =
            activityResultMethod.implementation!!.instructions.first()

        activityResultMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static {p1, p2, p3}, $EXTENSION_CLASS->handleBunnyActivityResult(IILandroid/content/Intent;)Z
                move-result v0
                if-eqz v0, :bunny_font_import_activity_result_fallback
                return-void
            """,
            ExternalLabel(
                "bunny_font_import_activity_result_fallback",
                originalActivityResultEntry,
            ),
        )
    }
}
