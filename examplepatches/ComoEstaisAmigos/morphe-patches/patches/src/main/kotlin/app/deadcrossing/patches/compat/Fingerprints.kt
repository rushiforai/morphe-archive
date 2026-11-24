package app.deadcrossing.patches.compat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/** Filter 1 is the `Intent(String)` constructor. The next instruction overwrites the string register. */
internal object BindMarketBillingServiceFingerprint : Fingerprint(
    definingClass = "Lcom/feelingtouch/unityandroid/pay/checkout/BillingService;",
    name = "bindToMarketBillingService",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("com.android.vending.billing.MarketBillingService.BIND"),
        methodCall(definingClass = "Landroid/content/Intent;", name = "<init>", location = MatchAfterImmediately()),
        methodCall(name = "bindService"),
    ),
)

internal object UnityDeviceIdFingerprint : Fingerprint(
    definingClass = "Lcom/unity3d/player/UnityPlayer;",
    name = "getDeviceUniqueIdentifier",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)
