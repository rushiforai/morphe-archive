package app.hrisapn.patches.agriconnect.mocklocation

import app.morphe.patcher.Fingerprint

/**
 * The bundled `@capacitor-community/background-geolocation` plugin builds every
 * location object that is delivered to the web layer here.
 *
 * It contains `JSObject.put("simulated", location.isFromMockProvider())`, which is
 * the only source of the `simulated` flag consumed by the check-in/out page.
 */
object FormatLocationFingerprint : Fingerprint(
    definingClass = "Lcom/equimaps/capacitor_background_geolocation/BackgroundGeolocation;",
    name = "formatLocation",
    parameters = listOf("Landroid/location/Location;"),
    returnType = "Lcom/getcapacitor/JSObject;",
)
