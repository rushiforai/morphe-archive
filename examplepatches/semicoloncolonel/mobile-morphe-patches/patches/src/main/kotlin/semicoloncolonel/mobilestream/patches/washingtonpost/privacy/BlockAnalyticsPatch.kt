package semicoloncolonel.mobilestream.patches.washingtonpost.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.washingtonpost.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Third-party SDKs in the 7.18.1 phone build: AppsFlyer, Chartbeat, comScore,
// Permutive (audience targeting), Iterable (marketing events), Airship's event
// upload (combine.*) and Firebase Analytics. WaPo keeps OkHttp's public names,
// so both shared layers apply: URLConnection and OkHttp (see BlockTrackers.kt).
//
// No manifest kill switches here: the patcher cannot re-encode this app's
// resources (ARSCLib fails on fusion_cell_label_bottom_card.xml, "Unknown
// attribute name 'a:id'"), so every WaPo patch stays bytecode-only. That is
// also why WaPo is left out of Disable auto-updates. Firebase's upload hosts
// are still blocked on the network.
//
// Not touched: OneTrust (privacy consent), Airship push registration,
// sign-in and article loading.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops analytics and tracking in the Washington Post phone app: AppsFlyer, " +
        "Chartbeat, comScore, Permutive, Iterable, Airship analytics and Firebase. Blocking " +
        "happens on the device, inside the app. Sign-in, articles and push notifications are " +
        "left alone. Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
