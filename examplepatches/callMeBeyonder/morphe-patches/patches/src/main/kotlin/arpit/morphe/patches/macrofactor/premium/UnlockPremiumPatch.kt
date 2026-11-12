package arpit.morphe.patches.macrofactor.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook
import app.morphe.patches.all.misc.extension.sharedExtensionPatch
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import arpit.morphe.patches.macrofactor.shared.Constants.COMPATIBILITY_MACROFACTOR_WORKOUTS
import arpit.morphe.patches.macrofactor.signature.signatureHashSpoofPatch
import arpit.morphe.util.requireRootMount

private const val EXTENSION_CLASS = "Larpit/morphe/extension/macrofactor/premium/UnlockPremiumPatch;"

// Extension loading + activity context hook. Declared before the public patch because
// top-level properties initialize in declaration order.
// `internal` so the sibling MacroFactor (com.sbs.diet) patch can reuse the same
// extension instance instead of declaring a duplicate helper patch.
internal val extensionPatch = sharedExtensionPatch(
    "macrofactor",
    activityOnCreateExtensionHook("/FlutterFragmentActivity;")
)

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium (Root)",
    description = "Unlocks all premium features. Requires root: the patched build must " +
        "be mounted over the genuine Play-signed install — a re-signed sideload " +
        "will not work.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MACROFACTOR_WORKOUTS)

    availability(requireRootMount)

    dependsOn(
        extensionPatch,
        signatureHashSpoofPatch,
        changePackageInstallerPatch()
    )

    execute {
        // Intercepts every production CustomerInfo parse path (online, offline and
        // cached) because all of them funnel into this 5-arg overload, and rewrites
        // the subscriber JSON before the SDK reads it.
        //
        // `.registers 20` with 6 parameter registers: p1 is the JSONObject body.
        // invoke-static writes no registers, so injecting at index 0 is safe.
        BuildCustomerInfoFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p1 }, ${EXTENSION_CLASS}->updateCustomerInfo(Lorg/json/JSONObject;)V
            """
        )
    }
}
