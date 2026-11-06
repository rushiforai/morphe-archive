package app.zdrgon.patches.unifiedremote.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Enable Full funnel — Unified Remote 3.25.1 (325001) ──────────────
//
// Billing is RevenueCat (API key configured in Ldh0;/SubscriptionActivity,
// entitlement id "full") over Play Billing, PLUS the legacy one-time
// route: the Subscription page links out to the separate paid app
// com.Relmtech.RemotePaid. Both routes are only WRITERS. RevenueCat's
// CustomerInfo callback (Ldh0$a;) and the legacy/promo/trial checks all
// fold into ONE local license status integer:
//
//   Lbh0;  (classes2.dex, abstract license helper)
//     c(Landroid/content/Context;)I   PUBLIC STATIC, 0x9
//       0 = Free, 1 = Locked, 2 = Full
//       Body: a chain of local overrides that can return 2 (a 3-day
//       grace flag Leh0;->a (hard-coded false in 3.25.1), an in-memory
//       static set by Lbb;, a "promo" SharedPreference in Lsw0;->Q, and
//       a trial expiry Lsw0;->e0/c0), otherwise it returns the
//       SharedPreferences int "License.Status" (default 1). That pref
//       key occurs NOWHERE else in either dex — c() is its only reader
//       and Lbh0;->k (called only by the Lch0; entitlement setter) its
//       only writer.
//
// EVERY feature gate derives from c() (verified 2026-11-03, smali
// census of both dexes):
//
//   Lbh0;->i(Landroid/content/Context;)Z   "isFull" == (c() == 2)
//     19 call sites outside Lbh0; in 16 files: custom remotes / editor
//     (Editor2Activity, Editor2ConfigActivity, Editor2URIWizardActivity),
//     Widgets (WidgetConfigActivity), Quick Actions
//     (QuickActionsConfigActivity, quickactions/c), IR actions
//     (IRActivity), NFC actions (Ldp0;), voice commands (Ldd1;),
//     screen mirroring / floating windows (RemoteInputView$a/$b,
//     RemoteMediaView, views/remote/a), ShareQrActivity, URIActivity,
//     views/menu/a.
//   Lbh0;->h(Landroid/content/Context;Ljava/lang/String;)Z
//     per-remote gate: returns i() first, otherwise checks the free
//     remote list in Lfh0; — 10 call sites in 7 files (remote select
//     NewSelectFragment(+d), views/remote/a, sn0, v31, ShortcutActivity,
//     GeneralPreferencesFragment$h). Pinning c() flips h() too, because
//     h() consults i() before the free list.
//   Direct c() readers outside Lbh0;/Lch0;:
//     MainActivity — initialises MobileAds ONLY when c() != 2, so a
//       Full status means the ad SDK is never even started (the
//       paywall's "No ads").
//     Lv31; (home/remote list) — adds a Free entry when c()==0 and a
//       Locked entry when c()==1; c()==2 is the real-buyer path.
//   Display strings Lbh0;->a/d/e all switch on c() (2 -> "Full"), so
//     the Status screen also reads Full after the pin — it is not a
//     display-only bypass risk, it is the same funnel.
//
// The only direct RevenueCat entitlement reads in app code are the
// writers/display: Ldh0$a; (folds an active "full" entitlement into
// the status via Lch0;->a(2)) and SubscriptionActivity$c (shows the
// subscription state on the Subscription page itself). No feature
// consults RevenueCat, a developer backend, or the LAN PC server at
// read time — the PC server is the remote-control target, not an
// entitlement validator.
//
// NOTE: Morphe fingerprints compare access flags by EXACT equality;
// the dex record for c() is PUBLIC | STATIC (0x9).

/** The single license-status reader. Returning 2 (Full) unlocks everything. */
object LicenseStatusFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf("Landroid/content/Context;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Lbh0;",
    name = "c"
)
