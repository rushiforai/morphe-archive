package semicoloncolonel.mobilestream.patches.shared.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import semicoloncolonel.mobilestream.patches.shared.misc.tvOnly
import semicoloncolonel.mobilestream.patches.nba.shared.Constants as Nba
import semicoloncolonel.mobilestream.patches.nfl.shared.Constants as Nfl

private const val SDK = "Lcom/onetrust/otpublishers/headless/Public/OTPublishersHeadlessSDK;"
private const val ORIGINAL = "shouldShowBanner\$msp"
private const val REJECTER =
    "Lsemicoloncolonel/mobilestream/extension/shared/privacy/ConsentRejecter;"

// OneTrust's consent SDK decides whether to show its tracking prompt with
// OTPublishersHeadlessSDK.shouldShowBanner(), a public API whose name survives
// R8. Apps call it directly (NBA's Android TV app) or through OneTrust's React
// Native module (NFL's Android TV app). The original method is kept under
// another name, and shouldShowBanner() becomes a wrapper that passes its result
// to ConsentRejecter, which saves Reject All the first time the prompt is due
// and reports that there is nothing to show. Wrapping each return in place does
// not work: NBA's copy reuses the `this` register before it returns.
internal object ShouldShowBannerFingerprint : Fingerprint(
    definingClass = SDK,
    name = "shouldShowBanner",
    returnType = "Z",
    parameters = emptyList(),
)

@Suppress("unused")
val rejectTrackingConsentPatch = bytecodePatch(
    name = "Reject tracking consent",
    description = "Answers the app's tracking consent prompt with Reject All, so the prompt does not appear " +
        "and the optional trackers stay off.",
) {
    category("Privacy")
    compatibleWith(Nfl.COMPATIBILITY.tvOnly(), Nba.TV_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // Skips an app without OneTrust instead of failing.
        val method = ShouldShowBannerFingerprint.methodOrNull ?: return@execute
        val copy = ImmutableMethod(
            method.definingClass,
            ORIGINAL,
            emptyList(),
            "Z",
            method.accessFlags,
            null,
            null,
            method.implementation,
        ).toMutable()
        mutableClassDefBy(method.definingClass).methods.add(copy)
        method.addInstructions(
            0,
            """
                invoke-virtual { p0 }, $SDK->$ORIGINAL()Z
                move-result v0
                invoke-static { p0, v0 }, $REJECTER->reject(Ljava/lang/Object;Z)Z
                move-result v0
                return v0
            """,
        )
    }
}
