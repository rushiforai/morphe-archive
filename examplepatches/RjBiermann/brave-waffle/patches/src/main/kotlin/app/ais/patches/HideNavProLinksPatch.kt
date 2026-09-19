package app.ais.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * The mobile nav drawer has several entries that are useless without a
 * (working, PRO) server account: "Your Account" (login), "Get Free PRO",
 * "PRO Benefits", "PornDB", "Global Search" and "PornTabs". The server
 * rejects these features for non-whitelisted builds and non-PRO accounts
 * ("You are not logged in!" / redownload error), so they can be hidden from
 * the drawer. "Player Playlist" is client-side and stays.
 *
 * Runtime-toggleable: the pref `morphe_hide_nav_pro` (default false, i.e.
 * links visible) is set by the "Hide account / PRO links" switch added to
 * the phone settings screen by ModSettingsPatch, and read here in
 * `NavDrawer.onCreate` so a toggle applies on the next screen creation.
 *
 * The app already hides its debug entries (Test Suite / Errors / Get Link)
 * in `NavDrawer.onCreate` with `menu.findItem(id).setVisible(false)`.
 * The same pattern is appended right after that block, wrapped in the pref
 * check. The existing code leaves the Menu reference clobbered
 * (`move-result-object v0`), so the menu is re-fetched from the
 * NavigationView (`p1`) first. Only v0/v1 are touched; `v8` (false) is
 * reused as both the pref default and the setVisible(false) argument.
 */
private val HIDDEN_NAV_IDS = intArrayOf(
    0x7f0b0324, // nav_premium    "Your Account"
    0x7f0b032b, // nav_tokens     "Get Free PRO"
    0x7f0b0316, // nav_buypro     "PRO Benefits"
    0x7f0b0323, // nav_porndb     "PornDB"
    0x7f0b0326, // nav_search_pro "Global Search"
    0x7f0b0329, // nav_tabs       "PornTabs"
)

object MobileNavFingerprint : Fingerprint(
    definingClass = "Lcom/streamdev/aiostreamer/mobile/ui/NavDrawer;",
    name = "onCreate",
    returnType = "V"
)

@Suppress("unused")
val hideNavProLinksPatch = bytecodePatch(
    name = "Hide account/PRO nav links",
    description = "Adds a settings toggle ('Hide account / PRO links') that hides the account and PRO-only entries (Your Account, Get Free PRO, PRO Benefits, PornDB, Global Search, PornTabs) from the mobile navigation drawer. Off by default.",
    default = true // runtime-controlled now; pref default keeps the links visible
    ) {
    compatibleWith(Constants.COMPATIBILITY_APP)

    execute {
        val method = MobileNavFingerprint.method
        // The app hides its debug entries with three MenuItem->setVisible(Z)
        // invoke-interface calls; the third (last) one is where our block
        // gets appended. invoke-interface refs are plain MethodReferences here.
        val lastIndex = method.implementation!!.instructions.indexOfLast {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref != null && ref.definingClass == "Landroid/view/MenuItem;" && ref.name == "setVisible"
        }
        var index = lastIndex
        // Runtime gate: only v0/v1 are used; v8 (false) serves as pref default
        // and as the setVisible(false) argument below.
        val sb = StringBuilder(
            """
            const-string v1, "morphe_hide_nav_pro"
            sget-object v0, Lka1;->j:Landroid/content/SharedPreferences;
            invoke-interface {v0, v1, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
            move-result v1
            if-eqz v1, :cond_morphe_nav_skip
            invoke-virtual {p1}, Lcom/google/android/material/navigation/NavigationView;->getMenu()Landroid/view/Menu;
            move-result-object v0
            """.trimIndent()
        )
        for (id in HIDDEN_NAV_IDS) {
            sb.append("\nconst v1, $id\n")
            sb.append("invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;\n")
            sb.append("move-result-object v1\n")
            sb.append("invoke-interface {v1, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;\n")
        }
        sb.append(":cond_morphe_nav_skip\nnop")
        method.addInstructionsWithLabels(++index, sb.toString())
    }
}
