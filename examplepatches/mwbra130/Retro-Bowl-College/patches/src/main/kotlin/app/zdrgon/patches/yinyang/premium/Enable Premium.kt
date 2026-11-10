package app.zdrgon.patches.yinyang.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.yinyang.shared.Constants.COMPATIBILITY_YIN_YANG
import app.zdrgon.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Yin Yang Launcher — Enable Premium (Lifetime).
 *
 * The app sells Yin Yang Pro as a Yearly subscription ($14.99/yr) or a
 * one-time Lifetime purchase ($29.99) through RevenueCat (entitlement
 * "pro_v1"), cross-checked on-device against a direct Play Billing
 * ownership query. Both answers are merged locally into a
 * YSubscription, and SessionManager.emitSession folds that into
 * SessionFlowData, whose isPremiumUser boolean is what every feature
 * gate in the app reads (appearance/EditLook clocks, fonts, live
 * wallpapers and icons, homescreen, mindful features, MySpace,
 * widgets, promotions). Nothing is re-validated by a developer
 * backend when a feature is used; the gates trust local state.
 *
 * v1.52.0 pinned only the SessionFlowData constructor. That opened
 * the feature gates in Desktop verification, but on-device Lifetime
 * was NOT granted (Matsen, 2026-11-03, patched with v1.52.0): the
 * YSubscription object itself — the state SessionManager stores and
 * the paywall / profile surfaces read isPremium and isLifetime from
 * directly — stayed non-premium, so the app as a whole never agreed
 * the user was a Lifetime owner.
 *
 * This patch therefore pins BOTH single-constructor state objects:
 *
 * 1. YSubscription (Lwa/log;.<init>): force the isPremium parameter
 *    (p1) and the isLifetime parameter (p7) to true immediately
 *    before their field stores. Every YSubscription in the app is
 *    built by this one constructor (both the RevenueCat build and
 *    the Play-only fallback build inside updateSubscriptionSession),
 *    so the stored subscription, the session derived from it, the
 *    profile/paywall state and every direct reader all agree.
 *    Forcing isLifetime as well as isPremium matters: a plain
 *    subscription state is not the Lifetime state the $29.99
 *    one-time purchase produces.
 * 2. SessionFlowData (Loc/for;.<init>): force the isPremiumUser
 *    parameter (p3) to true immediately before its store, as before,
 *    so every session — the real emitted one and the fallback
 *    instances feature code builds — reports a premium user even if
 *    a future billing sync rewrites the subscription.
 *
 * Neither pinned register is read again after its store in either
 * constructor. The patch creates no purchase, forges no receipt, and
 * touches nothing in RevenueCat or the billing library; it only
 * changes the app's own answer to its own question.
 *
 * PairIP note: 5.13.1 is PairIP LIGHT (application + licensecheck in
 * classes2.dex, no VM, no native PairIP lib, no SignatureCheck) and
 * its local installer check is LIVE (LicenseClient
 * .performLocalInstallerCheck -> getInstallSourceInfo), so the
 * companion "Change installer source" patch in this folder is
 * REQUIRED for a re-signed build to get past the license check at
 * all — exactly the Video Cutter situation. Both patches ship
 * default-on.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Yin Yang Pro for free, as if the Lifetime purchase were bought: all clocks, fonts, live wallpapers and icons. Also enable the Change installer source patch (pre-selected) — it is required for the patched app to pass the license check.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YIN_YANG)

    execute {
        // ── Pin 1: YSubscription — isPremium (p1) and isLifetime (p7) ──
        YSubscriptionConstructorFingerprint.method.apply {
            val insns = instructionsOrNull?.toList()
                ?: throw PatchException("YSubscription constructor has no instructions.")
            fun storeIndexOf(fieldName: String): Int = insns.indexOfFirst { insn ->
                if (insn.opcode != Opcode.IPUT_BOOLEAN) return@indexOfFirst false
                val ref = insn.getReference<FieldReference>() ?: return@indexOfFirst false
                ref.definingClass == "Lwa/log;" && ref.name == fieldName
            }
            // Field "for" = isPremium (stored from p1); field "this" = isLifetime (stored from p7).
            val premiumStoreIndex = storeIndexOf("for")
            val lifetimeStoreIndex = storeIndexOf("this")
            if (premiumStoreIndex < 0 || lifetimeStoreIndex < 0) {
                throw PatchException("Could not find the isPremium/isLifetime stores in the YSubscription constructor.")
            }
            // Insert at the later index first so the earlier index stays valid.
            addInstructions(
                lifetimeStoreIndex,
                """
                    const/4 p7, 0x1
                """.trimIndent()
            )
            addInstructions(
                premiumStoreIndex,
                """
                    const/4 p1, 0x1
                """.trimIndent()
            )
        }

        // ── Pin 2: SessionFlowData — isPremiumUser (p3) ──
        SessionFlowDataConstructorFingerprint.method.apply {
            val insns = instructionsOrNull?.toList()
                ?: throw PatchException("SessionFlowData constructor has no instructions.")
            // The store of the isPremiumUser field: iput-boolean p3, p0, Loc/for;->try:Z
            val storeIndex = insns.indexOfFirst { insn ->
                if (insn.opcode != Opcode.IPUT_BOOLEAN) return@indexOfFirst false
                val ref = insn.getReference<FieldReference>() ?: return@indexOfFirst false
                ref.definingClass == "Loc/for;" && ref.name == "try"
            }
            if (storeIndex < 0) {
                throw PatchException("Could not find the isPremiumUser store in the SessionFlowData constructor.")
            }
            // Force the parameter register to true right before it is stored.
            addInstructions(
                storeIndex,
                """
                    const/4 p3, 0x1
                """.trimIndent()
            )
        }
    }
}
