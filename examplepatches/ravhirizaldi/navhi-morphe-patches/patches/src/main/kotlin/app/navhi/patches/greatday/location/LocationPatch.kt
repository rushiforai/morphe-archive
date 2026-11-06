package app.navhi.patches.greatday.location

import app.navhi.patches.greatday.shared.Constants.COMPATIBILITY_GREATDAY
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.bytecodePatch

private const val STORE = "Lapp/navhi/extension/greatday/LocationStore;"

/** The app's own Geolocation plugin, the one the web layer talks to. */
private val geolocationFixFingerprint = Fingerprint(
    definingClass = "Lcom/dataon/cordova/plugin/GeolocationPlugin;",
    name = "b",
    returnType = "Landroid/location/Location;",
)

/** Background location callbacks; both report through the same field. */
private val backgroundFixFingerprints = listOf("b", "f").map { simpleName ->
    Fingerprint(
        definingClass = "Lcom/marianhello/bgloc/c/$simpleName;",
        name = "onLocationChanged",
        parameters = listOf("Landroid/location/Location;"),
        filters = listOf(
            fieldAccess(
                definingClass = "this",
                name = "e",
                type = "Lorg/b/c;",
            ),
        ),
    )
}

/** Hands the pinned point to every location consumer, or the real provider when off. */
@Suppress("unused")
val manualLocationPatch = bytecodePatch(
    name = "Keep the saved point in the app",
    description = "The map, the attendance form and the background service all get your saved point instead of the real fix.",
) {
    compatibleWith(COMPATIBILITY_GREATDAY)

    dependsOn(manualLocationAssetsPatch)

    extendWith("extensions/extension.mpe")

    execute {
        geolocationFixFingerprint.let {
            it.method.addInstructions(
                0,
                """
                    iget-object v0, p0, Lcom/dataon/cordova/plugin/GeolocationPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;
                    invoke-interface { v0 }, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;
                    move-result-object v0
                    invoke-static { v0 }, $STORE->fakeLocation(Landroid/content/Context;)Landroid/location/Location;
                    move-result-object v0
                    if-eqz v0, :live_fix
                    return-object v0
                    :live_fix
                """,
            )
        }

        backgroundFixFingerprints.forEach { fingerprint ->
            fingerprint.let {
                it.method.addInstructions(
                    0,
                    """
                        iget-object v0, p0, Lcom/marianhello/bgloc/c/a;->c:Landroid/content/Context;
                        invoke-static { v0 }, $STORE->fakeLocation(Landroid/content/Context;)Landroid/location/Location;
                        move-result-object v0
                        if-eqz v0, :real_fix
                        move-object p1, v0
                        :real_fix
                    """,
                )
            }
        }
    }
}
