package app.twoeno.patches.untappd.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.twoeno.patches.shared.Constants.COMPATIBILITY_UNTAPPD
import app.twoeno.patches.shared.EXTENSION
import app.twoeno.patches.shared.EXTENSION_PACKAGE
import app.twoeno.patches.shared.inspectReturnedObjects

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/untappd/HideFeedAdsPatch;"

internal object GetAllConfigValuesFingerprint : Fingerprint(
    definingClass = "Lio/invertase/firebase/config/UniversalFirebaseConfigModule;",
    name = "getAllValuesForApp",
    parameters = listOf("Ljava/lang/String;"),
)

@Suppress("unused")
val hideFeedAdsPatch = bytecodePatch(
    name = "Hide feed ads",
    description = "Removes the ad slots from the activity feed.",
) {
    compatibleWith(COMPATIBILITY_UNTAPPD)

    extendWith(EXTENSION)

    execute {
        GetAllConfigValuesFingerprint.method.inspectReturnedObjects(
            "$EXTENSION_CLASS->overrideConfigValues(Ljava/lang/Object;)V",
        )
    }
}
