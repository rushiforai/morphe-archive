package app.template.patches.meesho.ui

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.MEESHO_COMPATIBILITY
import org.w3c.dom.Element

// Make Meesho's externally reachable entry activities non-exported.
//
// From a decoded manifest, two exported activities take external input:
//   • com.meesho.supply.main.deeplinkresolver.SharedTextRedirectionActivity
//     — exported, ACTION_SEND text/plain (any app can feed it shared text)
//   • com.meesho.account.impl.mybank.MyBankActivity
//     — exported, <custom scheme>://my_bank_details deep link
//
// Setting android:exported="false" keeps internal navigation working (the app
// starts them with explicit intents) while removing the external attack/nag
// surface. The launcher (MainActivity), deep-link trampoline
// (TrampolineActivity) and SEARCH activity are intentionally left exported —
// they are the app's public entry points.
//
// Fail-safe: activities not present are left stock.

private val ENTRY_ACTIVITIES_TO_LOCK = setOf(
    "com.meesho.supply.main.deeplinkresolver.SharedTextRedirectionActivity",
    "com.meesho.account.impl.mybank.MyBankActivity",
)

@Suppress("unused")
val meeshoNonExportExternalEntryActivitiesPatch = resourcePatch(
    name = "Lock exported share-in / bank-link activities",
    description = "Makes Meesho's exported SharedTextRedirectionActivity and MyBankActivity " +
        "non-exported. Internal navigation still works; external apps/links can no longer " +
        "start them.",
    default = false,
) {
    compatibleWith(MEESHO_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { document ->
            val activities = document.getElementsByTagName("activity")
            for (index in 0 until activities.length) {
                val activity = activities.item(index) as? Element ?: continue
                if (activity.getAttribute("android:name") in ENTRY_ACTIVITIES_TO_LOCK) {
                    activity.setAttribute("android:exported", "false")
                }
            }
        }
    }
}
