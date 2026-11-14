package semicoloncolonel.mobilestream.patches.checkout51.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.checkout51.shared.Constants

private const val GAS_OFFER_LIST =
    "Lsemicoloncolonel/mobilestream/extension/checkout51/GasOfferList;"

// ─────────────────────────────────────────────────────────────────────────────
// Show gas offers on OpenStreetMap.
//
// Checkout 51's Google Maps key accepts only the app's own signature, so both
// gas maps are blank in every patched build ("Authorization failure" in the
// log). The offers still load: the map fragment's markers observer receives
// them before it draws the pins. GasOfferList runs first in that observer and
// covers the Google map with an OpenStreetMap view (OsmMapView) that has a pin
// per offer, above a list of the offers, nearest first. Tapping a pin or a
// row opens the app's own details bar, as tapping a Google pin does.
//
// The Details screen's map gets the same OpenStreetMap view with the station,
// and a Directions button that opens it in the maps app you choose.
//
// Map tiles come from tile.openstreetmap.org, which sees the device's IP
// address and the area on screen. Tiles are kept on the device for seven days.
// ─────────────────────────────────────────────────────────────────────────────

internal object GupMarkersObserverFingerprint : Fingerprint(
    definingClass = "Lcom/c51/feature/gup/ui/GupMapFragment;",
    name = "onViewCreated\$lambda\$2",
    parameters = listOf("Lcom/c51/feature/gup/ui/GupMapFragment;", "Lcom/c51/core/data/Resource;"),
)

internal object GupDetailsViewCreatedFingerprint : Fingerprint(
    definingClass = "Lcom/c51/feature/gup/ui/GupDetailsFragment;",
    name = "onViewCreated",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    returnType = "V",
)

@Suppress("unused")
val listGasOffersPatch = bytecodePatch(
    name = "Show gas offers on OpenStreetMap",
    description = "Replaces the gas maps, which are blank in a patched app because Google Maps rejects its key, " +
        "with OpenStreetMap maps and a list of the offers. The details screen gets a Directions button.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        GupMarkersObserverFingerprint.method.addInstructions(
            0,
            "invoke-static { p0, p1 }, $GAS_OFFER_LIST->onMarkers(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
        GupDetailsViewCreatedFingerprint.method.addInstructions(
            0,
            "invoke-static { p0, p1 }, $GAS_OFFER_LIST->onDetailsView(Ljava/lang/Object;Landroid/view/View;)V",
        )
    }
}
