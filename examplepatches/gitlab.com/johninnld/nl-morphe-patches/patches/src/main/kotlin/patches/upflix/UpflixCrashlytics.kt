package patches.upflix

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import patches.upflix.shared.COMPATIBILITY_UPFLIX

/**
 * The ad/tracking patch removes the Firebase Crashlytics component registrar, but Titanium's
 * `ti.crashlytics` module still installs a primary exception handler that calls
 * `FirebaseCrashlytics.getInstance()`. With no component that throws a NullPointerException,
 * turning every JavaScript warning into a fatal crash loop. Make the handler inert.
 */
internal object CrashlyticsHandlerFingerprint : Fingerprint(
    definingClass = "Lti/crashlytics/TitaniumCrashlyticsModule\$1;",
    name = "handleException",
    returnType = "V",
    parameters = listOf("Lorg/appcelerator/kroll/KrollExceptionHandler\$ExceptionMessage;"),
)

@Suppress("unused")
val disableCrashlyticsReporter = bytecodePatch(
    name = "Disable Crashlytics reporter",
    description = "Stops Titanium's Crashlytics exception reporter. Required together with the " +
        "ad/tracking patch: the reporter calls FirebaseCrashlytics after that component is " +
        "removed, which otherwise crashes the app on any JavaScript exception.",
) {
    compatibleWith(COMPATIBILITY_UPFLIX)
    execute {
        CrashlyticsHandlerFingerprint.method.addInstruction(0, "return-void")
    }
}
