package app.template.patches.youcut.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

// YouCut keeps the Pro entitlement in SharedPreferences and exposes one app-wide static check.
// The class is not obfuscated; the method name (d in 1.722.1225) is, so the two preference keys
// it reads are the anchor. It holds "SubscribePro" and the older "com.camerasideas.trimmer.vip"
// key, then also checks User.expireType, "SubscribeProOfHw" and the fup/redeem packages.
internal object ProGateFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf(string("SubscribePro"), string("com.camerasideas.trimmer.vip")),
)
