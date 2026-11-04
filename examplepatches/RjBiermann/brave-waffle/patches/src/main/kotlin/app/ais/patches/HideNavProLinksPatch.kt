package app.ais.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import util.assembleFirstMethod

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
 * the phone settings screen by ModSettingsPatch, and read here so a toggle
 * applies on the next screen creation.
 *
 * The hide loop lives in an added static method taking the NavigationView:
 * `NavDrawer.onCreate` has 10 locals, so p1 (the NavigationView at that
 * point, reused from the Bundle parameter) is v11 — out of range for 4-bit
 * register instructions — and clobbering its locals makes the verifier
 * reject the method (v1 must stay an Integer at the merge point) and breaks
 * navigation. One range invoke touches nothing.
 */
private val HIDDEN_NAV_IDS = intArrayOf(
    0x7f0b0330, // nav_premium    "Your Account"
    0x7f0b0337, // nav_tokens     "Get Free PRO"
    0x7f0b0322, // nav_buypro     "PRO Benefits"
    0x7f0b032f, // nav_porndb     "PornDB"
    0x7f0b0332, // nav_search_pro "Global Search"
    0x7f0b0335, // nav_tabs       "PornTabs"
)

private val HIDE_NAV_SMALI = buildString {
    append(
        """
        .class public Lcom/streamdev/aiostreamer/mobile/ui/NavDrawer;
        .super Ljava/lang/Object;

        .method public static morpheHideNav(Lcom/google/android/material/navigation/NavigationView;)V
            .locals 4
            sget-object v0, Lc34;->q:Landroid/content/SharedPreferences;
            const-string v1, "morphe_hide_nav_pro"
            const/4 v2, 0x0
            invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
            move-result v0
            if-eqz v0, :cond_morphe_nav_done
            invoke-virtual {p0}, Lcom/google/android/material/navigation/NavigationView;->getMenu()Landroid/view/Menu;
            move-result-object v0
            const/4 v3, 0x0

        """.trimIndent()
    )
    for (id in HIDDEN_NAV_IDS) {
        append("\n    const v1, $id")
        append("\n    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;")
        append("\n    move-result-object v1")
        append("\n    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;")
    }
    append(
        """

            :cond_morphe_nav_done
            return-void
        .end method
        """.trimIndent()
    )
}

private const val NAV_DRAWER_CLASS = "Lcom/streamdev/aiostreamer/mobile/ui/NavDrawer;"

object MobileNavFingerprint : Fingerprint(
    definingClass = NAV_DRAWER_CLASS,
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
        // invoke-interface calls; the third (last) one is where our call
        // gets appended, i.e. right after the drawer is fully built.
        val lastIndex = method.implementation!!.instructions.indexOfLast {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref != null && ref.definingClass == "Landroid/view/MenuItem;" && ref.name == "setVisible"
        }
        check(lastIndex >= 0) { "NavDrawer.onCreate: no setVisible call found" }

        mutableClassDefByOrNull(NAV_DRAWER_CLASS)!!
            .directMethods
            .add(MutableMethod(assembleFirstMethod(HIDE_NAV_SMALI, "hide-nav helper")))

        method.addInstructions(
            lastIndex + 1,
            "invoke-static/range {p1 .. p1}, $NAV_DRAWER_CLASS->morpheHideNav(Lcom/google/android/material/navigation/NavigationView;)V"
        )
    }
}
