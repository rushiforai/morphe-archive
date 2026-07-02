package app.template.patches.ihealth.buyMoreLink

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

// Fingerprints the ViewBinding constructor that wires up the "Buy more iHealth devices?"
// TextView click listener. The string "method 'onBuyMoreClicked'" is a ButterKnife debug label
// loaded immediately before the findRequiredView call for that specific view, making it a stable
// anchor even if other findRequiredView calls are reordered.
object BuyMoreDeviceLinkFingerprint : Fingerprint(
    definingClass = "Lcom/ihealth/business/common/mydevices/DevicesFragment_ViewBinding;",
    strings = listOf("method 'onBuyMoreClicked'"),
    filters = listOf(
        string("method 'onBuyMoreClicked'"),
        methodCall(
            definingClass = "Lbutterknife/internal/Utils;",
            name = "findRequiredView",
        ),
    )
)
