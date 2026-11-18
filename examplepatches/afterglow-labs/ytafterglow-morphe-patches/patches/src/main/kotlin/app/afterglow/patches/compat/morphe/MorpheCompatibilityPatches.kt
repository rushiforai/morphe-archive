/* Afterglow adaptation of Morphe patches v2.0.0, GPLv3 with Section 7 terms.
 * Copyright 2026 Morphe. https://github.com/MorpheApp/morphe-patches
 * Original hard fork: ReVanced/revanced-patches 724e6d61b2ecd868c1a9a37d465a688e83a74799.
 * See compat/morphe/license and docs/morphe-compatibility.md for complete notices.
 */
package app.afterglow.patches.compat.morphe

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.MainActivityOnCreateFingerprint
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.compat.morphe.shared.CastContextFetchFingerprint
import app.afterglow.patches.compat.morphe.shared.PrimeMethodFingerprint
import app.afterglow.patches.compat.morphe.shared.misc.gms.gmsCoreSupportPatch
import app.afterglow.patches.compat.morphe.shared.misc.spoof.spoofVideoStreamsPatch
import app.afterglow.patches.compat.morphe.shared.misc.spoof.userAgentClientSpoofPatch
import app.afterglow.patches.compat.morphe.youtube.misc.gms.accountCredentialsInvalidTextPatch
import app.afterglow.patches.compat.morphe.youtube.misc.gms.deviceComplianceCheckPatch
import app.afterglow.patches.compat.morphe.util.addInstructionsAtControlFlowLabel
import app.afterglow.patches.compat.morphe.util.findInstructionIndicesReversedOrThrow
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.string
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

internal const val ORIGINAL_PACKAGE = "com.google.android.youtube"
internal const val COMPATIBILITY_PACKAGE = "app.morphe.android.youtube"
internal const val MORPHE_UTILS = "Lapp/morphe/extension/shared/Utils;"

internal object CompatibilityApplicationInitFingerprint : Fingerprint(
    filters = listOf(string("Application.onCreate"), string("Application creation"))
)

/** Ordered extension merging follows the exact loaded upstream 2.0.0 closure. */
internal val compatibilityExtensionPatch = bytecodePatch {
    dependsOn(afterglowExtensionPatch, compatibilityResourcesPatch)
    extendWith("compat/morphe/extensions/shared.mpe")
    extendWith("compat/morphe/extensions/youtube.mpe")
    extendWith("compat/morphe/extensions/shared-youtube.mpe")
    execute {
        val utils = mutableClassDefBy(MORPHE_UTILS)
        Fingerprint(definingClass = MORPHE_UTILS, name = "getPatchesReleaseVersion",
            returnType = "Ljava/lang/String;", parameters = emptyList()).method.returnEarly("Afterglow / compatibility 2.0.0")
        // Settings normally sets these resource names; retain its dialog theme support.
        listOf("getThemeLightColorResourceName" to "yt_white1",
            "getThemeDarkColorResourceName" to "yt_black1").forEach { (name, color) ->
            Fingerprint(definingClass = "Lapp/morphe/extension/shared/theme/ThemeUtils;",
                name = name, returnType = "Ljava/lang/String;", parameters = emptyList()).method.returnEarly(color)
        }
        // Keep the exact theme update/persistence body on Utils. Calling its original
        // settings Activity owner eagerly requires the unused settings screen's layout.
        val themeObserver = installCompatibilityThemeObserver(utils,
            Fingerprint(definingClass = "Lapp/morphe/extension/youtube/settings/YouTubeActivityHook;",
                name = "updateLightDarkModeStatus", returnType = "V", parameters = listOf("Ljava/lang/Enum;")).method)
        // GmsCore and stream-error dialogs still follow YouTube's selected theme.
        Fingerprint(accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = "L", parameters = emptyList(),
            filters = listOf(resourceLiteral(ResourceType.STRING, "app_theme_appearance_dark")))
            .method.apply {
                findInstructionIndicesReversedOrThrow(Opcode.RETURN_OBJECT).forEach { index ->
                    val register = getInstruction<OneRegisterInstruction>(index).registerA
                    addInstructionsAtControlFlowLabel(index,
                        "invoke-static { v$register }, $themeObserver")
                }
            }
    }
    finalize {
        // As upstream, finalize puts context before every other extension startup call.
        listOf(CompatibilityApplicationInitFingerprint, MainActivityOnCreateFingerprint).forEach {
            it.clearMatch()
            it.method.addInstruction(0,
                "invoke-static/range { p0 .. p0 }, $MORPHE_UTILS->setContext(Landroid/content/Context;)V")
        }
    }
}

/** Exact 21.43 branches of the pinned upstream stream patch; no upstream settings row. */
internal val spoofVideoStreamsHookPatch = spoofVideoStreamsPatch(
    extensionClass = "Lapp/morphe/extension/youtube/patches/spoof/SpoofVideoStreamsPatch;",
    mainActivityOnCreateFingerprints = listOf(MainActivityOnCreateFingerprint, CompatibilityApplicationInitFingerprint),
    fixCronetOnesie = { true },
    fixMediaFetchHotConfigAlternative = { false },
    fixParsePlaybackResponseFeatureFlag = { true },
    fixMediaSessionFeatureFlag = { true },
    fixReelItemWatchResponseFeatureFlag = { true },
    restoreMissingCuepointMethod = { false },
    patchProtoRequest = { true },
    patchProtoRequestLegacy = { false },
    block = {
        compatibleWith(COMPATIBILITY_YOUTUBE)
        dependsOn(compatibilityExtensionPatch, userAgentClientSpoofPatch(ORIGINAL_PACKAGE))
    }
)

/** Keep the verified installed package so the existing app and its login data upgrade in place. */
internal val gmsCoreSupportHookPatch = gmsCoreSupportPatch(
    fromPackageName = ORIGINAL_PACKAGE,
    toPackageNameDefault = COMPATIBILITY_PACKAGE,
    primeMethodFingerprint = PrimeMethodFingerprint,
    earlyReturnFingerprints = setOf(CastContextFetchFingerprint),
    mainActivityOnCreateFingerprint = MainActivityOnCreateFingerprint,
    extensionPatch = compatibilityExtensionPatch,
    gmsCoreSupportResourcePatchFactory = { compatibilityGmsResourcesPatch },
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(spoofVideoStreamsHookPatch, deviceComplianceCheckPatch,
        accountCredentialsInvalidTextPatch, compatibilityCastButtonsPatch)
}
