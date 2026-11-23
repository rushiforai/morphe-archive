package app.jofslash.patches.booking.shared

import app.morphe.patcher.Fingerprint

// The app's Application.onCreate, which runs once when the app's process starts (also when
// Android starts it for a background job).
internal object ApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/booking/BookingApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)
