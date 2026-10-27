package app.noam.patches.geocaching.detail

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.noam.patches.geocaching.misc.extension.extensionHookPatch
import app.noam.patches.geocaching.shared.Constants

/** GeocacheApi.getGeocache (/mobile/v1/geocaches/{code}), which refuses some caches the website shows. */
internal object GeocacheGetFingerprint : Fingerprint(
    definingClass = "Lcom/groundspeak/geocaching/intro/network/api/geocaches/b;",
    name = "d",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "Lkotlin/coroutines/jvm/internal/ContinuationImpl;"),
)

/** LogGeocacheActivity.onCreate: the log and draft screen. */
internal object LogScreenCreateFingerprint : Fingerprint(
    definingClass = "Lcom/groundspeak/geocaching/intro/loggeocache/LogGeocacheActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

internal val detailEnrichPatch = bytecodePatch(
    name = "Unlock Premium caches",
    description = "Opens the caches the app locks behind Premium by loading them from geocaching.com, the way c:geo " +
        "does, so they show what the website shows your account.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(extensionHookPatch)

    execute {
        // Same Result-wrapper contract as the search method: fetch returns the app's yk9 itself
        // (xk9 success, or the wk9 "offline" failure the app already handles).
        GeocacheGetFingerprint.method.replaceInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, ${Constants.GC_LIVE_DETAIL}->fetch(Ljava/lang/String;)Ljava/lang/Object;
                move-result-object v0
                return-object v0
            """,
        )

        // geocaching.com refuses logs and drafts on Premium-only caches from Basic members; say so as
        // the log screen opens instead of letting the log fail quietly later. First thing, while p0
        // is still the activity.
        LogScreenCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, ${Constants.GC_LIVE_DETAIL}->warnIfLogRefused(Landroid/app/Activity;)V",
        )
    }
}
