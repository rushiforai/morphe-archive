package io.github.kirby1997.patches.onetrust

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

// Universal suppression for the OneTrust cookie/TCF consent banner. The
// com.onetrust.otpublishers.headless SDK is byte-stable across apps, so no per-app
// fingerprinting is needed and no compatibleWith is declared — the patch matches by
// class presence and applies to any app that bundles OneTrust (e.g. Meetup).
//
// Two independent show paths exist and BOTH are neutered:
//   1. App-level gate — a host screen (e.g. Meetup's IntroFragment) calls
//      shouldShowBanner() and only renders if it returns true. We persist a real
//      "Banner - Reject All" decision through OneTrust's own API, then return false.
//   2. Direct render — other screens (e.g. Meetup's RootActivity / Application)
//      call setupUI()/callSetupUI() unconditionally after startSDK(), which renders
//      the banner regardless of shouldShowBanner(). We no-op those so the banner UI
//      never inflates from any caller. This is why patching shouldShowBanner alone
//      let the popup slip through on relaunch.
//
// Deliberately does NOT force the getConsentStatusForGroupId/SDKId getters to 0:
// saveConsent already writes correct per-category values (0 rejected,
// 1 Strictly Necessary), and blanket-zeroing would also reject Strictly-Necessary,
// breaking functional-category features (e.g. Meetup map tiles). Leaving the getters
// alone keeps natural consent values while non-essential tracking stays rejected.

private const val OT_SDK = "Lcom/onetrust/otpublishers/headless/Public/OTPublishersHeadlessSDK;"

// App-level gate.
object OtShouldShowBannerFingerprint : Fingerprint(
    definingClass = OT_SDK,
    name = "shouldShowBanner",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
)

// Direct render entry points (SDK-controlled; ignore the app-level gate).
object OtCallSetupUiFingerprint : Fingerprint(
    definingClass = OT_SDK,
    name = "callSetupUI",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(
        "Landroidx/fragment/app/FragmentActivity;",
        "I",
        "Lcom/onetrust/otpublishers/headless/Public/DataModel/OTConfiguration;",
    ),
)

object OtSetupUiAppCompatFingerprint : Fingerprint(
    definingClass = OT_SDK,
    name = "setupUI",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Landroidx/appcompat/app/AppCompatActivity;", "I"),
)

object OtSetupUiFragmentFingerprint : Fingerprint(
    definingClass = OT_SDK,
    name = "setupUI",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Landroidx/fragment/app/FragmentActivity;", "I"),
)

object OtSetupUiFragmentConfigFingerprint : Fingerprint(
    definingClass = OT_SDK,
    name = "setupUI",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(
        "Landroidx/fragment/app/FragmentActivity;",
        "I",
        "Lcom/onetrust/otpublishers/headless/Public/DataModel/OTConfiguration;",
    ),
)

@Suppress("unused")
val disableOneTrustConsentPatch = bytecodePatch(
    name = "Auto-reject OneTrust consent banner",
    description = "Universally suppresses the OneTrust cookie/TCF consent banner in any app that bundles " +
        "OneTrust. Persists a real 'Banner - Reject All' decision so non-essential tracking is rejected, " +
        "and no-ops the setupUI render path so the banner never appears on any launch.",
) {
    // Each surface is guarded so the patch applies to whatever overloads a given app
    // actually contains.
    execute {
        // App-level gate: persist reject-all, then report "don't show".
        runCatching {
            OtShouldShowBannerFingerprint.method.addInstructions(
                0,
                """
                    const-string v0, "Banner - Reject All"
                    invoke-virtual {p0, v0}, $OT_SDK->saveConsent(Ljava/lang/String;)V
                    const/4 v0, 0x0
                    return v0
                """,
            )
        }

        // Direct render paths: never inflate the banner UI.
        runCatching { OtCallSetupUiFingerprint.method.addInstructions(0, "return-void") }
        runCatching { OtSetupUiAppCompatFingerprint.method.addInstructions(0, "return-void") }
        runCatching { OtSetupUiFragmentFingerprint.method.addInstructions(0, "return-void") }
        runCatching { OtSetupUiFragmentConfigFingerprint.method.addInstructions(0, "return-void") }
    }
}
