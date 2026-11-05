package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    private const val FLASHSCORE_SOURCE_NOTE = "Download the .apks from apkcube.com"

    // Shared hardening pass 2026-10-19 (smoke tests; no app changed behaviour on purpose):
    //   - GmsCore support (shared builder): clearMatch() also on each app's launch-activity
    //     onCreate and early-return fingerprints, so a second patch run in one process re-resolves
    //     them; early-return targets must have a body and return V or Z (else the patch fails).
    //     routeGoogleIdRequestsToBeginSignIn counts its isAvailableOnDevice rewrites and fails
    //     when onGetCredential has a body and the Identity Credentials client (action
    //     com.google.android.gms.identitycredentials.service.START) is present but nothing was
    //     rewritten. Rewrites: FotMob 3; Shazam, Sofascore and Truecaller 1; 365Scores 0 (no client).
    //   - OsmAnd, OneFootball, Pocket Color Wheel and SoundHound: lookups that were optional are
    //     now required (a missing class or getter fails the patch).
    //   - Unified Remote and WiFi Analyzer: the gate is singleOrNull() (a second match fails).
    //   - FotMob Enable FotMob+: the subscription getter is singleOrNull(), and on 238+ the
    //     app-icon step fails the patch instead of warning (see COMPATIBILITY_FOTMOB).
    //   - 365Scores Disable update prompts: the two update extras are compared as a set of keys,
    //     not a count.
    //   - Configuration rule (owner, 2026-10-19): every Compatibility lists only the latest
    //     verified target, the one its smoke test runs against.

    // Signatures (2026-10-25, patcher 2.0): each Compatibility lists the SHA-256 of the signing
    // certificate of its verified target APK (apksigner on the APK, or the original base split
    // recorded when a bundle was merged; Firefox from Mozilla's own 158.0 build). Morphe Manager
    // 2.x warns, with an option to go on, when a picked APK is signed by none of them; on
    // Android 10 and older it skips the check. Textra has none: its Play-signed cert came from
    // one mirror only. On an app update, check the signer and keep or replace the hash.

    // 2026-10-12 APK-finder audit: only distributed as a split bundle (APKMirror BUNDLE /
    // APKPure-Uptodown XAPK), so apkFileType is APKM; any "universal APK" note below is outdated.
    // 2026-11-03: "Hide countries" (opt-in, Patch settings list sofascore.hidden_countries) on
    // 26.10.19. Anchors: the kept model getters SportCategoriesResponse/CategoriesForDateResponse
    // .getCategories and SearchResponse.getResults, the request lambdas calling the kept Retrofit
    // methods NetworkCoroutineAPI.sportLiveEvents / getIndexedEventsPage (their case's return), the
    // country list <clinit> (Country constructor calls, read at patch time for the picker seeds) and
    // ReleaseApp.onCreate; all OK-unique in FingerprintProbe. Smoke test, CLI without -f (all 18
    // Sofascore patches) and a disassembly of every hook pass. Emulator
    // 2026-11-03: the picker lists ~241 entries (England, Scotland, Wales, NI separate, plus regions);
    // with England hidden it is gone from the Today feed, Leagues and competition search after a
    // restart, back after Clear all; hiding World works. Search teams carry no category, so
    // teams fall back to Team.getCountry(); players (whose team has no country in search) are
    // dropped via a team id -> country map filled from team and event results. Seeded country
    // names win over seen labels ("England Amateur" shares EN). Re-run on the emulator the same
    // day: England listed on first open, "Arsenal" shows no English teams or players, Clear all
    // restores them. The Live
    // tab had no English matches live, so it was not observed.
    // 2026-11-03: "Hide competitions" (opt-in, Patch settings list sofascore.hidden_competitions,
    // keys = UniqueTournament ids, labels "category · name") on 26.10.19. The hook sites of both
    // list patches moved into one unnamed patch (sofascoreListFiltersPatch); new anchors there: the
    // kept getter UniqueTournamentGroupResponse.getUniqueTournaments (a country's competitions in
    // Leagues) and the request lambda calling NetworkCoroutineAPI.categoryScheduledEvents (an
    // expanded country of the date feed; ro3, which returns the result via move-object v0, v1).
    // All eight list anchors OK-unique in FingerprintProbe; smoke test, CLI without -f (all 19
    // Sofascore patches) and a disassembly of the new sites pass. Not run on the emulator yet.
    val COMPATIBILITY_SOFASCORE = Compatibility(
        name = "Sofascore", // App name as it appears in the Android launcher.
        packageName = "com.sofascore.results",
        apkFileType = ApkFileType.APKM, // Preferred or recommended file type.
        appIconColor = 0x384CF4, // Icon color in Morphe Manager.
        signatures = setOf("ecd3a2c9902adbef2653b105924a97f1755bbebb93c5f2b2a1fb56c7b009f841"), // CN=Sofa Score, O=SofaScore
        targets = listOf(
            // "version = null" means the patch works with the latest app target
            // and is expected to work with all future app targets.
            //
            // It is highly recommended to always include the exact app version you developed your patches for
            // or the last version you have confirmed as 100% working.
            // History (26.07.27 to 26.09.14 were supported until 2026-10-12, see the last note):
            // Verified 2026-09-17: 26.08.24 (the build users reported failing with a
            // NullPointerException in Disable telemetry - issue #7) patches cleanly with all
            // 5 patches. The crash came from returnEarly() being applied to an abstract
            // AppsFlyerLib.logEvent declaration; the fingerprint now requires an actual
            // method body, and the emitted bytecode was checked on this version.
            // Verified 2026-09-17 against com.sofascore.results 26.09.07 (versionCode 260907002,
            // universal, Android 12L+). This build shuffled a lot: the app-level premium gates
            // the old "Enable Premium" fingerprints targeted (aiInsights/removeAds/PremiumToken/
            // isPremium) are gone, FirebaseAnalytics.logEvent was removed, Adjust is no longer
            // bundled and the Facebook/Crashlytics SDK classes are R8-renamed. The patches were
            // re-anchored:
            //   - Disable ads: unchanged; UserAccount getForceAds/getForceHideAds/getHasServerAds
            //     are still unobfuscated.
            //   - Enable Premium: forces UserAccount.getHasPremium() and ProfileData.getHasPremium(),
            //     the two boxed-Boolean flags every premium gate reads.
            //   - Disable telemetry: AppsFlyer Lib subclass logEvent, AppMeasurementSdk.logEvent,
            //     and Crashlytics (located via its collection-enabled SharedPreferences key).
            //   - Disable Facebook SDK: AudienceNetworkContentProvider onCreate only, plus
            //     manifest flags disabling FB auto-log/advertiser-ID. FacebookInitProvider
            //     must NOT be killed: the login screen builds FB Login handlers and crashes
            //     with "SDK has not been initialized" without sdkInitialize() (issue #24,
            //     fixed 2026-09-30; verified on 26.09.14).
            // The "Block marketing notifications" patch dismisses two in-app promo
            // sheets only; it cannot affect push. Missing match alerts on re-signed
            // builds traced to push delivery itself (issue #25); "GmsCore support" and
            // "Spoof signature" (added 2026-10-12) cover that.
            //   - Block marketing notifications: PromotionModal / tennis promo bottom sheet
            //     onViewCreated dismiss the sheet before it renders.
            // The "Disable Play Integrity" patch was dropped: this build does not bundle the
            // Play Integrity classes (the AppsFlyer SDK only references them, behind a catch),
            // so the patch had nothing to patch.
            // All 5 patches apply cleanly; SofascoreSmokeTest asserts the emitted bytecode.
            // Re-verified 2026-09-28 against 26.09.14 (versionCode 260914002, from
            // APKMirror): all 5 patches apply unchanged and the decompiled output shows
            // the same forced values (getHasPremium -> TRUE, ad flags false).
            // Verified 2026-10-07 against 26.09.28 (versionCode 260928002, APKPure bundle
            // merged). The tennis AI-insights promo sheet was removed in this build, so Block
            // marketing notifications treats it as optional (PromotionModal stays required)
            // and now also keeps the PromotionBannerView / PromotionalOffersBannerView
            // promotion banners GONE. The other four patches apply unchanged. Enable Premium's
            // description now states that server-served premium content (AI insights) is
            // not unlocked (issue #32).
            // 2026-10-12, 26.09.28 (still the latest on APKMirror): added "GmsCore support"
            // (shared builder, off by default; FCM push via FCMListenerService and Google login
            // via androidx.credentials GetGoogleIdOption, launch activity main.start.StartActivity;
            // here R8 inlined isGooglePlayServicesAvailable into GoogleApiAvailabilityLight.b, so
            // the shared fingerprint now anchors on its signature warning) and "Spoof signature"
            // (CN=Sofa Score cert, SHA-1 e235776b...4d23, from the APKMirror base APK; Firebase
            // checks it, issues #24/#25). Block marketing notifications now also no-ops every
            // FirebaseInAppMessagingDisplay.displayMessage, so FIAM campaign popups never show.
            // Assessed and rejected: forcing UserAccount.isLoggedIn (predictions, sync, chat all
            // need a real server token), update/review prompts (no Play Core, no custom update
            // screen), odds/betting, paywall and survey/popup surfaces (server-driven). The older
            // targets were dropped: the new patches were only verified on 26.09.28.
            // 2026-10-17: updated to version 26.10.05 (versionCode 261005002; signer CN=Sofa Score,
            // cert SHA-256 ecd3a2c9...9f841, SHA-1 unchanged). Every existing anchor stayed unique;
            // only R8 names moved. 26.09.28 was dropped (latest verified version only). Changes:
            //   - Shared GmsCore support: ensurePlayServicesAvailable is a(Context)V here (R8 dropped
            //     the version parameter), so the old (Context, int) fingerprint never matched; it now
            //     matches (Context), (Context, int) and (int, Context) and fails when missed.
            //   - New "Hide betting content" (off by default, like Flashscore's), anchored on
            //     preference keys plus shape: the static (Context, SharedPreferences)Z odds decision
            //     ("PREF_PROVIDER_ODDS_ENABLE"; 11 methods hold the key, only this one has the
            //     shape) -> false; EventHeadFlags getAdditionalOdds /
            //     getAdditionalOddsComparison / getRecommendedPrematchOdds (kept model) -> false; the
            //     static (Context)String Bet365 open-account link (URL prefix) -> null (both callers
            //     null-check); the static (Context)Z "PREF_PROMOTIONS_ENABLE" -> false; the static
            //     (Context)Z "ODDS_PROVIDERS_DISABLED" -> true (hides the dead odds settings row).
            //     This supersedes the "odds/betting" rejection above for these client-side gates.
            //   - Disable ads: getHasServerAds() false made the one-time "Active subscription"
            //     upgrade sheet open for everyone. Its modal-queue predicate (found through the
            //     "Active subscription" modal's <clinit> and the "PR_XAIST" key) now reads
            //     hasServerAds as true, so the sheet is never queued.
            //   - New "Disable rating prompts": the "Rating Info" modal predicate reads
            //     "ask_review_v3" as false, so the rating dialog is never queued (the modal queue
            //     never waits for a dismiss). This supersedes the "review prompts" rejection above:
            //     the dialog is the app's own (Play's review API isn't bundled).
            //   - The unused FacebookInitProviderFingerprint was removed.
            // Decompile-checked 2026-10-17 (CLI, no -f, all 10 patches Applied; every hook above,
            // the ServiceCheck return-void and the extension's "sign-in and notifications" text
            // match). Emulator 2026-10-17 (morphe-play, MicroG RE installed, stock control with the
            // same test key): patched cold-starts x2 with no crash; no upgrade sheet; the list and
            // match-page test banners are gone; the bet365 1X2 "Ad" odds block and 18+ text are
            // gone, there is no Odds tab, and Settings > Odds is hidden; no MicroG warning;
            // the C2DM register reaches MicroG RE with no error (no token logged). The battery
            // dialog didn't show (StartActivity finishes first; a known gap of the check).
            // 2026-10-19 (issue list; smoke test): Disable telemetry now no-ops AppsFlyer's
            // start, logSession, logAdRevenue and every logEvent overload (the Flashscore
            // approach: every concrete void of those names on the AppsFlyerLib subclass;
            // previously only the 4-arg logEvent), and forces the Firebase Analytics manifest
            // switch "firebase_analytics_collection_deactivated" to read as true in the
            // bytecode (the Truecaller approach; zzal.k0 reads it through the config helper
            // Boolean zzal.j0(String) here, and the read's result is overwritten with
            // Boolean.TRUE right after its move-result-object), so measurement never starts
            // and the automatic first_open / session_start / screen_view events stop. No
            // resource patch: a manifest edit would re-encode the whole resource table.
            // Rule 12 (2026-10-19 audit): the resource table is still re-encoded by the
            // default-on Disable Facebook SDK (its manifest flags) and by GmsCore support, and
            // that strips the literal surrounding quotes of the Arabic (values-ar)
            // string/fantasy_rebuild_squad_token. Not checked at runtime.
            // 2026-10-22: updated to version 26.10.12 (versionCode 261012002; APKMirror bundle,
            // signer CN=Sofa Score cert SHA-256 ecd3a2c9...f841, identical on APKPure). All 9 patches
            // apply unchanged: SofascoreSmokeTest passes, and the Morphe matcher (FingerprintProbe)
            // resolves 14 of 15 fingerprints uniquely - the 15th, TennisPromoSheet, is the documented
            // optional sheet removed in 26.09.28. 26.10.05 was dropped (latest verified version only).
            // 2026-10-22 additions on 26.10.12 (owner-approved; all three new fingerprints OK-unique
            // in FingerprintProbe, asserted in SofascoreSmokeTest):
            //   - Disable telemetry, "Sofascore NATS analytics": the app's own first-party event
            //     sender (sends user_id, analytics_user_id, account id, advertising id, device info
            //     and geo with every event) returns early. Anchor: (String, FirebaseBundle)V shape
            //     plus "event_date" + "event_timestamp" (b9e.c here). The method never references
            //     the NATS client or the live-update connection, which stay untouched.
            //   - Disable telemetry, "Firebase Performance off": isPerformanceMonitoringEnabled
            //     (vp3.o here) returns false. Anchor: no-arg Z holding "fpr_enabled",
            //     "fpr_disabled_android_versions" and "com.google.firebase.perf.SdkEnabled".
            //   - Disable ads, "skip ad SDK start-up": ReleaseApp's no-arg void consent method
            //     ("ad_personalization" + "analytics_storage"; ReleaseApp is the unobfuscated
            //     manifest Application class) loses its single
            //     Thread.start() (the patch fails on any other count), so the background thread
            //     that sets ad consent and starts Mintegral/Unity/Moloco/Pangle/Equativ/Nimbus/
            //     AppHarbr and MobileAds.initialize never runs; the Firebase consent code stays
            //     and the shared R8 runnable's run() is untouched. Rule 9: every MobileAds static
            //     void is neutralised too (setAppVolume/setAppMuted come from the init listener and
            //     AppHarbr, openDebugMenu from the hidden developer options). The banner,
            //     interstitial, rewarded and IMA preroll load paths were traced: all are gated by the ad-free flags Disable ads already forces and by
            //     PREF_AD_ADAPTER_INITIALISED (stays false without init), so no GMA load hooks.
            //   - UserAccount.getDataSharingOptOut is deliberately NOT forced: it is serialized
            //     with the account and synced to the user's Sofascore account, so forcing it
            //     would change a server-side account setting, not just this device.
            //   Status: smoke test, Morphe matcher and CLI decompile check (all 9 patches Applied
            //   without -f; only the 3 new methods changed vs the earlier verification). Emulator
            //   (stock control, all 9 patches): no crash/ANR/MobileAds error; the stock Unity,
            //   Mintegral, Pangle, InMobi, Audience Network and AdMob data files and the fireperf
            //   settings fetch are absent in patched; live scores still update (clock and new
            //   incidents on a live match). Push, MicroG sign-in and the NATS transport not observed.
            //   The rule-9 MobileAds statics step was added after those runs: it is covered by
            //   SofascoreSmokeTest and a separate CLI decompile check, not by the emulator run.
            // 2026-10-28: updated to 26.10.19 (versionCode 261019002, APKPure XAPK, armeabi-v7a
            // only, signer unchanged). All seven patches apply unchanged: the smoke test passes,
            // CLI without -f applies all seven, and the patched UserAccount gates decompile to
            // getForceAds=false, getForceHideAds=true, getHasServerAds=false. No emulator run (the
            // bundle is 32-bit ARM only).
            // 2026-11-03: Heval Controls framework on 26.10.19 (Play arm64 fixture, vc 261019002).
            // Host: "Patch settings" (the UI name since 2026-11-03, was "Heval Controls") with a row
            // after "Preferences" in Settings (SettingsFragment's (View, Bundle)V onViewCreated
            // work, O here, calls HevalControlsEntry.addRow(root) first;
            // the row is a second ProfileClickableRowView). Runtime switches (Manager defaults kept):
            //   - Disable rating prompts, Hide betting content, Block marketing notifications are now
            //     feature patches (same names/descriptions). Rating no longer forces "ask_review_v3":
            //     the modal queue hook below drops "Rating Info". Betting: the same 5 sites, gated;
            //     the three EventHeadFlags getters have no local register, so they answer
            //     `flag && !isEnabled` right before their return. Marketing: the same sheets, banners
            //     and FIAM displays, gated (FIAM stubs that are already return-void are skipped).
            //   - New Hide AI insights (EventHeadFlags.getAiInsights) and Hide match tabs (7 getters:
            //     commentary, crowdsourcing, media, graphs, standings, cup tree, matches), plus a guard
            //     in navigateToTab (inlined into a Function1 lambda: the cast to the tab enum, found by
            //     its <clinit> names, followed by a cast to EventActivity) so a hidden tab is not added
            //     back.
            //   - New Hide promo pop-ups: the modal queue's enqueue ((descriptor)Z holding
            //     "last_shown_pop_up_timestamp", for the MANUAL modals) and its suspend evaluator
            //     ((descriptor, ...)Serializable in the same class, for the startup list) ask
            //     hideModal(name) first. The descriptor base is the "Rating Info" descriptor's
            //     superclass. Consent and Active subscription modals have no switch.
            //   - New Hide sports (25 switches, restart required): the Room results of
            //     "SELECT * FROM sport_order ..." and "SELECT sportName ... ORDER BY" (two lambdas) are
            //     filtered, the "isSelected = 1" results and the PREF_HOME_SPORT_V2 getter map a hidden
            //     selection to the first visible sport. Never empty; no DELETE exists, so no row is lost.
            //   - New Hide promo sections (10 Remote Config keys, restart required): Remote Config
            //     getBoolean (instance (String)Z reading the value handler's Patterns; the handler is
            //     found by "^(1|true|t|yes|y|on)$") asks hidePromoSection(key) first. What each key
            //     shows was read from call sites only.
            // FingerprintProbe: SettingsFragmentViewCreated and HomeSport OK-unique; all older ones
            // unchanged (TennisPromoSheet stays the documented optional miss). Smoke test green.
            // 2026-11-03 emulator (patched build of the release batch, stock control): cold start OK, the Patch settings row sits after Preferences, Hide Tennis removed Tennis from the sport strip and picker after a restart.
            // 2026-11-03 speed work on 26.10.19 (owner-approved):
            //   - Disable ads also skips the ad SDK start-up components, in bytecode (the patch has
            //     no resource pass): onCreate()Z of IronsourceLifecycleProvider,
            //     LevelPlayActivityLifecycleProvider, MBComponentLifecycleProvider and VungleProvider
            //     returns true, and Unity's AdsSdkInitializer.create(Context)Object returns
            //     Boolean.FALSE (all manifest-named, so the names are kept). An absent class is
            //     skipped. PicassoProvider is left alone (only stores a context; Picasso.get()
            //     throws without it).
            //   - Disable telemetry: FIAM's data-collection getter (no-arg Z holding
            //     "firebase_inapp_messaging_auto_data_collection_enabled" + "auto_init", p5d.T here)
            //     returns false, so no campaign fetch; EmojiCompatInitializer.create returns
            //     Boolean.FALSE (all 17 EmojiCompat.get() users are androidx code behind
            //     isConfigured()). AppsFlyer init is left: start/logEvent/logSession are already
            //     no-ops, init only sets local state in an obfuscated coroutine (with the deep-link
            //     subscription), and the invite-link generator reads its UID.
            //   - New Animation speed (opt-in; switches "Turn off animations" and "Faster
            //     animations", both off, restart): ReleaseApp.onCreate()V calls AnimationSpeed.init
            //     first, and all 12 Settings.Global.getFloat(ContentResolver, String, F) callers
            //     (all read "animator_duration_scale") call the extension's same-signature getFloat.
            //   - New Slower widget refresh (opt-in switch, off): the static (Context)V holding
            //     "enqueueUniquePeriodic_widget_periodic_refresh" and const-class
            //     WidgetPeriodicRefreshWorker (kv9.U here) passes its 1800000 interval through
            //     widgetRefreshInterval before the iput-wide (1 h while on; the 5 min flex stays).
            //   FingerprintProbe: ReleaseAppOnCreate, InAppMessagingDataCollection and
            //   WidgetPeriodicRefresh OK-unique. Smoke test and CLI without -f (all 17 patches) pass,
            //   and every changed site was checked in the patched APK. 2026-11-03 emulator: cold start OK, the Speed & battery switches are listed, Turn off animations on + restart runs without a crash; cold-start medians after speed-profile were the same as stock.
            // 2026-11-04: updated to 26.10.26 (versionCode 261026004, Play arm64 via gplaydl, signer
            // unchanged ecd3a2c9...f841). R8 split ReleaseApp: it now extends an obfuscated abstract
            // base (ds0 here) that holds the old onCreate body and the consent method. Two fixes:
            //   - Disable ads: AdSdkStartupFingerprint drops the ReleaseApp defining class and adds a
            //     Thread.start() call filter (the shared R8 runnable's run()V holds the same consent
            //     strings but starts no thread); the patch fails unless the match is declared by
            //     ReleaseApp or one of its superclasses. ReleaseApp.onCreate (Animation speed, Hide
            //     countries) is still the override that calls super, so those hooks are unchanged.
            //   - Hide sports: the shared Room lambda now reuses the selected-sport SQL register for
            //     the other queries, each loading its own SQL right before its prepare call, so those
            //     prepare calls are no longer counted as selected-sport sites.
            //   New in this build: an "Aurion" ad network (com.aurion11.sirius, Remote Config
            //   "aurion_ads_enabled") as an extra unit of the interstitial/rewarded placements. Its
            //   network choice sits behind the same placement config; that it is gated by the ad-free
            //   flags was not traced.
            //   FingerprintProbe: every fingerprint OK-unique except the documented optional
            //   TennisPromoSheet.
            AppTarget(
                version = "26.10.26",
                versionCode = 261026004
            )
        )
    )

    // FotMob phone build. Note the Wear OS build shares the same package and its versions
    // look like "236.253021660w..."; the APKPure/APKMirror *latest* lookups sometimes return
    // the watch APK, so always check android.hardware.type.watch before using an APK.
    // Verified 2026-09-17 against 236.17398.20260827 (versionCode 17398) and
    // 236.17338.20260822 (the build from issue #8) from APKMirror; both patch cleanly.
    // The subscription manager is R8-obfuscated; the patch anchors it on the staff-account
    // email strings and identifies the subscription getter structurally (see
    // fotmob/plus/Fingerprints.kt), so obfuscated name rotation no longer breaks it.
    // Verified 2026-09-18 against 237.17536.20260911 (versionCode 17536, the current APKMirror
    // phone build). This release swapped the storage layer under the getter (236 read
    // SharedPreferencesRepository.get(Z), 237 goes through a settings holder), so the getter
    // search is now storage-agnostic: the manager's only non-constant no-arg boolean method
    // that does not hold the staff email. Both old 236 targets were re-checked and still pass.
    // 2026-10-12 APK-finder audit: only distributed as a split bundle (APKMirror BUNDLE /
    // APKPure-Uptodown XAPK), so apkFileType is APKM; any "universal APK" note below is outdated.
    // 2026-10-13, 238.17794.20261012 (versionCode 17794): "Enable FotMob+" forces the
    // subscription manager's valid_subscription getter true and the staff check false, which
    // removes ads and sends More > FotMob+ to MembershipActivity instead of PaywallActivity (both
    // seen on the emulator). That screen still said "No active subscriptions found" and the old
    // patch never exposed the "Exclusive app icons" picker: MembershipActivity reads the
    // RevenueCat entitlements from the server, so it cannot honestly show an active plan, and
    // the picker was drawn only in its entitlement branches. A new step calls the picker in the
    // NoEntitlement branch too: the screen lambda is the only method with that literal; the
    // picker is the MembershipActivity (I, composer)V method its entitlement branches already
    // call (T, 3 calls, reads string/app_icons 0x7f1300c3), on the same activity register; the
    // composer type comes from the branch's end-group (Z)V call. The step is skipped (logged)
    // when the literal is absent, and skipped with a warning (steps 1-2 still apply) when the
    // screen code has another shape. RevenueCat records and the valid_subscription pref are not
    // faked. "Early access" is marketing text only, with no client gate to unlock.
    // FotMobSmokeTest passes on 238.17794 and 238.17666 (same lambda, composer dj5); 237/236
    // not re-checked for this step (no APK at hand). Emulator (238.17794): no paywall, the
    // membership screen shows the 12-icon picker, switching to Barcelona changed the launcher
    // alias and switching back restored it, no crashes. The staff check is not runtime-testable.
    // 2026-10-18, 238.17794.20261012 (issue #64): "GmsCore support" (default off, no clone option:
    // the widget providers com.fotmob.widget.logos/.images are outside the package name) hooks the
    // manifest launch activity MainActivityWrapper.onCreate(Bundle) and rewrites the GMS/c2dm
    // constants and manifest entries for MicroG RE, so Sign in with Google (androidx.credentials Play
    // services provider -> Firebase Auth) can work on a re-signed build. "Spoof signature" routes
    // every getPackageInfo call (incl. Firebase's cert-hash helper) through the extension with the
    // original CN=Christer Nordvik certificate (SHA-1 5546e6c4b0c1f31b9e5a953a89a8bb6f25a2ad6f).
    // FotMobSmokeTest and a CLI patch + apkanalyzer check pass; rule-12 string diff: only
    // sw player_yellow_card loses its literal surrounding quotes. Facebook native-app login is not
    // covered by the spoof (the Facebook app reads the real certificate).
    // GmsCore support also skips the onboarding auto sign-in: in the OnboardingStartActivity
    // coroutine (found by its "Did not find any existing Google accounts" / "User seemingly
    // dismissed the automatic Google sign-in" log prefixes) it throws androidx's
    // NoCredentialException (TYPE_NO_CREDENTIAL constructor) right after the
    // google_server_client_id read, inside the try block whose NoCredentialException handler runs
    // (the stock no-account path), because MicroG RE ignores filterByAuthorizedAccounts and showed
    // its chooser uninvited at first start. The Sign in with Google button paths are unchanged.
    // 2026-10-19 (FotMobSmokeTest on 238.17794): Enable FotMob+ now requires exactly one candidate
    // subscription getter (singleOrNull; none or several fail the patch). The app-icon step (step
    // 3) is still skipped when the "No active subscriptions found" literal is absent (pre-238),
    // but on 238+, where the literal is present, a picker or NoEntitlement branch shape that no
    // longer matches now fails the whole patch instead of logging a warning, so a drifted icon
    // screen fails Enable FotMob+ (ad removal included) loudly.
    // 2026-10-22: updated to version 239.17834.20261016 (versionCode 17834; same CN=Christer
    // Nordvik signer). 239 removed the MainActivityWrapper class: .ui.MainActivityWrapper is now a
    // manifest activity-alias targeting com.fotmob.android.ui.MainActivity, so GmsCore support
    // hooks the manifest-declared MainActivity.onCreate(Bundle) instead (unique; the checkGmsCore
    // invoke-static/range p0 injection is unchanged). The other anchors (staff email strings,
    // "No active subscriptions found", TYPE_NO_CREDENTIAL constructor, the onboarding log
    // prefixes) resolve unchanged; only R8 names rotated. FotMobSmokeTest passes on 239.
    // 2026-10-22: two new patches on 239 (owner-approved), verified by FotMobSmokeTest, the
    // Morphe matcher (FingerprintProbe) and a CLI decompile check; runtime below.
    // - "Disable ads": shouldShowAds() (no-arg boolean holding the log string starting "Ads
    //   disabled: user is in sanctioned country", lc.f in 239) returns false, the FotMob+ path.
    // - "Disable telemetry": the "firebase_analytics_collection_deactivated" read answers TRUE
    //   (shared with Sofascore, shared/misc/telemetry), AppMeasurementSdk.logEvent(String, String,
    //   Bundle) returns early, the AppsFlyerLib subclass's start/logEvent/logSession/logAdRevenue
    //   (6 methods) return early, and in the classes holding "firebase_crashlytics_collection_
    //   enabled" only the synchronized no-arg boolean (the DataCollectionArbiter getter, e93.o)
    //   returns false; the unrelated static SDK_INT check merged into the other class is untouched.
    // 2026-10-22: three more patches on 239 (owner-approved), verified by FotMobSmokeTest, the
    // Morphe matcher (FingerprintProbe: each fingerprint OK-unique) and a CLI decompile check.
    // - "Hide betting content" (default off, like the other apps' betting patches): the odds gate,
    //   a suspend (Object)Object holding the log line starting "User has disabled odds in
    //   settings" (am9.b in 239), returns Boolean.FALSE at once. Match odds, the odds tab (built
    //   only when the gate allows), the odds promo and betting card offers wait on it. The odds
    //   format (NO_ODDS) reader is deliberately not forced: it feeds the account settings sync and
    //   would push "No odds" to the user's server-side settings. Settings > Odds and its age-gate
    //   dialog stay reachable, user-initiated.
    // - "Disable rating prompts": the only method constructing RatingAppMessage
    //   (<init>(String), suspend (Object)Object shape, u20.a in 239) returns null, which its caller
    //   already treats as "no message".
    // - "Disable FotMob+ promo popup" (owner's name): the public static no-arg PlusPromoConfig
    //   reader of the "fotmobplus_promo" Remote Config key (jnb.a in 239) returns null. Both
    //   callers null-check it: the promo eligibility coroutine answers false and the RevenueCat
    //   experiment attribute is not set.
    // 2026-10-22 runtime (emulator, ARM translation, stock control, all 8 patches): no crash or
    // ANR; on the match page the stock Stake/bet365 odds rows, banner and in-feed ad are gone with
    // no empty placeholder; GMA network lines 469 -> 0, Firebase Analytics reports deactivated.
    // Not reached on the emulator: the FotMob+ membership screen (no entry point in More, not
    // exported), the odds tab and betting cards (absent on the tested match) and the rating
    // prompt (shown 21-40 days after install). A second run with the 7 other patches and WITHOUT
    // Enable FotMob+ (the free-user path of Disable ads) also passed: no crash and no MobileAds or
    // ads_mobile_sdk exception on the tour, the odds row and banner gone, GMA lines 426 -> 0.
    // 2026-11-03: "Hide countries" (opt-in, Patch settings list fotmob.hidden_countries) on
    // 240.17974.20261023. Anchors are model/converter names R8 keeps: LiveMatchesAndLeagueRank.<init>
    // (match lists), LeagueConverter.convert (Leagues tab + onboarding) and the Suggestion
    // constructors (search); CountryFilter reads model fields by name (checked at patch time).
    // Smoke test, CLI without -f (all 14 FotMob patches) and jadx of every hook pass. Emulator
    // 2026-11-03: the picker lists about 219 countries; with England hidden it is gone from the
    // Leagues tab and search after a restart and back after Clear all (the day's match list had no
    // English matches, so match lists were not observed).
    // 2026-11-03: "Hide competitions" (opt-in, Patch settings list fotmob.hidden_competitions,
    // keys = league ids, a stage keyed by its ParentId; labels "country · name"; picker logo
    // images.fotmob.com/image_resources/logo/leaguelogo/{id}.png) on 240.17974.20261023. No new
    // anchors: the three Hide countries hook sites moved into one unnamed patch
    // (fotMobListFiltersPatch) that both list patches depend on, and each feature patch only rewrites
    // its patched()Z flag (CountryFilter / CompetitionFilter) to true. Seeds: the app's bundled
    // res/raw/available_leagues (388 leagues). Smoke test (both list patches, one filter call per
    // site) and CLI without -f (all 15 FotMob patches) pass. Not run on the emulator yet.
    val COMPATIBILITY_FOTMOB = Compatibility(
        name = "FotMob",
        packageName = "com.mobilefootie.wc2010",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x00985F,
        signatures = setOf("99eb36651caf7752dc34770ee1afbf5b5f4e07a906243904104eb5acc9ffbaf4"), // CN=Christer Nordvik, O=Score Service
        targets = listOf(
            // 2026-10-22: 239.17834.20261016 replaces 238.17794.20261012 (latest version only,
            // owner 2026-10-19); see the 2026-10-22 note above for what was verified on it.
            // 2026-10-29: 240.17974.20261023 (versionCode 17974, APKMirror arm64/universal, same
            // CN=Christer Nordvik cert). StaffAccountFingerprint gained the no-arg Boolean shape:
            // 240 has a second method holding the staff address (ks4.b(Lir4;)Z), which made the
            // string-only fingerprint match twice. All eight patches apply unchanged.
            // 2026-11-02: "Use system font" (opt-in, issue #110) added on 240.17974.20261023,
            // verified by FotMobSmokeTest and the Morphe matcher (FingerprintProbe, both
            // OK-unique). It moves the app onto FotMob's own system-font path (its Burmese path):
            // the static <clinit> that stores `SDK_INT > 27 && language != "my"` into a boolean of
            // its own class (mf5 in 240) stores false, the static (Context, I, String, I)Typeface
            // loader that reads SDK_INT and calls both Typeface.create overloads (pae.k, 16 View
            // callers) returns at once (since the 2026-11-02 follow-up below, through the
            // extension), and the resource part sets the six font items of style
            // Base.Theme.FotMob.V26 (values-v26) to the base theme's sans-serif families and
            // TextAppearance.FotMob.Switch to sans-serif-medium.
            // 2026-11-02 (#110 follow-up): plain sans-serif is still Roboto on devices with their
            // own UI font, so the patch now carries extensions/fotmob. SystemFontPatch maps
            // sans-serif / sans-serif-medium / sans-serif-black (and null or "") to the device font
            // named by the framework strings config_bodyFontFamily / config_bodyFontFamilyMedium,
            // and passes every call through unchanged when the device has none. The loader (pae.k)
            // returns SystemFontPatch.create(p2, p3); Compose's PlatformTypefacesApi28 factory
            // (ComposePlatformTypefaceFingerprint, a library-shape anchor) starts with
            // p0 = composeFamily(p0); every app-dex Typeface.create(String, int) is redirected to
            // SystemFontPatch.create (the extension package is excluded, so its own fallback call
            // stays direct). FingerprintProbe on 240: AppFontFlag (mf5.<clinit>),
            // ComposePlatformTypeface (n07.a) and TypefaceLoader (pae.k) each OK-unique.
            // Verified: FotMobSmokeTest, CLI without -f, decompile, and the emulator
            // with the AOSP font overlay (Source Sans) showing the device font on the match list.
            // Not verified: a real Pixel (Google Sans Text), other screens, OEM font changers.
            // 2026-11-03 (owner-approved speed work + Patch settings), on 240.17974.20261023,
            // verified by FotMobSmokeTest and a CLI run without -f; 2026-11-03 emulator: the Patch settings row sits after Support and lists every switch, Turn off animations on runs without a crash (setDurationScale not blocked). The patched dex no longer matches Play's baseline profile (after a speed-profile compile the odex is 1.2 MB vs 26 MB stock), but cold-start medians showed no measurable difference:
            // - "Patch settings" (host, default on): a row after Support on SettingsActivity
            //   (manifest activity, name kept): onCreate calls HevalControlsEntry.addRow(this) right
            //   after setContentView, and the row inflates the stock settings_line_left_icon layout.
            //   FotMobApp.onCreate (manifest Application) registers extensions/fotmob ActivityHooks
            //   after super.onCreate() for the display features.
            // - Converted to switches (ids fotmob.<feature>, default on, Manager defaults unchanged):
            //   Hide betting content, Disable rating prompts, Disable FotMob+ promo popup (gates at
            //   index 0) and Use system font (restart; the font flag store goes through a (Z)Z value
            //   helper, the loader is gated, the extension checks the switch, and the resource part
            //   no longer edits Base.Theme.FotMob.V26 / TextAppearance.FotMob.Switch in place: it adds
            //   HevalSystemFontOverlay (+ HevalSystemFontSwitch/-SwitchText), applied to each
            //   activity's theme in onActivityCreated while the switch is on).
            // - New switches (opt-in): "Turn off animations" / "Faster animations" (restart; every
            //   app Settings.Global.getFloat(ContentResolver, String, float) - 11 methods - calls
            //   AnimationSpeed.getFloat, which changes only animator_duration_scale; ValueAnimator
            //   duration scale set by reflection on resume, API 33+ listener, API 34+ no activity
            //   transitions for Off; Off wins) and "Slower live refresh" (MatchActivity's 1 s ticker
            //   in a switch-merged Runnable, pz.run in 240: the const/16 15 before the if-lt that
            //   leads to "Refreshing match facts!" goes through an (I)I helper answering 30).
            // - Disable ads also returns true at once from AudienceNetworkContentProvider.onCreate
            //   and VungleProvider.onCreate (manifest names). Disable telemetry also stops the
            //   Remote Config realtime stream (the synchronized (J)V of the class holding
            //   "/namespaces/firebase:streamFetchInvalidations", p82.e), forces the
            //   "enable_appsflyer_sdk" read to false (rb5.invokeSuspend; AppsFlyer is never
            //   initialised, so click.fotmob.com OneLink deep links no longer resolve in the app;
            //   the firebase.test.lab check is untouched) and returns TRUE from
            //   EmojiCompatInitializer.create (EmojiCompat stays unconfigured).
            // 2026-11-04: 241.18134.20261030 (versionCode 18134, Play arm64 via gplaydl, same
            // CN=Christer Nordvik cert) replaces 240.17974.20261023. Every fingerprint still
            // matches; one change: Team became a Kotlin class, so the field Hide countries /
            // Hide competitions read by reflection is now "id" (still serialized as "ID", so the
            // favourites files are unchanged). Verified: FotMobSmokeTest (all 15 patches) and a CLI
            // run without -f with a decompile of the hook sites. Not run on the emulator.
            AppTarget(
                version = "241.18134.20261030",
                versionCode = 18134
            )
        )
    )

    // Verified 2026-09-18 against com.myfitnesspal.android 26.37.0 (versionCode 51401) from
    // APKPure. 26.37.0 removed the old local `SubscriptionPreferences.getPremiumPlusEnabled`
    // gate; premium is now server-driven through queryenvoy `FeatureState` objects
    // (feature + entitlement + tier). The patch overrides the two enum-companion parsers
    // (Entitlement -> Entitled, Tier -> PremiumPlus), which is the single conversion point
    // for every feature state deserialized from the server.
    // Re-verified 2026-09-28 against 26.38.0 (versionCode 51448) from APKPure: the same
    // companion parsers still match and the patched output returns Entitled/PremiumPlus.
    // Verified 2026-10-07 against 26.39.0 (versionCode 51509, APKPure base split): all
    // patches apply unchanged; MyFitnessPalSmokeTest passes.
    // 2026-10-12 APK-finder audit: only distributed as a split bundle (APKMirror BUNDLE /
    // APKPure-Uptodown XAPK), so apkFileType is APKM; any "universal APK" note below is outdated.
    // Verified 2026-10-14 against 26.41.0 (versionCode 51589, APKPure XAPK merged, arm64; the
    // owner keeps only the latest verified version). Enable Premium+ now finds both parsers by
    // shape (static (String) -> Entitlement/Tier on the enum's companion, reading its Unknown
    // fallback) instead of the R8 names `$a`/`a`; the entitlement enums are unchanged. 26.41.0 adds
    // the Datadog SDK (RUM, crash/ANR, network tracing): the new Disable Datadog telemetry makes
    // the app's DatadogRumStartDecision function (kept return type + SkipReason.FLAG_DISABLED
    // branch) always return Skip(FLAG_DISABLED), so the SDK core is never initialized.
    // MyFitnessPalSmokeTest passes.
    // Emulator 2026-10-14 (26.41.0, logged out): no crash. The app never logs Datadog start-up, so the
    // Datadog skip is verified in bytecode only.
    // 2026-10-25: updated to version 26.42.0 (versionCode 51610; APKPure XAPK merged, same
    // signer); MyFitnessPalSmokeTest passes; CLI (no -f) changes only the Entitlement/Tier
    // parsers and the Datadog start decision. Emulator not re-run for this bump.
    val COMPATIBILITY_MYFITNESSPAL = Compatibility(
        name = "MyFitnessPal",
        packageName = "com.myfitnesspal.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0072BC,
        signatures = setOf("e2f39185315095611b23f9602cef6332a89db8960ee76a45fb41eeef4975d95d"), // CN=MyFitnessPal LLC
        // 2026-10-28: updated to 26.43.0 (versionCode 51626, arm64-v8a). Both patches apply
        // unchanged: smoke test green, CLI without -f applied both, and the patched Datadog start
        // decision decompiles to Skip(FLAG_DISABLED).
        // 2026-11-04: updated to 26.44.0 (versionCode 51651; Play arm64 split bundle merged, same
        // signer). Both patches apply unchanged: smoke test green and CLI without -f applied both.
        targets = listOf(AppTarget(version = "26.44.0", versionCode = 51651))
    )

    // Verified 2026-09-18 against club.boxbox.android 5.4.9 (versionCode 251, the current
    // APKMirror build) from APKMirror. The telemetry and interstitial patches used to call
    // returnEarly() on the first fingerprint match only - on 5.4.9 that hit an abstract
    // AppsFlyer declaration (patcher NPE) and the overridden showAd overload, leaving the
    // terminal showAd(String, String, Activity) alive. Both now patch every concrete match
    // by class scan; bytecode-verified in BoxBoxSmokeTest.
    // Verified 2026-10-07 against 5.4.16 (versionCode 260, APKPure XAPK merged, arm64 only).
    // A decompile check found two silent no-ops, present since 5.4.9: Enable Premium's
    // "block launchBillingFlow" step matched nothing (no method returns BillingResult in
    // either build) and was removed - EntitlementInfo.isActive() alone is the gate; and
    // FirebaseAnalytics has no logEvent left (R8 inlines it into the app's call sites), so
    // Disable telemetry now neuters the measurement service's
    // logEvent(String, String, Bundle, Z, Z, J) on both AppMeasurementDynamiteService and the
    // R8-renamed Binder proxy (mandatory anchor on the service). The ads patch, the AppsFlyer
    // and Crashlytics branches apply unchanged; BoxBoxSmokeTest passes on 5.4.9 and 5.4.16.
    // Runtime check 2026-10-08 (emulator, 5.4.16): app runs without crashes, but "Get Pro"
    // upsells still show and RevenueCat logs "Entitlement missing; keeping existing plan" -
    // Enable Premium is NOT confirmed working at runtime (bytecode change only).
    // Re-anchored 2026-10-13 for 5.4.17 (versionCode 261, merged universal), which replaced
    // AppLovin with Google Mobile Ads. Disable ads now forces AppConfigModel.isAdsEnabled to
    // false in its constructor (class found by its data-class toString "AppConfigModel(" +
    // ", isAdsEnabled="; Boolean from 5.4.16, primitive boolean in 5.4.9) - every placement
    // checks "plan == Free && isAdsEnabled" - plus optional GMA hooks (MobileAds init, the
    // static full-screen load with "AdRequest cannot be null.", BaseAdView.loadAd with "#008")
    // and the optional AppLovin MaxInterstitialAd no-op. Enable Premium never worked for
    // never-subscribed accounts: the app reads entitlements["Pro_Android"], which is null (not
    // inactive) for them, so forcing EntitlementInfo.isActive() left the plan on Free. It now
    // forces the plan enum (enum <clinit> "Free"/"Pro") to Pro where PlanDataStore (<clinit>
    // "plans_data_store"/"plan_type") decodes the cached ordinal via entries.get(I) (all three
    // versions), and in 5.4.17's static plan-returning store methods (live RevenueCat check and
    // cache read). BoxBoxSmokeTest passes on 5.4.9 (APKMirror bundle, re-downloaded),
    // 5.4.16 and 5.4.17; CLI-patched and decompile-checked on 5.4.16 and 5.4.17. Emulator
    // (5.4.17, logged out): the "AD" promo card and the Standings ad slot are gone with no
    // gap and AdMob never initializes; "Get Pro" and the paywall are gone, a Pro-locked widget
    // shows "Add" instead of "Unlock" and the app logs plan Pro; no crashes. The "PRO" labels
    // in the widget list stay. Signed-in features were not tried; server-side
    // UserProfiles.isPro is untouched.
    // 2026-10-14: Disable ads also neutralises the other MobileAds statics (rule 9).
    // 2026-10-19: older targets 5.4.9, 5.4.16 dropped (latest version only, owner); BoxBoxSmokeTest
    // runs against 5.4.17.
    // 2026-10-25: updated to version 5.4.18 (versionCode 262; APKPure XAPK merged, arm64-v8a, same
    // signer); BoxBoxSmokeTest passes on patcher 2.0.0 after one fix. R8 moved the inlined
    // MobileAds.initialize out of MobileAds (which now only has setPlugin and stop) into the app's
    // consent-gated ad init helper, a static-only class whose "can request ads" flow starts false,
    // so Disable ads step 3 now also returns early from every static void carrying the SDK's
    // "Initializing on calling thread" log (InlinedMobileAdsInitFingerprint) to keep GMA
    // uninitialised as on 5.4.17; the helper's privacy-options flow then also stays false.
    // FullScreenAdLoadFingerprint now anchors on the SDK's "Context cannot be null." and "#008" main
    // thread checks: R8 dropped "AdRequest cannot be null." from the RewardedAd, RewardedInterstitialAd
    // and AppOpenAd loads (reached only from GMA's ad inspector test handler), so all four
    // full-screen loads return early, mandatory when GMA is bundled. The other anchors are
    // unchanged. Emulator vs stock (5.4.18, before the full-screen load re-anchor): starts, no
    // ads, Pro unlocked, the "Ad privacy choices" row is gone (expected: the privacy-options flow
    // stays false); ad loads after consent not tried. The rewarded, rewarded-interstitial and
    // app-open load hooks are verified in bytecode only (CLI, 19 methods changed).
    val COMPATIBILITY_BOXBOX = Compatibility(
        name = "BoxBox",
        packageName = "club.boxbox.android",
        apkFileType = ApkFileType.APKM, // bundle-only on APKMirror and APKPure (checked 2026-10-07)
        appIconColor = 0xFF0000,
        signatures = setOf("ea97f13707620039a2c9d8ab8f3122304e1dedb58ea87b131845e0b14b8d7518"), // Google Play app signing key
        targets = listOf(
            AppTarget(version = "5.4.18", versionCode = 262)
        )
    )

    // Verified 2026-08-19 against 365scores.apkm v14.8.8 (universal, Android 7.0+).
    // App uses Google Mobile Ads (AdMob) loaded via the Blaze GAM SDK wrapper.
    // MobileAds.initialize(Landroid/content/Context;)V and the (Context, Listener)
    // overload are both present unobfuscated in com.google.android.gms.ads.MobileAds.
    // Ad SDKs observed: Google Mobile Ads, Unity, InMobi, Vungle, Mintegral,
    // ByteDance Pangle, Meta Audience Network (all GAM-mediated).
    // Re-verified 2026-09-17 on 14.9.4 with morphe-cli -f: Disable ads still applies.
    // Re-verified 2026-09-28 on 14.9.5 (versionCode 1495, APKPure): both initialize
    // overloads are empty in the decompiled output.
    // Verified 2026-10-07 against 14.9.6 (versionCode 1496, APKPure XAPK merged): Disable
    // ads applies unchanged; Scores365SmokeTest passes.
    // 2026-10-12, 14.9.6 (still the latest on APKMirror and APKPure): Disable ads also forces
    // every concrete showAdsForContext()/isBannerNeedToBeShown() app ad gate to false. Added
    // "Enable Premium" (EntitlementState constructor forces adsFree/tipster/plus/
    // delayedNotifications/notificationSounds true and its feature getters return true, since
    // the startup cache is read with Gson and skips the constructor; entitlements come from the
    // 365 purchase gateway and are only mapped locally; the Remove ads screen reads its grace
    // start key "iabc_fnrts" under another name, because the forced state starts a grace period
    // that would make it show the purchase screen), "Disable update prompts" (BaseActivity and
    // BaseActionBarActivity onCreate no longer find the ForceUpdateDialog/NewVersionPopup
    // extras) and "GmsCore support" (shared builder, off by default; social login uses
    // play-services-auth GoogleSignIn, push uses FCM; signing cert SHA-1 47f994bd...f1a1 read
    // from the APKMirror bundle's v2/v3 block; launch activity com.scores365.ui.Splash; pulls in
    // "Spoof signature", which routes every getPackageInfo call through the signature extension
    // so Firebase's X-Android-Cert carries the original certificate and its API key stops
    // answering 403 API_KEY_ANDROID_APP_BLOCKED). Ideas
    // from github.com/0xtalos/365score-patches; its FirebaseAnalytics.logEvent hook has no
    // target in 14.9.6 (R8 removed the method), so no telemetry patch here. 14.9.4 and 14.9.5
    // were dropped from the targets: the new patches were only verified on 14.9.6. The GmsCore
    // "Clone" option renames the package, which Spoof signature does not follow (it spoofs
    // com.scores365 only), so keep Clone off when notifications matter.
    // 2026-10-14: Disable ads also neutralises the other MobileAds statics (rule 9).
    // 2026-10-17: updated to version 14.9.7 (versionCode 1497, APKMirror bundle arm64-v8a +
    // armeabi-v7a 480-640dpi, merged; signer CN=Roe Aharoni, O=365 Scores, SHA-1 47f994bd...f1a1,
    // the same key, with a Play source stamp). Every anchor is unchanged and unique; only R8 names
    // moved (the GMS common holder is now common/a; the ServiceCheck (int, Context) shape still
    // matches). 14.9.6 dropped (latest verified version only). CLI decompile-checked (every hook,
    // nothing dropped). Emulator 2026-10-17 (morphe-play with MicroG RE, stock control on the same
    // test key): no crash in 2 cold starts; the InMobi banners, in-list ad rows and sponsored
    // match creative are gone with no gap; the stock re-signed build gets Firebase Installations
    // 403 API_KEY_ANDROID_APP_BLOCKED (push broken) while the patched one initialises Firebase
    // without it; following a match works. The battery-optimisation dialog leaks from the
    // finishing Splash (known GmsCore-check gap; no crash).
    // Rule 12, 2026-10-19 (CLI, no -f, default set plus GmsCore support, all Applied; aapt2 dump
    // resources stock vs patched, PUBLIC flags ignored): no string, plural or array value changes
    // and no entry is lost. Only the case-twin ids subTitle/subtitle, tvSubTitle/tvSubtitle and
    // tvToolTipText/tvTooltipText come back as id_0x... names (same IDs).
    val COMPATIBILITY_365SCORES = Compatibility(
        name = "365Scores",
        packageName = "com.scores365",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFFC107,
        signatures = setOf("08ab809258f8d7c0ac7451033d6b12c8ca70053ab4f37942fc988cb6571b963b"), // CN=Roe Aharoni, O=365 Scores
        // 2026-10-28: updated to 14.9.8 (versionCode 1498, APKPure arm64-v8a, same signer). 14.9.8
        // replaced the classic Google Mobile Ads SDK with the next-gen Ads SDK, which is compiled
        // into the app and R8-renamed to ads_mobile_sdk.*: there is no MobileAds.initialize and no
        // BaseAdView/AdLoader/InterstitialAd/RewardedAd/AppOpenAd left, so the old GMA hooks cannot
        // anchor. Disable ads now works at the app layer: EntitlementRepository's "ads removed" gate
        // (the ()Z logging "isUserAdsRemoved=", uej.e in 14.9.8) and its sibling that reads
        // forceShowAds + IsUserRemovedAdsPackageBuying (uej.a) both answer true, and every
        // per-activity showAdsForContext/isBannerNeedToBeShown gate still answers false. Every
        // banner, interstitial, in-feed/MPU, AllScores and betting-promo path checks those gates,
        // so the app now behaves as ad-free and the betting promos (BPMB) are blocked too. The
        // per-activity presence check uses GameCenterBaseActivity (BaseActionBarActivity was renamed
        // u41). Disable update prompts anchors on the onCreate(Bundle) shape (both extras) instead
        // of the two class names.
        // 2026-11-03: updated to 14.9.9 (versionCode 1499, Play arm64 build via gplaydl, same
        // signer). All five patches apply unchanged (the ads-removed gate is oij.e in 14.9.9):
        // Scores365SmokeTest passes and the smoke test applies all five; a CLI run without -f applied the three default ones. 2026-11-03 emulator on 14.9.9 (patched build of the release batch, stock control): two cold starts, no crash.
        // 2026-11-03: updated to 15.0.0 (versionCode 1500, Play arm64 build via gplaydl, same
        // signer 08ab8092...963b). All five patches apply unchanged (the ads-removed gate is wij.e,
        // the two update readers are x41/y41.onCreate): Scores365SmokeTest passes and a CLI run
        // without -f with all five enabled applied them; the gates, readers, EntitlementState and Splash hook
        // decompile as patched. Rule 12 (aapt2, with GmsCore support): no value changes, only the
        // same three case-twin id pairs come back as id_0x... names. 2026-11-03 emulator: two patched cold starts, no crash.
        targets = listOf(
            AppTarget(version = "15.0.0", versionCode = 1500)
        )
    )

    // Verified 2026-08-20 against livescore.apk v9.9.1 (universal, Android 7.0+).
    // AdsRemovalSettings.areAdsDisabled()Z is the single ad gate checked by
    // BannerManagerImpl, InterstitialAdsUseCase, MpuAdsConfig, HeroPlacementUseCase,
    // CoverageSponsorshipSettings and AnnouncementBannerUseCase. Class and method
    // are un-obfuscated in com.livescore.ads.config.
    // Re-verified 2026-09-17 on 10.1 with morphe-cli -f: Disable ads still applies.
    // Verified 2026-10-07 against 10.2.1 (versionCode 2188, APKPure): Disable ads applies
    // unchanged; LivescoreSmokeTest passes.
    // 2026-10-14: updated to 10.3.1 (versionCode 2226, single APK, signer CN=Sebastian/O=Cloeme
    // as on 10.3); anchors unchanged: AdsRemovalSettings.areAdsDisabled()Z keeps its name, body and
    // the same six callers. Only the latest verified version is supported.
    // Emulator 2026-10-14 (10.3.1): no banner, interstitial or gap (stock shows a test banner and an
    // interstitial); no crash. The bookmaker "Match odds" sponsor card (AD tag) is an app widget and stays.
    // 2026-10-17: updated to version 10.3.2 (versionCode 2230, APKMirror universal APK, same signer
    // CN=Sebastian/O=Cloeme, cert SHA-256 82bf3a1c...2ebb). The manifest, SDKs and betting code are
    // unchanged; AdsRemovalSettings.areAdsDisabled()Z is still unique with the same six callers.
    // 10.3.1 dropped (latest verified version only). Smoke-tested and decompile-checked 2026-10-17
    // (CLI, no -f: only areAdsDisabled changes, to return true). Emulator 2026-10-17 (stock control):
    // stock shows a Disney+ test banner, a bet365 test banner and an interstitial; patched shows
    // none and no gap; the bet365 "Match odds" widget stays; no crash in 2 cold starts.
    val COMPATIBILITY_LIVESCORE = Compatibility(
        name = "Livescore",
        packageName = "com.livescore",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xC8102E,
        signatures = setOf("82bf3a1c6498d93a22c4fe6ab8f272d5a8495093a8e04a66b0b1c92cdcd12ebb"), // CN=Sebastian, O=Cloeme
        targets = listOf(AppTarget(version = "10.4", versionCode = 2250))
    )

    // Verified 2026-08-20 against FishBuddy v11.0.84 (universal, Android 7.0+).
    // Premium gate is User.hasPremium()Z (no.fishbuddy.app.data.models.User),
    // reads the server-populated `roles` HashMap for the "premium" entitlement.
    // Subscription managed via RevenueCat (no ad SDKs). Class + method names
    // un-obfuscated.
    // Re-verified 2026-09-17 on 11.0.101 with morphe-cli -f: Enable Premium still applies.
    // Verified 2026-10-07 against 11.0.125 (versionCode 110125, APKPure): Enable Premium
    // applies unchanged; FishBuddySmokeTest passes.
    // 2026-10-12 APK-finder audit: only distributed as a split bundle (APKMirror BUNDLE /
    // APKPure-Uptodown XAPK), so apkFileType is APKM; any "universal APK" note below is outdated.
    // 2026-10-19: older target 11.0.101 dropped (latest version only, owner); FishBuddySmokeTest
    // runs against 11.0.125.
    // 2026-10-25: updated to version 11.0.137 (versionCode 110137; APKPure XAPK merged, same
    // signer); FishBuddySmokeTest passes on patcher 2.0.0; anchors unchanged.
    val COMPATIBILITY_FISHBUDDY = Compatibility(
        name = "FishBuddy",
        packageName = "no.fishbuddy_playground.app",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0288D1,
        signatures = setOf("dad0c2bd5066aeaf984967fd562e98ec7b4cced799ec9aab2a256d930eff389a"), // Google Play app signing key
        targets = listOf(
            AppTarget(version = "11.0.137", versionCode = 110137)
        )
    )

    // Verified 2026-08-19 against brave.apkm v1.93.136, re-anchored 2026-09-18 against
    // v1.95.104 (versionCode 429510404, the current APKMirror build). All Brave Origin
    // anchor strings and non-obfuscated classes (BraveOriginPreferences,
    // BraveOriginSettingsLauncherHelper, profiles/Profile) are present. Obfuscated class
    // names rotate between versions, but every fingerprint is string/shape-based so it
    // resolves at patch time. 1.95.104 swapped the parameter order of the package/product
    // pref writer from (Profile, String) to (String, Profile), which broke the fingerprint
    // pinning v1.93.136; the patch matches the new order and is bytecode-verified in
    // BraveSmokeTest.
    val COMPATIBILITY_BRAVE = Compatibility(
        name = "Brave Browser",
        packageName = "com.brave.browser",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF4500,
        signatures = setOf("9c2db70513515fdbfbbc585b3edf3d7123d4dc67c94ffd306361c1d79bbf18ac"), // CN=Chris Lacy, O=Digital Ashes
        targets = listOf(
            // History (1.95.104 and 1.96.61 were targets until 2026-10-19, see the last note):
            // Verified 2026-10-07 against com.brave.browser 1.96.61 (versionCode 429606104,
            // APKMirror bundle merged with APKEditor). Two Origin log messages were reworded
            // ("getIsSubscriptionActive prefs are unavailable", "requestCredentialSummary
            // profile is null or destroyed"), which broke the full-string anchors; both now
            // match by prefix. All other anchors (pref keys, policy strings, Origin
            // preferences shape) were unchanged. BraveSmokeTest passes on 1.95.104 and 1.96.61.
            // Also 2026-10-07: the Origin "Privacy preserving analytics" and "Statistics
            // reporting" switches only wrote a SharedPreferences key nothing read (P3A and the
            // usage ping are native). The listener now also writes brave.p3a.enabled /
            // brave.stats.reporting_enabled through LocalStatePrefs + PrefService (real class
            // names, shape-matched methods). CLI-applied and decompile-checked on 1.95.104 and
            // 1.96.61; runtime-checked on 1.96.61 (switch flips the native pref).
            // Also 2026-10-19 (issue list; smoke test + jadx/dexdump review of all three stock
            // builds, not runtime-tested): the Origin "Web discovery project" switch only wrote
            // a SharedPreferences key nothing read too (no Java gatekeeper). Its native pref is
            // profile-scoped ("brave.web_discovery_enabled" - the same pref the Search engines
            // screen's "send_web_discovery" switch writes, through owl.a(ChromeBaseSettingsFragment.H0)
            // in 1.97.56, sdl.a / ffl.a in 1.95.104 / 1.96.61), so the listener's branch now writes
            // it through the fragment's Profile field and that (BrowserContextHandle)PrefService
            // helper, resolved from the Search engines writer by its two strings and the call
            // shape; the Profile field is resolved by its type on the Origin preferences class.
            // Verified 2026-10-07 against 1.97.56 (versionCode 429705604, GitHub release
            // Bravearm64Universal.apk): all patches apply unchanged; BraveSmokeTest passes.
            // Rule 12 (2026-10-19 audit): the Brave Origin resource patch (XML defaults) re-encodes
            // the resource table, which strips the literal surrounding quotes of the Arabic
            // (values-ar) 0_resource_name_obfuscated value "%1$s" و"%2$s" (it comes back as
            // %1$s" و"%2$s). Cosmetic: a quote mark in one Arabic string.
            // 2026-10-19: older targets 1.95.104, 1.96.61 dropped (latest version only, owner);
            // BraveSmokeTest runs against 1.97.56. No versionCode: Brave's arm64 and x86_64
            // builds of one version carry different versionCodes.
            // 2026-10-23: target moved 1.97.56 -> 1.98.60 (versionCode 429806004, GitHub release
            // Bravearm64Universal.apk). The Origin restart snackbar the policy-write callback
            // calls is now (II)V (title and message string ids, p5()V before): the listener
            // rewrite reads both ids from the `const` loads before that one call site (anchor:
            // "Failed to set policy value for " plus the single BraveOriginPreferences void call)
            // and loads them into two free locals found by a liveness check. All policy keys,
            // pref keys and the other Origin anchors are unchanged. The new 1.98 activation flow
            // (the "Ready to activate" snackbar and the Skus activation limit) is untested; on a
            // fresh install it is not reached, because step 6 forces the token check that sets
            // the O0 lock flag false. BraveSmokeTest passes on 1.98.60; CLI-applied without -f
            // and decompile-checked on the arm64 build (25 methods + 1 helper, all 9 Origin
            // defaults true, no string value changed). Emulator (x86_64 BraveMonox64 1.98.60,
            // stock control): Origin opens without the paywall, all switches ON, toggling shows
            // the "Changing Brave features" restart snackbar, brave_origin_off_* prefs are written,
            // the activation flow does not appear, no crash.
            // 2026-10-29: 1.98.62 (versionCode 429806204, GitHub Bravearm64Universal.apk). The
            // update-scout row said 1.100.36, but that tag is a Nightly build
            // (com.brave.browser_nightly); the stable "Latest" release is 1.98.62, so that is the
            // target. Brave Origin applies unchanged.
            // 2026-11-03: updated to 1.98.63 (versionCode 429806304, GitHub "Latest" release
            // Bravearm64Universal.apk, same signer); Brave Origin applies unchanged; smoke + CLI
            // without -f.
            // 2026-11-03 (#121): "DNS filter" (opt-in; options dohUrl, default CleanBrowsing
            // Family, and dohMode strict|fallback). Chromium's PolicyProvider.notifySettingsAvailable
            // (Bundle) (R8-merged, 1.98.63: bbf.a; found by the "#notifySettingsAvailable()" log
            // prefix + (Bundle)V shape) puts the enterprise policies DnsOverHttpsMode
            // ("secure", or "automatic" for fallback) and DnsOverHttpsTemplates (the URL) into
            // every non-null policy bundle before Chromium reads it, so the Secure DNS screen is
            // managed and locked and Brave says it is managed by an organisation. The app
            // restriction getters are untouched (no managed first run). Strict means nothing
            // resolves while the resolver is unreachable. Verified on 1.98.63 by BraveSmokeTest
            // (default and fallback options); not runtime-tested.
            AppTarget(version = "1.98.63"),
        )
    )

    // Same app, used only by the experimental Brave patches (Disable telemetry, Disable ads,
    // Hide promotional prompts), so Morphe Manager flags them as experimental. Researched
    // 2026-10-07 against 1.96.61 (versionCode 429606104): smoke-tested, CLI-applied and
    // decompile-checked, and runtime-checked on the emulator with the x86_64 1.96.61 build
    // (no crashes; P3A/usage ping off, crash consent false, no promoCode, normal NTP). Anchors
    // are unobfuscated (JNI/manifest-kept) class names, pref keys and method shape. Not yet
    // field-tested by users.
    val COMPATIBILITY_BRAVE_EXPERIMENTAL = Compatibility(
        name = "Brave Browser",
        packageName = "com.brave.browser",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF4500,
        signatures = setOf("9c2db70513515fdbfbbc585b3edf3d7123d4dc67c94ffd306361c1d79bbf18ac"), // CN=Chris Lacy, O=Digital Ashes
        targets = listOf(
            // Verified 2026-10-07 against 1.97.56 (versionCode 429705604, GitHub release
            // Bravearm64Universal.apk): the experimental patches apply unchanged; BraveSmokeTest
            // passes. Not runtime-tested on this version.
            // 2026-10-19: older target 1.96.61 dropped (latest version only, owner).
            // 2026-10-23: target moved 1.97.56 -> 1.98.60 (versionCode 429806004, GitHub release
            // Bravearm64Universal.apk). Disable telemetry applies unchanged. Hide promotional
            // prompts: the rate-dialog check now matches any one object parameter ("L"), because
            // in the x86_64 BraveMonox64 build R8 narrowed its Context parameter to an obfuscated
            // ChromeTabbedActivity superclass and the old (Context)Z fingerprint failed there (the
            // arm64 builds, including the Play AAB, keep Context). Do not pin Context again. The
            // sponsored-image factory createBrandedWallpaper was renamed
            // createNewTabTakeoverWallpaper (same parameters), so Disable ads now matches it by
            // shape: the only NTPBackgroundImagesBridge method returning Wallpaper.
            // Verified: BraveSmokeTest passes; all three patches Applied without -f on both the
            // arm64 Universal and the x86_64 Mono build; decompile-checked on arm64. Emulator
            // (x86_64): the Settings VPN callout card is gone and nothing crashes. The system
            // "Set Brave as your default browser app?" role dialog on the very first start still
            // shows, as in stock: it is Brave's one-off first-run request, not the recurring
            // default-browser dialog this patch skips (that one needs many app opens, not
            // reproduced). Sponsored new tab images never appeared on the emulator, so Disable ads
            // is verified in bytecode only.
            // 2026-10-29: target moved 1.98.60 -> 1.98.62 (versionCode 429806204, GitHub release
            // Bravearm64Universal.apk). All three experimental patches apply unchanged without -f;
            // BraveSmokeTest passes.
            // 2026-11-03: updated to 1.98.63 (versionCode 429806304, GitHub "Latest" release
            // Bravearm64Universal.apk), all three experimental patches apply unchanged; smoke +
            // CLI without -f.
            AppTarget(
                version = "1.98.63",
                isExperimental = true,
            ),
        )
    )

    // Verified 2026-08-30 against easynotes..._1.3.59.0819-10565 .apkm from APKMirror
    // (arm64-v8a + armeabi-v7a, Android 6.0+ / minSdk 23). App code is NOT obfuscated:
    // 3,589 readable classes under notes.easy.android.mynotes.
    //
    // Entitlement is entirely local — there is no license server. Everything routes through
    // three public static booleans on notes.easy.android.mynotes.App:
    //   isVip()Z       38 call sites - master gate for premium assets (fonts, backgrounds,
    //                  stickers, drawing tools). Per-asset flags such as DrawPatternRes.isVip()
    //                  are only consulted *inside* an `if (!App.isVip())` check.
    //   isAdFree()Z    4 call sites  - gates banner loading in utils/AdManager
    //                  (e.g. the "notes_edit_banner" unit) and App$AppOpenAdManager.
    //   isGoogleVip()Z drives the "Google VIP" badge only.
    //
    // Both isVip() and isGoogleVip() reduce to
    //   userConfig.getHasBuyed() || userConfig.getHasSubscribe()
    // with isVip() additionally early-outing on getBillingMonthlyTestOpen() (false) and
    // isReferralVip() (true). State lives in SharedPreferences via constant/UserConfig
    // (keys has_buyed, has_subscribe, has_m_subscribe, has_y_subscribe).
    //
    // Important: billing/BillingManager runs queryPurchaseState() on startup and its
    // callbacks (BillingManager$5/$7/$8) write those prefs back from whatever Play reports,
    // so a non-payer gets them reset to false. That is why we patch the *consumers*
    // (App.isVip/isAdFree) rather than the writers — forced return values ignore the reset.
    //
    // SKUs: BILLING_MONTH / BILLING_YEAR / BILLING_LIFETIME / BILLING_MONTH_TO_YEAR /
    // BILLING_UP_TO_LIFETIME (analytics suffixes "1m", "1y", "lifetime").
    // Ad SDKs: Google Mobile Ads (app-open), Meta Audience Network, PubMatic.
    // Re-verified 2026-09-17 on 1.3.61.0907 with morphe-cli -f: both patches still apply.
    val COMPATIBILITY_EASYNOTES = Compatibility(
        name = "EasyNotes",
        packageName = "easynotes.notes.notepad.notebook.privatenotes.note",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x00ACFF,
        signatures = setOf("6591e7c2a62f9db462192e5417921fb74ecfd72f660e5270ef512b9a5fa4267a"), // CN=gulooloo, O=gulooloo
        targets = listOf(
            // Verified 2026-10-07 against 1.3.63.0921 (versionCode 10569, APKPure XAPK
            // merged): both patches apply unchanged; EasyNotesSmokeTest passes.
            // 2026-10-19: older target 1.3.61.0907 dropped (latest version only, owner).
            // 2026-10-25: updated to version 1.3.64.0929 (versionCode 10570; APKPure XAPK merged,
            // same signer); EasyNotesSmokeTest passes on patcher 2.0.0; anchors unchanged.
            AppTarget(
                version = "1.3.65.1019",
                versionCode = 10571
            )
        )
    )

    // Verified 2026-09-17 against eu.faircode.email 1.2337 (versionCode 2337) from APKPure.
    // FairEmail is FOSS and not obfuscated: the pro entitlement is a single SharedPreferences
    // boolean ("pro") read through ActivityBilling.isPro(Context). The billing client rewrites
    // the pref from Play on launch, so the patch forces the getter instead of the pref.
    // Note: Gmail OAuth cannot work on a re-signed build. FairEmail gets Gmail tokens through
    // AccountManager and Google only issues them to packages signed with the certificates
    // registered for the OAuth client (the Play/GitHub builds). For Gmail accounts use an app
    // password instead (Gmail requires 2FA for that); non-Google accounts are unaffected.
    // Verified 2026-10-07 against 1.2338 (versionCode 2338, APKPure): all patches apply
    // unchanged; FairEmailSmokeTest passes.
    // 2026-10-19: older target 1.2337 dropped (latest version only, owner).
    // 2026-10-25: updated to version 1.2339 (versionCode 2339, GitHub release, same signer);
    // FairEmailSmokeTest passes; CLI (no -f) changes only ActivityBilling.isPro. 1.2338 is kept
    // as the version-diff fixture.
    val COMPATIBILITY_FAIREMAIL = Compatibility(
        name = "FairEmail",
        packageName = "eu.faircode.email",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2196F3,
        signatures = setOf("e02067249f5a350e0ec703fe9df4dd682e0291a09f0c2e041050bbe7c064f5c9"), // O=FairCode
        targets = listOf(
            AppTarget(version = "1.2339", versionCode = 2339)
        )
    )

    // Verified 2026-09-17 against net.dinglisch.android.taskerm 6.6.18 (versionCode 5443)
    // from APKPure. Paid app: the Play purchase is validated with Google Play LVL plus a
    // licence server (Patreon keys). The licensing code is R8-obfuscated (rf.a0, rf.w$a);
    // the 2026-09-17 fingerprints pinned those names.
    // 2026-10-13: fingerprints no longer pin obfuscated names. Anchors: the LVL response
    // mapper's <init>(I) with the "Licensed"/"Retrying"/"Unlicensed" labels (its no-arg
    // LicenseStatus getters return Licensed); the (Context, long)Z cached check by its
    // "Checking cached only" log prefix; in that class the public (Context)Z overload and the
    // private static (?, boolean, Context)Z result helper reading LicenseStatus.Retry/Licensed
    // (new hook: covers the Unlicensed fallback when Play cannot be reached); and the public
    // static (Context)Z facade that calls the overload. Smoke test and CLI disassembly pass on
    // 6.6.18 (5443) and 6.6.20 (5445). Emulator 2026-10-14 (6.6.20, Play Store image, no Google
    // account, so LVL answers with a server error): stock shows "Trial Over - Tasker can't be
    // used until you purchase it"; patched shows no licence dialog or notification and runs a
    // Flash task; no crashes. A real NOT_LICENSED response and the timeout path were not reachable.
    // Enable Full Version is a pre-rule licence bypass the owner kept (2026-10-19).
    // 2026-11-03: "GmsCore support" (opt-in, owner decision: login-only) uses the shared builder's
    // scoped mode against 6.6.20 (5445). Only the sign-in and token clients move to MicroG RE: the
    // BaseGmsClient subclasses for auth.account.authapi / auth.service / auth.api.signin.service /
    // signin.service START (found by those action strings; the package and dynamic-lookup getter
    // names are read from BaseGmsClient's connect step, anchored on its "too low to support dynamic
    // lookup" message), the classes holding the GetToken component or the GOOGLE_SIGN_IN action, the
    // kept com.google.android.gms.auth.api.signin classes and the "<<default account>>" methods.
    // isGooglePlayServicesAvailable, location, Home/Matter, Maps, Dynamite, FCM and the c2dm
    // manifest entries are untouched. Smoke test (bytecode + manifest) and a CLI run without -f;
    // 2026-11-03 emulator (patched build of the release batch, stock control): Google Drive backup sign-in showed MicroG RE's account picker and signed in.
    // 2026-11-04: updated to version 6.7.8 (versionCode 5454; APKMirror universal APK, arm64-v8a +
    // armeabi-v7a, same CN=Lee Wilmot signer; paid, so not on the spare Play account). The startup
    // result helper now takes (result, Context, boolean) instead of (result, boolean, Context), so
    // LicenseResultFingerprint accepts either order; the other anchors are unchanged (R8 renames
    // only: rf.w$a -> nt.x$a, rf.a0 -> nt.b0). TaskerSmokeTest passes, including every login-only
    // GmsCore assertion (the four sign-in actions routed, location/Home/telemetry/credentials
    // clients, FCM, Dynamite and the c2dm manifest entries untouched). Emulator not re-run.
    val COMPATIBILITY_TASKER = Compatibility(
        name = "Tasker",
        packageName = "net.dinglisch.android.taskerm",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4CAF50,
        signatures = setOf("973fe25b9be28fb7436d49582b04277767c852539be31783d134a55621b6636d"), // CN=Lee Wilmot
        targets = listOf(AppTarget(version = "6.7.8", versionCode = 5454))
    )

    // Verified 2026-09-17 against org.kman.AquaMail 2.7.0 (versionCode 200700061) from
    // APKPure. LicenseManager computes a licence level (0 free / 10-20 Pro / 30 migration /
    // 40 Pro+ subscription) and LockFeatures answers the per-feature locks; both classes and
    // methods are unobfuscated. The UI reads getLicenseLevel() directly, so the patch forces
    // the level to 40 as well as the derived booleans.
    // Issue #16 (reported against bundle 1.3.1, the free version still displayed): the
    // account list, the prefs license line and the account-limit logic all gate on
    // getLicenseData() != null, which is null on a free install, so the forced getters
    // were never consulted past that gate. getLicenseData() now returns a licensed
    // snapshot instead (state licensed, confirm deadline + expiry far future; the
    // snapshot's R8-renamed fields are discovered structurally from the licensed checks
    // themselves). Re-verified against the same APK on 2026-10-06 - AquaMailSmokeTest
    // asserts the snapshot prefix in the emitted bytecode.
    // 2026-10-12 APK-finder audit: only distributed as a split bundle (APKMirror BUNDLE /
    // APKPure-Uptodown XAPK), so apkFileType is APKM; any "universal APK" note below is outdated.
    val COMPATIBILITY_AQUAMAIL = Compatibility(
        name = "Aqua Mail",
        packageName = "org.kman.AquaMail",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x00B0FF,
        signatures = setOf("da3a93962f82949130f2869637f7abbd0d8f4fff3527a089b06a1078acb7d684"), // CN=Kostya Vasilyev, O="Hypnotica, Inc."
        targets = listOf(AppTarget(version = "2.8.1", versionCode = 200801029))
    )

    // Verified 2026-09-17 against com.wunderground.android.weather 6.20.1
    // (versionCode 2019070035) from APKPure. The ad-free purchase is evaluated locally by the
    // Adobe Airlock SDK ("ads.Ad Free" entitlement); the getters in AirlockValueUtil,
    // PremiumHelper and WUApplication are unobfuscated. FeatureManager.initAdManagers() reads the
    // raw Airlock feature and starts the ad SDKs, so it is also neutered (2026-10-10, issue #45:
    // ads came back after a few launches when only the getters were forced).
    val COMPATIBILITY_WUNDERGROUND = Compatibility(
        name = "Weather Underground",
        packageName = "com.wunderground.android.weather",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1565C0,
        signatures = setOf("baea216abcdbf01625d10a858453c1c879e451ba5c4dda3eca77c08c6e20c8cd"), // CN=John Celenza, O=Weather Underground
        targets = listOf(AppTarget(version = "6.20.1", versionCode = 2019070035))
    )

    // Verified 2026-09-17 against com.monefy.app.lite 1.22.11 (versionCode 2229) from APKPure.
    // The app code is R8-obfuscated but the entitlement helpers are readable:
    // the master pro check (pro-app package id or cached IAP flag), the cached IAP flag the
    // RevenueCat callback writes, and the subscription-expired state. The 2026-09-17 patch
    // pinned their R8 names (gh.o / GeneralSettingsProvider.F / zt.p).
    // 2026-10-12 APK-finder audit: only distributed as a split bundle (APKMirror BUNDLE /
    // APKPure-Uptodown XAPK), so apkFileType is APKM; any "universal APK" note below is outdated.
    // Re-anchored 2026-10-19 on 1.22.11 (MonefySmokeTest + CLI disassembly): no R8 names. The
    // master pro check is the public static ()Z on the Application class (ClearCashApplication,
    // R8-renamed gh) holding "com.monefy.app.pro"; GeneralSettingsProvider's ()Z holding
    // "KEY_GOOGLE_PLAY_MONEFY_PRO_IN_APP_BOUGHT" is forced true; the ()Z holding
    // "KEY_MONEFY_PRO_SUBSCRIPTION_EXPIRED" (DefaultSettingsProviderImpl, R8 zt) is forced false.
    // Each must match exactly once.
    val COMPATIBILITY_MONEFY = Compatibility(
        name = "Monefy",
        packageName = "com.monefy.app.lite",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x8BC34A,
        signatures = setOf("1648cbbe1517389ffbf1d6e0dd911dab52656d53ed01be670f9caf112dbeb85e"), // CN=Monefy App, O=www.monefy.me
        targets = listOf(AppTarget(version = "1.22.11", versionCode = 2229))
    )

    // Verified 2026-09-18 against com.rammigsoftware.bluecoins 13.1.79 (versionCode 33145)
    // from APKMirror. The app is not obfuscated: every premium check collects
    // BillingDomain.isPremiumVersionFlow(), whose only implementation is BillingDomainManager.
    // The manager delegates to an encrypted "premiumKey" preference; the patch returns a
    // constant flow of true instead, so all screens see premium without touching the
    // encrypted storage or the billing client.
    // Re-anchored 2026-10-07 for 13.1.149 (versionCode 33215): this release is fully
    // R8-obfuscated - BillingDomainManager and every kotlinx.coroutines.flow name are gone, so
    // the flowOf(TRUE) replacement no longer applies. The patch now forces the value inside
    // the premium pipeline instead, anchored only on Timber log prefixes + method shape:
    // (1) the salted "premiumKey" verifier's downstream emit (log "Startup: Encryption:
    // Premium is ") is fed Boolean.TRUE - this is the final stage in 13.1.79; (2) in 13.1.149
    // the use case (strings "premiumKey" + "versionOverride") combines that with a Google Play
    // version override that wins when set, so the combine lambda (log "Startup: Encryption:
    // Google Play premium override") returns TRUE; step 2 is mandatory whenever that use case
    // exists. BluecoinsSmokeTest passes on both 13.1.79 and 13.1.149.
    // 2026-10-19: older target 13.1.79 dropped (latest version only, owner); BluecoinsSmokeTest
    // runs against 13.1.149.
    val COMPATIBILITY_BLUECOINS = Compatibility(
        name = "Bluecoins",
        packageName = "com.rammigsoftware.bluecoins",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2979FF,
        signatures = setOf("669491c227af63912876c38b286d782a3f7f7e382c7941b820fe48137d1f8c64"), // CN=ANTONIO BARRIA, O=RAMMIG SOFTWARE
        targets = listOf(
            AppTarget(version = "13.1.149", versionCode = 33215),
        )
    )

    // Verified 2026-09-18 against Flashscore 26.9.2 (versionCode 517) supplied from
    // apks/flashscore. The app is obfuscated, but ads all go through Google's next-generation
    // Mobile Ads SDK (com.google.android.libraries.ads.mobile.sdk), whose class and method
    // names are stable library API; the "Disable ads" patch hooks that surface. There is no
    // Play Billing client at all - the subscription is validated server-side
    // (/api/v2/android/validate_subscription_v2), so premium cannot be unlocked client-side.
    // 2026-10-12 APK-finder audit: only distributed as a split bundle (APKMirror BUNDLE /
    // APKPure-Uptodown XAPK), so APKM at the time. Corrected 2026-10-19: apkFileType is now APKS
    // (the owner's apkcube .apks source, see the field below); APKM bundles still work.
    // Verified 2026-10-13 against 26.10.2 (versionCode 520, owner-supplied apkcube .apks; same
    // CN=Pavel Cvetler / LiveSport signer as 26.9.2, v3 verifies on every split): Disable ads
    // applies unchanged and FlashscoreSmokeTest passes on its base APK.
    // Verified 2026-10-13 on both 26.9.2 (517) and 26.10.2 (520): FlashscoreSmokeTest applies all
    // five patches of that moment and asserts every hook (Hide betting content, added later that
    // day, makes six). Anchors are kept names, stable strings and shape only:
    //   - Disable ads, extended: the kept AdvertZone's load method ("Unsupported ad provider: ")
    //     goes GONE and calls the (I)V setMinHeight helper (bookmaker WebView banners too); the
    //     video media item (toString ", vmapResponse=", ctor (ArrayList, MediaProvider$DrmData,
    //     String)) gets a null VMAP, so IMA video ads never load.
    //   - Disable telemetry: AppsFlyerLib subclass start/logEvent/logSession/logAdRevenue;
    //     Crashlytics via "firebase_crashlytics_collection_enabled" (app wrapper + arbiter) and
    //     the wrapper ("FirebaseCrashlytics component is not present.") enable method; Apptentive
    //     register/engage; manifest switches for Firebase Analytics/Performance, ad ID and
    //     Facebook auto-logging (the Facebook SDK stays initialised for Facebook Login).
    //   - Disable rating prompts: the settings getBool (" using getBool!") returns false for
    //     CAN_SHOW_RATING_BANNER / CAN_SHOW_INAPP_RATING.
    //   - Block marketing popups: remote dialog (ctor "dialogSupport", show "btnGoUrl" over
    //     EventListActivity), FirebaseInAppMessagingDisplay.displayMessage, InAppStrip parser.
    //   - Disable update prompts: the SOFT/HARD dialog ("unssupported_version_reporter" class,
    //     "last_notify_" + Dialog.show()).
    // Push is untouched: no Firebase Messaging/Installations, notification or OneTrust code is
    // patched, and the test checks the MESSAGING_EVENT service against the stock APK.
    // CLI decompile (no -f) shows exactly 45 changed classes, none push-related. On the emulator
    // (26.10.2) the push token registers with Livesport's token service as in stock, following a
    // match and the per-match/global notification settings work, and list ads are gone. A
    // "NotificationsSettingsSportRepository 401" before token registration also occurs on stock.
    // 2026-10-13: "Hide betting content" (default off) added and FlashscoreSmokeTest passes on
    // 26.10.2. The app's own paid "Hide betting content" setting is dead code
    // (its HIDE_BETTING_CONTENT / HAS_ACTIVE_SUBSCRIPTION prefs are never written, the toggle has
    // no click handler, and its predicate only hides list odds), so the patch drives the
    // remote-config odds kill switch the app already uses for geo blocks and underage users:
    // the config value class (ctor "USER_PREFS_CONFIG_KEY-") routes get() through a new static
    // helper that answers ODDS_ENABLE, the DETAIL_ODDS_* switches and
    // DETAIL_SUMMARY_GAMBLING_TEXT_ENABLED with false, DETAIL_BROADCASTING_BOOKMAKERS_DISABLE and
    // DETAIL_ODDS_SUMMARY_IMAGES_DISABLED with true, BONUS_PROMO_GIFT_ICON_URL with "" and
    // LEAGUE_DETAIL_HEADER_STRIP_SPORTS_ENABLED with an empty list. The keys are the key enum's
    // constants (the ctor's 2nd parameter type), resolved by name from its <clinit>; all 15 exist
    // in both versions. The sponsored strip DTO (toString "SponsoredStripWidgetDTO(sponsoredItems=")
    // and the bonus strip DTO (toString prefix "BonusStripWidgetDTO(": "(bonuses=" in 26.9.2,
    // "(summaryBonuses=" in 26.10.2) get empty lists in their constructors. Bookmaker
    // AdvertZone banners stay with Disable ads; the age-verification flow itself is not touched
    // (only the league summary params' copy of isAgeVerified is forced false, see below).
    // 2026-10-13, extended after the emulator still showed the league ODDS tab and the "Winner
    // Odds" (outright) block: neither is behind a remote-config key. The league tab bar comes from
    // the tab set the API sends, so the league header model (toString
    // "LeagueDetailHeaderModel(tournamentId=" + ", detailTabs=") routes its constructor's Set
    // through a new helper that drops the tab-id enum constant named ODDS. The summary only
    // creates the outright widget when its params' isAgeVerified is true, so the params class
    // (toString "LeagueDetailSummaryScreenParams(tournamentId=" + ", isAgeVerified=") stores
    // false there and the widget stays in its Hidden state (renders nothing). FlashscoreSmokeTest
    // passes on 26.10.2; the CLI-patched 26.10.2 disassembly shows both hooks.
    // 2026-10-13: the 26.9.2 target was dropped at the owner's request; only 26.10.2 is supported.
    // 2026-10-13 emulator run (26.10.2 full-bundle merge, all six patches, stock control): the
    // league ODDS tab, the match-detail odds section, the bookmaker bonus strip with its 18+ line,
    // the gift icon and the ad slots are gone; no crashes. List-row odds and bookmaker broadcasting
    // info were not shown by stock in that region, so they are untested.
    // 2026-10-14: Disable ads also no-ops the next-gen MobileAds (and Companion) setRequestConfiguration,
    // setUserMutedApp and setUserControlledAppVolume, which throw without init (rule 9).
    // 2026-11-03: 26.11.4 (versionCode 525, Play arm64 build, same signer) checked and NOT taken;
    // the target stays 26.10.2. Disable ads no longer holds: like 365Scores 14.9.8, R8 repackaged
    // the next-gen Ads SDK into ads_mobile_sdk.* (only AdActivity and 6 internal classes keep
    // their names), so the MobileAds, preloader and load hooks find nothing to patch, while the
    // app's own interstitial manager ("ads_interstitial_display_count") still runs outside
    // AdvertZone. Block marketing popups also drifted (the dialog show logic moved into
    // EventListActivity.onResume, and the InAppStrip model moved to
    // flashplatform/repository/inappStrip/models); both have a tested re-anchor, but the app is
    // held until Disable ads gets a new app-layer anchor (lead: the ADS_ENABLED remote-config key).
    // 2026-11-04: target moved to 26.11.4 (versionCode 525, Play arm64 split merge, same signer
    // 2c8830db...). FlashscoreSmokeTest applies all six patches. Disable ads now works at the
    // app layer: the remote-config value class (ctor "USER_PREFS_CONFIG_KEY-") answers the key
    // enum constants ADS_ENABLED and ADS_AMAZON_ENABLED with false (a second helper chained with
    // Hide betting content's, shared code in flashscore/shared/RemoteConfigOverrides.kt);
    // ADS_ENABLED gates AdvertZone, the zone-id resolver, the embedded list/news ad components and
    // the screens' ad states. AdvertZone still collapses itself ("Unsupported ad provider: "), the
    // interstitial manager (ctor prefs "ads_interstitial_display_date"/"_count") gets an empty ad
    // unit id from its only ()String getter (its load entry returns on an empty id), and the VMAP
    // response is still nulled. The SDK-name hooks were dropped (no MobileAds/preloader/load
    // classes are left); the SDK may still initialise, but nothing requests an ad. Block
    // marketing popups re-anchored: EventListActivity.onResume (holds "btnGoUrl") nulls the
    // dialog model read back from the "dialogSupport" helper right before its null check, and the
    // InAppStrip parser matches the model by simple name. Runtime not tested yet.
    val COMPATIBILITY_FLASHSCORE = Compatibility(
        name = "Flashscore",
        packageName = "eu.livesport.FlashScore_com",
        // The owner gets Flashscore from apkcube.com, which serves .apks split archives. The
        // bundle cannot choose Manager's download site (Morphe's API picks it); the preferred
        // format and the per-version note point users there instead. APKM still works.
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x1E88E5,
        signatures = setOf("2c8830db33069e1beb410e5f37ea0949b4c5852fde108c6e3895738e07226550"), // CN=Pavel Cvetler, O=LiveSport s.r.o.
        targets = listOf(
            AppTarget(version = "26.11.4", versionCode = 525, description = FLASHSCORE_SOURCE_NOTE),
        )
    )

    // Verified 2026-09-18 against OneFootball 15.142.0 (versionCode 1044958885) from APKMirror.
    // The app code is obfuscated; all ads run through Google Mobile Ads
    // (com.google.android.gms.ads), so the "Disable ads" patch hooks that stable library
    // surface (initialize, every load/loadAd and the app-open preloader). No premium tier
    // was found in the readable code - the patch targets ads only.
    // Verified 2026-10-07 against 15.145.0 (versionCode 1044999406, APKMirror): Disable ads
    // applies unchanged; OneFootballSmokeTest passes.
    // 2026-10-12 APK-finder audit: only distributed as a split bundle (APKMirror BUNDLE /
    // APKPure-Uptodown XAPK), so apkFileType is APKM; any "universal APK" note below is outdated.
    // 2026-10-14: Disable ads also neutralises the other MobileAds statics (rule 9).
    // 2026-10-17: updated to version 15.146.0 (versionCode 1045009496, APKMirror bundle arm64-v8a +
    // armeabi-v7a, merged). Signer CN=Appsolute, OU=SD, SHA-256 5099231f...56ab (the same cert as the
    // 15.145.0 file), with a Play source stamp. Every GMA anchor is unchanged and unique.
    // 15.142.0 and 15.145.0 dropped (latest verified version only). Smoke-tested and CLI
    // decompile-checked (all 27 GMA hooks, nothing dropped). Emulator 2026-10-17: not usable.
    // Stock and patched both crash at start in native code (JuceInvocationHandler, the same pc)
    // under ARM translation, so ads and push were not checked at runtime. Airship registered a
    // channel on both re-signed builds; whether Firebase push needs Spoof signature is still open.
    // (Superseded 2026-10-23: 15.147.0 starts fine on the emulator, stock and patched; see below.)
    val COMPATIBILITY_ONEFOOTBALL = Compatibility(
        name = "OneFootball",
        packageName = "de.motain.iliga",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x00C853,
        signatures = setOf("5099231f83f0f6d011f15287f37fe37b6392f97b9908f6f44ea6cb86d44356ab"), // CN=Appsolute, OU=SD
        targets = listOf(
            // 2026-10-23: updated to version 15.147.0 (versionCode 1045019512; APKMirror bundle,
            // every ABI; signer CN=Appsolute OU=SD, cert SHA-256
            // 5099231f83f0f6d011f15287f37fe37b6392f97b9908f6f44ea6cb86d44356ab, confirmed by APKPure).
            // All GMA load/init hooks are unchanged (dexindex diff vs 15.146.0) and
            // OneFootballSmokeTest passes; 15.146.0 dropped (latest verified version only).
            // Emulator (stock control): no crash; the Home banner ad and all GMA traffic are gone.
            // The in-feed "Ad Break" slot (home and match page) stayed as an empty skeleton box.
            // 2026-10-24: Disable ads also (1) makes both native ad component parsers
            // (AdvertisingComponentParser / AdvertisingPlaceholderComponentParser.parse) return
            // null, so ComponentParserRegistry leaves those components out (anchors: parse shape
            // (String, I, ComponentModel, protobuf Any) -> ComponentModel plus the generated
            // Ads$AdComponentProperties / Ads$PlaceholderAdComponentProperties parseFrom call), and
            // (2) answers the Flutter getAdData / getOMPAdData bridge calls with the app's own
            // result.error("Ad Blocked") at once (handle(MethodCall, Result)V holding the channel
            // method name), so Dart no longer waits on a load that never ends. OneFootballSmokeTest
            // asserts both; CLI (no -f) Applied, 32 methods changed and all intended (decompile).
            // Emulator vs stock: no crash, no Google ad traffic, match page ad slots gone with no
            // gap, Home banner gone. Known limit: the Home feed's "Ad Break" card keeps its grey
            // skeleton. It is a Dart-only placeholder (feed fetched and decorated in Dart; stock
            // shows the same skeleton on any no-fill) and no native lever removes it. Other Dart
            // feeds (e.g. a competition News feed) were not rechecked and likely behave the same.
            // 2026-11-03: updated to version 15.148.0 (versionCode 1045029590; owner-supplied
            // APKCube .apks merged, arm64-v8a; same signer CN=Appsolute OU=SD, 5099231f...56ab).
            // Disable ads applies unchanged: every GMA hook, both ad component parsers and both
            // Flutter bridge handlers still match. OneFootballSmokeTest passes; CLI (no -f)
            // Applied and the changed methods decompile as intended. 15.147.0 dropped (latest
            // verified version only). 2026-11-03 emulator: stock and patched both hit a splash ANR under emulator load (not the patch); no crash.
            AppTarget(version = "15.148.0", versionCode = 1045029590)
        )
    )

    // Verified 2026-09-18 against net.osmand 5.4.5 (versionCode 5405) from APKMirror.
    // Not obfuscated: InAppPurchaseHelper.isPurchased(String) walks the purchase list and
    // InAppPurchaseHelperImpl answers the cached local entitlement getters. applyPurchases()
    // derives the OSMAND_PRO_PURCHASED / OSMAND_MAPS_PURCHASED / LIVE_UPDATES_PURCHASED
    // settings from those same getters, so forcing them also stops the writer resetting them.
    // Verified 2026-10-07 against 5.4.9 (versionCode 5409, APKPure XAPK merged): all patches
    // apply unchanged; OsmAndSmokeTest passes.
    // Verified 2026-10-13 against 5.4.10 (versionCode 5410; same signing certificate as 5.4.9):
    // OsmAndSmokeTest passes unchanged (commit 4884eb6).
    // 2026-10-19: the entitlement getter lookups are now required (a missing one fails the patch).
    // 2026-10-19: older targets 5.4.5, 5.4.9 dropped (latest version only, owner).
    // 2026-10-24: updated to version 5.4.11 (versionCode 5411; APKPure XAPK merged, arm64-v8a
    // only; signer CN=Victor Shcherb, cert SHA-256 d192f4ff...5bed27, matches the expected
    // developer cert). isPurchased and the five InAppPurchaseHelperImpl getters are unchanged
    // (dexindex). Enable Premium now also forces InAppPurchaseUtils.isAndroidAutoAvailable(
    // OsmandApplication) true (GitHub #79): it is a separate gate, true only for 10 days after
    // install/update and then only for developer/paid builds or saved *_PURCHASED settings
    // (filled after an inventory cycle), so Android Auto showed RequestPurchaseScreen. Callers:
    // NavigationSession.onCreateScreen/onPurchaseDone, IntentHelper.parseContentIntent,
    // MapViewWithLayers.setupRenderingView. Kept (not obfuscated) name, mandatory lookup.
    // Android Auto lists sideloaded apps only with its "Unknown sources" developer setting on.
    // OsmAndSmokeTest passes; CLI (no -f) Applied, the 7 forced methods decompile-verified (no
    // other method changed). Emulator vs stock: starts, Free-version banner gone, Weather
    // unlocked. Android Auto not runtime-tested (needs a head unit), bytecode only. 5.4.10
    // dropped (latest version only).
    val COMPATIBILITY_OSMAND = Compatibility(
        name = "OsmAnd",
        packageName = "net.osmand",
        apkFileType = ApkFileType.APKM, // bundle-only on APKMirror and APKPure (checked 2026-10-07)
        appIconColor = 0x7CB342,
        signatures = setOf("d192f4fffff2fae37f2821e4ca44f4cbe2483e7ffa24a8472043f685dd5bed27"), // CN=Victor Shcherb, OU=OsmAnd
        targets = listOf(
            AppTarget(version = "5.4.11", versionCode = 5411)
        )
    )

    // Verified 2026-09-19 against com.textra 4.85 (versionCode 48561) from APKMirror.
    // Textra app code is R8-obfuscated. Purchase state is a single integer preference
    // (key "lc": -1 unknown, 0 free, 1 licensed) owned by a dedicated obfuscated class.
    // Until 2026-10-19 the patch found that class as the only one declaring the four methods
    // g()Ljava/lang/Integer;, i(Ljava/lang/Integer;)V, k()Z and l()Z. Those are R8 names, so it
    // did NOT survive name rotation, despite the earlier "no obfuscated names" note. It forces
    // the licensed getter true and the free getter false (state 1). Every gate reads those: ad
    // placement, settings visibility and upgrade prompts.
    // Verified 2026-10-07 against 4.87 (versionCode 48761, APKPure XAPK merged): all patches
    // apply unchanged; TextraSmokeTest passes.
    // Re-anchored 2026-10-19 on 4.87 (TextraSmokeTest + CLI disassembly): the license class is
    // the one the preference registry instantiates for the "lc" key (new-instance before
    // const-string "lc", ctor (String, int, SharedPreferences); sq.q in 4.87). Its ()Z getters
    // are told apart by the state they test: intValue()==1 is forced true (licensed),
    // intValue()==0 is forced false. No method names are used.
    // 2026-10-19: older target 4.85 dropped (latest version only, owner).
    // 2026-11-02 (GitHub #108, "4.87 crash on start"): the current Play build of 4.87
    // (versionCode 48767, arm64) is now wrapped by the full PairIP native VM:
    // com.pairip.application.Application.attachBaseContext runs VMRunner.setContext +
    // SignatureCheck.verifyIntegrity, StartupLauncher.launch() runs in App.<clinit>, and
    // libpairipcore.so ships for arm64-v8a. Emulator differential control: the Play-signed
    // splits reach InitialSyncActivity, but any re-signed build (unpatched STOCK control AND
    // the Enable Pro build) SIGSEGVs in libpairipcore.so ~2 s after start, before onCreate.
    // That is Morphe's re-signing tripping the native tamper check, NOT this patch - the
    // Enable Pro bytecode still applies and the smoke test passes. Same native-VM blocker as
    // Zedge/Backdrops/HabitNow; the Java SignatureCheck.verifySignatureMatches force does not
    // help there. Enable Pro should be withdrawn for the PairIP-wrapped Play build (see
    // docs/patch-blocklist.md). Play app-signing cert (verified 2026-11-02):
    // a93dd7bddbe5d1539d0450fda15dbcd28c793c390d5fcf04169a4f385c8aff82 (CN=Android, O=Google Inc.).
    val COMPATIBILITY_TEXTRA = Compatibility(
        name = "Textra",
        packageName = "com.textra",
        apkFileType = ApkFileType.APKM, // bundle-only on APKMirror and APKPure (checked 2026-10-07)
        appIconColor = 0x5C6BC0,
        targets = listOf(
            AppTarget(version = "4.87", versionCode = 48761)
        )
    )

    // Verified 2026-09-19 against com.jetappfactory.jetaudio 13.1.2 (versionCode 261320)
    // from APKMirror. Purchase state lives in one obfuscated class (default-package "uy",
    // compiled from JInAppInfo.java) holding per-plugin static booleans. The class is
    // located by its unique inline literal (IAB: QueryInventory info: ...) instead of its rotating
    // name. Leaf boolean getters (no args or a Context) are forced true; the compound
    // getters and the inverted upsell check OR those leaves and flip by themselves.
    // 2026-10-12 APK-finder audit: only distributed as a split bundle (APKMirror BUNDLE /
    // APKPure-Uptodown XAPK), so apkFileType is APKM; any "universal APK" note below is outdated.
    val COMPATIBILITY_JETAUDIO = Compatibility(
        name = "jetAudio",
        packageName = "com.jetappfactory.jetaudio",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF6D00,
        signatures = setOf("6bd7d17bd3553400ef40222f4a7cd4cee0c0b276e97e3ce831baa7f1d0b71b4b"), // CN=JetAudio Team, O=JetAppFactory
        // 2026-11-03: updated to 13.2.0 (versionCode 261370, Play build via gplaydl, same
        // signer), Enable Pro applies unchanged; smoke + CLI without -f.
        // 2026-11-03 emulator: two patched cold starts reach the main screen, no crash.
        targets = listOf(AppTarget(version = "13.2.0", versionCode = 261370))
    )

// Verified 2026-09-19 against com.Relmtech.Remote 3.25.1 (versionCode 325001) from
// APKMirror. The app code is R8-obfuscated (`bh0` here); "Full" is a
// `License.Status` SharedPreferences int (0 = Free, 1 = Locked, 2 = Full) and the
// canonical Full check is the single `Z(Context)` method that reads it through the
// same-class `I(Context)` getter - called from ~20 feature sites. The patch locates
// that class by the unique "License.Status" literal and forces the check true.
// (RevenueCat only feeds the paywall UI for actual buyers - non-buyers get an empty
// entitlements map, so an `isActive()` force can never unlock anything here.)
    val COMPATIBILITY_UNIFIEDREMOTE = Compatibility(
        name = "Unified Remote",
        packageName = "com.Relmtech.Remote",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2962FF,
        signatures = setOf("b506be7e0c84f44785538ff9034687d52c3b8080c3c745cb79da07891c3c92cb"), // CN=Jakob Berglund, O=Relmtech
        targets = listOf(AppTarget(version = "3.25.1", versionCode = 325001))
    )

    // Verified 2026-09-27 against com.futbin 27.02 (versionCode 7002, user-supplied
    // APKPure APK). The app code is obfuscated, but all ads run through Google Mobile
    // Ads (the app's own `x.cv3` ad manager only calls the GMA surface, and the Nimbus
    // mediation SDK renders AdMob through it), so the "Disable ads" patch hooks that
    // stable library surface (initialize, every load/loadAd and the app-open
    // preloader). Futbin+ premium is account-linked (Play purchase is linked to the
    // Futbin account server-side), so premium is out of reach - ads only.
    // 2026-10-13: the "27.5" (versionCode 7005) target added 2026-10-07 was REMOVED. That APK
    // (Aptoide user store "superpocket") is a rebuilt repack, not a Futbin release: signed by
    // CN=Jx Clarynx (cert SHA-256 bd6515d3...fc6b) instead of FUTBIN (1cf7ff75...e904), with
    // an injected classes7.dex whose exported launcher activity fetches remote JSON, collects
    // device/carrier info and shows WebView overlays (adware). Genuine releases are numbered
    // 27.05, 27.06; check the FUTBIN signer before using any Futbin APK.
    // 2026-10-14 re-verified on genuine builds (signer O=FUTBIN, 1cf7ff75...e904): 27.02 (7002),
    // 27.05 (7005), 27.06 (7006). The "only GMA" claim above was wrong. Nimbus also renders through
    // its own Moloco/Mintegral/Vungle demand: the GAM controller falls back to a Nimbus interstitial
    // when it has no GAM one. The squad builder shows an Anzu video panel that only premium hides.
    // GMA-only hooks also left in-list ad slots visible (empty). "Disable ads" now forces the app's
    // isAdAllowed preference ("preferences.ad.allowed.key") to false, so every placement hides
    // itself and the SDKs are never started. It also no-ops, by log-line prefix (R8 names rotate:
    // x.cv3 -> x.nk4), the FbApplication GAM/Nimbus init ("Ad Log -> int GAM"), the GAM
    // interstitial show, Nimbus init and its interstitial/bottom/in-feed requests. It forces the
    // premium branch of the Anzu init ("Ad Log -> init Anzu") and keeps the GMA hooks. Every hook is
    // mandatory. The app calls no MobileAds static besides initialize. Smoke test and CLI
    // disassembly pass on all three. Emulator 2026-10-14 (27.06, 2 GB and 4 GB AVDs): the patched
    // app starts and stays up with no crash; the stock app logs "Initialized AdMob" and the patched
    // app starts no ad SDK. Neither stock nor patched gets past the first GlobalActivity screen on
    // this emulator (pause timeout on stock too), so the screens with ads, the squad-builder panel
    // and interstitials were NOT checked at runtime. Only 27.06 is supported now (owner request).
    // 2026-10-14: Disable ads also neutralises the other MobileAds statics (rule 9).
    // 2026-10-17: updated to version 27.08 (versionCode 7008, APKPure single universal APK; not on
    // APKMirror). Signer O=FUTBIN, 1cf7ff75...e904 (genuine, no injected dex or new components).
    // Every anchor is unchanged and unique (R8 renames only: nk4->bt4, tm7->rz7, jw8->tb9); the new
    // Club Import screens add no ad paths. 27.06 dropped (latest verified version only).
    // Smoke-tested and CLI decompile-checked on 27.08 (every hook, nothing dropped). Not runtime-
    // tested, same as 27.06: on the emulator the app doesn't get past its first screen.
    // 2026-11-04: updated to version 27.10 (versionCode 7010; Play base APK with all four ABIs,
    // signer O=FUTBIN 1cf7ff75...e904). Disable ads applies unchanged (owner: keep the current
    // patches); FutbinSmokeTest green and CLI without -f applied it.
    val COMPATIBILITY_FUTBIN = Compatibility(
        name = "Futbin",
        packageName = "com.futbin",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x26A69A,
        signatures = setOf("1cf7ff75f2e364c2e671321af98f86d35979fe8f3575da508b90d530df75e904"), // CN=Dirk Duncan, O=FUTBIN
        targets = listOf(AppTarget(version = "27.10", versionCode = 7010))
    )

    // Verified 2026-09-27 against com.pocketcolorwheel.PCW 3.26 (versionCode 57,
    // user-supplied APKPure APK). The free app has no premium gate: no billing client,
    // no license checks and no references to the separate Pro package - it monetizes
    // purely through Google Mobile Ads initialized from `ApplicationClass.onCreate`.
    // The "Disable ads" patch hooks that stable library surface (initialize, every
    // load/loadAd and the app-open preloader). The Pro app
    // (com.pocketcolorwheelpro.pro) is a standalone paid listing that mirrors do not
    // serve, so there is nothing to verify against it.
    // 2026-10-12 APK-finder audit: only distributed as a split bundle (APKMirror BUNDLE /
    // APKPure-Uptodown XAPK), so apkFileType is APKM; any "universal APK" note below is outdated.
    // 2026-10-14: Disable ads also neutralises the other MobileAds statics (rule 9).
    val COMPATIBILITY_PCW = Compatibility(
        name = "Pocket Color Wheel",
        packageName = "com.pocketcolorwheel.PCW",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x9C27B0,
        signatures = setOf("fb2ba2a7e820705bd774b02f9c34b36a51bb6d0ebdbc81ff2d67b97ad39fd46c"), // Google Play app signing key
        targets = listOf(AppTarget(version = "3.26", versionCode = 57))
    )

    // YouCut (com.camerasideas.trimmer) removed 2026-10-09 (issue #44): see
    // docs/patch-blocklist.md. The Pro gate is client-side and forceable, but every
    // re-signed build self-kills via a native signing-cert + anti-debug SIGKILL gate in
    // libisvideoengine.so JNI_OnLoad, which a bytecode/resource patch cannot neutralise.
    // Revisit only if the engine gains native-lib patching.

    // Verified 2026-10-06 against com.flyersoft.moonreader 10.7 (versionCode 1007000,
    // universal APK from APKPure). All ads run through the app's own unobfuscated ad
    // manager com.flyersoft.components.MrAd, whose private static no-arg boolean
    // disableAds() gates every ad path: the MrAd constructor returns before
    // initializing the ad SDK (AdMob + Facebook Audience Network) when it is true,
    // and the interstitial/exit/rewarded show paths consult it first. MrAd is the
    // only app class that touches the ad SDK, so forcing that one consumer true
    // disables banner, interstitial, exit and native ads. isProVersion only
    // distinguishes the separate paid Pro listing (backup suffixes .mrpro/.mrstd),
    // so there is no in-app premium gate; ads-only.
    // 2026-10-12 APK-finder audit: only distributed as a split bundle (APKMirror BUNDLE /
    // APKPure-Uptodown XAPK), so apkFileType is APKM; any "universal APK" note below is outdated.
    // 2026-10-25: updated to version 10.8 (versionCode 1008000; APKPure XAPK merged, same signer);
    // MoonReaderSmokeTest passes on patcher 2.0.0; anchors unchanged.
    val COMPATIBILITY_MOONREADER = Compatibility(
        name = "Moon+ Reader",
        packageName = "com.flyersoft.moonreader",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x283593,
        signatures = setOf("5ac646ebc68017e4cc582b11b1c2ae5d29b15d9b0ac3a54fc60972417b41c9ad"), // CN=Seany Zhou
        targets = listOf(AppTarget(version = "10.8", versionCode = 1008000))
    )

    // Verified 2026-10-10 against com.foobnix.pdf.reader 9.4.20 (versionCode 7175) from APKPure.
    // No PairIP and no billing library in the free app. Ads are Google Mobile Ads, gated by
    // AppsConfig.isShowAdsInApp(Context) (MobileAds init, interstitial/banner/reward checks) and
    // ADS.isRewardActivated() (the interstitial, banner and reward show paths). The Pro build is a
    // separate paid listing, so this patch is ads-only.
    // 2026-11-04: updated to version 10.0.22 (versionCode 7536; Play download via gplaydl, a single
    // arm64 APK, same CN=Ivan Ivanenko signer). 10.0 is R8-obfuscated (AppsConfig/ADS renamed and
    // merged, the GMA public API renamed, the banner path gone), so the gates are found by their
    // log lines: isShowAdsInApp is the (Context)Z logging "no-ads old device..." before its Pro app
    // package check "com.foobnix.pro.pdf.reader" (it gates MobileAds init in LibreraApp.onCreate and every rewarded
    // and interstitial load in AdsFragmentActivity.onResume), and every ()Z logging
    // "isRewardActivated" is forced true (ADS's own, now static, plus the copy R8 inlined into
    // AdsFragmentActivity). LibreraSmokeTest asserts both; CLI without -f applies it. Not
    // runtime-tested.
    val COMPATIBILITY_LIBRERA = Compatibility(
        name = "Librera",
        packageName = "com.foobnix.pdf.reader",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1E88E5,
        signatures = setOf("cdf4e1c31c41a55ed72896bf443ce56d50fb34bb933e3189b3ddc2609c90d8f9"), // CN=Ivan Ivanenko
        targets = listOf(AppTarget(version = "10.0.22", versionCode = 7536))
    )

    // Verified 2026-10-10 against com.alarmclock.xtreme.free 26.06.0 (versionCode 70004221) from
    // APKPure. Split base (requiredSplitTypes), so the bundle is APKM. No PairIP. The ad-free
    // entitlement is ShopFeature AD_FREE, read through the shop data's d(ShopFeature) check
    // (the implementation takes the "feature" argument and returns Z). Ad SDKs: GMS ads, Vungle,
    // Facebook Audience Network and Unity Ads. Only the AD_FREE entitlement is forced true, so the
    // paid all-in-one and other shop features are not unlocked.
    // Re-anchored 2026-10-19 on 26.06.0 (AlarmClockSmokeTest + CLI disassembly): the entitlement
    // check is the concrete (ShopFeature)Z holding "feature" that is the only implementation of
    // its interface method (l9.d implementing in7.d, 35 call sites); the three
    // sd0$a.a(ShopFeature) candidates share an interface with 3 implementations and are
    // excluded. No method name is pinned (the d(ShopFeature) name above is the R8 name).
    val COMPATIBILITY_ALARMCLOCK = Compatibility(
        name = "Alarm Clock Xtreme",
        packageName = "com.alarmclock.xtreme.free",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xF44336,
        signatures = setOf("7638e4e83b50c513ec1eb886301a451b6f0751cf470ec9921e916a6818203359"), // CN=Irene Duke
        targets = listOf(AppTarget(version = "26.06.0", versionCode = 70004221))
    )

    // Verified 2026-10-14 against com.appgenix.bizcal 2.55.7 (versionCode 255702): owner-supplied
    // apkcube bundle, base and every split signed by the developer (CN=Michael Kopplin, O=Mikado
    // Software, SHA-256 53d3dc3f...) with a Google Play source stamp, merged with APKEditor. Only
    // distributed as a split bundle, so APKM. No PairIP, LVL or Play Integrity; app code readable.
    // Disable ads: AdsUtil.showAdsForUser(Context) and showAdsAccordingToFirebase(Context) (the
    // "ads or Pro" dialog flag) forced false, plus the FairBid backstop in StoreUtil
    // (initializeMobileAds / preloadInterstitialAd / showInterstitialAd, pinned by their FairBid and
    // Interstitial calls) and the Facebook AudienceNetworkContentProvider.onCreate.
    // Disable telemetry: Fyber's crash-handler provider, the two PushNotificationsUtil promo-push
    // methods, FirebaseAnalytics.logEvent/setUserId/setUserProperty, AppMeasurementSdk.logEvent, the
    // Crashlytics reporting API plus its collection arbiter (found by its pref key), and the
    // firebase_analytics_collection_deactivated manifest switch; Firebase init and Remote Config
    // are left running. Unlock Pro (owner-supplied reference
    // o0b/morphe-patches): SettingsHelper$ProStatus.getCompleteProStatus / getForceProStatus
    // forced true, which every ProUtil feature gate reads first; billing is untouched.
    // Emulator 2026-10-14 (2.55.7, all three patches): no crash, no ads or ads-or-Pro dialog, no Go
    // Pro drawer item, location autocomplete unlocked, events persist across views/rotation/restart;
    // Firebase logs "App measurement deactivated via the manifest".
    // Rule 12, 2026-10-19 (CLI, no -f, default set = Disable ads + Disable telemetry + Unlock Pro,
    // all Applied; aapt2 dump resources stock vs patched, PUBLIC flags ignored): no entry lost, no
    // control character or string_0x name. Changes: the literal surrounding quotes go from the
    // German (de) gopro_simple_review_1..4_quote testimonials and from the hu/sv string_in_quotes
    // "%1$s" (cosmetic; the Go Pro screen is behind Unlock Pro anyway); 10 date-picker
    // multipliers (string/circle_radius_multiplier, *_radius_multiplier_*, text_size_multiplier_*,
    // ...) come back as the same text typed as strings instead of floats (getString returns the
    // same text); dimen go_pro_activity_premium_batch_50_width sw720dp 274.921875dp ->
    // 274.914062dp (float precision); the case-twin ids detail_Lunar_event_times /
    // detail_lunar_event_times become id_0x7f0a02eb / id_0x7f0a0324 (same IDs; the names appear
    // in the dex only in the string pool with the other R.id names; not checked further).
    // 2026-10-25: updated to version 2.55.8 (versionCode 255800; APKPure XAPK merged, same signer);
    // BusinessCalendarSmokeTest passes on patcher 2.0.0; anchors unchanged. The emulator and rule 12
    // checks above were run on 2.55.7 only.
    val COMPATIBILITY_BUSINESSCALENDAR = Compatibility(
        name = "Business Calendar 2",
        packageName = "com.appgenix.bizcal",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x009688,
        signatures = setOf("53d3dc3f50ea8256ea27768bc0c6c24d44c1dcf8b478fa08496a721658a21a8f"), // CN=Michael Kopplin, O=Mikado Software
        targets = listOf(AppTarget(version = "2.55.8", versionCode = 255800))
    )

    // Verified 2026-10-11 against app.expert.player 11.2.0 (versionCode 306) from APKPure's XAPK
    // (base + arm64 and locale splits, merged with APKEditor). Flutter app: its logic and premium
    // checks are native Dart (libapp.so), which bytecode patches cannot change. PairIP license
    // layer only (com.pairip.licensecheck; no VMRunner/SignatureCheck): Disable ads no-ops
    // LicenseClient.checkLicense(Context), which otherwise kills a non-Play install (a pre-rule
    // licence bypass the owner kept, 2026-10-19). (The earlier "No PairIP" note was wrong.)
    // Re-verified 2026-10-19 (smoke test, CLI without -f, apkanalyzer): Disable ads no longer
    // blocks MobileAds.initialize (Dart awaits its listener; the 2026-10-11 patch no-op'ed the
    // FlutterMobileAdsWrapper init thread's run()). Every google_mobile_ads plugin load (anchors:
    // the load* channel strings in onMethodCall, the onAdFailedToLoad event strings, the "Ad for
    // following adId already exists" trackAd string) reports NO_FILL to Dart through a
    // morpheFailLoad helper on the AdInstanceManager, and the GMA load entry points (BaseAdView /
    // AdManagerAdView.loadAd, AdLoader.loadAd(s), the static full-screen loads) return at once as
    // a backstop. Dart uses banner, interstitial, rewarded-interstitial and app-open ads
    // (libapp.so channel names). Not run on a device.
    // 2026-10-25: updated to version 11.3.0 (versionCode 309; APKPure XAPK merged, same signer);
    // ExpertPlayerSmokeTest passes on patcher 2.0.0 after one fix. Disable ads anchors unchanged.
    // Enable Premium (opt-in) pinned RevenueCat's EntitlementInfo by its R8 name (G5.M in 11.2.0,
    // d6.J now) and failed to match; it now finds the class by RevenueCat's toString literal
    // "EntitlementInfo(identifier='" and takes its only (String, Z isActive, ...) constructor,
    // which still forces isActive (p2) true. No R8 name is pinned any more.
    val COMPATIBILITY_EXPERTPLAYER = Compatibility(
        name = "TV Smarters Player Expert",
        packageName = "app.expert.player",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1565C0,
        signatures = setOf("78601372350f222eed7007cd300a115fd215dacd7b2352c5077d6db026b4168a"), // Google Play app signing key
        // 2026-10-29: updated to 11.4.0 (versionCode 311, same Play signer). Disable ads and Enable
        // Premium apply unchanged: both smoke tests green and CLI without -f applied them. The
        // APKPure bundle is armeabi-v7a only (no arm64 build on APKPure; the APKMirror slug was not
        // found), so this update is bytecode-verified only.
        // 2026-11-03: updated to 11.6.1 (versionCode 315, Play arm64 build via gplaydl, same Play
        // signer), both patches apply unchanged; smoke + CLI without -f.
        // 2026-11-03 emulator: patched cold starts reach MainActivity (stock stops at the PairIP licence screen), no crash.
        targets = listOf(AppTarget(version = "11.6.1", versionCode = 315))
    )

    // Verified 2026-09-29 against com.streema.simpleradio 6.2.0 (versionCode 872,

    // APKPure universal). App code is not obfuscated. Premium state is entirely local:
    // SimpleRadioBaseActivity.isPremium() returns mIabService.isInitialized() &&
    // mIabService.c(), and the IAB service (b9/j) answers c() from SharedPreferences
    // ("iab_premium" boolean OR "iab_subscription_date_end" timestamp in the future).
    // Ads run through AppLovin MAX mediation (the SDK init key is inline) plus Google
    // Mobile Ads (AdMob native/interstitial), so "Disable ads" hooks those stable
    // library surfaces (MobileAds.initialize overloads, MaxInterstitialAd loadAd/showAd).
    // 2026-10-12 APK-finder audit: only distributed as a split bundle (APKMirror BUNDLE /
    // APKPure-Uptodown XAPK), so apkFileType is APKM; any "universal APK" note below is outdated.
    // 2026-10-13 "Disable ads" fix, smoke-tested on 6.2.0 (872) and 6.2.4 (895, split base).
    // Before: the banner hook targeted AdView, which has no loadAd, so it matched nothing and
    // banners kept loading while the patch reported Applied; AdManager interstitials (the
    // path every non-"admob" AdsExperiment bucket takes), rewarded, rewarded-interstitial,
    // app-open and MAX banner/rewarded/app-open/native loads were not hooked at all. Now every
    // listed entry point is mandatory (missing class or method = patch failure): GMA
    // BaseAdView.loadAd, AdManagerAdView.loadAd, AdLoader.loadAd/loadAds, static load() on
    // InterstitialAd, AdManagerInterstitialAd, RewardedAd, RewardedInterstitialAd, AppOpenAd;
    // MAX loadAd on MaxInterstitialAd/MaxAdView/MaxRewardedAd/MaxAppOpenAd/MaxNativeAdLoader
    // plus every MaxInterstitialAd.showAd. GMA/MAX names are unobfuscated in both versions.
    // Prebid (6.2.4 only, obfuscated) is not hooked: the app blocks on its demand future with
    // an untimed get(), and the AdManagerInterstitialAd.load no-op already stops the ad.
    // 2026-10-14 crash fix: with MobileAds.initialize a no-op (released patch too), the ads
    // manager's MobileAds.setAppVolume(0f) threw IllegalStateException on every cold start while
    // Remote Config "android_ump_enabled" was not active (fresh install), with or without Enable
    // Premium. Every concrete static void on MobileAds now returns early and
    // putPublisherFirstPartyIdEnabled answers false. New anchor for the empty native "Ad" row in
    // the station lists: the AdsExperiment Boolean stored after "android_search_nativeads_show"
    // (getter s2() on 6.2.0, x2() on 6.2.4) answers false. Smoke test (both patches, one run)
    // passes on 6.2.0 (872) and 6.2.4 (895); 6.2.4 CLI-patched without -f and disassembly
    // checked. Emulator 2026-10-14 (6.2.4, fresh installs, Disable ads alone and with Enable
    // Premium, 3-4 cold starts each incl. after UMP consent): no crash and no "must be called
    // prior" exception; no "Ad" card (stock shows it at the top of Recommended); audio plays and
    // survives background/return; no interstitial; Enable Premium hides the paywall and the
    // Premium tab. 6.2.0 dropped: only the latest verified version is supported.
    // 2026-10-14: updated to 6.3.0 (versionCode 899, merged bundle, same developer signer as
    // 6.2.4); anchors unchanged: SimpleRadioBaseActivity.isPremium, the "iab_premium" IAB service
    // (still ta/j), every listed GMA/MAX entry point and MobileAds static, and the AdsExperiment
    // Boolean after "android_search_nativeads_show" (loader s2(), getter x2() as on 6.2.4). The app
    // code differs from 6.2.4 only by renumbered lambdas and two Dagger injector classes.
    // Emulator 2026-10-14 (6.3.0, fresh installs, both patches): no crash incl. after consent, no "Ad" card,
    // no Premium tab or paywall, audio plays.
    val COMPATIBILITY_SIMPLERADIO = Compatibility(
        name = "Simple Radio",
        packageName = "com.streema.simpleradio",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF6D00,
        signatures = setOf("e9dc74df7439ad7a73c7cb916b7dd5697281e0a3f6bfac93208ec7bd9f70725a"), // OU=Streema
        targets = listOf(AppTarget(version = "6.3.0", versionCode = 899))
    )

    // Verified 2026-09-29 against com.farproc.wifi.analyzer 3.10.5-L (versionCode 999,
    // APKPure). Tiny single-dex app, not obfuscated. Banner ads are gated by
    // Settings.a(Context), which reads the "next_show_ad_time_millisec" preference and
    // returns true once the hide-until date passes; MainScreen.N() shows the legacy
    // AdMob banner (com.google.android.gms.ads.e) only when the gate is true. Forcing
    // the gate false hides the banner everywhere.
    // 2026-10-13, 3.11.2 (versionCode 139): patch unchanged, the CLI applies it without -f.
    // MainScreen's ad methods were renamed (gate wrapper E(), banner H(), interstitial D());
    // the gate Settings.a(Context) still has exactly two callers, MainScreen.E and
    // LanNeighborsScreen.j, so the main banner, the interstitial and the LAN banner all reach
    // the forced-false gate (checked in the patched bytecode). The LeadBolt web ad that
    // 3.10.5-L carried is gone from 3.11.2; on 3.10.5-L it is not blocked, and only the banner
    // was checked there. 3.11.2 has a lower versionCode (139) than 3.10.5-L (999), so moving
    // from 3.10.5-L needs an uninstall first.
    // 2026-10-19: the gate is now the single static (Context)Z that reads the
    // "next_show_ad_time_millisec" key (singleOrNull; a second match fails the patch).
    // 2026-10-19: older target 3.10.5-L dropped (latest version only, owner);
    // WifiAnalyzerSmokeTest runs against 3.11.2.
    val COMPATIBILITY_WIFIANALYZER = Compatibility(
        name = "WiFi Analyzer",
        packageName = "com.farproc.wifi.analyzer",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00ACC1,
        signatures = setOf("90c579818cc58567db12e7f1150a60e4bba9a393e3c269eaba46d89af402f881"), // O=farproc.com
        targets = listOf(
            AppTarget(version = "3.11.2", versionCode = 139)
        )
    )

    // Verified 2026-09-29 against com.Project100Pi.themusicplayer 3.2.0.0_release_2
    // (versionCode 32001, APKPure universal). Premium state is a static boolean flag
    // in an R8-obfuscated holder class (`v7/g` here) next to a list X (corrected 2026-10-19:
    // X is the owned background-pack ids "1".."5", not a purchase list): a() = all five packs
    // owned, b() = flag && a() (the combo), and 32 reads in 25 classes use the flag directly.
    // Purchases (remove_ads / combo SKUs) set the flag via c(Z);
    // a temp-ad-free resetter clears it when the trial timestamp expires. The patch
    // forces a()/b() true, neuters the resetter and seeds the flag true in <clinit>,
    // so every consumer sees premium without touching Play Billing.
    // Ads run through AppLovin MAX mediation plus Google Mobile Ads, so "Disable ads"
    // hooks those stable library surfaces (until 2026-10-19: MobileAds.initialize overloads,
    // GMA loads, MaxInterstitialAd loadAd/showAd; see below).
    // 2026-10-12 APK-finder audit: only distributed as a split bundle (APKMirror BUNDLE /
    // APKPure-Uptodown XAPK), so apkFileType is APKM; any "universal APK" note below is outdated.
    // 2026-10-14: Disable ads also neutralises the other MobileAds statics (rule 9).
    // 2026-10-19: Enable Premium also forces every sput-boolean to the flag to true: the
    // cold-start prefs loader (run from MyApplication.onCreate) stored the "isAdFree" pref into it
    // on every launch, overwriting the <clinit> seed, and c(Z) could clear it. The prefs-loader
    // write ("isAdFree" anchor) is required. Disable ads rewritten on mandatory hooks
    // (shared/misc/ads/MaxGmaAdHooks.kt): AppLovinSdk initialize/initializeSdk (the app's
    // initializeSdk listener only enables ad preloads), GMA BaseAdView/AdManagerAdView/AdLoader
    // and full-screen static loads, MAX MaxAdView loadAd/startAutoRefresh plus the full-screen
    // MAX loadAd/showAd; MaxAdView kept GONE. GMA RewardedAd.load reports an immediate failure so
    // the remove-ads sheet's "watch a video ad" spinner ends with the app's own error toast.
    // MobileAds statics are neutralised as a guard only (the app never calls initialize).
    // Smoke-tested and CLI-verified (no -f, smali checked) on 3.2.0.0_release_2; not
    // runtime-tested.
    // 2026-10-25: updated to version 3.2.1.0_release_1 (versionCode 32101; APKPure XAPK merged,
    // same signer); PiMusicPlayerSmokeTest passes on patcher 2.0.0; anchors unchanged.
    val COMPATIBILITY_PIMUSICPLAYER = Compatibility(
        name = "Pi Music Player",
        packageName = "com.Project100Pi.themusicplayer",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x3F51B5,
        signatures = setOf("f1b56e1d0e7901712e4ed9be385a34b7a11b696c60c9f458cf804ae3cf0f8636"), // CN=100PiDevs, O=Team100Pi
        targets = listOf(AppTarget(version = "3.2.1.0_release_1", versionCode = 32101))
    )

    // Verified 2026-10-05 against com.shazam.android 16.62.0 (versionCode 1606200,
    // APKPure universal). No ad SDK, no billing client, no shields in the dex, so
    // the only patchable surface is telemetry: FirebaseAnalytics.logEvent(String,
    // Bundle) is public and concrete, and FirebaseCrashlytics is fully public
    // (isCrashlyticsCollectionEnabled/recordException/log). No premium gate exists
    // (Apple-owned free app).
    // Verified 2026-10-11 against the same build: "Open in YouTube (Music)" rows come
    // from server config (streamingproviders[]: packagename + intent:// song/artist/album
    // URIs with package=<stock>;). Every consumer reads the StreamingProvider data class
    // (R8 Hn.u), found by its unique toString string "StreamingProvider(streamingProviderId=";
    // its only constructor (obj, String x5, Z) is hooked so p3..p6 pass through the shazam
    // extension's remap(). Cross-checked against the config parser (List-returning, strings
    // "packageName(...)"/"songUri(...)"/"albumUri(...)") constructing that class. The
    // manifest's <queries> lists only the stock packages (targetSdk 36), so the patch adds
    // the Morphe packages there too. Version names carry a build suffix ("16.62.0-261001");
    // the old bare "16.62.0" target made Manager/CLI skip Shazam patches (fixed 2026-10-11).
    // 16.62.1-261006 (APKMirror bundle, merged) verified 2026-10-11: both patches' smoke
    // test + CLI without -f, and on the emulator with Morphe YouTube 21.20.405 / YT Music
    // 9.18.50 + MicroG RE the rows open the Morphe apps (START pkg=app.morphe.android.*).
    // Shazam ships as a bundle only (requiredSplitTypes base__abi,base__density).
    // 2026-10-18 (issue #62): "Spoof signature" (on by default; original cert CN=Tony Miller, O=Shazam
    // Entertainment Ltd., SHA-1 b804e188301813b5d8d47d0bb2280607c16fd8b6, from the APKMirror
    // 16.63.0-261008 bundle) fixes account sign-in on the patched app and also makes the bundled
    // Spotify Auth SDK's SpotifyNativeAuthUtil.startAuthActivity() return false, so Spotify login
    // uses the SDK's WebView page (the Spotify app rejects the re-signed caller). "GmsCore support"
    // (off; launcher SplashActivity.onCreate) for Google sign-in/FCM; it also makes the sign-in use
    // case (found by "prefkey_should_attempt_silent_sign_in" + (Context, String, Z, continuation))
    // return false when silent, so MicroG RE shows no uninvited chooser on the Library tab or the
    // login screen. Rule 12: 0 of 19,925 string values changed. Smoke + CLI (no -f) verified on
    // 16.63.0 only.
    // 2026-10-19 (issue list; smoke test, not runtime-tested): Disable telemetry also forces
    // the Crashlytics DataCollectionArbiter's no-arg boolean getters (16.63.0:
    // isAutomaticDataCollectionEnabled and its isFirebaseDataCollectionDefaultEnabled fallback,
    // found by the "firebase_crashlytics_collection_enabled" key the class reads) to false, the
    // Business Calendar approach: IdManager, the settings controller and the
    // CrashlyticsAppQualitySessionsSubscriber call the arbiter directly, so forcing only
    // FirebaseCrashlytics.isCrashlyticsCollectionEnabled (kept) never stopped collection.
    // GmsCore support no longer offers the Clone package name: the dex hard-codes the original
    // package name in behaviour checks (SplashActivity.onStart branches on
    // "com.shazam.android", and Apple's AMS kit pairs "com.shazam.android" with its
    // signing-certificate allowlist), so a clone takes broken paths.
    // 2026-10-19: older targets 16.62.1-261006, 16.62.0-261001 dropped (latest version only,
    // owner); ShazamSmokeTest ran against 16.63.0-261008 then (now 16.64.0-261015, see the target).
    // 2026-10-19 (issue #62, reporter's video): Spotify's login page no longer works in the SDK
    // 1.2.3 WebView dialog (the email step resets, Facebook lands on the account page instead of
    // redirecting with ?code=, Google refuses WebViews). Spoof signature's Spotify part now hooks
    // WebViewAuthHandler.start to open the login in a browser tab (default browser if it supports
    // Custom Tabs, else the first that does, else any browser, never com.spotify.music) through
    // the shazam extension's SpotifyBrowserLoginPatch; the manifest gains the exported
    // SpotifyRedirectReceiverActivity for shazam-spotifyoauth://spotifylogincallback, which brings
    // the SDK LoginActivity back (CLEAR_TOP|SINGLE_TOP) and hands the redirect (or a cancel when
    // the tab is closed) to the SDK's own completion listener. The WebView dialog stays as the
    // fallback when no browser exists. Smoke test + CLI (no -f, smali + manifest checked, rule 12:
    // 0 of 19,925 strings changed). Emulator (Chrome, via the shazam://spotifyconnect deep link):
    // Custom Tab on accounts.spotify.com, Back clears the tab and LoginActivity with Shazam's
    // "Connection failed" toast, an ?error= redirect clears the task back to MainActivity; no
    // crash. A real login (code exchange) was not tested: it needs a Spotify account.
    val COMPATIBILITY_SHAZAM = Compatibility(
        name = "Shazam",
        packageName = "com.shazam.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0088FF,
        signatures = setOf("bffeb14903fbc92fffe6404a3654098a3f85c81a3513afd5dceac121cd678d1c"), // CN=Tony Miller, O=Shazam Entertainment Ltd.
        targets = listOf(
            // 2026-10-23: updated to version 16.64.0-261015 (versionCode 1606400; APKMirror bundle;
            // signer CN=Tony Miller / Shazam Entertainment Ltd., cert SHA-256
            // bffeb14903fbc92fffe6404a3654098a3f85c81a3513afd5dceac121cd678d1c, SHA-1 b804e188...d8b6,
            // unchanged). The real matcher resolves all 11 Shazam fingerprints uniquely (4 R8
            // renames only) and ShazamSmokeTest passes; 16.63.0 dropped (latest verified only).
            // 2026-10-28: updated to 16.65.0-261022 (versionCode 1606500, arm64-v8a, same signer).
            // 2026-11-04: updated to 16.66.0-261029 (versionCode 1606600; Play arm64 split bundle
            // merged, same signer). All four patches apply unchanged: smoke test green and CLI
            // without -f applied them.
            AppTarget(version = "16.66.0-261029", versionCode = 1606600),
        )
    )

    // Verified 2026-10-05 against com.podcast.podcasts 9.17.0 (versionCode 260909124,
    // APKPure universal). The app code is partly obfuscated; all ads run through a
    // heavy mediation stack (GMA, AppLovin MAX, Meta Audience Network, InMobi, Vungle
    // strings, Pangle, Huawei), so "Disable ads" hooks those stable library surfaces
    // (initialize/init, every load/loadAd and the MAX terminal showAd overload).
    // No premium patch: the only ad-free path is Firebase invite referral state
    // (server-driven); no local purchase gate was found (no queryPurchases /
    // onPurchasesUpdated in app code).
    // 2026-10-12: the real versionName carries a build suffix; the bare version made
    // Manager/CLI treat the patches as incompatible.
    // 2026-10-14: Disable ads also neutralises the other MobileAds statics (rule 9).
    // 2026-10-19: Disable ads now runs Castbox's mandatory hook set (same Castbox code base and
    // ad stack): the old "AdView" hook matched nothing and the MAX banners (MaxAdView loadAd x4 +
    // startAutoRefresh in its banner helpers, Explorer, Downloads) were unhooked.
    // AppLovinSdk.initialize is neutered (its listener only mutes and sets the user id); MaxAdView
    // kept GONE. Smoke-tested and CLI-verified (no -f, smali checked) on 9.17.0; not
    // runtime-tested.
    val COMPATIBILITY_PODCASTREPUBLIC = Compatibility(
        name = "Podcast Republic",
        packageName = "com.podcast.podcasts",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5722,
        signatures = setOf("5efb79c6024b970c74f30a2012aa63cb018140966a397e709bcb11f74fd7de01"), // CN=Yoga Monkey, O=Guru
        targets = listOf(AppTarget(version = "9.17.0-260909124", versionCode = 260909124))
    )

    // Verified 2026-10-05 against fm.castbox.audiobook.radio.podcast 11.26.1
    // (versionCode 260915290, APKPure universal). App code is not obfuscated. All ads
    // run through a heavy mediation stack (GMA, AppLovin MAX, Meta Audience Network,
    // InMobi, Vungle strings, Pangle, Huawei), so "Disable ads" hooks those stable
    // library surfaces (initialize/init, every load/loadAd and the MAX terminal
    // showAd overload).
    // No premium patch: premium reads server-synced vip lists (UserProperties filled
    // from the account backend) and local purchases are RSA-verified in
    // BillingRepository, so there is no client-side gate to force.
    // 2026-10-12 APK-finder audit: only distributed as a split bundle (APKMirror BUNDLE /
    // APKPure-Uptodown XAPK), so apkFileType is APKM; any "universal APK" note below is outdated.
    // 2026-10-12: the real versionName carries a build suffix; the bare version made
    // Manager/CLI treat the patches as incompatible.
    // 2026-10-14: Disable ads also neutralises the other MobileAds statics (rule 9).
    // 2026-10-19: Disable ads rewritten on mandatory hooks (shared/misc/ads/MaxGmaAdHooks.kt,
    // shared with Podcast Republic). The old "AdView" hook matched nothing (loadAd lives on
    // BaseAdView / AdManagerAdView) and the app's own AppLovin MAX banners/MRECs (MaxAdView
    // loadAd + startAutoRefresh) were never hooked. Now: AppLovinSdk.initialize (app-called; its
    // listener only mutes), Meta AN initialize, InMobi init, MobileAds statics (initialize
    // required, rule 9), GMA BaseAdView/AdManagerAdView/AdLoader loads plus the interstitial,
    // rewarded, rewarded-interstitial and app-open static loads, MAX MaxAdView
    // loadAd/startAutoRefresh, MaxInterstitialAd/MaxRewardedAd/MaxAppOpenAd loadAd+showAd and
    // MaxNativeAdLoader.loadAd; every MaxAdView is kept GONE (setVisibility override + every
    // constructor). Smoke-tested and CLI-verified (no -f, smali checked) on 11.26.1; not
    // runtime-tested.
    // 2026-10-25: updated to version 11.27.0-261014339 (versionCode 261014339; APKPure XAPK merged,
    // same signer); CastboxSmokeTest passes on patcher 2.0.0; anchors unchanged.
    val COMPATIBILITY_CASTBOX = Compatibility(
        name = "Castbox",
        packageName = "fm.castbox.audiobook.radio.podcast",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xF44336,
        signatures = setOf("5efb79c6024b970c74f30a2012aa63cb018140966a397e709bcb11f74fd7de01"), // CN=Yoga Monkey, O=Guru
        targets = listOf(AppTarget(version = "11.27.0-261014339", versionCode = 261014339))
    )

    // Verified 2026-10-07 against com.melodis.midomiMusicIdentifier.freemium 10.5.8
    // (versionCode 21134, APKPure universal). NOTE the package: the free app is
    // com.melodis.midomiMusicIdentifier.freemium - the com.melodis.soundhound.android
    // name the candidates doc previously guessed does not exist. The app code is
    // R8-obfuscated, but every ad runs through the full public Google Mobile Ads API
    // (banner AdView, native AdLoader, interstitial, rewarded, rewarded-interstitial,
    // app-open, Ad Manager banner/interstitial, GMA preloading) plus Meta Audience
    // Network, so the patch hooks those stable library surfaces: the SDKs never
    // initialize, preload never starts and every load/loadAd/loadAds becomes a no-op.
    // No PairIP or other shields in the dex. Play Billing is present for the Pro
    // subscription but the premium gates are obfuscated; premium deep-dive parked -
    // ads only.
    // 2026-10-14: Disable ads also neutralises the other MobileAds statics (rule 9).
    val COMPATIBILITY_SOUNDHOUND = Compatibility(
        name = "SoundHound",
        packageName = "com.melodis.midomiMusicIdentifier.freemium",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x000000,
        signatures = setOf("56d8b2577bea4cb34487e6c60225f1e3f0abc39e24fd34e45769876ebb062a3c"), // O=Melodis
        targets = listOf(AppTarget(version = "10.5.8", versionCode = 21134))
    )

    // Verified 2026-10-07 against one.cricket.app 26.08.01 (versionCode 90, APKPure base
    // split). The app ships as a split bundle: libnative-lib.so (loaded by the ad loaders'
    // static initializers and by MyApplication for its API URLs) lives in the ABI split,
    // so users must patch the full APKM/XAPK. App classes keep their names but R8 renames
    // their methods, so the ad wrappers (one/cricket/app/ads/*) are matched by class +
    // parameter shape; AppOpenManager.onStart keeps its name (@OnLifecycleEvent). The
    // other bundled networks (Mintegral, IronSource, Vungle, ...) are only reached via
    // AdMob mediation, so the AdMob loads are the backstop. No premium tier exists (no
    // billing code). No PairIP.
    // 2026-10-14: Disable ads also neutralises the other MobileAds statics (rule 9).
    val COMPATIBILITY_ONECRICKET = Compatibility(
        name = "OneCricket",
        packageName = "one.cricket.app",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0D47A1,
        signatures = setOf("6e795e00c60134f927a1a8d61677926fadac536befce84d617358def4ae8a4d9"), // CN=OneCricket, O=OneCricket
        targets = listOf(AppTarget(version = "26.10.01", versionCode = 91))
    )

    // Verified 2026-10-07 against com.gregacucnik.fishingpoints 4.7.3 (versionCode 410,
    // APKPure). Premium is client-side: RevenueCat entitlements are pushed into four tier
    // flags on AppClass (the Application, name kept), and every gate plus the ad manager
    // reads aggregate getters that OR those flags (A/B/K in this build, R8-renamed, found by
    // shape). The forecast/weather API sends no entitlement, so the unlock is real. Ads
    // (AdMob + Pangle/Meta mediation) are skipped for premium users. Play Integrity is only
    // the Billing library's transitive dependency and gates nothing. No PairIP.
    // 2026-10-25: updated to version 4.8.0 (versionCode 411; APKPure APK, same signer);
    // FishingPointsSmokeTest passes on patcher 2.0.0; anchors unchanged.
    val COMPATIBILITY_FISHINGPOINTS = Compatibility(
        name = "Fishing Points",
        packageName = "com.gregacucnik.fishingpoints",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1565C0,
        signatures = setOf("4e8e4f711a222f9c9c75b4fa1560bb3cb09d7a25b1ce26db1808b2b0e042ca15"), // CN=Grega Cucnik
        targets = listOf(AppTarget(version = "4.8.0", versionCode = 411))
    )

    // Verified 2026-10-07 against com.onesports.score 4.3.1 (versionCode 296, APKPure split
    // bundle merged). VIP is server-authoritative but cached: the server's vip int/expiry are
    // written to MMKV and every client gate reads UserPreference (name kept): a "logged in AND
    // vip == 1" getter and the raw vip int getter, both R8-renamed and found by shape. Forcing
    // them unlocks the VIP UI and removes ads (ad fragments hide for VIP). Premium data the
    // server delivers (predictions, dropping odds) is validated server-side and stays gated.
    // Also covered by rushiranpise/morphe-patches (coverage is informational only).
    // 2026-10-13: 4.3.2 (versionCode 297, merged arm64) verified, patch unchanged; AiScoreSmokeTest
    // passes. 4.3.2 adds direct AdMob units (an AdMob/MAX network switch) next to AppLovin MAX
    // in the match-detail banner, stats-detail banner and match-list native row, but each sits
    // in the same VIP-gated block as the MAX path: the match-detail runnable checks a field set
    // from UserPreference's VIP gate in onCreate, the stats activity checks the gate before
    // posting its banner runnable, and the list builder inserts native-ad rows only when the
    // gate (passed as a "no ads" flag) is false. No GMA hooks are needed.
    // 2026-10-14, 4.3.2: added "Spoof signature" (shared builder, on by default) for the reported
    // "goal alerts never arrive". AiScore's Firebase API key (project aiscore-abb71) is restricted
    // to the original signing cert (CN=onescore, SHA-1 d34738b4...a84c, read from the bundle's
    // v2/v3 block), so a re-signed build gets 403 API_KEY_ANDROID_APP_BLOCKED from Firebase
    // Installations, FCM never gets a token and AppFcmTokenWorker never reports one (POST
    // v1/app/device/report/fcm). FIS builds X-Android-Cert through AndroidUtilsLight and the
    // R8-renamed PackageManagerWrapper's getPackageInfo(String, 0x40); the patch routes every
    // PackageManager.getPackageInfo call through the signature extension. Push is plain FCM and
    // the VIP patch is unrelated. FotMob's key is unrestricted, which is why it needs no spoof.
    // No GmsCore patch (works with Play services). Spoof signature was only verified on 4.3.2.
    // Emulator 2026-10-14 (Play services, fresh installs): Enable Premium alone -> FIS 403
    // API_KEY_ANDROID_APP_BLOCKED, PersistedInstallation Status 4, no FCM token; with Spoof
    // signature -> Status 3 with an auth token, "Token successfully retrieved", an FCM token in
    // appid.xml and AppFcmTokenWorker SUCCEEDED. VIP badge unlocked in both; no crashes.
    val COMPATIBILITY_AISCORE = Compatibility(
        name = "AiScore",
        packageName = "com.onesports.score",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x00C853,
        signatures = setOf("175a57de17de7811434710e42b2afbbf8e60811e54a6e570b740fa7bb4c6906f"), // CN=onescore, O=onescore
        targets = listOf(AppTarget(version = "4.3.2", versionCode = 297))
    )

    // Verified 2026-10-07 against com.resultadosfutbol.mobile 6.6.0 (versionCode 23005536,
    // APKPure). The blocklist previously had this app under the wrong package
    // (com.besoccer). PairIP license check only (no VM shield): the manifest Application is
    // com.pairip.application.Application, whose attachBaseContext only calls
    // LicenseClient.checkLicense, so that one call is neutralised for re-signed builds. The
    // ad-free subscription is server-validated (backend returns an empty AdsConfig for
    // subscribers) and the app's ad engine is obfuscated, so ads are removed at the SDK.
    // (Until 2026-10-19 that meant the AppLovin MAX, Unity, Meta and Vungle inits; see below.)
    // Disable license check is a pre-rule licence bypass the owner kept (2026-10-19).
    // 2026-10-19, 6.6.0 (dex-verified): every ad goes through Google's next-gen Mobile Ads SDK
    // (com.google.android.libraries.ads.mobile.sdk). AppLovin, Fyber, Moloco, Meta, Unity, Vungle
    // and Verve are only its mediation adapters and app code never calls MAX, so the old
    // MAX/Unity/Meta/Vungle hooks were dropped. Disable ads no-ops MobileAds and its Companion's
    // initialize plus every void that throws without init (rule 9), forces
    // putPublisherFirstPartyIdEnabled false, and returns early from every void load / loadAd /
    // loadFromAdResponse on AdView and on BannerAd, InterstitialAd, RewardedAd,
    // RewardedInterstitialAd, AppOpenAd and NativeAdLoader and their Companions. Anchors are the
    // SDK's public names, kept by R8. A patch-time scan fails if any app call into MobileAds or a
    // load lands on an unpatched method. The init listener never fires, so the app's own
    // "MobileAds initialised" flag stays false and every ad path takes its built-in
    // not-initialised branch (the one it uses when no WebView is available): app-open and
    // interstitial/rewarded fail at once and the user action continues, banner and native slots
    // wait at most 30 s. Smoke test and CLI disassembly pass; not runtime-tested.
    // 2026-11-03: target moved to 6.7.1 (versionCode 23005545, Play arm64 build via gplaydl, same
    // signing certificate). Both patches apply unchanged: BeSoccerSmokeTest passes (the app still
    // makes the same nine next-gen SDK calls) and a CLI run without -f applied both; checkLicense
    // and the MobileAds/load methods disassemble to an immediate return. 2026-11-03 emulator (patched build of the release batch, stock control): two cold starts, no crash.
    val COMPATIBILITY_BESOCCER = Compatibility(
        name = "BeSoccer",
        packageName = "com.resultadosfutbol.mobile",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x2E7D32,
        signatures = setOf("97f9d6deb3d9d3ca623528b77dddc530c49516c90e948628e0354bb530cc3b6f"), // CN=Alejandro Sanchez Blanes, O=Resultados-Futbol.com
        targets = listOf(AppTarget(version = "6.7.1", versionCode = 23005545))
    )

    // Verified 2026-10-07 against com.rawcam.app 1.4.3 (versionCode 55, APKPure split bundle
    // merged). Method adapted from the WaggBR and franticg33k Native Camera patches (GPL-3.0,
    // last targeting 1.4.2): premium is the local "is_premium" flag in "rawcam_prefs". 1.4.3
    // moved the read/write into shared helpers o()/p(SharedPreferences, String, Z), so the
    // patch persists true right before the CameraViewModel constructor reads the flag (instead
    // of flipping the read's default register, which R8 may reuse) and forces the setter's
    // argument true. PairIP license check only (Application wrapper, no VM shield). No ads.
    // Device-tested 2026-10-07 by the owner on a Galaxy S25 Ultra (Android 17, arm64-only;
    // Play Store 1.4.3 base + splits, base patched, all re-signed): app starts without the
    // license wall and all premium features work. Note APKPure's bundle only carries the
    // armeabi-v7a split, which arm64-only phones cannot install.
    // Verified 2026-10-13 against 1.4.4 (versionCode 56; same signing certificate as 1.4.3):
    // NativeCameraSmokeTest passes unchanged (commit 4884eb6); not device-tested on 1.4.4.
    // Disable license check is a pre-rule licence bypass the owner kept (2026-10-19).
    // 2026-10-19: older target 1.4.3 dropped (latest version only, owner).
    // 2026-10-23: target moved to 1.4.5 (versionCode 57; APKPure, same signing certificate).
    // The premium class and setter were renamed by R8 (R1/q -> R1/r, U -> W); the "is_premium" +
    // "rawcam_prefs" anchors and the PairIP LicenseClient.checkLicense still match uniquely.
    // Smoke test and CLI decompile (no -f; exactly the 3 hooked methods change) pass; not run on
    // the emulator (the APKPure bundle is armeabi-v7a only, which the emulator cannot install).
    val COMPATIBILITY_NATIVECAMERA = Compatibility(
        name = "Native Camera",
        packageName = "com.rawcam.app",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xD0BCFF,
        signatures = setOf("e6cb3d3dc3c31c4ffbcc5a2b95d71875c1861ee2b17ddc3e591471c274bd9768"), // Google Play app signing key
        targets = listOf(
            AppTarget(version = "1.4.5", versionCode = 57)
        )
    )

    // Verified 2026-10-07 against com.ztnstudio.notepad 5.4.3.19019 (versionCode 19019,
    // APKPure split bundle merged). App classes keep their names, methods are R8-renamed.
    // Premium: every gate reads UserPremiumData's premium getter (b() here, found by shape)
    // and some also BuyAdFreePreferenceHelper's "isPurchased" getter. Ads: the bundled
    // Calldorado SDK (in-app ad manager started unconditionally, plus the after-call screen);
    // its public start/startInAppAdManager entry points are neutralised. RevenueCat + Play
    // Billing handle purchases. No PairIP.
    // 2026-10-25: 5.4.4.19080 (versionCode 19080, APKPure, same signer) NOT adopted: it drops the
    // Calldorado core SDK (no com.calldorado.Calldorado class, so Disable ads fails loudly). Ads now
    // run through Appvestor's ad SDK (com.appvestor.adssdk AvAds: AppLovin MAX + Google Mobile Ads),
    // started with the appvestor data partners from the app's ThirdPartyManager; only Calldorado's
    // lookup/opt-in/in-app-update modules remain. Disable ads needs new research and a runtime check.
    val COMPATIBILITY_ZTNNOTEPAD = Compatibility(
        name = "#Notepad",
        packageName = "com.ztnstudio.notepad",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFFC107,
        signatures = setOf("d7508eb3c26f90cbf457dc823b6008f4927d78bf0e64edcde5472fff9564bde5"), // O=ZTN Studios
        targets = listOf(AppTarget(version = "5.4.4.19080", versionCode = 19080))
    )

    // Verified 2026-10-12 against net.smartwod.timer 1.46.9 (versionCode 10000399, APKMirror
    // bundle merged, all four ABIs). React Native + Hermes; no PairIP or packer. Ads are Google
    // Mobile Ads 23.6.0 only, driven from JS through react-native-google-mobile-ads. "Disable
    // ads" hooks stable library API: MobileAds.initialize (both overloads), startPreload and the
    // setAppMuted/setAppVolume/openDebugMenu calls that throw without init; every concrete
    // load/loadAd/loadAds on BaseAdView, AdLoader, Interstitial/Rewarded/RewardedInterstitial/
    // AppOpen and the AdManager variants; and the RN module's initialize(Promise)
    // (io.invertase.googlemobileads, kept for RN reflection) resolves an empty adapter list.
    // UMP consent is untouched. Premium (2026-10-12): the Hermes JS decides it from
    // react-native-iap's getAvailableItemsByType("inapp"/"subs") results and only checks each
    // entry's productId (no state/signature/token/server check), revoking premium whenever the
    // product is missing. "Enable Premium" hooks RNIapModule.getAvailableItemsByType (class and
    // @ReactMethod name kept for RN reflection) to call the smartwod extension, which resolves
    // net.smartwod.timer.premium.lifetime (Premium+) and inapp.adfree as acknowledged purchases
    // ("subs" stays empty) without touching Play Billing. The JS only runs that check after
    // initConnection succeeds, which needs Play Services and a reachable Play Store; that path
    // is left unpatched.
    // Runtime 2026-10-12 (Play-certified API 35 emulator): patched app starts cleanly, drawer
    // shows "Premium+ / Lifetime", MIX unlocked, no banner on the AMRAP screen (stock shows a
    // filled banner + paywall); no crashes or JS errors.
    val COMPATIBILITY_SMARTWOD = Compatibility(
        name = "SmartWOD Timer",
        packageName = "net.smartwod.timer",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x333333,
        signatures = setOf("0c002344faaad0e17db0deca425519632476f7d2d9ebda4fb99f6828d9c73f99"), // Google Play app signing key
        // 2026-11-03: updated to 1.47.1 (versionCode 10000403, Play arm64 build via gplaydl, same
        // Play signer), both patches apply unchanged; smoke + CLI without -f. Its newer GMA has one
        // AppOpenAd.load overload instead of three (the patch already neuters every overload; only
        // the smoke test's expected count changed).
        targets = listOf(AppTarget(version = "1.47.1", versionCode = 10000403))
    )

    // Verified 2026-10-12 against me.bluemail.mail 2.2.408 (versionCode 47587, APKMirror bundle
    // merged, arm64-v8a + armeabi-v7a). Native K-9-based mail app (com.trtf.blue) with a React
    // Native + Hermes layer. Ads are Google Mobile Ads only, driven from JS through
    // react-native-google-mobile-ads; the native app code never calls GMA directly. "Disable ads"
    // hooks stable library API: MobileAds.initialize (the only overload R8 kept) and the
    // setAppMuted/setAppVolume/openDebugMenu calls that throw without init; every concrete
    // load/loadAd on BaseAdView, AdLoader, Interstitial/Rewarded/RewardedInterstitial/AppOpen and
    // AdManagerInterstitialAd; and the RN module's initialize(Promise)
    // (io.invertase.googlemobileads, kept for RN reflection) resolves an empty adapter list.
    // UMP consent is untouched. The premium/ad-free entitlement is server-side
    // (hasServerAdFreeEntitlement, verifyPurchaseWithProvider), not patched.
    // Not runtime-tested: the APK ships only ARM libs with extractNativeLibs=false, so even the
    // stock app dies at startup on the x86_64 emulator (libreactnative.so not found). Bytecode
    // verified only; the same GMA/RN design was runtime-checked on SmartWOD.
    val COMPATIBILITY_BLUEMAIL = Compatibility(
        name = "BlueMail",
        packageName = "me.bluemail.mail",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x006CEF,
        signatures = setOf("46cc9dad502c7581cb5fa56c1e7ea092db8f31948f4a6af2388fcf9391c41af6"), // O=BlueMail
        targets = listOf(AppTarget(version = "2.2.418", versionCode = 48013))
    )

    // Verified 2026-10-12 against com.truecaller 26.39.6 (versionCode 2639006, APKMirror bundle
    // merged; APKPure also ships a standalone APK). Fully R8-obfuscated outside kept model/worker
    // classes, so every anchor is a pref key, a kept type in the signature, or method shape:
    //   - Enable Premium: the "premiumLevel" tier getter (returns PremiumTierType) -> GOLD;
    //     isPremium() in the same class, i.e. !getBoolean("isPremiumExpired", true) (not the
    //     getter that also reads "isInGracePeriod") -> true; the static (PremiumFeatureStatus)Z
    //     gate that compares with INCLUDED -> true; the (PremiumFeature, Z)Z feature check that
    //     reads "disabledPremiumFeatures" -> true (it is the server kill-switch list *and* the
    //     availableFeatures INCLUDED lookup in one method);
    //     PremiumState's constructor (kept types ZLPremiumTierType;LProductKind;LPremiumScope;
    //     LInsuranceState;) gets isPremium = true and tier = GOLD; and the kept
    //     PremiumSubscriptionStatusNotificationWorker.doWork returns a work Result at once (Success
    //     has no no-arg constructor in this build, so the obfuscated Failure class, found by its
    //     "Failure {mOutputData=" toString, is used; doWork already returns it on its own paths).
    //   - Disable telemetry: AppStartTracker.enableTracking (kept), push(String) and
    //     push(String, Map) on the CleverTapManager implementation (kept interface), and every
    //     concrete start(Context, ...) on the AppsFlyerLib subclass.
    //   - Hide Assistant tab / Hide Scam feed: the feature toggles read by exact key
    //     "featureCallAssistant" / "featureScamFeed" (exact-match filters; the keys are prefixes
    //     of other toggles). featureScamFeed is the master switch for the Scam Feed tab, menu
    //     entry, deep link and its notification worker.
    //   - Use SMS for verification codes: the OtpSmsApi selection branch (GOOGLE vs SMS) of an
    //     R8-merged Function0 lambda; only that branch is changed, the other 28 cases are not.
    //   - Disable ads: the ads module never reads Premium or NO_ADS (Enable Premium's NO_ADS is
    //     at most partial for ads). Banner/native: every void bind method of the kept
    //     ads.ui.AdsContainer / AdsContainerLight / AdsSwitchView that takes the banner holder,
    //     a native holder or AdLayoutTypeX sets the view GONE and returns; the holder types are
    //     read at patch time from AdsSwitchView's (holder, AdLayoutTypeX) method and the shared
    //     layout-config parameter. Full-screen: see the 2026-10-14 entry below. Rewarded ads
    //     (WhoViewedMeAdActivity, and the rewarded flow through AdInterstitialActivity) are left
    //     alone: they gate a feature.
    //   - Disable update prompts: the in-app update manager's suspend (Activity, UpdateTrigger,
    //     continuation) entry, scoped by its (Activity, UpdateTrigger)CompletableFuture sibling,
    //     returns Boolean.FALSE; every soft and HardUpgrade Play Core flow starts there. Also the
    //     app's own forced-update state getter (strings "forcedUpdate_updateType" and
    //     "forcedUpdate_appVersion", eak.a() here) returns UpdateType.NONE, so
    //     forcedupdate.ui.ForcedUpdateActivity never shows a REQUIRED or DISCONTINUED page.
    //     SimpleForceUpdateActivity is left alone: WizardActivity only starts it when a drawable
    //     is missing (broken install), not from the server state.
    //   - GmsCore support / Spoof signature: shared builders, launch activity
    //     ui.TruecallerInit.onCreate, original cert CN=truecaller (SHA-1 0ac1169a...1f25e31);
    //     androidx.credentials routing applies (onGetCredential tests isAvailableOnDevice(int)).
    // Server-side and not unlocked: Who viewed / searched for me data, Identify AI, cloud call
    // recording, fraud insurance, the verified badge, and phone verification (server-side Play
    // Integrity attestation; nothing here targets Play Integrity).
    // Ideas taken from the GPLv3 Paresh and bufferk Truecaller patches (anchors there were for
    // older builds and pinned obfuscated names). Rejected: pinning a6x/pol/myw/x5x/hqa/co70/es7/
    // nk00 names; AttributesDTO.<init>(Z) (Gson-built, nothing outside the DTO reads isPremium in
    // this build); returning SMS at offset 0 of the OtpSmsApi lambda (it would break every other
    // merged case).
    // Re-verified 2026-10-14 against 26.39.6 (smoke test + jadx/smali review, not runtime-tested)
    // for user reports #52/#54 and request #53:
    //   - Enable Premium: (PremiumFeature, Z)Z now falls through to the stock check for
    //     CALL_ASSISTANT and FAMILY_SHARING (kept enum constants; both server-backed, and a
    //     forced Call Assistant let "Assistant"-handled spam calls ring through). The premium
    //     status sync writer (Object return, 2 params, strings "premiumHadPremiumBefore" +
    //     "entitledCatalogItemIds", only i3x.e here) returns kotlin.Unit (singleton field found by
    //     type) at once, the equivalent of the reference "SavePremiumState": its
    //     PremiumStatusUpdate event treated the forced isPremium plus the server's "expired" as a
    //     lost subscription, which reset Max spam protection to Basic, the premium blocking
    //     options and the call blocking method, re-enabled ads and posted "subscription expired".
    //   - Disable ads: interstitials are gated at the source, the ()Z check that reads exactly
    //     "featureInterstitialAd" (krk.e here) -> false, so placements run the user's action at
    //     once; finishing AdInterstitialActivity / AdRouterInterstitialActivity dropped Click to
    //     WhatsApp, block, details, pay and rewarded callbacks and was removed. Only
    //     AdAppOpeningActivity (a loading screen without a pending action, reached only from the
    //     gated flow) still finishes after super.onCreate.
    //   - Hide Premium tab / Hide Blocking tab (opt-in): the bottom bar builder ((SparseIntArray)V
    //     reading BottomBarButtonType.CALLS / MESSAGES, then a static ([Object)List filterNotNull
    //     and CollectionsKt (Iterable, I)List take) calls a new static helper per patch on the tab
    //     array right before filterNotNull; it nulls PREMIUM, or BLOCKING and
    //     FAMILY_PROTECTION_CONFIG (both labelled "Blocking"), read through the tab base class's
    //     BottomBarButtonType getter. Calls and Messages always stay; selecting a hidden tab
    //     (deep links, upsells) is a no-op in NavigationBarView.setSelectedItemId.
    //   - Hide family button / Restore classic call log (opt-in; the latter experimental): the
    //     central toggle resolver (String, FeatureState)Z that calls SharedPreferences.getBoolean
    //     (twins with the same signature do not) returns false for "featureFamilyProtect" /
    //     "featureCallLogRevamp", via a shared key -> value override helper.
    //   Emulator 2026-10-14 (logged out): stock, the default patches, and the default patches plus
    //   the four new opt-in ones all install, run onboarding and survive 3 cold starts with no
    //   crash. Everything past onboarding needs SMS registration, so the premium-sync fix, the
    //   interstitial change, the hidden tabs, the family button and the classic call log were NOT
    //   checked at runtime (smoke test + CLI disassembly only).
    // 2026-10-14: updated to 26.40.5 (versionCode 2640005, merged APKMirror bundle, signer
    // CN=truecaller SHA-1 0ac1169a...1f25e31 as above); anchors unchanged in shape and
    // uniqueness, only R8 names moved: premium store qbx (W tier, Z isPremium, Y grace sibling),
    // feature status jb9.c0, isFeatureAvailable a4x.c, sync writer x8x.e (still ends with the
    // PremiumStatusUpdate event), PremiumState obx, worker Results o9q/m9q, toggle resolver fho.a
    // (twins ezj.a / liq.a do not call getBoolean), interstitial gate cvk.e, Call Assistant su7.c,
    // Scam Feed xq00.a, bottom bar builder cp6.g, update manager ybn, forced update qdk.a, OtpSmsApi
    // lambda dl70.invoke; kept classes (ads.ui views, AdAppOpeningActivity, AppStartTracker,
    // CleverTapManager, AppsFlyerLib, TruecallerInit, PremiumFeature CALL_ASSISTANT /
    // FAMILY_SHARING, BottomBarButtonType PREMIUM / BLOCKING / FAMILY_PROTECTION_CONFIG) unchanged.
    // New in 26.40.5: a MessageList ad unit (AdPlacement MessageScreen.MessageList, business inbox
    // list ads via ListAdConfig). It is an Ads V2 (Compose) placement, covered by Disable ads step 4
    // below, not by the bind hooks; not checked at runtime.
    // 2026-10-14: GmsCore support no longer offers the Clone package name (#50): the main provider
    // authority is exactly "com.truecaller", the dex hard-codes content://com.truecaller, and the
    // com.truecaller.account type clashes, so a clone cannot install next to stock.
    // 2026-10-18: GmsCore support and Spoof signature are on by default (owner): Google sign-in,
    // Drive backup and push need them on a re-signed build.
    // 2026-10-18 (#52/#53, 26.40.5; smoke test + CLI disassembly with the default set + Hide business
    //   media, no -f, all Applied):
    //   - Disable ads overrides "featureAdsOnOfferHub" off in the resolver: no "Recommended Offers"
    //     row (OfferHubActivity, ads-router offer feed) and no offer hub deep link.
    //   - Hide business media (opt-in): the BusinessDetailsModel constructor (toString prefix
    //     "BusinessDetailsModel(description=" + ", brandMedia=") gets a new empty ArrayList as
    //     brandMedia; the static BusinessDetailsScreen (strings "BusinessDetailsScreen" +
    //     "BusinessDesTitle") clears its Function2 video thumbnail slot. Verified campaign cards: 7
    //     toggles off (featureBizVerifiedCampaigns, ...ForOutgoingCalls, ...InRevampedInCallUi,
    //     ...sCarouselACS, ...sDetailsView, ...sCarouselDetailsView, ...sDV3), because each surface
    //     ORs its own toggle with the master. featureBizPACSFeaturesRevamp can still enqueue a
    //     campaign prefetch (no display). Message ID campaigns are left alone.
    //   - Disable telemetry: every getBoolean("featureCleverTap") outside com.truecaller.qa reads
    //     false (SDK init, second gate, CRM push handler, CleverTapRefreshWorkAction). Firebase in
    //     bytecode, not the manifest: the measurement config's Boolean get(String) answers TRUE for
    //     firebase_analytics_collection_deactivated and FALSE for
    //     google_analytics_adid_collection_enabled; the Crashlytics arbiter (key + "Crashlytics
    //     automatic data collection ") ()Z getters return false; the Sessions manifest override
    //     returns FALSE.
    //   - tagging5 (GET /v1/tags, the caller-ID tag catalogue) is not ads and stays.
    //   - Backup (Google Drive via Google sign-in) has no client-side fix: it needs GmsCore support
    //     and MicroG RE.
    //   - Restore classic call log (experimental, opt-in) also keeps the classic list's swipe actions
    //     (right = call, left = SMS): the classic lists' shared RecyclerView setup (the one ()V method
    //     calling addOnItemTouchListener -> addItemDecoration -> setItemAnimator -> setHasFixedSize in
    //     that order) attached the swipe helper (checked by its "ItemEvent.SWIPE_START" event) only
    //     while "featureFavouriteContacts" was off; the read's result is forced to 0 before its
    //     if-nez. The toggle itself is not overridden, so the Favourites UI is unchanged. The
    //     redesigned (Compose) call log has no row swipe in stock 26.40.5 (its swipe-to-delete is
    //     coded but switched off), which explains the Reddit report; not runtime-tested.
    //   - Rule 12 (GmsCore support, default on): 5 strings lose their surrounding quotes and
    //     string/Dismiss + string/dismiss come back as string_0x7f14030a / string_0x7f140dc9 (same
    //     IDs, no by-name lookup found); no control characters lost.
    // 2026-10-19 (issue list; smoke test, not runtime-tested): Enable Premium step 4 - the
    // (PremiumFeature, Z)Z availability check now returns false at once for CALL_ASSISTANT and
    // FAMILY_SHARING instead of falling through to the stock check: with the premium state
    // forced, the stock check offered both as unlocked even though Truecaller's servers do not
    // back them (and a forced Call Assistant would let "Assistant"-handled spam calls ring
    // through). The stock check (with the server's kill-switch list) stays below the early
    // returns, unreached.
    // 2026-10-14 (#53, 26.40.5, smoke test only, not runtime-tested):
    //   - Disable ads step 4: the call log's "Truecaller Premium / Upgrade for an ad-free
    //     experience" row is the Ads V2 call log list slot (AdPlacement CallLogScreen.ClList) drawing
    //     its AdPlaceholderType.Premium backfill when no ad fills it; the ads module ignores Premium.
    //     The Ads V2 placement check (Object return, (AdPlacement, continuation), exact string
    //     "featureAdsV2OnClList", ar0.a here) returns Boolean.FALSE at once. All its callers (call log
    //     list slot and ad positions, call log promo, message list, details view, caller ID, in-call,
    //     PACS) then lay out and load nothing. The global Ads V2 switch (ar0.c) is left alone.
    //   - Hide Messages tab (opt-in): hideBottomBarTabs now refuses only CALLS. The builder class's
    //     "default_tab_on_launch" getter (()BottomBarButtonType) returns CALLS; its selectTab
    //     ((BottomBarButtonType, Z)V calling setSelectedItemId) swaps MESSAGES for CALLS, so the
    //     launch tab, SMS notification / deep-link intents (ARG_FRAGMENT_ORDINAL) and the back
    //     button land on Calls (selecting a missing tab on a fresh start left the screen empty, and
    //     back kept "returning" to the old default). A new helper after the builder's
    //     check-cast to BottomBarView (kept) collapses the bar with fewer than two tabs (see below).
    // 2026-10-16 (#61, 26.40.5; smoke test + CLI decompile check with the reporter's 14 patches, all
    //   Applied; not runtime-tested, because the Calls screen needs SMS registration): Hide Messages tab
    //   no longer sets the bar GONE. TruecallerInit is edge to edge and only the bar (Material
    //   BottomNavigationView inset listener, bottom padding += nav bar inset) pads for the navigation
    //   bar; the coordinator with the Calls pill and FAB ends at the bar's top (barrier), so a GONE
    //   bar put them behind 3-button navigation. The helper keeps the bar VISIBLE, sets its children
    //   (the tab menu) GONE and its minimum height to 0, saved in a new public Integer field on
    //   BottomBarView (morpheSavedMinHeight) and restored when two or more tabs come back.
    // 2026-10-14 (#52, 26.40.5, smoke test + CLI disassembly, not runtime-tested): Fix T9 contact search
    //   (opt-in) clones the static RefreshT9MappingWorker helper ((Context)V with "RefreshT9MappingWorker.RebuildAll",
    //   w6j.f here) as public morpheRefreshT9Incremental with Boolean.FALSE, called right after super.onCreate in
    //   TruecallerInit; the unique job uses ExistingWorkPolicy.REPLACE, so launches do not stack.
    // 2026-10-14 (#53, 26.40.5, smoke test + CLI disassembly, not runtime-tested): Hide Premium tab also hides the
    //   Settings "Premium" row, and Hide Wear OS settings hides "Truecaller for Wear OS": every
    //   CategoriesSettingsState constructor (a7a here, found by its toString prefix) stores false for
    //   isPremiumItemVisible / isWatchItemVisible (fields mapped through toString's outlined append order).
    // 2026-10-15 (#53, 26.40.5; smoke test + CLI decompile check; emulator: 2 logged-out cold starts,
    //   no crash, no GMA init error; the Contacts-tab row and logged-in ad traffic were NOT checked at
    //   runtime because Truecaller needs SMS registration): Disable ads step 5 forces the
    //   master "ads allowed" check ()Z (strings "qaForceAds" + "adsDisabledUntil", static kt50.Y here,
    //   inlined AdsAvailability.shouldShowAds) to false; step 6 overrides four toggles in the resolver
    //   (fho.a): "featureAdsOptimisationOnListView" on (contacts yoc.<init> and classic call log g68.F
    //   then ask kt50.Y instead of always adding the "Explore Truecaller Premium" slot),
    //   "featureAdsRestrictCampaignProcessing" on (a30.a/b return null: no ads-segment-profile keywords
    //   or launch prefetch), "featureConfigManagementSystem" off (no ads-config-engine sync) and
    //   "featureEnableOfflineAds" off (no ads-router offline ads sync). All four keys are exact
    //   const-strings read through fho.a. tagging5 (caller ID tags) is left alone. With kt50.Y false,
    //   rewarded ads are off too (owner decision) and p10 skips GAM init when
    //   featureDisableGamInitForPremium is on; the ad load paths still start GAM themselves.
    // 2026-10-19 (26.40.5; smoke test + CLI disassembly with the default set, no -f, all Applied;
    //   not runtime-tested): Disable contact upload (default on).
    //   - The two methods that hold the selection "data_type = ? AND data_phonebook_id NOT NULL AND
    //     data8 = ?" and pass it to ContentResolver.query (the FetchImContactsWorkAction branch of
    //     jc.a, messenger GetUsers lookup; ContactsPremiumStatusFetchWorkAction z5s.p, Premium
    //     presence lookup) now query with " AND 0" appended, so they read no numbers. The patch
    //     requires exactly 2. With no numbers, jc returns Success (o9q) and z5s.p returns Unit,
    //     which its work action (x6c) turns into Success, so WorkManager does not retry.
    //   - "featureCallAssistantNumberSync" off in the resolver (fho.a): the should-sync check
    //     (wv7.d) is false and the work action returns Success before wv7.c builds the
    //     SetWhitelistNumbersRequestDto (api/v1/users/setWhitelistNumbers). The patch fails if the
    //     DTO class or a resolver read of the key is gone.
    //   - "featureContactEditorNameSuggestion" off: NameSuggestion.isVisible is false, the editor
    //     hides the checkbox, and both save paths (lec, z20) enqueue the upload only when it is
    //     visible and checked. MOBILE_CLIENT and SURVEY suggestions, local contacts, T9, caller ID
    //     (/v2/search, /v2/bulk), backup and PhonebookSyncWorker are untouched.
    // 2026-10-22: updated to 26.41.5 (versionCode 2641005, signer CN=truecaller SHA-1
    // 0ac1169a...1f25e31 as above; replaces 26.40.5). All 36 existing fingerprints resolve with the
    // real matcher (33 unique, 3 multi-match by design); the toggle resolver is lmo.a now. Four new
    // patches, all toggle overrides at the start of a resolver, each key first required to be read
    // there (the patch fails otherwise). Verified by TruecallerSmokeTest, FingerprintProbe (all
    // 37 fingerprints resolve) and a CLI decompile check (all 22 patches Applied without -f; the
    // Internal resolver starts with 32 key blocks, the Firebase one with 1; 378 changed methods,
    // all explained). Emulator: cold start of stock and patched to the registration screen, no
    // crash; the new patches' effects were not observed, because the Calls, after-call and home UI
    // need SMS registration, which the emulator cannot do. Without MicroG RE, GmsCore support makes
    // "Get started" fail with "Age verification failed" (stock reaches the dialer-role prompt).
    //   - Disable auto-launch (default on): "featureAutoAppLaunchPassive" off. That server
    //     experiment opens the app (VIEW deep link, FLAG_ACTIVITY_NEW_TASK) while the screen is off
    //     for passive users after N inactive days; off keeps everyone in the control group.
    //   - Disable nags (default on), off: featureDefaultDialerInterstitial,
    //     featureDefaultDialerPermanentSpace, featureNotificationsPermissionBanner (3 reads),
    //     featureDOOABanner, featureDisableBatteryOptimizationBanner,
    //     featurePeriodicallyCheckPermissions, featureRatingsAndReviewsSurveys,
    //     featureBlockSurveyFlow, featureFeedbackSurvey (Family Protection). featureReduceValueForNonDd
    //     is deliberately left out.
    //   - Hide promotions (default on), off: featurePersonalSafetyPromo (Guardians home promo),
    //     featureAcsWhoViewedMeBanner (after-call upsell banner), featureReferralNavDrawer,
    //     featureRedeemPromo (1 read with the key right before the call, 2 with the const-string
    //     hoisted; the read check needs one). Left out: featurePersonalSafetyMenuItem and
    //     featureTruecallerNewsMenuItem (catalogue only, 0 reads) and featureChatWithZipZipMenuItem
    //     (the Help "Chat with us" support row, not a promotion). The Firebase experiment toggle
    //     "DisableWVMNotifications_65487" reads TRUE in the Firebase resolver ((String,
    //     FeatureState)Z with an invoke-interface (String, Z)Z and no SharedPreferences reference;
    //     h4k.a here), so the Who-viewed-me notification check (ux90.k) bails out. A new experiment
    //     suffix fails the patch.
    //   - Hide after-call screen for contacts (opt-in, owner decision: the after-call screen never
    //     shows for phonebook contacts on incoming or outgoing calls): featureShowACSAllIncoming and
    //     featureShowACSAllOutgoing off (4 reads each). The ACS rules (gl.b here) show it for a
    //     phonebook contact only when the user's afterCallForPbContacts AND the matching toggle are
    //     on, so contacts lose it even with that setting on. Missed calls, unknown numbers and the
    //     user's prefs (afterCall, afterCallForPbContacts, afterCallForNonPbContacts) are untouched;
    //     no pref is written.
    // 2026-10-23 (#71, 26.41.5; TruecallerSmokeTest + FingerprintProbe, the 3 new fingerprints
    //   OK-unique; NOT runtime-tested, the call log needs SMS registration): Show caller number in
    //   call log (opt-in, owner-approved). The revamped call log's row mapper ((List) public, kept
    //   CallLogHistoryItem.HistoryEntry enum reads ContextAction SAVE_CONTACT -> Name UNKNOWN ->
    //   SubtitleLabel RECORDING -> WHATSAPP_VIDEO in that order; b98.G here) builds each row with one
    //   invoke-direct/range HistoryEntry.<init>. Fields come from the toString labels
    //   ("CallLogHistoryEntryData(primaryHistoryEventId=" / "HistoryEntry(id=" prefixes, replayed
    //   append order through the outlined helpers; phonebookId J, normalisedNumber, countryCode,
    //   name, spamScoreLabel, blockReasonLabel String, isSpam, isBlocked Z) and the row constructor's
    //   stores; the mapper must pass the model's normalisedNumber as the row's. At the join of the
    //   subtitle label branches (first two instructions write two free registers, checked) a new
    //   static morpheCallLogSubtitle(entry, label) on the mapper's class replaces the label: for
    //   phonebookId 0, not blocked, non-blank name and number, the number (PhoneNumberUtils
    //   formatNumber with the upper-cased countryCode when it is two letters, else E.164), after
    //   " · " when there is a text label (the (String) label class whose superclass is the
    //   subtitle type and whose toString prints "Text(text="). Owner decision: resource labels
    //   (recording, video, WhatsApp, screening, voicemail) stay as they are, without the number.
    //   An Exception in the helper keeps the stock label. Only the revamped call log uses this
    //   mapper; "Restore classic call log" shows the classic list instead.
    // 2026-10-23 (#77, 26.41.5; TruecallerSmokeTest + FingerprintProbe, the 3 new fingerprints
    //   OK-unique; NOT runtime-tested, the Premium tab needs SMS registration): Enable Premium crashed
    //   the app on opening the Premium tab. Cause: the tab's view model (PremiumUserTabPaywallViewModel,
    //   amx here) picks its screen in a suspend state chooser (amx.L) that reads isPremium (forced true
    //   by step 2), then the "isSubscriptionOnHoldOrPaused" pref and a PremiumLaunchContext.Static
    //   constant; premium and not paused built the Entitled state (toString "Entitled(subscriptionFetchResult="),
    //   whose subscription management view model expects a real purchase and threw in an unhandled
    //   viewModelScope launch on the server's FREE data. Fix (owner's choice), Enable Premium step 8:
    //   only in that chooser (strings "isSubscriptionOnHoldOrPaused" + an sget of the kept
    //   PremiumLaunchContext$Static; the patch also requires it to build the Entitled and the Paywall
    //   ("Paywall(subscriptionFetchResult=") states and to call the step 2 getter exactly once) the
    //   isPremium result is overwritten with false right after its move-result, so the tab builds the
    //   Paywall state (the plans) as on a stock free account. No other premium input decides the
    //   screen. All other isPremium readers keep the forced true. Side effect: a real subscriber who
    //   also enables Enable Premium sees the plans screen in the Premium tab instead of their
    //   subscription screen; managing the subscription in the Play Store still works.
    // 2026-10-24 (#76, 26.41.5; TruecallerSmokeTest + FingerprintProbe, the 2 new fingerprints
    //   OK-unique; NOT runtime-tested, the call log needs SMS registration): Hide call log filters
    //   (opt-in, owner-approved). The revamped call log's filter row (chips plus the SIM selector) is
    //   one static Compose function (a050.e here; matched by the exact string "filtersStartPadding",
    //   static, void and its 11 parameter types); it returns at once, before its restart group, so it
    //   emits nothing in either mode (pinned, or the LazyColumn item "call_log_filters"). The selected
    //   filter is an in-memory StateFlow (initial NONE, reset to NONE by TruecallerInit.onCreate, never
    //   persisted; the SIM choice likewise), but the missed call / voicemail / assistant intent extras
    //   select a filter through one setter, which would leave the list filtered with no chips to undo
    //   it. That setter (ud8.f(FilterType) here, the (kept com.truecaller.calllog.api.FilterType)V
    //   call after "set_missed_filter" and FilterType.MISSED in TruecallerInit.onNewIntent; onCreate
    //   calls the same one) now always selects NONE, the value behind the All chip.
    // 2026-10-26 (#90, 26.41.5; TruecallerSmokeTest + CLI decompile check, exactly these 2 methods
    //   change; emulator: 2 cold starts with both + Disable ads/telemetry/Enable Premium, no crash or
    //   linkage error; the rows themselves NOT runtime-tested, the call log and inbox need SMS
    //   registration; with Restore classic call log the revamped builder is not used): Hide
    //   frequently called contacts and Hide important senders (both opt-in). Both screens are Compose LazyColumns built in R8-merged Function1
    //   lambdas (invoke(Object)Object), which add each optional item as a const-string key passed to
    //   a static void item helper behind a branch that jumps past it. Anchors are the exact item keys:
    //   "frequent_contacts_id" (qh8 here; if-eqz on the row's show flag) and
    //   "important-senders-header" (c67 here; if-lt on importantSenders.size() against 6, the list
    //   read from the BusinessHomeScreenState field that its toString prints after
    //   ", importantSenders="). The shared skipLazyListItem inserts "goto <guard target>" right
    //   before the guard; it checks the key is loaded once, the guard is the nearest branch after
    //   the previous item that jumps past the item helper call without skipping the next item, and
    //   nothing else jumps into the item. The Categories row, the section titles (kc4.A here) and
    //   Recents are untouched.
    // 2026-11-02 (#98): updated to 26.42.5 (versionCode 2642005, owner-supplied APKCube .apks merged
    //   with APKEditor, arm64; signer CN=truecaller, cert SHA-256 7712b5f2...4913ae as pinned). 26.42.5
    //   added a local override read (a SharedPreferences contains(key) + getBoolean(key) behind a
    //   flag check) to all three (String, FeatureState)Z resolvers (doo.a SharedPreferences store,
    //   f5k.a Firebase experiments, rpq.a default only), so the old "reads SharedPreferences" /
    //   "never touches SharedPreferences" split matched three and zero methods and Hide promotions
    //   failed on FirebaseFeatureToggleResolverFingerprint. The keys did not move (every overridden
    //   key is read through the same store as in 26.41.5). FeatureToggleResolverFingerprint now
    //   matches every concrete (String, FeatureState)Z method and every override goes into each
    //   resolver; requireFeatureToggleRead accepts a read through any of them.
    // 2026-11-02 (#114, 26.42.5; TruecallerSmokeTest + CLI disassembly, NOT runtime-tested: the
    //   incoming call screen needs a real call): Swap call answer and decline buttons (opt-in). The
    //   incoming call buttons composable (iis.d here; the only static void method loading both test
    //   tags "rejectCallButton" and "answerCallButton") places both swipe buttons in one Box with
    //   the same alignment and moves them sideways with offset(x = -/+ width / 3.5). The x of the
    //   (Float, Float, Int, Modifier)Modifier offset call right before each tag is negated, so answer
    //   sits left and decline right. Each button is dragged in any direction (progress is the drag
    //   distance), so the gesture does not depend on the side. The PiP actions are not changed.
    // 2026-11-02 (#113, 26.42.5; TruecallerSmokeTest + CLI without -f with all 28 patches + apkanalyzer
    //   disassembly of hk8/h09/tb6 invoke; patched cold start reached WizardActivity with no
    //   VerifyError and `cmd package compile -m verify` passed; the haptics themselves NOT
    //   runtime-tested, they need a real incoming call): Disable call button haptics (opt-in), three
    //   sources. 1) Completion: each call UI action handler dispatches new p89(CallUIHaptic.X) to
    //   m89.b and then reports an analytics enum; the dispatch is removed in the handlers that report
    //   ACCEPT or REJECT of CallUIActions, CallUIDetailsViewAction or CallUIPipActions (6 sites in
    //   hk8/h09, found by walking back from the enum read to the CallUIHaptic read on the same
    //   straight-line path; CONFIRM/REJECT must match). HANGUP and KEYPAD_END_CALL keep the same REJECT
    //   haptic. 2) Drag start and 3) drag vibration live in the R8-merged Function1 lambda (tb6 here)
    //   that the incoming call composable passes as the function references
    //   "onCallUiSwipeButtonDraggingStateChanged" / "onDraggingProgressChanged" (the last constructor
    //   argument is the switch case): the CallUIHaptic.CLICK dispatch behind "state != IDLE" is
    //   removed, and the progress is set to 0 right before its cmpg-float against 0.1f, so the
    //   handler always takes the stop path (j99.a, Vibrator.cancel) and never starts the looping
    //   one-shot.
    // 2026-11-02 (#116, 26.42.5; TruecallerSmokeTest + CLI without -f + emulator with Truecaller
    //   holding the dialer role: the patched heads-up shows Answer left / Decline right and the left
    //   button answers; stock shows Decline left): Swap call answer and decline buttons now
    //   also swaps them in the incoming call notification. The builder (m5m.x here; the only static
    //   void method with "incoming_calls", "Answer" and "Decline") asks a ()Z check (sy8.a: SDK 31+,
    //   Firebase experiment "featureCallStyleNotifications_44143", maker/device not excluded) whether
    //   to build Notification.CallStyle.forIncomingCall (ry8) or its own RemoteViews class (itd).
    //   CallStyle fixes decline first with red/green styling, so it cannot be swapped; the reporter's
    //   screenshot shows that style. The check's result is forced false right after its move-result
    //   (the patch requires the false path to build a class whose constructor inflates RemoteViews),
    //   and a resource part moves @id/button_answer in front of @id/button_decline in
    //   res/layout/notification_call_incoming.xml (icon row, also inside the Android 12 big layout)
    //   and notification_call_incoming_big.xml (older text-button layout), swapping their
    //   layout_margin* attributes so the spacing stays. Intents are bound by id, so label, colour and
    //   action move together. Side effect: users who had the system call style get Truecaller's own
    //   notification design; the ongoing call notification is unchanged.
    //   #115 (Disable splash screen): not implemented. TruecallerInit's theme
    //   (Theme.Truecaller.Splash: windowSplashScreenBackground + BrandingImage on v31, a windowBackground
    //   drawable before) only styles the system starting window; tje.U setTheme()s the real theme
    //   before super.onCreate, and there is no SplashScreen API, keep-on-screen condition, pre-draw hold
    //   or timed splash activity. The Lottie "Page_SplashScreen" is a one-time onboarding wizard page.
    // - 2026-11-02 (26.42.5): "Patch settings" (default on; named "Heval Controls" until the
    //   2026-11-03 UI rename) with 12 runtime switches. Entry: a "Patch settings" row after Help on
    //   the main Settings screen, added by
    //   extensions/truecaller HevalControlsEntry.addRow(root) right after super.onViewCreated in
    //   CategoriesFragment.onViewCreated (kept class name + "Missing required view with ID: "; the
    //   row finds Help/About by the resource entry names item_help/item_about and copies Help's
    //   style). Converted (Manager name, description and default unchanged; each switch defaults
    //   on): Hide promotions, Disable nags, Disable auto-launch, Hide after-call screen for
    //   contacts and Hide family button (each toggle override gets the feature gate between the key
    //   match and the forced value, in all three resolvers); Hide business media (the toggles, a
    //   gate at the screen's entry, and morpheBrandMedia(list) on the model class because its
    //   constructor has no local register); Disable update prompts, Hide Assistant tab and Hide
    //   Scam feed (gate at index 0); Hide Blocking tab, Show caller number in call log and Fix T9
    //   contact search (stock path at index 0 of their own generated helper). Off = stock code
    //   path. Verified: smoke test (gate shapes, registry, manifest, entry call), CLI without -f
    //   (all 20 patches applied), apkanalyzer smali of onViewCreated, doo.a, the tabs helper and
    //   morpheBrandMedia, aapt2 manifest (provider exported=false initOrder=1000, activity
    //   exported=false) and string values (identical to a GmsCore-only build). Emulator (7756584):
    //   2 clean cold starts, InitProvider ran, the settings screen (opened directly) lists the 12
    //   switches with 6 Restart badges, a toggle persists, Pause all and Reset work. The Settings
    //   row itself needs a phone-verified account, so it is checked in bytecode only.
    //   The host is a hard dependency of the 12 converted patches (featurePatch dependsOn it): if
    //   the Settings entry anchor (CategoriesFragmentViewCreatedFingerprint) drifts, all 12 fail
    //   loudly, not only "Patch settings" - accepted, the target is pinned. Root Mount: the host is
    //   available there too (it was UNAVAILABLE, which would have taken the 12 patches away); mount
    //   keeps the stock manifest, so InitProvider/HevalControlsActivity are not registered, the
    //   engine starts lazily on the first hook, the crash guard stays off, and HevalControlsEntry
    //   skips its row when getActivityInfo finds no activity (features stay at their defaults).
    //   Rule 12 (2026-11-02): the string baseline above was GmsCore-only, so a build with ONLY
    //   "Patch settings" + "Disable nags" (CLI without -f, both applied) was diffed against stock:
    //   the aapt2 string pool is byte-identical; the only table change is 36 entry names of
    //   case-colliding pairs renamed to <type>_0x<id> (17 id pairs such as toolbar/toolBar,
    //   standard/STANDARD, plus string/dismiss + string/Dismiss), values unchanged. A GmsCore-only
    //   build renames exactly the same 36 entries, so it is the shared re-encode, not this patch;
    //   item_help/item_about keep their names.
    // - 2026-11-03 (26.42.5): Heval Controls phase 2, 8 more runtime switches (20 in total; Manager
    //   name, description and default unchanged, each switch defaults on, off = stock code path):
    //   Hide Messages tab (its tabs helper, the default tab getter and selectTab gated at index 0,
    //   and morpheShowBottomBarWithTwoTabs returns at once while off unless this process collapsed
    //   the bar, which it then restores) and Hide Premium tab (its tabs helper, and the Settings
    //   state stores isPremiumItemVisible through a (Z)Z helper r8a.morpheHide_isPremiumItemVisible)
    //   - both restart; Restore classic call log (gated toggle override, swipe guard through
    //   z78.morpheClassicCallLogSwipe(Z)Z; restart); Hide call log filters (gate at index 0 of the
    //   row composable g660.c and of the filter setter td8.f; restart, so an open call log screen is
    //   not flipped mid-composition); Hide frequently called contacts and Hide important senders
    //   (skipLazyListItem now emits "if-nez isEnabled, :skip_item" before the stock guard, scratch
    //   register from findFreeRegister: v3 in ph8.invoke, v15 in b67.invoke); Disable call button
    //   haptics (each answer/decline and drag-start dispatch is kept and jumped over while on, the
    //   drag progress goes through tb6.morpheCallButtonDragProgress(F)F); Swap call answer and
    //   decline buttons (offset x through iis.morpheSwapCallButtonOffset(F)F, the call style check
    //   through m5m.morpheSwapCallButtonsCallStyle(Z)Z). The notification layouts are no longer
    //   edited in place (supersedes the 2026-11-02 #116 resource note): the resource part adds
    //   <name>_heval_swapped copies of the 9 notification_call_incoming* layouts (the 2 button
    //   layouts swapped, the 7 including layouts include the swapped copies) and leaves the stock
    //   files untouched; the patcher assigns the new ids at encode time (0x7f0d0ae6..0aee here), so
    //   itd.<init> passes each of its 6 RemoteViews layout constants (checked against
    //   resourceId(LAYOUT, name)) through extensions/truecaller SwapCallButtons.layout(I)I, which
    //   answers getIdentifier(<entry name>_heval_swapped) while on and the stock id while off.
    //   Verified: TruecallerSmokeTest (registry of 20, every gate/skip/helper shape, stock and copy
    //   layouts), HevalControlsTest (skip gate, value helper), CLI without -f (defaults + all 20
    //   features applied), apkanalyzer smali of every site above, aapt2 resource table (9 new
    //   layouts, stock ids unchanged) and xmltree (stock layouts decline-first, copies answer-first,
    //   copy includes point at the copies). 2026-11-03 emulator (patched build of the release batch, stock control): the Patch settings screen lists all 20 switches and a toggle is stored.
    // 2026-11-03 (#116 follow-up, 26.42.5; TruecallerSmokeTest + CLI without -f + aapt2 xmltree,
    //   emulator 2026-11-03: Answer left and Decline right fully inside the card at font scale 1.0 and 1.3, stock order with the switch off): with Swap call answer and decline buttons on, the Android 12+ heads-up
    //   clipped the bottom of Truecaller's text buttons (the system caps a decorated custom view at
    //   136dp, 96dp of content; notification_call_incoming_big needs ~95dp). In the
    //   notification_call_incoming_big_heval_swapped copy only, the button row's marginTop is 8dp
    //   (stock 16dp), it gets marginBottom 8dp (stock none) and its three buttons are 40dp high
    //   (stock @dimen/notification_call_button_big_height, 44dp, a dimen left untouched): ~91dp.
    //   The stock layouts and the collapsed copy (44dp icon buttons, within its 48dp) are unchanged.
    // 2026-11-03 (#120, 26.42.5; TruecallerSmokeTest + CLI without -f + apkanalyzer smali, NOT run
    //   on a device: the profile menu needs a registered account): "Hide profile menu items"
    //   (opt-in) registers five Patch settings switches, all off by default, in "Profile menu". The
    //   menu (UsersHomeActivity) keeps only MenuItemUiState rows with isVisible; each of its
    //   constructors (toString "MenuItemUiState(item=", zrr) passes (item, isVisible) through
    //   zrr.morpheProfileRowVisible, which answers false for the kept MenuItem constants
    //   ANDROID_WATCH / INVITE_FRIENDS / CONNECT_WITH_US / HELP while their switch is on.
    //   MenuItemsViewState ("MenuItemsViewState(groups=", esr) drops empty groups through
    //   esr.morpheDropEmptyProfileGroups while any row switch is on, so no section divider is left.
    //   The Premium banner is the "Enabled(iconRes=" row state (fmj) titled
    //   usershome_premium_section_premium_member / _upgrade_to_premium (ids via resourceId; a
    //   builder of fmj with each id must exist): every static renderer whose first parameter is the
    //   row state interface (gmj) and that tests for fmj (svy.f) starts with
    //   fmj.morpheHidePremiumBanner, which returns the "Disabled" object (emj) instead. The Settings
    //   Wear OS row stays with "Hide Wear OS settings"; the featurePromptWearApp toggle is untouched.
    // 2026-11-04: updated to version 26.43.5 (versionCode 2643005; APKMirror arm64-v8a +
    //   armeabi-v7a bundle merged with APKEditor, same CN=truecaller cert 7712b5f2...13ae). Two
    //   patches needed a fix, the rest apply unchanged:
    //   - Disable call button haptics: R8 outlined the onDraggingProgressChanged case of the merged
    //     function reference lambda (pc6) into a private b(Object)Object, so the case is now only
    //     invoke-direct {this, arg}, b; move-result-object; return-object. The case lookup follows
    //     such a delegate to a method of the lambda itself and searches its body for the 0.1f
    //     compare (anchors unchanged: the kept handler name, the function reference constructor
    //     shape and the 0.1f float compare).
    //   - Hide business media: BusinessDetailsModel (a57) gained a trailing contactId (Long), so the
    //     constructor is matched by its six leading parameters (exactly one must match); brandMedia
    //     is still p6.
    //   Verified: TruecallerSmokeTest and HevalControlsTest (18) pass; the CLI without -f applies
    //   all 30 Truecaller patches; apkanalyzer shows pc6.b's progress going through
    //   morpheCallButtonDragProgress(F)F before cmpg-float, a57.<init> starting with
    //   morpheBrandMedia(p6), the same overrides (26 gated) in all three resolvers (nso.a, s8k.a,
    //   zuq.a), CategoriesFragment.onViewCreated calling HevalControlsEntry, 6 SwapCallButtons.layout
    //   calls in bwd.<init>, and the profile menu helpers on jxr / oxr / opj (called from o6z.f).
    //   Rule 12: all 307,364 string values are identical to stock; the only table changes are the
    //   same 36 case-collision renames as before and the 9 _heval_swapped layouts. Not run on a
    //   device (owner tests on the phone after the pre-release).
    val COMPATIBILITY_TRUECALLER = Compatibility(
        name = "Truecaller",
        packageName = "com.truecaller",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0087FF,
        signatures = setOf("7712b5f255f2c85b8b164519116ac4381bb9a3582dcdd2b73ac06ee7464913ae"), // CN=truecaller
        targets = listOf(AppTarget(version = "26.43.5", versionCode = 2643005))
    )

    // Verified 2026-10-13 against com.hevy 3.1.16 (versionCode 3325935, XAPK base + arm64 + en +
    // mdpi splits merged with APKEditor). Hevy is React Native on Hermes: the Pro logic is Hermes
    // bytecode (HBC v96) in assets/index.android.bundle, which ships in the base split, so patch a
    // merged APK. No expo-updates or CodePush, so no OTA bundle replaces the patched one.
    //   - Unlock Pro (rawResourcePatch): hevy/pro/HermesBytecode parses the HBC header, function
    //     headers and string table; the locator resolves the string ids of
    //     "isProStatusOverrideEnabled", "is_pro" and "isWithinProOfflineGracePeriod" and requires
    //     exactly one function whose bytecode holds all three as operands: HevyProStore's isPro
    //     getter (#32111 at 0x11b9d9c in this build, cross-checked with hermes-dec 0.1.7). Its first
    //     4 bytes become LoadConstTrue r0; Ret r0 (length-preserving; the footer SHA-1 is not checked
    //     at runtime). arandomhooman's fixed byte signature (isWithinProOfflineGracePeriod prologue, 3.1.0)
    //     no longer matches. Server-side limits (cloud-backed Pro features, Hevy Coach) stay locked.
    //   - Block telemetry & trackers (ported from kveld9): RNSentryModuleImpl.initNativeSdk
    //     resolves true without SentryAndroid.init; Adjust PackageHandler addPackage/
    //     sendFirstPackage, Facebook AppEventQueue.flush and Amplitude AndroidContextProvider.prefetch
    //     return at once; isLimitAdTrackingEnabled and Branch.isTrackingDisabled -> true; Amplitude
    //     getLegacyEvents resolves an empty array; SentryInitProvider/SentryPerformanceProvider are
    //     disabled in the manifest. Firebase Messaging, push and RevenueCat are untouched.
    // The bundle's trailing 20-byte SHA-1 is recomputed after the edit. HevySmokeTest asserts the
    // rewritten getter, the footer and every telemetry hook; a CLI decompile (no -f) shows only the
    // getter's first bytes and the 6 telemetry classes changed. On the emulator the patched bundle
    // loads through Hermes and the app reaches its welcome screen like stock (no crash or JS
    // error); Pro screens need an account and were not reached.
    // Verified 2026-10-14 against 3.2.0 (versionCode 3364731, XAPK merged, arm64; the owner keeps
    // only the latest verified version). The bundle is still HBC v96; the three strings still
    // pick exactly one function, the isPro getter (#33380 at 0x122b846, same 99-byte body as
    // 3.1.16), and no new function reads is_pro or bypasses it. The bigger RevenueCat SDK is
    // only reached from JS (no app-side native entitlement check). All telemetry hooks and both
    // Sentry providers are unchanged; HevySmokeTest passes.
    // Emulator 2026-10-14 (3.2.0): not runtime-tested; the merged APK fails to load libreactnative.so on the
    // x86_64 emulator for stock and patched alike. Smoke test and CLI (bundle bytes + SHA-1 footer) pass.
    // 2026-10-25: updated to version 3.2.2 (versionCode 3398745; APKPure XAPK merged, same signer).
    // Unlock Pro is unchanged (the three strings still pick one getter). 3.2.2 R8-renames the
    // Sentry, Facebook, Amplitude and Branch SDK classes, so Block telemetry & trackers is
    // re-anchored: Sentry on the RNSentryModule.initNativeSdk bridge method (the renamed Impl's
    // only caller); Facebook on AppEventQueue.flushAndWait (V6.n.n) by the APP_EVENTS_FLUSHED /
    // _NUM_EVENTS_FLUSHED intent strings, which every flush path reaches; Branch.isTrackingDisabled
    // (Mg.e.r0) as the ()Z the RNBranchModule.isTrackingDisabled bridge method calls. Amplitude's
    // isLimitAdTrackingEnabled and prefetch are gone (unused, removed by R8), so the two ad-ID
    // readers (a$a.t by the getAdvertisingIdInfo/isLimitAdTrackingEnabled reflection strings,
    // a$a.s by limit_ad_tracking/advertising_id) return null instead. Adjust PackageHandler and
    // Amplitude getLegacyEvents are unchanged by name. FingerprintProbe: all three new fingerprints
    // OK-unique; HevySmokeTest passes. CLI (no -f) applies both patches: exactly 8 methods change
    // (the hooks above), the Hermes bundle Pro bytes + SHA-1 footer, and the two Sentry providers
    // are disabled; no string value changed (rule 12). flushAndWait is broader than the old flush
    // hook (the timer and event-count flushes reach it too). Not runtime-tested: libreactnative.so
    // still doesn't load on the x86_64 emulator.
    val COMPATIBILITY_HEVY = Compatibility(
        name = "Hevy",
        packageName = "com.hevy",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x101012,
        signatures = setOf("add9aa0d804a1a14a04119d44fa7cb4cc229c86322991eda526f5455d11580ef"), // Google Play app signing key
        targets = listOf(AppTarget(version = "3.2.4", versionCode = 3403347))
    )

    // Verified 2026-10-13 against easy.launcher 1.10.28 (versionCode 11028, the owner's APKMirror
    // bundle merged, 4 ABIs, minSdk 32). Play title "Easy Launcher"; the launcher label
    // (string/app_name) is "Easy Homescreen". App code is R8-renamed, but the com.eet.* packages,
    // kept model/worker/service classes, log lines and preference keys anchor every patch:
    //   - Disable ads: the static (Context)Z gate reading "ads.enabled" + "INSIDE_WALDO" -> false;
    //     in com.eet.core.ads.consent the "initializeMobileAdsSdk: " (GMA next-gen + CloudX start)
    //     and "requestConsentInfoUpdate: activity=" (UMP form) methods return at once; in
    //     com.eet.core.ads.activity the app-open loadAd ("loadAd: new ad wrapper created for key, ")
    //     returns and showAd ("showAd: failed to show ad, ") only runs its Function0 callback; the
    //     native cache's "replenishAds: size=" step returns; AdFreeViewModel.isAdsEnabled -> false.
    //   - Disable telemetry: every concrete logEvent/logException/setUserId/setUserProperties/
    //     setUserProperty/setCustomKey/dropBreadcrumb/sendScreenshot on all 8 AnalyticsService
    //     subclasses; AmplitudeAnalyticsService.initializeAmplitude; the Rudderstack constructor's
    //     write-key length reads 0 (its own "key empty" guard skips init); Singular.init (both
    //     overloads) -> false; BrazePushService.initialize returns Unit; Firebase
    //     setCrashCollectionEnabled always passes false; manifest switches for Crashlytics,
    //     Analytics, ad ID, deferred deep links and Facebook auto-init / advertiser ID. Remote
    //     Config, FCM, Firebase Installations and com.eet.core.push are untouched.
    //   - Disable rating prompts: the review observer's onResume ("app_launch_count_for_review" +
    //     "getDaysSinceInstall: error") returns; the "isUserPrimedForReview -> true" and
    //     "shouldRequestAppReview -> true" checks -> false.
    //   - Disable promotions: getEnabled/getActionCardEnabled/getSuggestEnabled of the GetJar and
    //     SportsPass Banner/Icon/Tile/Search remote configs -> false; CpaOffersActionCardProvider
    //     .isEnabled -> false; ImePromoHandler.pitchIme returns.
    //   - Disable default launcher reminder (off by default): in HomeRoleReminderWorker's work
    //     method the role-held check (the helper method that calls RoleManager.isRoleHeld) reads
    //     true, so the worker takes its "already held" path.
    //   - Hide sponsored content (off by default): SponsoredLinksResponse.getData,
    //     SponsoredSites.getSponsoredSites, SponsoredPostsResponse.getArticles and
    //     SponsoredLinkSuggestionProvider.getSuggestions return emptyList().
    // No premium patch: the paywall is dead code in this build. PremiumActivity is abstract with
    // no subclass and is not in the manifest; the declared PremiumBottomSheetDialog is never
    // started; BillingViewModel is only registered with Koin and never injected, and
    // BillingWorker / PurchasesBillingWorker are never enqueued. App Check / Play Integrity and
    // RootBeer are deliberately not touched. EasyLauncherSmokeTest asserts every hook, and a CLI
    // decompile (no -f) shows exactly 30 changed classes, none in the push stack. On the emulator
    // the patched launcher starts with no crash, the ad consent form and the news-feed native ad
    // are gone, the feed still shows articles with "Hide sponsored content" on, and the app-open
    // path still opens its destination. Known limit: the Braze SDK still initialises and registers
    // for push through another path; its event logging is blocked by the AnalyticsService no-ops.
    val COMPATIBILITY_EASYLAUNCHER = Compatibility(
        name = "Easy Homescreen",
        packageName = "easy.launcher",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x212121,
        signatures = setOf("b85f085f998a77c5feedc1ddc5c75c51b68bb1a0e0c7881cd924130c9f7bb45a"), // Google Play app signing key
        // 2026-10-29: updated to 1.10.29 (versionCode 11029, arm64-v8a, same Play signer). Amplitude
        // was removed from the app (no com.amplitude classes, no AmplitudeAnalyticsService), so the
        // telemetry patch no longer hooks it; the other five patches apply unchanged. Smoke test
        // green and CLI without -f applied all six.
        targets = listOf(AppTarget(version = "1.10.29", versionCode = 11029))
    )

    // Verified 2026-10-13 against in.cricketexchange.app.cricketexchange 26.10.06 (versionCode
    // 667, APKMirror bundle merged with APKEditor: BNDLTOOL-signed, all four ABIs). App classes
    // keep their names, methods are R8-renamed. Premium (ad-free) is client-side: the server's
    // plan is cached as "expiry_date" in the "payment" prefs, and two checks compare it with
    // today, both meaning "expired, show ads": MyApplication's no-arg boolean getter (found by
    // "expiry_date" + "0000-00-00" + Date.after; ~160 call sites incl. the ad managers, app-open,
    // floating score and the adsVisibility flags passed between screens) and HomeActivity's
    // static copy (the "payment" + "expiry_date" + Date.after method that stores it; default true
    // in <clinit>). Enable Premium forces both to false. The purchase screen reads the prefs
    // itself and still shows no plan; FanCode stream entitlements are server-side. Disable ads
    // is a library-level backstop: GMA next-gen load entry points (kept classes, matched by
    // load-callback parameter), Parth Ads AdRequest (CREX's own exchange) public loads and Meta
    // AdView.loadAd. No PairIP, no signature check (libnative-lib.so only returns config
    // strings); Play Integrity is only used by Cashfree, AppsFlyer, Firebase Auth and reCAPTCHA.
    // Emulator (logged out, both patches): stock showed test-fill ads (in-feed native, bottom
    // banner, an interstitial while switching tabs); the patched app showed none on Home, the
    // live match screen, Series, stats/points table, Social and Videos, with no gaps, and no
    // interstitial over 12 tab switches. The pinned floating score starts the Premium service
    // with no ad; no crashes. The menu's "CREX PREMIUM" row opens a login sheet. Live/Upcoming
    // tabs and the quiz were not reached.
    // 2026-10-17: updated to version 26.10.07 (versionCode 668, APKMirror universal bundle,
    // merged). Signer CN=Purushotam Rawat, cert SHA-256 b9e623fa...ea07 (the same as 26.10.06).
    // Every anchor is unchanged and the anchored method bodies are identical. 26.10.06 dropped
    // (latest verified version only). CLI decompile-checked (30 hooks, nothing dropped). Emulator
    // 2026-10-17 (stock control): stock shows GMA test banners, native cards on Series and a
    // PubMatic ad in the Live list; patched shows none with no gaps, and ad network events drop from
    // 277 to 3; no crash. A plain re-signed build gets no Firebase 403, so no notification fix is
    // needed (no FCM token line was seen either way).
    val COMPATIBILITY_CREX = Compatibility(
        name = "CREX",
        packageName = "in.cricketexchange.app.cricketexchange",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x262626,
        signatures = setOf("b9e623fa79aeb566d3388d717d074da7ae4e63160440d24f89c5c0f2af37ea07"), // CN=Purushotam Rawat
        // 2026-10-28: updated to 26.10.09 (versionCode 673, arm64-v8a, same signer). Enable Premium
        // and Disable ads apply unchanged: smoke test green and CLI without -f applied both.
        targets = listOf(AppTarget(version = "26.10.09", versionCode = 673))
    )

    // Added 2026-10-14 from the Reddit request queue ("the ads mess with the UI"). Verified
    // against cc.dreamspark.intervaltimer 2.3.30 (versionCode 239030, single APK, no native code,
    // signer CN=Su-Au Hwang O=dreamspark.cc). The only entitlement is "ad-free" (adbuster), synced
    // from the server into two R8-renamed JSON models, AppInstallation and User. Disable ads forces
    // both ad-state ()I getters to 3 (ad-free). They are found by the models' JSON field names
    // ("config_ads", "local_ads_time", "local_ads_off" plus "device" or "token") and the 3/2/1
    // returns. Every ad path reads them: the native-ad slot map and the only MobileAds.initialize
    // call, the workout-finished banner and the toolbar's "Remove ads" item (its dialog's only
    // entry point). Disable telemetry sets the Firebase Analytics, ad ID and Crashlytics manifest
    // switches. IntervalTimerSmokeTest asserts both getters and the manifest. Emulator 2026-10-14:
    // 3 fresh-install cold starts with no crash, no ad row or gap and no "Remove ads" toolbar item;
    // a workout runs and counts down. Pause, the finish screen, sounds and an explicit config
    // re-sync were not checked.
    val COMPATIBILITY_INTERVALTIMER = Compatibility(
        name = "Interval Timer",
        packageName = "cc.dreamspark.intervaltimer",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x607D8B,
        signatures = setOf("3de6afd771d45215b2fed0573cf27a726a78ec4d151b04efb1c0ce160fa96a48"), // CN=Su-Au Hwang, O=dreamspark.cc
        targets = listOf(AppTarget(version = "2.3.30", versionCode = 239030))
    )

    // Verified 2026-10-14 against com.duplila.screenshare 5.1 (versionCode 68, APKPure XAPK merged
    // with APKEditor, armeabi-v7a only, Play source stamp) for GitHub issue #51 ("unlock premium").
    // App classes are not obfuscated. PairIP license check only (Application wrapper, no VM
    // shield): "Disable license check" no-ops LicenseClient.checkLicense(Context). Premium is local:
    // every gate (main screen, banner, consent branch, preferences, checkout, the mirror screen's
    // watermark and unlockedVideoSize) awaits BillingManager.userPaid(), which runs Play
    // queryPurchasesAsync under a 10 s timeout; Enable Premium makes it return Boolean.TRUE at once
    // (anchor: name + suspend shape + BuildersKt.withContext). Disable ads: the UMP consent flow
    // (the (Z)V method calling ConsentInformation.requestConsentInfoUpdate) returns early, the
    // banner composable (static (Modifier, Z, Composer, I, I)V in the class whose AdView factory
    // calls setAdUnitId + loadAd) emits nothing, and every MobileAds static void plus
    // BaseAdView.loadAd is a no-op. No signature check in the app, its scrcpy-based
    // duplila_screen_server.apk or its native adb libs. DuplilaSmokeTest asserts every hook and the
    // CLI (no -f) applies all three. NOT runtime-tested: the app ships armeabi-v7a libs only and the
    // x86_64 test emulator refuses it (INSTALL_FAILED_NO_MATCHING_ABIS).
    // Disable license check is a pre-rule licence bypass the owner kept (2026-10-19).
    // 2026-10-25: updated to version 5.3 (versionCode 70; APKPure XAPK merged, same signer);
    // DuplilaSmokeTest passes on patcher 2.0.0; anchors unchanged.
    // 2026-11-04: updated to version 5.4 (versionCode 71; Play arm64 split bundle via gplaydl,
    // merged, same Play signing key). 5.4 R8-renames the GMA and UMP libraries (no
    // com.google.android.ump classes, AdView/BaseAdView/AdRequest are g7.*, MobileAds keeps only a
    // private setPlugin and MobileAds.initialize is inlined into the banner's LaunchedEffect), so
    // Disable ads now anchors on app code and GMA's own strings: the consent flow is MainActivity's
    // (Z)V reading its getConsentInformation() getter, the banner composable is the static
    // (Modifier, Z, Composer, I, I)V holding "Cannot show ads", and BaseAdView.loadAd is the
    // BaseAdView method creating the runnable tagged "BaseAdView.loadAd". The MobileAds statics step
    // was dropped (nothing left to neuter). Enable Premium and Disable license check are unchanged.
    // DuplilaSmokeTest asserts every hook; CLI without -f applies all three. NOT runtime-tested.
    val COMPATIBILITY_DUPLILA = Compatibility(
        name = "Duplila",
        packageName = "com.duplila.screenshare",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x009FE3,
        signatures = setOf("45469bfeef3d01413dbffc3530ebe6849bb08312317774f9fbc4f2d999a29294"), // Google Play app signing key
        targets = listOf(AppTarget(version = "5.4", versionCode = 71))
    )

    // Added 2026-10-14 from the Reddit request queue ("the ads are really long and unskippable").
    // Verified against com.peter890331.luckyclick.app 3.28 (versionCode 68, single APK, no native
    // code, Play-signed). PairIP license check only (no VMRunner / libpairipcore): Disable license
    // check no-ops LicenseClient.checkLicense(Context). Ad-free is local: Play purchases are
    // stored as AD_FREE_PERMANENT / AD_FREE_EXPIRE_TIME in SharedPreferences and mirrored into one
    // state that gates the banner, the interstitial preloads and the full-screen interstitial
    // shown before Start. Disable ads forces every getBoolean("AD_FREE_PERMANENT") read true
    // (MainActivity.onCreate is mandatory), makes the onQueryPurchasesResponse restore store
    // Boolean.TRUE (found by its Boolean.valueOf + "AD_FREE_PERMANENT" putBoolean), and no-ops
    // every MobileAds static void, InterstitialAd.load and BaseAdView.loadAd. No rewarded ads in
    // the app. LuckyClickSmokeTest asserts every hook.
    // The APK is the base of a split bundle (requiredSplitTypes base__abi,base__density), so it
    // will not install alone; apkFileType is APKM. Emulator 2026-10-14 (base with the split
    // requirement removed for the test only): stock shows PairIP's licence error; patched starts
    // with no paywall, no banner or gap, "Ads removed (Permanent)", and Start goes straight to
    // screen capture, also after background/resume; the accessibility service binds; no crashes.
    // The TRADE/EVOLVE modes and the overlay window were not reached.
    // Disable license check is a pre-rule licence bypass the owner kept (2026-10-19).
    // 2026-10-25: updated to version 4.8 (versionCode 77; APKPure XAPK merged, armeabi-v7a, same
    // signer; minSdk 29). The prefs keys are no longer string literals: AD_FREE_PERMANENT is now a
    // lazily decoded key on MainActivity (iget-object; Lazy.getValue(); check-cast String), and
    // the startup read moved from onCreate into a helper called from onCreate and onResume.
    // Disable ads now takes the key field from the purchase restore's only putBoolean and the
    // ad-free state from the setValue storing its only Boolean.valueOf(Z); it forces every
    // getBoolean on that key true (mandatory: a read in the method that sets the state TRUE).
    // The restore fingerprint anchors on Boolean.valueOf + putBoolean instead of the old string.
    // 4.8 adds a rewarded ad that unlocks an extra automation flow. While ad-free the app's own
    // code adds that flow without the ad, so patched users get it free; RewardedAd.load is also
    // no-oped. PairIP LicenseClient.checkLicense(Context) and its callers are unchanged.
    // LuckyClickSmokeTest asserts every hook on 4.8; CLI (no -f) changes exactly 22 methods (the
    // hooks above) and nothing else. Emulator 2026-10-25 (x86_64, lib/armeabi-v7a stripped from
    // stock and patched to install): stock shows the PairIP "Something went wrong" dialog;
    // patched starts without it, Settings shows "Ads removed (Permanent)", no banner or gap, Start
    // goes straight to the capture prompt (also after resume), adding a flow shows no ad, no crash.
    val COMPATIBILITY_LUCKYCLICK = Compatibility(
        name = "LuckyClick",
        packageName = "com.peter890331.luckyclick.app",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x3A362F,
        signatures = setOf("f7430d18f3745825b6a7a21171d1bc6d6fa2320fb1c9d094d022d66fb372346d"), // Google Play app signing key
        // 2026-11-03: updated to "2026/10/22" (versionCode 100, Play arm64 build via gplaydl, same
        // Play signer; the developer now uses the release date as versionName), both patches apply
        // unchanged; smoke + CLI without -f.
        // 2026-11-03 emulator: patched cold starts reach MainActivity (stock stops at the PairIP licence screen), no crash.
        targets = listOf(AppTarget(version = "2026/10/22", versionCode = 100))
    )

    // Added 2026-10-14 from the Reddit request queue (ads only: premium is an account role from
    // the server's /api/mv4, so it cannot be unlocked locally). Verified against
    // com.astrapaging.vff 6.7.8 (versionCode 678, APKPure XAPK merged, arm64-v8a only, signer
    // CN=Astra Paging Ltd.). Capacitor/Angular hybrid; PairIP license check only (no VMRunner /
    // libpairipcore): Disable license check no-ops LicenseClient.checkLicense(Context). Disable
    // ads works on the kept Capacitor plugin com.izosa.advert.AdvertPlugin (its classpath is in
    // capacitor.plugins.json): every @PluginMethod(PluginCall) handler (show, hide, resize,
    // fullscreen) resolves the call and returns, so no consent form, no SDK start, no WebView
    // wrap and no banner; the method calling MobileAds.initialize returns at once; and every
    // MobileAds static void is a no-op (rule 9). The web layer reserves no banner space.
    // VesselFinderSmokeTest asserts every hook.
    // Emulator 2026-10-14 (6.7.8): stock re-signed shows the PairIP licence error; patched launches to
    // the map with no paywall, no consent form, no banner or bottom strip; panning, a vessel page and
    // the login form work; 3 cold starts, no crash.
    // Disable license check is a pre-rule licence bypass the owner kept (2026-10-19).
    val COMPATIBILITY_VESSELFINDER = Compatibility(
        name = "VesselFinder",
        packageName = "com.astrapaging.vff",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x112D5A,
        signatures = setOf("d24b40de530cd622a604740c9dd036475ee6acfb326d29e34a06adcd1f6c6a1f"), // CN=Astra Paging Ltd., O=Astra Paging Ltd.
        targets = listOf(AppTarget(version = "6.7.8", versionCode = 678))
    )

    // Added 2026-10-14 from a Reddit request (ads only: subscribers see ads too, and the paywall
    // is decided server-side, so it is out of scope). Verified against wsj.reader_sp 6.43.0.33886
    // (versionCode 643003886, universal APK, signer CN=Wall Street Journal Digital Network, no
    // packer or PairIP). Disable ads anchors on kept class names and method shape only, never on
    // the hashed Compose / value-class suffixes: every SectionAdPlacementStrategy implementation
    // returns no ad indices (section, markets, For You, Magazine feeds), ArticleAdPlacementStrategy's
    // (II)Z answers false (inline article ads), AdManagerAdViewStore only ever publishes Unit so
    // any other slot (stock quote page) composes nothing and never requests, AdPaddingDefaults'
    // vertical padding is 0, UACModule keeps its empty ad title lambda (its static setter is a
    // no-op, so no "ADVERTISEMENT" caption over the emptied quote-page slot; found by emulator
    // run 2026-10-14), the native-ads-in-sections/articles and Ozone flags are false,
    // DJMobileAds.initialize plus every MobileAds static void are no-ops (rule 9), GMA
    // BaseAdView / AdManagerAdView / AdLoader loads are no-ops, and video pre-rolls are gone
    // (VideoPlayerAdsHandler returns a null IMA ad tag and loader, MediaItem.Builder drops ad
    // configurations). Megaphone podcast ads are server-side and not covered. WsjSmokeTest
    // asserts every hook.
    // Emulator 2026-10-14 (corrected 2026-10-19; an earlier line here said "not yet run on an
    // emulator"): per commit 7e83ebb the patched app showed no ads, ad skeletons or gaps and did
    // not crash, and that run found the quote page's "ADVERTISEMENT" caption fixed above. The
    // screens it opened are not recorded, except the stock quote page; video pre-rolls are not
    // recorded as checked.
    // 2026-10-25: updated to version 15.11.0.42207 (versionCode 700042207; APKPure universal APK,
    // same signer). Section ads were reworked: SectionAdPlacementStrategy is now a class behind
    // com.dowjones.advertisement.SectionAdPlacementStrategyContract, fed by a remote placement
    // registry, so step 1 now empties every contract implementation's getAdSlotConfigList(I, Z,
    // SectionAdPlacementModel) (SectionAdViewmodel is its only caller). Two new ad surfaces are
    // covered: live coverage (LiveCoveragePlacementStrategy's only (I)Z, shouldInsertAdBeforeCard,
    // answers false) and the Discover vertical video feed (every store to DiscoverScreenViewModel's
    // only int field, the DiscoverAds ad frequency read by onFeedData, stores 0, so no
    // DiscoverVideoInterstitialAd page is inserted; its AdLoader load is also a no-op). Steps 2-8
    // anchors are unchanged. WsjSmokeTest asserts every hook; CLI (no -f) changes exactly the 38
    // hooked methods and nothing else (injected instruction counts match the snippets).
    // Emulator 2026-10-25 (15.11, signed out, consent declined): stock shows "ADVERTISEMENT" slots
    // on Home, Markets and a quote page; patched shows none and no gaps; the Media vertical video
    // feed (10 videos) had no ad page or pre-roll in either build; no crash. Articles and live
    // coverage were not reached (paywall without an account), so steps 2 and 9 are bytecode-only.
    val COMPATIBILITY_WSJ = Compatibility(
        name = "The Wall Street Journal",
        packageName = "wsj.reader_sp",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x000000, // Black WSJ logotype on a #F7F7F7 adaptive-icon background.
        signatures = setOf("23bb0cd3b5fbc3fdd4f869b2c423ef79ea25ff7c54b06ea29ccd49472f66451f"), // CN=Wall Street Journal Digital Network, O=The Wall Street Journal
        // 2026-10-29: updated to 15.12.0.42675 (versionCode 700042675, arm64-v8a, same signer).
        // Disable ads applies unchanged: smoke test green and CLI without -f applied it.
        targets = listOf(AppTarget(version = "15.12.0.42675", versionCode = 700042675))
    )

    // Verified 2026-10-14 against me.piebridge.brevent 4.2.31.1 (versionCode 539, APKPure).
    // Donationware: donors pay via Play or WeChat/Alipay ("Brefoil"), the server (jianyv.com,
    // pinned by CON's trust manager) returns a token parsed into fields of the Application
    // class, and every feature tier reads one count source: the no-arg int getter whose body
    // holds the 1185657756 XOR mask (decompiled as ui/I.v() = (P() ? mask ^ H : 0) + x()).
    // Tier gates compare v() + w() against 5 (dynamic GMS + suspend, Q.Y1()) and 3 (further
    // settings, Q.z4()), both XOR-masked with the same constant. The patch forces that one
    // getter to 10, lifting every tier; the getter is located structurally (no-arg ()I with
    // the mask literal), so R8 letter-name rotation cannot break it, and a changed mask fails
    // loudly.
    // No PairIP or self-signature check; the adb-started server checks only the calling UID,
    // so a re-signed build still activates. DONOR CAVEAT: the token parse ties validation to
    // fields a re-signed build cannot produce, so genuine donors' tokens stop being consulted
    // (the count is forced); donors who want their donation recognized should use the official
    // build. Runtime test pending (needs adb activation on the emulator).
    // Enable Premium (the donor-tier unlock) is a pre-rule exception to the no-licence-bypass
    // rule that the owner kept (2026-10-19).
    val COMPATIBILITY_BREVENT = Compatibility(
        name = "Brevent",
        packageName = "me.piebridge.brevent",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0288D1,
        signatures = setOf("b7ab38fa38c82ef3cb28b1f9044c0360794abf109bcb2ce97e8ad939d736bd1f"), // CN=Liu DongMiao, O=piebridge.me
        targets = listOf(AppTarget(version = "4.2.31.1", versionCode = 539))
    )

    // Added 2026-10-14 from the Reddit request queue (ads, analytics, upgrade banners); restored
    // 2026-10-19 with a native-encryption bypass. Verified against com.fyxtech.muslim 3.5.4
    // (versionCode 149, apkcube bundle merged, arm64-v8a only, developer signer CN=athan O=yalla,
    // SHA-256 5d8c442d...ee0c; first written for 3.5.0). Premium membership is server-side
    // (protobuf membership state and privileges from the server) and is not faked. Disable ads
    // answers "has AUTHORITY_TYPE_NO_ADS" (that privilege only) in the single class implementing
    // the kept router interface IWalletExport, for its (AuthorityType)Z and StateFlow forms: every
    // ad placement, the splash ad and the feed ad units consult it. In 3.5.4 the (AuthorityType)Z
    // form has no local register, so it is cloned with the library's
    // cloneMutableAndPreserveParameters first. The open-page ad gate (the instance
    // (LocResourceOpenPageUiModel)Z that reads "ad_new_user_first_show_days", inline in 3.5.0,
    // through a static ()Z helper in 3.5.4) answers false, so the launcher never waits on the ad
    // platform. BaseAdView/AdLoader/InterstitialAd/AppOpenAd loads are no-ops. Rewarded ads (SSV,
    // the free path to make-up prayers, golds and point rewards) and MobileAds.initialize are
    // deliberately kept; AppLovin/Pangle/Unity/Meta are GMA mediation adapters only. Disable
    // telemetry: Firebase Analytics/Crashlytics manifest switches, the (String, Bundle) logEvent of
    // the measurement client FirebaseAnalytics holds (its field type; 3.5.4 inlines
    // FirebaseAnalytics.logEvent into the callers), AppMeasurementSdk logs, the concrete
    // AppsFlyerLib subclass (start/log*/init; setCustomerIdAndLogSession only where the SDK still
    // has it) and Adjust initSdk/trackEvent/trackAdRevenue. Hide premium banners:
    // InfoStreamUnit.hasMembershipInfo() answers false (home-feed membership card) and the Me
    // screen's VipCardView is kept GONE.
    //
    // Re-signing used to kill the app: AthanEncryption.<clinit> loads libagora-ey.so, the native
    // library rejects the changed signing certificate, KvInitializer dies in a background thread
    // with NoClassDefFoundError, and the process exits. "Fix native encryption check" skips that
    // initializer and replaces every Java call to its String getters with the values dumped from
    // the developer-signed build through the JNI methods. The library is never loaded. The k27
    // PKCS#8 RSA private key for the Yami mini-program signature check is deliberately omitted;
    // its call site returns an empty key, so Yami fails closed. The core app (prayer times, Qibla,
    // Quran/Hadith, ad and telemetry hooks) does not use it.
    // Disable ads, Disable telemetry, Hide premium banners and Hide feed clutter depend on the
    // bypass patch. Hide feed clutter answers false from six InfoStreamUnit accessors (LoginGuide,
    // Nearby, PostInfo, Store, FirstRecharge, WatchAdWinRewards), so the feed builder drops those
    // server units without a gap; the Ad-Free buttons, Ask AI search, Me-screen rows and bottom
    // navigation tabs are not InfoStream units and stay (issue #93's remaining items).
    // Native anti-debug markers (TracerPid/frida in libagora-ey.so, ptrace in libapminsightb.so)
    // are SDK self-protection and are not touched; on the Java side the signing cert is only
    // reported (Facebook app events, the app's SecModel log), never enforced.
    // WeMuslimSmokeTest asserts every hook plus the bypass. The full Morphe build was
    // emulator-tested 2026-10-19: the app starts, the consent flow is accepted, the home screen
    // renders with all navigation, the Quran opens, there are no AndroidRuntime or libc fatal
    // errors, and the ad and telemetry SDKs log no activity. The Yami mini-program (the path whose
    // RSA key is deliberately empty) was not exercised; it fails closed.
    // 2026-11-04: updated to version 3.5.5 (versionCode 151; Play arm64 split bundle merged, same
    // signer). Every patch applies unchanged: WeMuslimSmokeTest green and CLI without -f applied
    // them. AthanEncryption is called from 16 methods, as in 3.5.4, and only through getters
    // with a dumped value (the patch fails on any other), and k29/k30 still equal the Firebase
    // project_id/google_api_key resources. The other
    // dumped values are stored obfuscated in libagora-ey.so, but that library is byte-identical in
    // 3.5.4 and 3.5.5 (arm64 SHA-256 0c51b2c3...a089, both Play builds), so the dumped values still
    // hold. Not run on the emulator.
    val COMPATIBILITY_WEMUSLIM = Compatibility(
        name = "WeMuslim",
        packageName = "com.fyxtech.muslim",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x00A63B,
        signatures = setOf("5d8c442d9373ce3ce62410957a6ae3ab3a559097ff1e83f59888cf78fcdbee0c"), // CN=athan, O=yalla
        targets = listOf(AppTarget(version = "3.5.5", versionCode = 151))
    )

    // Added 2026-10-14 from the Reddit request queue: ads only. Pro and paywalled content are
    // server-side (entitlements and isPremium arrive from the server). Verified against
    // com.divum.MoneyControl 14.6.2 (versionCode 637, APKMirror bundle merged, arm64-v8a only,
    // signer CN=Ganapathy, O=Divum Corporate Services). App classes keep their names, members
    // are R8-renamed. No single local ad-free gate exists: the "ad_free" entitlement only hides
    // the app wall and a few Pro rows, the interstitial checks the Pro flag, and ad-free users
    // simply get a menu ad config without slots. Disable ads therefore makes every lookup on the
    // ad repository return null (the class the menu's ad-config parser, found by its slot-key
    // strings "native_ad"/"splash_top"/"splash_bottom"/"dfp_custom", hands its HashMap to;
    // lookups = instance-of + Map.get shape), redirects Utility's sticky-ad "show" to "hide"
    // (log prefixes "Utility hideAndShowAds Visibility VISIBLE/GONE"), nulls the BannerAd
    // video_preroll_url/tv_preroll_url getters (every video screen then skips the IMA preroll),
    // no-ops the GMA loads (AdLoader, Interstitial/AdManagerInterstitial/Rewarded/
    // RewardedInterstitial/AppOpen load) without calling back, hides BaseAdView/AdManagerAdView
    // on loadAd, and hides Taboola's TBLClassicUnit on fetchContent. The silent loads were
    // checked 2026-10-19: no Java caller waits on them (Utility's interstitial is
    // fire-and-forget, JJT's interstitial handler is never created, JJT banners only reset a
    // flag), and a failure would walk JJT's waterfall on to Yandex. The Flutter screens'
    // banner/native ads instead report NO_FILL to Dart via the shared google_mobile_ads plugin
    // hook (same anchors as 433/Expert Player). MobileAds.initialize is kept (the Flutter
    // google_mobile_ads plugin and the JJT SDK wait on its listener), so rule 9 does not apply.
    // MoneycontrolSmokeTest asserts every hook. Not yet run on an emulator; the Akamai BAP SDK
    // reports the signing-cert hash in its sensor data, so check that the re-signed build still
    // loads the news feed.
    val COMPATIBILITY_MONEYCONTROL = Compatibility(
        name = "Moneycontrol",
        packageName = "com.divum.MoneyControl",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0066A1,
        // Experimental (owner decision 2026-10-14): shipped without a device test because the
        // emulator is blocked by Akamai even on the original app.
        signatures = setOf("032e7418eec3fc2935e7235dca5abb40f180f57b616977499b24634c96b26064"), // CN=Ganapathy, O=Divum Corporate Services
        targets = listOf(AppTarget(version = "14.6.3.RC0", versionCode = 638, isExperimental = true))
    )

    // Verified 2026-10-15 against projekt.launcher 2.2.7 (versionCode 20207, APKMirror bundle
    // merged with APKEditor; signer O=projekt, SHA-256 b83ad17c...f603, same bytes on APKPure).
    // Launcher label "hyperion". No PairIP, packer or self-signature check; no ad SDKs (Firebase
    // Analytics/Crashlytics only). App code is R8-renamed into hype/* and the premium-related
    // strings are encrypted, so Enable Premium anchors on shape: the holder class is the one whose
    // static (Context, String, String, String)String token signer calls SecretKeySpec.<init>,
    // Mac.getInstance and Base64.encodeToString (the app's only Mac user) and whose <clinit> seeds
    // the premium MutableStateFlow<Boolean> from Boolean.FALSE. Every premium reader collects that
    // one flow. The patch seeds it TRUE, loads 1 into the boolean App.onCreate boxes with
    // Boolean.valueOf before its cold-start write into the flow (found by the flow's
    // sget-object + (Object, Object)Z compare-and-set shape), and makes the holder's static
    // no-arg reset (the void that writes FALSE into the flow) return at once. The token signer,
    // the shared StateFlow class, Firebase and the Launcher Key AIDL are untouched.
    // HyperionSmokeTest asserts all three hooks. The CLI (no -f) rewrites exactly two classes
    // (App and the holder), and apkanalyzer shows the TRUE seed, the return-void reset and
    // const/4 1 before valueOf; a full stock-vs-patched smali diff confirms only those two classes
    // change. Emulator (morphe-test, API 35): stock shows the "plus users" upgrade dialog on
    // Typography; patched opens it with no badge or dialog, and premium survives a force-stop
    // and a reboot. No crashes.
    // 2026-10-25: updated to version 2.2.13 (versionCode 20213; APKPure XAPK merged, same signer);
    // HyperionSmokeTest passes on patcher 2.0.0; anchors unchanged.
    val COMPATIBILITY_HYPERION = Compatibility(
        name = "Hyperion Launcher",
        packageName = "projekt.launcher",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x3C59AD, // Mid-point of the icon's blue-to-indigo background gradient.
        signatures = setOf("b83ad17c73dc062be4dc188f2b91e7f7632f69f85f962616e6866effe43bf603"), // O=projekt
        targets = listOf(AppTarget(version = "2.2.14", versionCode = 20214))
    )

    // Written 2026-10-15/16 against com.guardian 6.238.23405 (versionCode 23405), the STABLE
    // build: an owner-supplied APKCube bundle merged into one APK. The bundle's base.apk is signed
    // by Guardian (CN=Android, O=Guardian News and Media, SHA-256 4965429e...9e7d) with a Play
    // stamp; the merged APK's own signature no longer verifies (expected after the merge). No
    // packer, PairIP or app signature check. R8 renames the app's own classes in this build
    // (com.guardian.* and com.theguardian.* included), so every anchor is a string, a kept
    // library/Retrofit/app class name or a method shape.
    // Disable article limit (scope: no limit wall, warm-up prompt or offline wall; the free
    // sign-in gate is kept): GetMeterApiState, the only caller of the kept Retrofit
    // RetrofitApi.message (cross-checked by "Failed to get metering message for articleId: "),
    // returns None(shouldTrackArticleView=false) at entry (the None class is found by its
    // toString), so no meter request is made and no article view is counted. GetMeteringStateImpl
    // (the only (String, continuation) caller of it, cross-checked by the SignInWall and
    // OfflineWall singletons and "sign_in_date_key") returns that None instead of the
    // OfflineWall; its SignInWall branch is untouched.
    // Disable ads: the single GMA load method (strings "preparing ad request: %s", "No consent
    // given for google ads", "Forced ad failure"; AdManagerAdView second parameter) reports a
    // LoadAdError to the view's AdListener and returns before the GMA request and the Amazon APS
    // bid, like its own consent path; ShouldLoadAds (no-arg Z reading a RemoteSwitches$Companion$Key
    // and isPremium()) answers false. MobileAds, isPremium and UserTier are untouched.
    // GuardianSmokeTest asserts all four hooks.
    // Disable telemetry (added 2026-10-16, same build): SdkManager's gate, the only concrete
    // (Sdk)Z method that reads the Sdk's RemoteSwitches$Companion$Key field and calls isPremium()
    // (the Sdk data class is found by its "Sdk(remoteSwitchKey=" toString), answers false, the
    // app's own no-consent path: InitializeAvailableSdks deinitialises every SDK and Comscore,
    // Nielsen, Adjust, Braze, Permutive, Confiant, APS and Teads never start (Braze marketing
    // pushes and in-app messages go too). The Ophan uploader ((NativeAppSubmission)V with
    // "https://ophan.theguardian.com/mob" and "Ophan submission failed") returns at once, so the
    // worker drops the queued events. In the kept FirebaseAnalytics class the only instance (Z)V
    // (setAnalyticsCollectionEnabled) loads false first and the only (Bundle, String)V (logEvent)
    // returns at once; in Crashlytics (R8-renamed, found by getInstance's "FirebaseCrashlytics
    // component is not present.") the only instance (Z)V loads false first and the only
    // (String)V (log) returns at once. The push "received" beacon (the (Object)Object method
    // with the mobile-events notification/received URL) returns Boolean.FALSE before the request;
    // the notification is shown before it runs. The manifest gains
    // firebase_analytics_collection_deactivated=true. FCM, Remote Config, Sourcepoint, the
    // consent check and AcquisitionEventsService are untouched. GuardianSmokeTest asserts every
    // hook and the meta-data.
    // Decompile-checked 2026-10-16: a CLI build (no -f) with all three patches, every hooked
    // method and the manifest flag match. Resource names come out renamed (e.g. appBar).
    // Emulator 2026-10-16 (stock control, same test key): cold starts, onboarding, Settings and
    // Advanced Settings all render; FA logs "deactivated via the manifest", Adjust stays
    // disabled. The Sourcepoint consent screen shows on fresh installs of both builds; the
    // server decides (pv-data msgId 1511924). A WebView SIGSEGV in libmonochrome_64 at the same
    // pc hits stock too (environment). The emulator gets no ads and stock showed no meter
    // wall in about 11 articles, so ad removal and the article limit are verified in bytecode
    // only. FCM fails with the same 403 on stock (environment).
    // 2026-10-25: updated to version 6.239.23439 (versionCode 23439; APKPure XAPK merged,
    // armeabi-v7a, same signer); GuardianSmokeTest passes; CLI (no -f) applies all 3 patches,
    // 11 methods plus the manifest change, no string values changed (rule 12). The resource
    // rebuild renames 4 case-colliding id names (appBar/appbar, checkBox/checkbox) to id_0x...;
    // no code looks them up by name. Emulator not re-run for this bump.
    // 2026-11-04: updated to version 6.241.23504 (versionCode 23504; Play download via gplaydl,
    // base + arm64 config splits merged, same signer 4965429e...). Since 6.240 R8 renames most of
    // the GMA SDK (LoadAdError is lt7, AdListener tc, onAdFailedToLoad tc.b, BaseAdView.loadAd b),
    // so the old prologue failed on "Could not find class LoadAdError". The app's ad funnel is
    // unchanged: the single load method (hl0.f(jd, AdManagerAdView), same three strings) still
    // makes the app's only Amazon APS request (DTBAdRequest) and the only GMA load; its callers are
    // AdvertCardView, the interstitial page and the article MPU runnable. Disable ads step 1 now
    // reads the error type, its 5-arg constructor, getAdListener and the listener's failure method
    // from the method's own "No consent given for google ads" block and builds the same prologue
    // from them; every AdListener subclass ignores the error code. ShouldLoadAds (h8c.a) is
    // unchanged. FingerprintProbe: all ten guardian fingerprints OK-unique. GuardianSmokeTest
    // passes (it reads the types the same way); CLI (no -f) applies all 3 patches; apkanalyzer
    // shows the prologue (getAdListener on p2, new lt7(3, "Ads disabled", ...), tc.b, return-void)
    // and h8c.a returning false. Emulator not run.
    val COMPATIBILITY_GUARDIAN = Compatibility(
        name = "The Guardian",
        packageName = "com.guardian",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x052962, // Guardian navy.
        signatures = setOf("4965429ead99251c84c2d557d4e6f36c7bc3b35c1ea18e1996bcca13e55a9e7d"), // CN=Android, O=Guardian News and Media
        targets = listOf(AppTarget(version = "6.241.23504", versionCode = 23504))
    )

    // Updated 2026-10-23 to com.yahoo.mobile.client.android.sportacular 12.26.1 (versionCode
    // 11168590): owner-supplied apkcube bundle, merged, arm64-v8a only; signer CN=Yahoo! mobile CA,
    // O=Yahoo! Inc., cert SHA-256
    // d3f1fb1b2c81e096e3f5809a503afda0cfaf56b9d39dedc656ee2660acef614c, the same as the APKMirror
    // 12.10.3 bundle. Disable ads is unchanged (all three anchors still match once). Hide betting
    // promotions is re-anchored: 12.26.1 removed SportsbookPromotionHelper (and the
    // sponsored-moments promotion path) that the old fingerprint called for, and R8 now renames
    // BettingImageBannerCtrl (12.26.1: ui/card/bettingimagebanner/control/a). The same CardCtrl data
    // override (M2(Object)) is now found by shape: (Object)V, the "placement" key it passes to the
    // betting-promo data service, and a call into the kept CardCtrl base class. It returns at once,
    // so the server bettingPromo banner (now its only source) is never requested. Status 2026-10-23
    // on 12.26.1: YahooSportsSmokeTest passes, FingerprintProbe has all four fingerprints
    // OK-unique, and the CLI (no -f) applies both patches. A whole-APK dexindex diff shows exactly
    // the 6 target methods changed in 4 classes (ad card setData GONE, the 3 sponsored-moments
    // getters false, getAdTagUri null, M2 return-void); manifest and resources are byte-identical.
    // Emulator (ARM translation, stock control): no crash; the Home, Scores and game-page ad cards
    // are gone with no empty slot and the IMA SDK no longer loads; the game video still plays.
    // Not runtime-tested: the BetMGM banner (it never appears on the emulator, stock included) and
    // a video pre-roll (the Watch video is region-blocked, SS-202, in both builds).
    // Verified 2026-10-15 against 12.10.3
    // (versionCode 11166823, APKMirror bundle merged; signer CN=Yahoo! mobile CA, O=Yahoo! Inc.,
    // SHA-256 d3f1fb1b...614c, same as 12.9.2). No packer, PairIP or billing. App view/controller
    // and Verizon Media player class names are kept; members and helper classes are R8-renamed.
    // Disable ads: SportsAdCardView's typed setData (the view behind every ad card, the webview
    // top pencil and the video-screen ad) sets GONE and returns before it builds or loads the ad
    // view; the sponsored-moments config manager (found by its "stream_taboola_ad_enabled" and
    // "sponsored_moments_use_gam_ads" keys) answers false from every public no-arg boolean getter
    // (Taboola native pencil, Taboola stream ads, GAM pencils); SapiMediaItem.getAdTagUri returns
    // null, so no IMA pre-roll is requested. MobileAds, the SponsoredMoments initializer and the
    // generic config delegate are untouched. Not covered: ads inside web articles (server-side
    // pages), the sponsor splash and sponsored comments.
    // Hide betting promotions (12.10.3 anchor, replaced above): BettingImageBannerCtrl's data
    // method (the caller of SportsbookPromotionHelper.shouldShowBettingImageBanner) returns at
    // once, so the BetMGM banner view stays GONE (it hides itself in its constructor) and neither
    // promotion source is fetched. Odds, the Sportsbook hub and the six-pack betting prompt are untouched.
    // YahooSportsSmokeTest asserts all four hooks. CLI (no -f) applies both patches and a full
    // smali diff shows only the four target classes change. Emulator (morphe-test): stock shows
    // ad cards (V) on home, scores, game, team and news and 19-57 IMA log lines around video;
    // patched has every SportsAdCardView GONE, no ad containers, 0 IMA log lines, and videos
    // play. No BetMGM banner appeared on either build, so Hide betting promotions is
    // bytecode-verified only.
    // 2026-11-03: target moved to 12.27.0 (versionCode 11168613, Play arm64 build via gplaydl, same
    // signer). R8 now renames SapiMediaItem's methods (getAdTagUri is X2()) but keeps its field
    // names, so the ad-tag getter is found by shape: the only no-arg String method reading the
    // adTagUri field. The other three anchors are unchanged. YahooSportsSmokeTest passes, a CLI
    // run without -f applied both patches, and X2() disassembles to const/4 0 + return-object.
    // 2026-11-03 emulator (patched build of the release batch, stock control): two cold starts, no crash.
    val COMPATIBILITY_YAHOO_SPORTS = Compatibility(
        name = "Yahoo Sports",
        packageName = "com.yahoo.mobile.client.android.sportacular",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x6001D2, // Yahoo purple.
        signatures = setOf("d3f1fb1b2c81e096e3f5809a503afda0cfaf56b9d39dedc656ee2660acef614c"), // CN=Yahoo! mobile CA, O=Yahoo! Inc.
        targets = listOf(AppTarget(version = "12.27.0", versionCode = 11168613))
    )

    // Smoke-tested 2026-10-15 against com.pzolee.bluetoothscanner 1.9.3 (versionCode 93, APKPure
    // single APK, the only source checked; signer CN=Zoltan Pallagi, SHA-256 62799dca...0e380).
    // Launcher label "Bluetooth Scanner". The whole app, GMA included, is R8-renamed. Disable ads:
    // MainActivity's MobileAds init-complete listener (1.9.3: ib0.a(q40)), the one place that loads
    // both the banner and the interstitial, returns at once. It is found by the live interstitial
    // unit "ca-app-pub-9043738977093939/5919566899" plus its (one param)V shape and its check-cast
    // to the kept GMA AdView (the unit's only other holder, the no-arg reload after a dismissed
    // interstitial, has neither). The banner AdView is GONE in the layout and only its onAdLoaded
    // makes it VISIBLE; both interstitial shows are null-guarded. MobileAds.initialize is untouched.
    // BluetoothFinderSmokeTest asserts the hook. CLI (no -f) changes only that class. Emulator:
    // stock shows a live "Test Ad" banner; patched has myAdView GONE and no ad requests, and
    // scanning, Settings and Filters work. The interstitial trigger was not reached at runtime.
    val COMPATIBILITY_BLUETOOTH_FINDER = Compatibility(
        name = "Bluetooth Scanner",
        packageName = "com.pzolee.bluetoothscanner",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1084F7, // The icon's Bluetooth blue (on black).
        signatures = setOf("62799dcaf6986c6c512397a1d0bcb7f2f212685f3f97f8c5f3f5084f8df0e380"), // CN=Zoltan Pallagi
        targets = listOf(AppTarget(version = "1.9.3", versionCode = 93))
    )

    // Smoke-tested 2026-10-15 against com.macdom.ble.blescanner 4.8 (versionCode 74, single APK,
    // same file on APKMirror and APKPure; signer CN=Ashok Domadiya, SHA-256 bdfa4f78...0a977).
    // App class names are kept; ads use the next-gen GMA SDK. Disable ads: AdmobBanner (found by
    // its live unit "ca-app-pub-9113721270828121/8819258755") loadBanner(Context, RelativeLayout)
    // sets the container GONE and returns, which covers all 6 banner screens.
    // AdmobInterstitial (live unit "ca-app-pub-9113721270828121/2787645901")
    // loadInterstitialAds(Context) returns at once, and HomeActivity's no-arg caller of it
    // (4.8: loadInterADS) returns before it creates the AdmobInterstitial, so the field stays null
    // and showAd/showAdForHelp/showAdHistoryData open the radar, help or export screen directly.
    // The show paths, MobileAds initialization, UMP consent and billing are untouched.
    // BleScannerSmokeTest asserts all three hooks and the unchanged showInterstitialAds. CLI (no -f)
    // changes only AdmobBanner, AdmobInterstitial and HomeActivity. Emulator (after answering the
    // UMP form, which ads wait for): stock shows "Test Ad" banners in all six containers and 8
    // /mads/gma requests; patched has every container GONE, 0 ad requests, and Radar and Help
    // open at once.
    val COMPATIBILITY_BLE_SCANNER = Compatibility(
        name = "BLE Scanner",
        packageName = "com.macdom.ble.blescanner",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2E59A8, // Mid-point of the icon's blue gradient.
        signatures = setOf("bdfa4f78a08ea34576beba64605359c93df8ae7b6b53f896741af52d3a8a0977"), // CN=Ashok Domadiya
        targets = listOf(AppTarget(version = "4.8", versionCode = 74))
    )

    // Smoke-tested 2026-10-15 against ru.wasiliysoft.ircodefindernec "14.17.0 build 206 InAPP"
    // (versionCode 206, APKPure XAPK merged with APKEditor, arm64-v8a only). Signer: v3 lineage
    // from a Play-generated key (bd76d6d6...4849) to CN=Vitaliy Vasilchenko, O=WasiliySoft, SHA-256
    // 79131c22...c2c3 for SDK 33+ (Play app signing key upgrade); Play source stamp. No packer or
    // shield. The app is R8-renamed; ads are Yandex Mobile Ads 8.3.0 (Google only through Yandex
    // mediation), whose class and method names are kept. Disable ads:
    //   - Banners: the banner helper's constructor (14.17.0: m6.<init>(String, LinearLayout, Z, I),
    //     the only place a BannerAdView is built; found by that shape plus its
    //     BannerAdSize$a.sticky and BannerAdView.<init> calls) sets the container GONE and returns
    //     right after storing it, after the super call. That covers all four units
    //     (R-M-10827245-1/2/3 on PagerFragment, SmartScanActivity, ScanActivity and
    //     NotFoundIrServiceActivity). Its destroy method null-checks the banner and the job, and
    //     the refresh coroutine is only launched from the skipped tail.
    //   - Interstitial: the suspend loader (14.17.0: xd2.a(Activity, String, long, Continuation),
    //     the only place an InterstitialAdLoader is built; found by its "InterstitialAdLoadResult"
    //     log tag, the InterstitialAdLoader.<init> call and its (?, String, long, ?) shape) returns
    //     kotlin.Unit at once, like its own load-failure path. Unit (14.17.0: lp5) is found by
    //     its toString "kotlin.Unit"; null is the fallback. MainActivity's R-M-10827245-5 is never
    //     loaded.
    // The Yandex SDK init, the PREF_PREMIUM / billing logic and Play Integrity are untouched.
    // CloudActivity sends a Play Integrity token with cloud catalogue requests, so the server
    // may reject re-signed builds there; that is a signing effect, not caused by the patch.
    // Not patched (optional later): AppMetrica telemetry, where both public static void
    // AppMetricaLibraryAdapter.activate overloads and AppMetrica.activateReporter are clean
    // returnEarly() targets. IrCodeFinderSmokeTest asserts both hooks. CLI (no -f) changes only m6
    // and xd2. Emulator: stock shows Yandex "Test Ad" banners on the Remotes and Excluded tabs and on
    // the no-IR notice; patched has ad_container GONE, no BannerAdView, and no crash across
    // rotations. The scan screens need IR hardware and were not reached; the interstitial did not
    // show on either build.
    val COMPATIBILITY_IR_CODE_FINDER = Compatibility(
        name = "IrCode Finder",
        packageName = "ru.wasiliysoft.ircodefindernec",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x009688, // The icon's teal background.
        signatures = setOf("79131c22b4d86ad2ab256d9fca57e7b7ffea7b84b09a67b4b26226ac7d92c2c3"), // CN=Vitaliy Vasilchenko, O=WasiliySoft
        targets = listOf(AppTarget(version = "14.17.0 build 206 InAPP", versionCode = 206))
    )

    // Verified 2026-10-15 against app.prolauncher "v2.4.2" (versionCode 269, APKPure XAPK
    // merged with APKEditor, arm64-v8a only). Signer: the Play app-signing key (CN=Android,
    // O=Google Inc., SHA-256 07fd559f...6da7) with a Play source stamp, so there is no developer
    // certificate to compare. No licence protection: no PairIP, LVL, Play Integrity or signature
    // self-check. Enable Premium: isPro is computed from the RevenueCat entitlements
    // "entitlement_id_pro" / "entitlement_id_pro_lifetime" (or the local 3-day trial) and kept in
    // two places, each read by its own set of gates: (1) the IS_PRO SharedPreferences boolean,
    // read through an obfuscated getter `getBoolean("IS_PRO", false) || trial` (~70 call sites:
    // Interrupt switch, swipe gestures, app categories, the Pro/Pro Membership entries), and (2) the
    // kept data class app.prolauncher.data.SubscriberInfo (isPro() / component1(), ~13 Compose
    // readers). The first version forced only (2) and unlocked nothing at runtime. Both now return
    // true: (1) found by the "IS_PRO" key plus shape (no-arg Z, SharedPreferences.getBoolean),
    // (2) by the kept class name plus shape. RevenueCat and the stored pref are untouched.
    // ProLauncherSmokeTest asserts all three methods. 2026-10-15: CLI build (no -f) decompile-
    // checked (x9.u0.q, isPro, component1 = const/4 1; return); emulator-5554 re-signed stock vs
    // patched: stock shows the Pro sheet for Interrupt, Swipe left and app categories; patched
    // toggles Interrupt (3 apps), opens the swipe-gesture choices, adds a category, and the Pro
    // item / Pro Membership row show the subscriber "Pro Member" sheet. Same after a cold start; no
    // crashes.
    // 2026-10-25: updated to version v2.4.3 (versionCode 271; APKPure XAPK merged, same signer);
    // ProLauncherSmokeTest passes on patcher 2.0.0 after one fix. v2.4.3 added a second no-arg Z
    // reader of "IS_PRO", the "trial just ended" check (trial started, trial over, not Pro, within a
    // day of the trial end; it drives the once-a-day trial sheet in ComposeMainActivity.onResume),
    // so the IS_PRO fingerprint matched twice. It now also requires the no-arg Z trial-check call
    // right after the getBoolean read, which only the Pro getter has; the trial-ended check is left
    // alone. SubscriberInfo anchors unchanged.
    val COMPATIBILITY_PRO_LAUNCHER = Compatibility(
        name = "Pro Launcher",
        packageName = "app.prolauncher",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x111111, // The icon's near-black background (white glyph).
        signatures = setOf("07fd559fb0d1e34ee71433f11e1ca05945a069f8009d7214f74c3770a6bd6da7"), // Google Play app signing key
        targets = listOf(AppTarget(version = "v2.4.3", versionCode = 271))
    )

    // Verified 2026-10-26 against bitpit.launcher 1.16.33 (versionCode 1639, owner-supplied
    // universal APK from APKCube; signer CN=Peter Huber, SHA-256 ccb91800...98ed, the same cert as
    // the APKPure 1.16.28 build). App code and the bundled androidx/Kotlin/Firebase classes are
    // R8-renamed into b/*; the WorkManager worker classes keep their names. Disable telemetry:
    //   - The six telemetry workers (GdprConsentSyncWorker, RetentionEventsWorker, the three
    //     Singular report workers and UsageReportUploadWorker) return Result.success() at entry
    //     from their renamed doWork (each one's only instance (1 arg)Object method). Success is
    //     found by its "Success {mOutputData=" toString; success() is its superclass's only static
    //     no-arg method returning it.
    //   - The Singular request sender (the only method with the "attribution" path string, shape
    //     (String, L, KSerializer, L)Object) returns Unit at entry; Unit is the class whose
    //     toString is "kotlin.Unit", and its INSTANCE field is the sender's own sget-object.
    //   - The app's Crashlytics enable method (()V, UUID.randomUUID + putString of
    //     "bitpit.launcher.key.CRASHLYTICS_USER_ID", in the class whose constructor throws
    //     "FirebaseCrashlytics component is not present.") returns at once.
    //   - The "firebase_analytics_collection_deactivated" read answers TRUE (shared
    //     forceAnalyticsDeactivated, bytecode only, no resource re-encode): the app turns
    //     collection on after its terms screen, and the deactivated switch overrides that.
    // NiagaraSmokeTest asserts all four steps. The CLI (no -f) applies it and exactly these 9
    // methods change; resources.arsc and AndroidManifest.xml stay byte-identical. Emulator (x86_64,
    // stock re-signed vs patched, analytics allowed): Firebase Analytics logged 28 events in stock
    // and 0 patched ("deactivated via the manifest"); the consent-sync and Singular workers succeed
    // at once without sending, the follow-up Singular workers are never queued, no retries, no
    // crash, the launcher works. Side effect: the consent choice is no longer synced to Niagara's
    // server. HTTP traffic was not captured (the app does not log requests), and a local
    // crashlytics.installation.id is still created.
    // Enable Premium (2026-10-27): Niagara keeps its Pro entitlement as a three-boolean account
    // state (1.16.33: b/gzD9a0YbOD6gO7InQ4, toString "E(1=%s, 2=%s)") that the account JWT parse
    // builds from the "pro" claim and "flg" bit 0x20000 (a free/no-claim state is
    // (false,false,true), a Pro claim is (true,true,false)). The first flag is the Pro switch read
    // by ~100 methods (settings header, feature gates); the second is the account access switch
    // AccessDeniedActivity finishes on; the third is the app's own trial/no-claim value. The patch
    // finds the account record constructor (UUID, String, String, <flags>, com.auth0.android.jwt.*),
    // takes the flags type from its 4th parameter, checks it is three booleans with equals and a
    // (Z,Z,Z) constructor, and loads 1 into the constructor's first two parameters at entry. The
    // JWT parse, the DataStore and the Play Billing publishers are left alone, so the third flag
    // keeps the value the app built. NiagaraSmokeTest asserts the two constants and that the rest
    // of the constructor is the stock body. The CLI (no -f) applies it with Disable telemetry;
    // resources.arsc and AndroidManifest.xml stay byte-identical. Emulator (x86_64, stock re-signed
    // vs patched, same data): stock's Niagara settings header shows "Free version" and the Pro
    // screen offers the trial; patched shows no "Free version" line and the Pro screen reads
    // "Thank you for your support." (Discover features / Manage membership), no crash, the home
    // screen works. Account sync is server-backed and still needs a real account.
    // 2026-11-03: updated to version 1.16.34 (versionCode 1640; Google Play arm64 splits via
    // gplaydl, merged; same CN=Peter Huber cert ccb91800...98ed). Both patches apply unchanged:
    // NiagaraSmokeTest passes all five steps (the account state is now b/yqYBor9KUlEcq5s13TeGY4W4Qv1i),
    // and the CLI (no -f) applies Disable telemetry + Enable Premium; apkanalyzer shows the six
    // workers' doWork returning Result.success(), the Singular sender returning Unit, the
    // Crashlytics enable method's return-void, the analytics read forced to Boolean.TRUE and the
    // (Z,Z,Z) constructor starting with const/4 p1/p2 = 1; resources.arsc and AndroidManifest.xml
    // stay byte-identical. 2026-11-03 emulator: cold starts OK, settings no longer say "Free version", the Pro screen says "Thank you for your support."
    // 2026-11-04: updated to version 1.16.35 (versionCode 1641; APKPure universal APK with all four
    // ABIs, since Google Play still served 1.16.34 to our account; same CN=Peter Huber cert
    // ccb91800...98ed). Both patches apply unchanged: NiagaraSmokeTest passes, the CLI (no -f)
    // applies Disable telemetry + Enable Premium, apkanalyzer shows the six workers' doWork
    // returning Result.success(), the Singular sender returning Unit, the Crashlytics enable
    // method's return-void, the analytics read forced to Boolean.TRUE and the account state's
    // (Z,Z,Z) constructor (now b/U1OKOurdkv) starting with const/4 p1/p2 = 1; resources.arsc and
    // AndroidManifest.xml stay byte-identical. Not run on a device yet.
    val COMPATIBILITY_NIAGARA = Compatibility(
        name = "Niagara Launcher",
        packageName = "bitpit.launcher",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x03004C, // The adaptive icon's background colour (ic_launcher_background).
        signatures = setOf("ccb918002c40334b416899258de4f730a36c5d38821b3cb6fcb8c15a4b8198ed"), // CN=Peter Huber
        targets = listOf(AppTarget(version = "1.16.35", versionCode = 1641))
    )

    // Verified 2026-10-15 against mark.via.gp 7.3.3 (versionCode 20260823, single universal
    // APK, no native libs; signer CN=Various Tu, C=CN, SHA-256 3df7f89d...a390, same on APKMirror
    // and APKPure; Play developer Tu Yafeng). No packer or shield. Launcher label "Via". The
    // app and the bundled Firebase SDK are R8-renamed (FirebaseAnalytics keeps its class name, but
    // logEvent is a(String, Bundle) and setAnalyticsCollectionEnabled is stripped). Telemetry is
    // Firebase Analytics only; the tracker's crash method logs locally and Crashlytics never starts
    // (no FirebaseInitProvider). Disable telemetry: the tracker's event sink (7.3.3: t8/b.a, found
    // by its (String, Map)V shape plus its call to FirebaseAnalytics' only (String, Bundle)V
    // method) returns at once, and the manifest gets firebase_analytics_collection_deactivated =
    // true for the automatic events. The tracker init (t8/f.i) is left alone, because the hub
    // queues events until a tracker registers. The remote config fetch (c.viayoo.com/api/frontend),
    // which carries identifiers, is deliberately left alone as functional (it drives app
    // features), as are update/sync (app.viayoo.com), report-abuse and the ad-block filter list
    // downloads. ViaSmokeTest asserts the sink and the manifest switch. CLI (no -f) rewrites only
    // t8/b plus the manifest; apkanalyzer shows return-void first in the sink and the meta-data set
    // to true. Emulator (FA verbose logging): stock logs 5 events (first_open, session_start,
    // fetch_conf, channel_new_unknown, search_google); patched logs "App measurement deactivated via
    // the manifest" and 0 events; browsing, search, bookmarks, settings and ad blocking work. The
    // manifest edit re-encodes resources; the UI was checked in English only.
    val COMPATIBILITY_VIA = Compatibility(
        name = "Via",
        packageName = "mark.via.gp",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFFB700, // The icon's largest stroke (amber; with red and blue, on white).
        signatures = setOf("3df7f89d3b8d1315f05710c914fccbcf3a4e24980afddccb8dcebde90836a390"), // CN=Various Tu
        targets = listOf(AppTarget(version = "7.3.3", versionCode = 20260823))
    )

    // Added 2026-10-16 against ro.rcsrds.digisport 1.1.15 (versionCode 75, single universal APK;
    // signer CN=DigiSport, O=RCS&RDS, L=Bucharest, C=RO, SHA-256 014322fe...80c2853). Launcher label
    // "DigiSport". App code (ro.rcsrds.digisport.*) and its player library (ro.rcsrds.lib.player.*)
    // are not obfuscated, so every anchor is a readable class + method name with its full signature.
    // Disable ads: AdMobManager.loadAd hides the container and returns, requestAd / putAd return at
    // once (the app's only AdRequest / AdView.loadAd); VHSectionAd.bind sets the ad row GONE with
    // a 0 layout height; UiLivePreroll.getEnable answers false (no live "Reclama" pre-roll);
    // ArticleApiPayloads.getMVideoPreroll answers "" (no article/VOD pre-roll in GetArticleVod);
    // ExtensionServiceKt.initImaAds answers null, so media3 plays any item that still carries an
    // ad tag without ads (PlayerService.onCreate ignores the result; every mImaPreRoll reader
    // null-checks). MobileAds (never called by the app) and SatiManager (analytics) are untouched.
    // Disable ads also returns a new empty ArrayList from the four server
    // "ads" list getters (ApiArticleData/ApiEpgData.getAds, listingArticles.Data.getAdsList,
    // APIResultsResponseData.getAds), answers false from GetArticleDetailsLiveTab1.adConstraints
    // (<ad-api> elements), null from GetArticleDetailsWidgets.addAdWidget and returns early from
    // SyncEpgRepositoryBase.addBanner. Hide betting odds: UIResultsMatch.getBet answers null (the
    // odds block @id/nas goes GONE). Disable telemetry: manifest Firebase switches (Analytics and
    // Performance deactivated, Crashlytics off), FirebaseCrashlytics/FirebasePerformance collection
    // setters forced off, Crashlytics recordException/log/sendUnsentReports, CxenseSdk.pushEvents
    // and FirebaseAnalytics.logEvent return early; FCM is untouched. Disable update prompts:
    // MainActivityBase.checkUpdate returns early. Skip ad consent form: GoogleConsentUmp
    // .loadConsentInfo posts SUCCESS and returns before any UMP call, and
    // IncludeSettingsUserDataAdsBindingImpl.executeBindings first sets its root (mboundView0) GONE,
    // hiding the then buttonless "Publicitate" block in Settings / GDPR details. Hide sponsored articles:
    // listing and widget cards with a non-blank ApiArticle.getSponsored are skipped / become
    // spacing. Hide promotions: "widgetCross" cards become spacing and get no heading, and
    // HomeViewModel.getExclusiveVideo returns early. Verified 2026-10-16: DigiSportSmokeTest
    // (all eight patches); CLI (no -f) applies all eight and changes exactly the 23 hooked
    // classes plus the three manifest meta-data (the manifest edit re-encodes resources.arsc; no
    // visible effect); emulator, two cold starts, no crash: the UMP form, the Temu test-ad rows in
    // the home feed, articles and ProgramTV (no gaps left) and the Settings "Publicitate" block
    // are gone, an article video plays, and logcat shows "App measurement deactivated via the
    // manifest" and Performance off. Not seen on the emulator: betting odds (none shown by stock
    // either), a "Reclama" pre-roll (no ad fill), sponsored / cross-promo cards, the Home
    // "Exclusive online" bar and a Play update prompt.
    val COMPATIBILITY_DIGISPORT = Compatibility(
        name = "Digi Sport",
        packageName = "ro.rcsrds.digisport",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1D56A8, // The icon's blue gradient (mid-tone).
        signatures = setOf("014322fe24ad21500ec22894f597be2f29904fe0762f7a27b887762de80c2853"), // CN=DigiSport, O=RCS&RDS
        targets = listOf(AppTarget(version = "1.1.15", versionCode = 75))
    )

    // Same app, used only by "Disable live stream ads", so Morphe Manager flags it as experimental
    // (2026-10-16, 1.1.15 / versionCode 75). UiLiveDai.getEnable answers false, so live channels
    // are built from the plain stream (UiLiveStream.getMUrl) instead of the IMA DAI ssai:// item,
    // and ExtensionServiceKt.updateAdViewForDai returns at once. The plain stream is only fetched
    // when the channel config carries a livestream URL, so a DAI-only channel would not play.
    // Smoke- and decompile-verified; the emulator run passed (no crash) but live playback could not
    // be checked: LiveTv is geo-blocked to the DIGI network ("LIVE stream-ul este disponibil doar
    // din reteaua DIGI") for the stock app too. Stays experimental until a DIGI-network user confirms.
    val COMPATIBILITY_DIGISPORT_EXPERIMENTAL = Compatibility(
        name = "Digi Sport",
        packageName = "ro.rcsrds.digisport",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1D56A8,
        signatures = setOf("014322fe24ad21500ec22894f597be2f29904fe0762f7a27b887762de80c2853"), // CN=DigiSport, O=RCS&RDS
        targets = listOf(AppTarget(version = "1.1.15", versionCode = 75, isExperimental = true))
    )

    // Smoke-tested 2026-10-17 against com.football433 2.3.548 (versionCode 868, APKPure XAPK
    // merged, arm64-v8a only; APKMirror has no listing). Signer: the Play app-signing key
    // (CN=Android, O=Google Inc., SHA-256 87a49808...b2d0) with a Play source stamp
    // (2026-09-30), so there is no developer certificate to compare. Launcher label
    // "433 Football". A Flutter app: the UI is Dart (libapp.so); the Java plugins are R8-renamed,
    // so every anchor is a method-channel string, a kept SDK class/method name or a method shape.
    // Disable ads: AdMob / Ad Manager ads come only from the google_mobile_ads plugin (Dart in this
    // build uses loadBannerAd, loadAdManagerBannerAd and loadRewardedInterstitialAd). The
    // AdInstanceManager is found by its onAdFailedToLoad event method ("adId", "eventName",
    // "onAdFailedToLoad", "loadAdError"; (int, FlutterLoadAdError)V) and trackAd ("Ad for
    // following adId already exists: %d"), whose first parameter is FlutterAd. In
    // GoogleMobileAdsPlugin.onMethodCall (the (MethodCall, Result)V with every load* string) each
    // of the 9 load cases calls trackAd(ad, adId) and then the ad's no-arg load; those 9 calls
    // resolve to 8 load methods (the fluid ad inherits the Ad Manager banner's) and cover all 9
    // concrete FlutterAd classes. Each load now calls a new manager helper (morpheFailLoad(I)V)
    // that builds FlutterLoadAdError(3 = NO_FILL, "com.google.android.gms.ads", "Ad blocked",
    // null) and passes it to onAdFailedToLoad, and returns before any ad view or SDK call. The
    // plugin codec writes the null ResponseInfo as null; the platform-view factory returns an
    // empty View for an ad without a view; show and immersive-mode calls null-check the ad.
    // MobileAds.initialize (and with it Liftoff/Vungle adapter init, which loads no ads) and
    // the unused preloader (MobileAds#startPreloading is absent from libapp.so) are untouched.
    // Rewarded interstitials fail to load like every other ad. Football433SmokeTest asserts the
    // helper and every load prologue.
    // Decompile-checked 2026-10-17 (CLI, no -f): the helper, all 8 load prologues (+5
    // instructions each, nothing dropped) and the untouched onMethodCall/initialize match.
    // Emulator 2026-10-17 (stock control, same test key, ARM translation): stock shows the Home
    // carousel ad, the Matches "Sponsored" card and banner, and match-overview/line-ups banners;
    // patched shows none of them and leaves no ad box (a little extra spacing on the match
    // overview), no ad log lines in 60 s idle (so no retry loop), no crash in either build. The
    // wallpaper "Download [AD]" button: stock plays a rewarded ad first; patched downloads at
    // once. That is the app's own reaction to the failed load, not a patched reward path.
    // 2026-10-23: target moved to 2.3.585 (versionCode 905; APKPure XAPK, armeabi-v7a only, same
    // signing certificate). Only R8 renames (plugin classes P8 -> w9, UXCam/Branch handlers); every
    // string and shape anchor is still unique and the smoke test passes unchanged. CLI decompile
    // (no -f): 28 hooked methods change plus the added NO_FILL helper, resources byte-identical.
    // Not run on the emulator (armeabi-v7a only, which the emulator cannot install).
    val COMPATIBILITY_FOOTBALL433 = Compatibility(
        name = "433",
        packageName = "com.football433",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xF1FF00, // The adaptive icon's neon yellow background.
        signatures = setOf("87a49808a3bbed73e6af698a594f2ef984d35a36bda298eb400a5b2ed29fb2d0"), // Google Play app signing key
        targets = listOf(AppTarget(version = "2.3.585", versionCode = 905))
    )

    // Same app, used only by "Disable telemetry", so Morphe Manager flags it as experimental
    // (2026-10-17, 2.3.548 / versionCode 868; smoke- and decompile-checked, effect not visible on
    // the emulator, see below). The manifest gains
    // io.sentry.enabled=false: Dart starts Sentry Android through JNI, the SDK applies the manifest
    // before Dart's options callback (which never calls setEnabled) and Sentry.init stops when
    // disabled; Dart's envelopes go through the native SDK. UXCam: the flutter_uxcam
    // startWithConfiguration handler ((Map, Result)V with "userAppKey" and
    // "enableMultiSessionRecord") answers false at once, and every static void UXCam.start*
    // returns at once. Airship: AirshipConfigOptions$Builder.getAnalyticsEnabled answers false
    // (push and channel registration stay; event-triggered in-app automations stop). Branch: both
    // flutter_branch_sdk readers of the "branchAttributionLevel" argument (init and
    // setConsumerProtectionAttributionLevel) get "NONE" (tracking disabled, deterministic deep
    // links only; share links may come out in long form). Not covered: Segment and the app's own
    // analytics.prod.by433.com collector, both sent by Dart over HTTP with keys from
    // flutter_assets/env/.env.prod (blanking them could make Dart throw). Firebase Analytics is
    // not bundled: the GMA measurement client disables itself, so no Firebase flag is set.
    // Decompile-checked 2026-10-17 (every hook and the one-line manifest change). On the emulator
    // neither stock nor patched logged Sentry, UXCam or Branch lines, so the effect can't be told
    // apart there; Airship push work still runs, as intended. Stays experimental.
    // 2026-10-23: moved to 2.3.585 with the main entry (telemetry anchors unchanged apart from R8 renames).
    val COMPATIBILITY_FOOTBALL433_EXPERIMENTAL = Compatibility(
        name = "433",
        packageName = "com.football433",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xF1FF00,
        signatures = setOf("87a49808a3bbed73e6af698a594f2ef984d35a36bda298eb400a5b2ed29fb2d0"), // Google Play app signing key
        targets = listOf(AppTarget(version = "2.3.585", versionCode = 905, isExperimental = true))
    )

    // Written 2026-10-17 against com.mail.mobile.android.mail 9.18.3 (versionCode
    // 405213, APKMirror bundle merged). Signer CN=Raimund Rix, OU=Mobile & Media Services, O=1&1
    // Mail & Media GmbH, SHA-256 07ada088...dfbe, the same as on APKMirror. The app classes are not
    // R8-renamed, but the remote-config models are still found by their toString() output and
    // the methods by name plus shape (concrete only).
    //   - Disable ads: AdvertisingIdentityConfig ("AdvertisingIdentityConfig(isId5Enabled=")
    //     answers false from isAdEnabled, isGoogleInboxAdEnabled, isGoogleBannerEnabled,
    //     isHtmlBannerEnabled, isEndlessIbaEnabled, isMetaNativeIBAsEnabled,
    //     isMetaNativeBannerEnabled, isAdsInCustomFoldersEnabled and isId5Enabled (the patch fails
    //     if one is missing); isUnifiedInboxAdsEnabled is inverted and left alone.
    //     InterstitialAdConfig.isEnabled ("InterstitialAdConfig(isEnabled=") answers false, and
    //     AdTracker.send (the (String)V with the "AdTracker: url is null or invalid" and
    //     "AdTracker failed" logs), which only sends ad pixels, returns at once. The paid ad-free
    //     state (PayMailManager / BillingAdFreeStateProvider), the News userlevel field and the
    //     MobileAds statics are not touched. The server's inbox promo cards go away too.
    //   - Disable telemetry: Tracking2Config.isTracking2Enabled ("Tracking2Config(batchSize=")
    //     and AppMonConfig.isAppMonEnabled ("AppMonConfig(isAppMonEnabled=") answer false;
    //     TrackingPermissions(ZZZZZ) ("TrackingPermissions(isBrainTrackingAllowed=") sets Brain,
    //     Reach (INFOnline) and Trop false at entry, the registers taken from their iput-boolean
    //     stores (p1..p3 here); SentryAPI.start (the instance (1 arg)V calling SentryAndroid.init;
    //     the manifest has io.sentry.auto-init=false) returns at once. FCM push is untouched.
    //   - Disable rating prompts: InAppRatingManager.canRequestInAppReviewFlow()Z (reads the
    //     clock) answers false; it gates the only Play review request, after a mail is sent.
    //   - Hide upsells: Swipe2UpsellFeature.isEnabledByConfig (the ()Z returning
    //     isSwipe2UpsellEnabled) answers false, so swiping ads away no longer opens the upgrade
    //     sheet. IapUpsellingFeature is not touched: it also gates the Settings "Upgrade" row and
    //     the drawer's Premium item.
    // Decompile-checked 2026-10-17 (CLI, no -f: every hook, nothing dropped, ad-free entitlement
    // and IapUpselling untouched, resources byte-identical). Emulator 2026-10-17, logged out
    // (stock control): 2 cold starts each, no crash; the start screen and login load. The inbox
    // ads, promo cards, rating prompt and upsell sheet sit behind a login, so those effects are
    // verified in bytecode only.
    // 2026-10-25: updated to version 9.19.0 (versionCode 405215; APKPure XAPK merged, same signer);
    // every patch anchor is unchanged. MailcomSmokeTest needed one fix: 9.19.0 replaced the
    // IapUpsellingFeature toggle with the per-account suspend check
    // UpsellFeatureImpl.isIapUpsellEnabled(Account, Continuation), so the test's "left untouched"
    // check now looks at that method; it passes on patcher 2.0.0.
    // 2026-11-04: updated to version 9.20.2 (versionCode 405218; Play arm64 split bundle merged,
    // same signer). All four patches apply unchanged: MailcomSmokeTest green and CLI without -f
    // applied them.
    val COMPATIBILITY_MAILCOM = Compatibility(
        name = "mail.com",
        packageName = "com.mail.mobile.android.mail",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x283167, // The adaptive icon's navy background.
        signatures = setOf("07ada0886afd11865d631373b2078ee6d15d8c4769f622b890bcbef778ccdfbe"), // CN=Raimund Rix, O=1&1 Mail & Media GmbH
        targets = listOf(AppTarget(version = "9.20.2", versionCode = 405218))
    )

    // Updated 2026-10-23 to com.eurosport 8.34.1 (versionCode 113929; replaces 8.33.0 /
    // 113758). Signer: v3.1 key rotation; the developer cert CN=Unknown, OU=Eurosport,
    // O=Eurosport, L=Issy, C=fr (SHA-256 03428013...9a17) signs for SDK 24-32 and the rotated
    // Google key (CN=Android, SHA-256 cabdcdfd...09a1) for SDK 33+; apksigner verifies the
    // lineage. 8.34.1 dropped PlayerModel (and its showAds flag), so Disable ads step 3 now nulls
    // PlayerMediaInfo's adsMetadata instead; every other anchor is unchanged. EurosportSmokeTest
    // passes on 8.34.1 (2026-10-23). Decompile-checked on 8.34.1 (CLI, no -f): exactly the 37
    // hooked methods change, the null store sits right before the only adsMetadata write, and
    // the string values are unchanged. Emulator on 8.34.1 (stock control): no crash; the home
    // GAM banner and native ad card are gone and an on-demand video plays with no FreeWheel or
    // doubleclick requests. Not seen: in-app live playback (live cards open HBO Max on the web)
    // and the partner-promo banner.
    // Written 2026-10-17 against 8.33.0 (APKMirror bundle merged).
    // The app is R8-renamed almost everywhere, so its models are found by their toString()
    // output and the methods by shape; the Storyteller, Teads, Comscore, New Relic, AppsFlyer and
    // Apptentive SDKs keep their class names. EurosportSmokeTest asserts every hook. On 8.33.0 a
    // CLI build (no -f) applied all three patches and changed the 13 hooked classes; a dexdump of
    // the SdkConfig, PlayerModel, Settings, StorytellerEventTrackingOptions and setModules hooks
    // matched, and the string values were unchanged after the manifest edit (aapt2 diff of every
    // string, plurals and array entry, rule 12).
    // Limitation: ads inserted into live and premium streams (AdSparx SSAI) and video
    // entitlement / DRM are server-side and not touched.
    //   - Disable ads: the SdkConfig model ("SdkConfig(sdk=") constructor stores enabled = false
    //     for GOOGLE_AD and TEADS (matched by the Sdk enum's name()), so the ad view factory makes
    //     a 0x0 view; the only static (1 arg) AdPlaceholderModel factory ("AdPlaceholderModel(
    //     content=", in the class with "Unsupported provider: ") answers null; PlayerMediaInfo
    //     ("PlayerMediaInfo(id=") stores null as adsMetadata (its only final field of the
    //     "AdsMetadata(id=" type, cross-checked against what toString prints after
    //     "adsMetadata="), so the player sets up no IMA ads (8.33.0 instead forced PlayerModel's
    //     showAds false); Storyteller Settings (both constructors) store AdSource.NoAds (the enum
    //     with NoAds / IntegratingApp / Storyteller); StorytellerClipsAdConfiguration
    //     getBottomBannerEnabled / getPreRollEnabled answer false; Storyteller.setModules gets an
    //     empty list (the patch fails if a non-ads StorytellerModule exists; the app registers
    //     only StorytellerGamModule); the app's TeadsAdPlacementMedia creator (load()V) returns
    //     at once. MobileAds and MobileAdsInitProvider are not touched.
    //   - Disable telemetry: SdkConfig stores enabled = false for ADOBE, APPSFLYER, CHARTBEAT,
    //     PERMUTIVE, MUX and MEDIAMELON (STORYTELLER keeps the server value; both blocks can be
    //     applied together); com.comscore.Analytics.start(Context) and its static notify*
    //     methods, NewRelic.start(Context), the AppsFlyerLib subclass's start / logEvent /
    //     logSession / logAdRevenue and Apptentive register / engage return at once;
    //     StorytellerEventTrackingOptions(ZZZZZZList) stores false for enableStorytellerTracking,
    //     enableUserActivityTracking, enableAdTracking and enableFullVideoAnalytics (registers
    //     taken from the field stores); the manifest gains firebase_analytics_collection_
    //     deactivated=true, google_analytics_adid_collection_enabled=false and
    //     firebase_crashlytics_collection_enabled=false. Firebase Messaging, Remote Config and
    //     Batch are untouched. AppsFlyer deep links may stop.
    //   - Hide partner promotions (off by default): the only static (1 arg) WatchBannerUi
    //     factory ("WatchBannerUi(label=") answers null, which also hides the HBO Max /
    //     discovery+ links to the event.
    // Decompile-checked on 8.33.0, 2026-10-17 (CLI, no -f; jadx confirms the SdkConfig blocks
    // clear the ad/telemetry vendors and never STORYTELLER; the string table is unchanged).
    // Emulator on 8.33.0, 2026-10-17 (stock control): 2 cold starts, no crash with Comscore/New Relic/Apptentive
    // stubbed; the home-feed "ADVERTISEMENT" card is gone and the feed closes up; a free clip
    // plays without pre-roll (stock showed none at that moment either); no
    // Comscore/NewRelic/Teads/Permutive/Chartbeat/Mux log lines. Not seen on either build:
    // Storyteller stories (the carousel didn't render) and the discovery+/HBO Max watch banner.
    val COMPATIBILITY_EUROSPORT = Compatibility(
        name = "Eurosport",
        packageName = "com.eurosport",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000, // The adaptive icon's black background.
        signatures = setOf("cabdcdfd15a3395a9cbcd9a073784338383f4260adf2f9b1125a512ca3fb09a1"), // Google Play app signing key
        targets = listOf(AppTarget(version = "8.34.1", versionCode = 113929))
    )

    // Verified 2026-10-17 against lequipe.fr 10.69.1 (versionCode 1616) in bytecode only (smoke
    // test + decompile check; no emulator run yet).
    // Source: an apkcube .apks (base + split_config.arm64_v8a, so arm64-v8a only) merged with
    // APKEditor. The apkcube splits are signed by the developer (CN=Xavier Debbasch, OU=Airweb,
    // SHA-256 6d9f086b...6e59, plus a Google Play source stamp); the merge breaks that signature.
    // No packer or PairIP.
    // Disable ads: every native ad goes through Google Mobile Ads / Ad Manager. The banner slots
    // call AdManagerAdView.loadAd(AdManagerAdRequest) and the bidding interstitial calls
    // AdManagerInterstitialAd.load from R8-renamed coroutines, so the patch anchors on the GMA
    // library classes only: every concrete void load / loadAd / loadAds on BaseAdView, AdLoader,
    // AdManagerAdView, AdManagerInterstitialAd, InterstitialAd, RewardedAd,
    // RewardedInterstitialAd and AppOpenAd returns at once (the app's two loads and the mediation
    // adapter's BaseAdView / InterstitialAd loads are mandatory), and the patch fails if any GMA
    // load call in the APK resolves to an unpatched method or the app stops calling the two Ad
    // Manager loads. Rule 9: all MobileAds static voids return at once (registerWebView, which
    // fr.lequipe.ads.a calls, is mandatory) and putPublisherFirstPartyIdEnabled answers false.
    // Teads (TeadsAdapter) and Equativ (SASGMAMediation*Adapter) only fill through GMA mediation
    // and Prebid / Amazon bid into the Ad Manager request, so they are covered. The ad listeners
    // get no callback, so a slot that reserves space before loading may stay blank.
    // Known limitations: Taboola Classic widgets (sponsored content, TBLClassicUnit) are not
    // covered, nor are ads inside L'Équipe's web/PWA pages. The paywall (Piano/Purchasely) is
    // server-side and untouched. LequipeSmokeTest asserts every hook.
    // Decompile-checked 2026-10-17 (CLI, no -f): the 9 GMA classes above change, every load and
    // MobileAds static void starts with return-void, putPublisherFirstPartyIdEnabled returns 0,
    // and the app's banner and interstitial call sites still call the patched loads.
    // Emulator 2026-10-17: not runnable here. The 10.69.1 source was arm64-only React Native, and on the x86_64
    // emulator SoLoader never finds its arm64 libs, so stock and patched both crash at start with the
    // same AssertionError (environment, not the patch). The target is EXPERIMENTAL until it is
    // checked on an arm64 device: ads gone, no empty boxes, no crash. Shipped in v1.17.0 as
    // experimental and on by default (owner decision; the arm64 device check is still pending).
    // 2026-10-23: target moved to 10.70.0 (versionCode 1620; APKPure XAPK, armeabi-v7a only, same
    // Airweb signing certificate). The GMA library anchors are unchanged; the app's banner and
    // interstitial callers were only renamed by R8. Smoke test and CLI decompile (no -f; the same
    // 25 GMA methods change) pass; not run on the emulator (an armeabi-v7a APK doesn't install on
    // it). Still experimental (arm64 device check pending).
    val COMPATIBILITY_LEQUIPE = Compatibility(
        name = "L'Équipe",
        packageName = "lequipe.fr",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0A1E32,
        signatures = setOf("6d9f086b1df6eb441304d1d114c674185c985bc46fafcb045211db6172bd6e59"), // CN=Xavier Debbasch, O=Airweb
        targets = listOf(AppTarget(version = "10.70.0", versionCode = 1620, isExperimental = true))
    )

    // Written 2026-10-17 against de.transfermarkt.v2 4.3.2 (versionCode 2075, Play bundle merged).
    // Signed with the Play App Signing key, cert SHA-256 69932f3c...4f08 (the merge breaks the
    // signature). The app is a Cordova + Ionic Angular web app in assets/www; the native plugins
    // keep their class names. A shared extension (extensions/transfermarkt) checks each WebView
    // request's host against a suffix blocklist and answers an empty 200 script on a match, because
    // the app's CMP / Adobe / SDG loaders only continue on script.onload. The hook goes at the start
    // of every concrete shouldInterceptRequest(WebView, WebResourceRequest) on Cordova's
    // SystemWebViewClient and its subclasses (4.3.2: the base class and the live client,
    // IonicWebViewEngine$ServerClient); InAppBrowser's client is not touched. Transfermarkt's own
    // hosts, Bitmovin, YouTube, Twitter and the Sourcepoint consent dialog are never blocked.
    //   - Disable ads: the admob-plus webview-ad lambda that calls MobileAds.registerWebView and logs
    //     "Integrated the WebView API for Ads in " returns at once; rule 9: every MobileAds static
    //     void returns at once (initialize and registerWebView mandatory; the web app never calls
    //     admob-plus start, and AdMob.execute is not touched); ad hosts (Ströer SDG, Yieldlove,
    //     Adscale, DoubleClick/GPT/AdSense, Outbrain, oddsserve) are blocked. A raw-resource step
    //     (no resource table re-encode, rule 12) hides <app-adtags>/<app-odd-banner> with a style
    //     before index.html's </head>, makes the main.<hash>.js AdtagService refreshAds /
    //     refreshSingleAds / appendAdtags / loadInterstitial (each the only definition with a
    //     parameter list) return at once, and empties the Outbrain feature's allow list.
    //     setGTM / adobeInit are not stubbed (dataLayer / tmAnalytics must exist).
    //   - Disable telemetry: Google Tag Manager / Analytics, Adobe (adobedtm, omtrdc, demdex), m6r
    //     and INFOnline hosts are blocked; cordova-plugin-idfa's getInfo (AdvertisingIdClient call +
    //     "aaid"/"trackingLimited") answers {aaid:"", trackingLimited:true}. No Firebase Analytics.
    // Consent (Sourcepoint), billing, login and push (OneSignal) are untouched.
    // TransfermarktSmokeTest asserts every hook and asset edit. Decompile check passed. Emulator
    // (morphe-play, arm64 under translation) 2026-10-17, stock re-signed vs both patches: no crash,
    // consent dialog still shown, home / article / match / player pages render with no ad frames or
    // gaps (stock showed banners), back button works. Push: neither run logged a token or a
    // Firebase error, so re-signed push is undetermined (same in stock).
    val COMPATIBILITY_TRANSFERMARKT = Compatibility(
        name = "Transfermarkt",
        packageName = "de.transfermarkt.v2",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x001AA3, // The adaptive icon's blue background.
        signatures = setOf("69932f3cc60e277715dd59f601a6ad3455b2850f03cace2131eef8ccb1454f08"), // Google Play app signing key
        // 2026-10-28: updated to 4.3.3 (versionCode 2078, arm64-v8a, same Play signer).
        // Disable ads and Disable telemetry apply unchanged: smoke test green and CLI without -f
        // applied both.
        targets = listOf(AppTarget(version = "4.3.3", versionCode = 2078))
    )

    // Written 2026-10-18 against org.mozilla.focus 158.0 (versionCode 402802337 for both the
    // x86_64 and arm64-v8a builds, APKMirror bundles), signer CN=Release Engineering, O=Mozilla
    // Corporation (cert SHA-256 6203a473...4ffc). Focus is built with -dontobfuscate and GeckoView
    // keeps its whole API, so class and method names are stable anchors.
    //   - Add-on support (extensions/firefoxfocus): WebExtensionController.setPromptDelegate wraps
    //     the delegate (stock Focus never answers install prompts, so installs hung); installs the
    //     manager starts are allowed with private browsing, anything else asks. FocusApplication
    //     .onCreate tracks the foreground Activity. WebExtensionBrowserMenuBuilder's constructor
    //     forces showAddonsInMenu and swaps onAddonsManagerTapped for the manager (install
    //     uBlock Origin / Violentmonkey / Tampermonkey / Dark Reader from AMO, settings, enable,
    //     update, remove).
    //     WebExtension$Action.openPopup shows popups in a GeckoView dialog. Installed add-ons are
    //     checked for updates on addons.mozilla.org at most once a day.
    //   - Enable about:config: GeckoRuntime.create(Context, GeckoRuntimeSettings) sets it first.
    //   - Disable telemetry: Glean is already off in Focus; the usage-reporting service and ping
    //     never start or send, the Daily usage ping setting defaults to off, Nimbus.fetchExperiments
    //     returns at once. Crash reports are untouched (Focus asks before each one).
    //   - Disable rating prompts: the inlined review step in MainActivity.onCreate ("Pending" /
    //     "ReviewNeeded" / "Reviewed") always reads "Pending".
    //   - Hide promotional prompts: Onboarding isCfrEnabled / isPromoteSearchWidgetDialogEnabled
    //     delegate reads are false (tips and the search-widget promo after erase).
    // FirefoxFocusSmokeTest and FirefoxFocusAddonsSmokeTest pass; CLI applies all five without -f
    // and the disassembly shows each change. Emulator (morphe-play, API 35, x86_64) 2026-10-18,
    // re-signed stock vs patched: no crash; uBlock Origin 1.75.0 and Violentmonkey 2.49.0
    // install from the manager, uBO blocks on canyoublockit.com and its popup renders, a Greasy
    // Fork userscript installs through Violentmonkey's confirm tab and runs, add-ons and scripts
    // survive Erase and two relaunches, about:config opens, Daily usage ping shows off. uBO's
    // "More" pane is empty, the same as in Firefox itself. Rating/promo patches bytecode-only.
    // 2026-10-25: updated to version 158.0.2 (versionCode 402940253, the Play build: APKPure
    // XAPK merged, armeabi-v7a, same Mozilla signer; Mozilla's archive builds use other per-ABI
    // codes). FirefoxFocusSmokeTest passes; CLI (no -f) applies all 5 patches, 14 methods change
    // plus the extension classes. Emulator not re-run for this bump.
    // 2026-10-26 (#86): the manager also offers Dark Reader (addon@darkreader.org); it has no
    // options_ui, so Open settings falls back to its popup page. FirefoxFocus smoke tests pass.
    // Emulator (morphe-test, arm64 158.0.2 merged from APKMirror, same signer, all 5 patches):
    // Dark Reader 4.9.133 installs from the manager, darkens example.com, its popup and Open
    // settings render, On/Off works, and it survives Erase and a relaunch; no crash.
    // 2026-11-03 (#121): "DNS filter" (opt-in; options dohUrl, default CleanBrowsing Family, and
    // dohMode strict|fallback), shared with Firefox (shared/misc/dns): GeckoRuntimeSettings
    // setTrustedRecursiveResolverMode / Uri / ExcludedDomains overwrite their argument at entry (3
    // TRR only, or 2 TRR first for fallback; the URL; an empty list), and GeckoRuntime.create
    // (Context, GeckoRuntimeSettings) calls the mode and URI setters first (Focus never sets them).
    // Focus has no Secure DNS setting to hide. GeckoView sets these as default prefs and resets
    // their user values on every start, so with Enable about:config a network.trr.* edit lasts
    // until the next restart. Strict means nothing resolves while the resolver is unreachable.
    // FirefoxFocusSmokeTest (default and fallback options) passes on 158.0.2; not runtime-tested.
    // 2026-11-04: updated to version 159.0.1 (versionCode 403061757, Play arm64 via gplaydl, same
    // Mozilla signer). 159 replaced the browser menu with Android Components' Compose menu, so
    // WebExtensionBrowserMenuBuilder (Add-on support step 3 up to 158) is gone. Add-on support now
    // hooks BrowserMenu.menuGroupsFor(BrowserState, Drawable) at its return-object: addMenuItems
    // adds a row before the "settings" row with each enabled add-on's browser action (title,
    // GeckoView icon, the selected tab's override) and "Extensions" (the manager). Taps are Focus
    // MenuItemTapped events with a ToolbarMenu$FocusMenuItem proxy; MenuMiddleware.invoke (only the
    // erased (Object, Object, Object) bridge is left, matched by name + arity) passes the action to
    // onMenuAction first, Focus dismisses the menu and the extension runs the entry. The Compose
    // menu classes are reached by reflection (R8 narrows StandardMenuItem's constructor per release).
    // The other patches apply unchanged. Both FirefoxFocus smoke tests pass; not runtime-tested.
    val COMPATIBILITY_FIREFOX_FOCUS = Compatibility(
        name = "Firefox Focus",
        packageName = "org.mozilla.focus",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x7542E5, // The icon's purple.
        signatures = setOf("6203a473be36d64ee37f87fa500edbc79eab930610ab9b9fa4ca7d5c1f1b4ffc"), // CN=Release Engineering, O=Mozilla Corporation
        targets = listOf(AppTarget(version = "159.0.1", versionCode = 403061757))
    )

    // Written 2026-10-18 against org.mozilla.firefox 158.0 (versionCode 2016189054 for x86_64 and
    // 2016189050 for arm64-v8a, APKMirror standalone APKs), signer CN=Release Engineering,
    // O=Mozilla Corporation (cert SHA-256 a78b62a5...9b04). Fenix is built with -dontobfuscate and
    // GeckoView keeps its API, but R8 inlines single-caller getters and narrows signatures, so
    // anchors are class + name + parameters, never a fixed return type.
    //   - Disable telemetry: every Glean PingUploader that builds HttpStatus answers HttpStatus(200)
    //     at once (pings are dropped as sent); Settings telemetry / daily usage ping / marketing /
    //     experimentation getters are false; Adjust initSdk/enable/trackEvent/trackThirdPartySharing
    //     /gdprForgetMe return; SentryService.initIfNeeded returns and every CrashReporterService
    //     report overload (Sentry, Socorro) sends nothing; Nimbus.fetchExperiments returns.
    //   - Hide sponsored content: contile / Pocket sponsored stories / sponsored suggestions getters
    //     and isPocketSponsoredStoriesFeatureEnabled are false; MacTopSitesProvider.getTopSites
    //     answers EmptyList. Non-sponsored suggestions stay.
    //   - Enable about:config: GeckoRuntimeSettings$Builder.aboutConfigEnabled(Z) gets true.
    //   - Unlock secret settings: getShowSecretDebugMenuThisSession is true and FeatureFlags
    //     customExtensionCollectionFeature is stored true after its <clinit> store.
    //   - Hide promotional prompts: NimbusMessagingStorage.getNextMessage(String, List) is null,
    //     microsurveys off, MessageNotificationWorker succeeds at once, HomeActivity.onCreate's
    //     isDefaultBrowser result is true, the onboarding filter lambda drops the default-browser
    //     card (proved at patch time through OnboardingCardType and the WhenMappings switch) and
    //     the sync sign-in page, ContinuousOnboardingFeature.start returns, ShowReviewPromptBinding
    //     .onState returns Unit. Sign-in in the menu and settings is untouched.
    //   - Keep background tabs loaded (default off, experimental): ServiceAllocator$InstanceInfo
    //     .setPriorityLevel raises IDLE to BACKGROUND for content processes; tab reload cover on.
    // FirefoxSmokeTest passes; CLI applies all six without -f on both ABIs; the decompile check
    // found exactly the 18 intended classes changed. Emulator (morphe-play, API 35, x86_64)
    // 2026-10-18, re-signed stock vs patched: no crash; no default-browser card or system prompt
    // (stock showed both), no sponsored shortcuts (stock: adidas, Trip.com), about:config opens,
    // Secret Settings / Install extension from file / custom collection shown, Data collection
    // toggles off, no Nimbus fetch in logcat, uBlock Origin installs from AMO and blocks. With
    // the tabs patch, background tab processes sat at adj 0-100 in the foreground (stock not
    // measured). Sponsored stories and sponsored suggestions did not appear on stock in that run,
    // so those two steps are bytecode-only. Re-signing may break Send Tab and web push.
    // 2026-10-25: updated to version 158.0.2 (archive.mozilla.org, arm64-v8a 2016191570; x86_64
    // 2016191574 read from Mozilla's x86_64 build; same Mozilla signer). FirefoxSmokeTest passes;
    // CLI (no -f) applies all 6 patches and only the intended 37 methods change (+1 helper).
    // Emulator not re-run for this bump.
    // 2026-11-03: updated to 159.0 (Play arm64 build via gplaydl, versionCode 2016191887; x86_64
    // 2016191886 read from Mozilla's archive x86_64 build, same signer; Mozilla's archive arm64
    // build is 2016191882), all 6 patches apply unchanged; smoke + CLI without -f.
    // 2026-11-03 emulator: stock and patched cold starts OK, no crash.
    // 2026-11-03 (#121): "DNS filter" (opt-in; options dohUrl, default CleanBrowsing Family, and
    // dohMode strict|fallback). The GeckoView half is shared with Focus (see there: the TRR mode /
    // URI / excluded-domains setters are pinned and GeckoRuntime.create applies them). Fenix only:
    // Settings.getDohSettingsMode() returns Engine$DohSettingsMode MAX (INCREASED for fallback),
    // and SettingsFragment.onResume passes false to the DNS over HTTPS preference's setVisible
    // (the value read from showDohEntryPoint$delegate), so the entry is hidden, not removed.
    // DoH exceptions the user adds are dropped. With Enable about:config a network.trr.* edit
    // lasts until the next restart. Strict means nothing resolves while the resolver is
    // unreachable. FirefoxSmokeTest (default and fallback options) passes on 159.0; not
    // runtime-tested.
    val COMPATIBILITY_FIREFOX = Compatibility(
        name = "Firefox",
        packageName = "org.mozilla.firefox",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF7139, // The icon's orange.
        signatures = setOf("a78b62a5165b4494b2fead9e76a280d22d937fee6251aece599446b2ea319b04"), // O=Mozilla Corporation
        targets = listOf(
            AppTarget(
                version = "159.0",
                versionCodes = mapOf(SupportedAbi.X86_64 to 2016191886, SupportedAbi.ARM64_V8A to 2016191887),
            )
        )
    )

    // Written 2026-10-17 against com.bleacherreport.android.teamstream 11.12.0.33 (versionCode
    // 54053, APKMirror bundle), developer signer CN=Sam Parnell, OU=Bleacher Report (cert SHA-256
    // 60baa405...a4f0). The app (com.bleacherreport.phoenix) and its Kotlin runtime are R8-renamed
    // but keep .source names and toString strings; Unit and Result.failure are copied from the
    // patched methods' own code, never hard-coded. Launch tasks are found by the task id string in
    // their config's <clinit>, the LaunchTask base by its "...launchtaskmanager.LaunchTask" cast
    // message and ExecutionResult.Success by "Success(taskId=".
    //   - Disable ads: AdConfigInteractorImpl ("getFeaturesAdConfig() " + "Returning hardcoded ad
    //     config") answers Result.failure(AdConfigException) at entry; AdContentInserterImpl
    //     (AdContentInserterImpl.kt, "content"/"ads"/"channelAdUnit") gets an empty ad list and no
    //     alerted ad; AdsManagerImpl loadAd ("Ad Unit is missing in ") returns at once, loadSplashAd
    //     ("loadSplashAd() ad=") answers its "Ad Unit is missing" failure and the Amazon DTB start
    //     ("Amazon Services SDK could not be started") returns Unit; AdSetupLaunchTask and
    //     SplashAdLaunchTask answer Success(taskId). Rule 9: every MobileAds static void returns at
    //     once (initialize and registerWebView mandatory), putPublisherFirstPartyIdEnabled is false.
    //     Video ads are server-stitched (SSAI) into the streams and are not patched.
    //   - Disable telemetry: MParticleLaunchTask (mParticle and its Apptentive kit),
    //     DatadogLaunchTask and ComScoreLaunchTask answer Success; every comScore Analytics static
    //     void returns at once; Crashlytics DataCollectionArbiter ("firebase_crashlytics_collection_
    //     enabled manifest flag") answers false; the 3 Branch reads of "bnc_tracking_state" are
    //     forced to true (tracking disabled; the SDK still starts); Beam PersistentEventQueue.add
    //     ("EnrichedEventQueue.add(): exception") and EventQueueMonitor ("onTaskExecution skipped,
    //     mode is ") return Unit; CanonicalEventInteractorImpl ("br-braze-event-forwarding", 2 args)
    //     returns Unit, so no Braze custom events. Braze init/push, OneTrust consent, IsdkLaunchTask
    //     and Prism/PSM are not touched.
    //   - Hide betting content: the ChannelItemsMapper.kt Stats mapper answers null for the
    //     StatsItemType betting/odds/line/prop types (Stats found by "Stats(type="); the
    //     OddsStateMapper.kt and TrendingBetsStateMapper.kt module mappers answer null; the Scores
    //     model ("Scores(calendarNavigation=") stores no bettingLink / bettingDisclaimer.
    // BleacherReportSmokeTest asserts every hook. Decompile check passed. Emulator (morphe-play)
    // 2026-10-17, stock re-signed vs all three patches: no crash, consent still shown, home / Scores
    // / gamecast / alerts / article / NFL channel render; stock showed native ads and empty ad gaps,
    // patched none; no Datadog / comScore / Branch / DoubleClick traffic; Braze push token
    // registered on the patched build. Betting removal not seen on screen: no game tested showed
    // odds in stock either. ANRs on both builds came from the emulator's software video decode.
    val COMPATIBILITY_BLEACHER_REPORT = Compatibility(
        name = "Bleacher Report",
        packageName = "com.bleacherreport.android.teamstream",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1A1A1A, // The adaptive icon's background colour.
        signatures = setOf("60baa40540f4950406f327d85761d6e4c533a169d7129e20dfac56fb3124a4f0"), // CN=Sam Parnell, O=Bleacher Report
        targets = listOf(AppTarget(version = "11.13.0.39", versionCode = 54189))
    )

    // Verified 2026-10-27 against com.getupnote.android 9.22.8 (versionCode 360, APKPure XAPK merged
    // with APKEditor; signer CN=Android, OU=Android, O=Google Inc., cert SHA-256 2b546d93...d196 - the
    // Play app-signing key). Small Kotlin app, R8-renamed, Play Billing and Play Integrity present, no
    // ads. Premium is the account's subscription record (valid / cancelled / expiresDateMs from the
    // UpNote API): a no-arg Boolean getter in the record class (9.22.8: mo3.h(), one Long and two
    // Boolean fields) answers "premium", and the settings singleton copies it once at startup.
    // Enable Premium makes that getter return Boolean.TRUE. Local only: cloud sync still needs a real
    // account and is left to the server. UpNoteSmokeTest asserts the hook.
    val COMPATIBILITY_UPNOTE = Compatibility(
        name = "UpNote",
        packageName = "com.getupnote.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x2F6FED,
        signatures = setOf("2b546d93493095f7314f6b26d17fb238a8c94d95594a52d76db78e81f73ed196"),
        targets = listOf(AppTarget(version = "9.22.8", versionCode = 360))
    )

    // Verified 2026-10-27 against io.unorderly.structured 3.9.6 (versionCode 30533, APKPure XAPK
    // merged with APKEditor; signer CN=Android, OU=Android, O=Google Inc., cert SHA-256 9e808bcb...36bc
    // - the Play app-signing key). Kotlin/Compose app, R8-renamed, RevenueCat for "pro" and
    // "recurring_tasks"; PairIP is the licence-check wrapper only (LicenseClient, no VM shield), so a
    // re-signed stock build stops at LicenseActivity. Disable license check returns from
    // LicenseClient.checkLicense(Context). Enable Premium: the app's only CustomerInfo consumer is a
    // static (CustomerInfo) mapper that reads entitlements.active.keySet() and tests "pro" and
    // "recurring_tasks"; the patch loads 1 into the "pro" answer right after Set.contains.
    // StructuredSmokeTest asserts both hooks. The CLI (no -f) applies both; resources.arsc and
    // AndroidManifest.xml stay byte-identical.
    val COMPATIBILITY_STRUCTURED = Compatibility(
        name = "Structured",
        packageName = "io.unorderly.structured",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x4D6BFE,
        signatures = setOf("9e808bcb0eed0fb8620403fbf174186a5fe3a7ade002d547a79ce3beea7e36bc"),
        // 2026-11-03: updated to 3.9.6 build 30537 (versionCode 30533 -> 30537, Play arm64 build
        // via gplaydl, same Play signer), both patches apply unchanged; smoke + CLI without -f.
        // 2026-11-03 emulator: patched cold starts reach MainActivity (stock stops at the PairIP licence screen), no crash.
        targets = listOf(AppTarget(version = "3.9.6", versionCode = 30537))
    )

    // Verified 2026-10-27 against com.twodoor.bookly 2.4.2 (versionCode 505, APKPure XAPK merged with
    // APKEditor; signer CN=Iancu Tudor, OU=TwoDoor, O=TwoDoor, cert SHA-256 abe821f2...2255). Kotlin
    // app with readable app packages, RevenueCat for the lifetime entitlement (active product id
    // "chest_of_diamonds_3000") and Superwall for the paywall UI. The billing client's RevenueCat
    // listener sets SubscriptionManager's StateFlow to Active when that product is active and Free
    // otherwise; every Pro gate reads that flow. Enable Premium returns true from the entitlement
    // check and seeds the manager with Active, so both the pre-callback frames and the listener are
    // Pro. Ads (GMA) are not touched.
    val COMPATIBILITY_BOOKLY = Compatibility(
        name = "Bookly",
        packageName = "com.twodoor.bookly",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x2E7D5B,
        signatures = setOf("abe821f2d1f04d226fe1e994f68e13929c2b75745a8c0ed08fffa7bd1a362255"),
        targets = listOf(AppTarget(version = "2.4.2", versionCode = 505))
    )

    // Verified 2026-10-27 against com.qqlabs.minimalistlauncher 1.22.8 (versionCode 236, APKPure XAPK
    // merged with APKEditor; signer CN=Android, OU=Android, O=Google Inc., cert SHA-256 30ab0a6a...6a47a
    // - the Play app-signing key). Kotlin/Compose launcher, R8-renamed; Play Billing for the one-time
    // "full version", Braze/Branch for the referrer upload, no ad view in the dex (only
    // AdvertisingIdClient refs). The purchase flag lives in the default SharedPreferences under "full
    // version": a no-arg boolean getter (9.22.8: f83.u()) seeds the purchase StateFlow, and a setter
    // (qz.l(boolean, purchase), log line "setting full version to ") writes the pref and the flow on
    // every billing refresh. Enable Premium returns true from the getter and loads 1 into the setter's
    // boolean parameter, so both the startup seed and later refreshes report the purchase.
    val COMPATIBILITY_MINIMALIST = Compatibility(
        name = "Minimalist Launcher",
        packageName = "com.qqlabs.minimalistlauncher",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1B1B1B,
        signatures = setOf("30ab0a6a032881270eed4c161fc304d3d5c22f5822dcf4505708f97e6fb6a47a"),
        targets = listOf(AppTarget(version = "1.22.8v236", versionCode = 236))
    )

    // Verified 2026-10-27 against com.dev47apps.obsdroidcam 8.2 (versionCode 575, APKPure single APK;
    // signer O=DEV47APPS, C=CA, cert SHA-256 c7190a0f...27f3). App classes are R8-mangled with random
    // unicode names, so the anchors are the ad SDK library APIs. Ads run through AppLovin MAX
    // (MaxAdView, MaxInterstitialAd, MaxRewardedAd, MaxAppOpenAd, MaxNativeAdLoader) and Google Mobile
    // Ads, with InMobi as a MAX adapter; the Meta/Unity/Vungle/Pangle/IronSource entry classes are not
    // in the APK. Disable ads neuters AppLovinSdk.initialize and InMobiSdk.init, neutralises every
    // MobileAds static (rule 9), returns from every GMA/MAX load/show, and keeps MaxAdView GONE.
    val COMPATIBILITY_DROIDCAM = Compatibility(
        name = "DroidCam",
        packageName = "com.dev47apps.obsdroidcam",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1F8B4C,
        signatures = setOf("c7190a0fe7b87e46212ae3ddf26dd31435c5aa9558bfeb442f2f64386fff27f3"),
        targets = listOf(AppTarget(version = "8.2", versionCode = 575))
    )

    // Verified 2026-10-27 against app.pinya.mango 1.64 (versionCode 64, APKPure XAPK merged with
    // APKEditor; signer CN=Android, OU=Android, O=Google Inc., cert SHA-256 7959db39...e98d - the Play
    // app-signing key). Mango Launcher; R8-renamed, Play Billing for the subscription
    // "mango_pro_yearly" plus the lifetime in-app "mango_pro_lifetime", no ads. The billing client
    // keeps a Play-Billing-backed state (REAL/FREE/EXPIRED/YEARLY/YEARLY_CANCELED/LIFETIME, cached in
    // "billing_cached_is_pro") and seeds a StateFlow with "YEARLY, YEARLY_CANCELED or LIFETIME" in its
    // constructor; every Pro gate reads that flow. Enable Premium loads 1 into that seed. PairIP is
    // the licence-check wrapper only, so Disable license check returns from checkLicense(Context).
    val COMPATIBILITY_MANGO = Compatibility(
        name = "Mango Launcher",
        packageName = "app.pinya.mango",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xF5A524,
        signatures = setOf("7959db394ab099fd6827d09ecc2ae865b1e5952f0bdf4e273aa37004a668e98d"),
        targets = listOf(AppTarget(version = "1.64", versionCode = 64))
    )

    // Verified 2026-10-27 against ie.rte.news 10.0.2 (versionCode 440, APKPure XAPK merged with
    // APKEditor, armeabi-v7a only; signer CN=Karina Carroll, OU=RTÉ Publishing, O=RTÉ, cert SHA-256
    // fe9b87e6...2117). Compose/Kotlin app, app modules R8-renamed, no PairIP and no billing. The ad
    // is an app widget, not an SDK slot: the article renderer builds an RteAdContainer (advertising
    // info + AdView), calls AdView.loadAd(request), and a Compose block draws the "ADVERTISEMENT"
    // heading and hosts the view ("adContainer" is its parameter name; "Ad request targeting: " is
    // the loader's log line). Disable ads returns from that block, so neither heading nor empty
    // placeholder is laid out, and removes the loadAd call so no request is made; the AdView and its
    // request object are still built, and the OneTrust consent stack is untouched.
    // RteNewsSmokeTest asserts both hooks. The CLI (no -f) applies the patch and changes the two
    // methods; resources.arsc and AndroidManifest.xml stay byte-identical. The APK is armeabi-v7a
    // only, which the x86_64 emulator refuses (INSTALL_FAILED_NO_MATCHING_ABIS), so the runtime check
    // used a copy with lib/ stripped and re-signed for both builds: stock shows the "ADVERTISEMENT"
    // heading and an empty black AdView placeholder in an article; the patched build shows the same
    // article with no heading and no placeholder, and no crash. That stripped copy is a test vehicle
    // only - the shipped APK keeps its libs.
    val COMPATIBILITY_RTENEWS = Compatibility(
        name = "RTÉ News",
        packageName = "ie.rte.news",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0B6E69,
        signatures = setOf("fe9b87e61648c71b5ecc586907a04698334f953c450bfc076c518d50f9112117"),
        targets = listOf(AppTarget(version = "10.0.2", versionCode = 440))
    )

    // Verified 2026-10-27 against com.rarecam.app 1.0.90 (versionCode 90, APKPure XAPK merged with
    // APKEditor; signer CN=Android, OU=Android, O=Google Inc., cert SHA-256 42947b25...31cd - the Play
    // app-signing key, still to be cross-checked against a second mirror). Kotlin/Compose app, R8
    // renamed, no ad SDK. RevenueCat sells the single "rarecam_pro" entitlement; PairIP is the
    // licence-check wrapper only (LicenseClient, no VMRunner/libpairipcore), so a re-signed stock
    // build stops at LicenseActivity.
    // Disable license check: LicenseClient.checkLicense(Context) returns at its entry.
    // Enable Premium: the app's only CustomerInfo consumer is a static (CustomerInfo)V that reads
    // entitlements.get("rarecam_pro")?.isActive() and stores the boolean into a Compose MutableState
    // every Pro gate reads; the patch loads 1 into that boolean at the merge point before the state
    // write, so both the missing and the expired branch report Pro. RevenueCat, the offerings and the
    // purchase screen are untouched.
    // RareCamSmokeTest asserts both hooks and that the state method otherwise matches stock. The CLI
    // (no -f) applies both; resources.arsc and AndroidManifest.xml stay byte-identical. Emulator
    // (x86_64, stock + licence check only vs full patch, same data): the licence-only build starts and
    // shows "PRO" badges on LOG and StackND; the fully patched build runs the same screens with no PRO
    // badges, no paywall when a Pro format is selected, and no crash. The licence bypass alone is what
    // lets either build start; the premium hook is what removes the badges.
    val COMPATIBILITY_RARECAM = Compatibility(
        name = "RareCam",
        packageName = "com.rarecam.app",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF6D00,
        signatures = setOf("42947b25f3b0a5fc1b3905ba33f7e61cfc4b1fab9be3cc2173edf4103f2231cd"),
        // 2026-11-03: updated to 1.0.95 (versionCode 95, Play build via gplaydl, same Play signer),
        // both patches apply unchanged; smoke + CLI without -f.
        // 2026-11-03 emulator: patched cold starts reach MainActivity (stock stops at the PairIP licence screen), no crash.
        targets = listOf(AppTarget(version = "1.0.95", versionCode = 95))
    )

    // Verified 2026-10-26 against se.footballaddicts.livescore 6.15.10 (versionCode 731,
    // owner-supplied APKCube split bundle merged with APKEditor, arm64-v8a only), developer signer
    // O=FootballAddicts, C=SE (cert SHA-256 57c298f0...6c2c). Kotlin Multiplatform app, heavily
    // R8-renamed; anchors are toString/log/event strings, kept class names and method shape, and
    // kotlin.Unit is copied from each patched method's own return (its field is renamed).
    //   - Disable ads: the ad slot's suspend load (the only method with the "AdOpportunity" event
    //     and the "ads/opportunity" trace) returns Unit at entry, so slots stay idle; the next-gen
    //     GMA SDK still initialises (rule 9). AdsSettings ("AdsSettings(appVersionName=") stores
    //     prebidEnabled = false (field after ", prebidEnabled=") before every constructor return.
    //     subscriptionActive is not touched.
    //   - Disable telemetry: the single "firebase_analytics_collection_deactivated" read answers TRUE
    //     (shared forceAnalyticsDeactivated, bytecode only); com.forzafootball.SentryInitializer.create
    //     (kept, named in the manifest) returns Unit; every concrete AppsFlyerLib start / logEvent /
    //     logSession / logAdRevenue returns at once; the Crashlytics arbiter (the synchronized ()Z
    //     calling the "firebase_crashlytics_collection_enabled manifest flag" logger) answers false.
    //     Intercom (support chat) and Firebase Performance are not touched.
    //   - Hide betting content: Betting ("Betting(country=") stores optedOut = true (field after
    //     ", optedOut=", the app's "Opt out of gambling ads" setting) before every constructor
    //     return, so betting is never allowed; the opt-out switch cannot be turned off while the
    //     patch is on. Remote-config odds switches are not touched.
    // ForzaFootballSmokeTest asserts every step. The CLI (no -f) applies all three and exactly 15
    // methods change; resources.arsc and AndroidManifest.xml stay byte-identical. Emulator (ARM
    // translation, stock re-signed vs patched): no crash or ANR through onboarding, home, a match
    // page, news and Intercom; Firebase Analytics logged 35 events in stock and 1 patched (31 more
    // refused as "Event not sent since app measurement is disabled"), Sentry's native libs never load, Crashlytics fetches no settings. Neither build
    // requested an ad and the gambling setting never showed (en-US/en-GB), so Disable ads and Hide
    // betting content are bytecode-verified only. Push: the re-signed stock build gets 403
    // API_KEY_ANDROID_APP_BLOCKED from Firebase Installations and never registers ("FCM
    // Registration failed!"), so Spoof signature is part of the app's patch set (below).
    // Enable Premium (2026-10-27): Forza Legend is a RevenueCat entitlement. The app's only gate is
    // a static (CustomerInfo)Z that walks customerInfo.entitlements.active and asks whether the
    // identifier "Forza Legend" is among them (its (CustomerInfo) neighbour only reads the
    // expiration date for display). The patch returns true from it; RevenueCat, the offerings, the
    // purchase screen and the expiration date stay untouched, so account-backed features still need
    // a real account.
    // Spoof signature (2026-10-27): the Play signing certificate (O=FootballAddicts, SHA-1
    // 6e1189e8...6529, DER from the v2/v3 block of the owner-supplied 6.15.10 base split) is
    // injected into the shared signature extension, which routes every
    // PackageManager.getPackageInfo call, so Firebase's X-Android-Cert is the original and
    // Installations accepts the re-signed build. On by default; the patch comment records the
    // certificate.
    // The smoke test (2026-10-27) applies all five patches. The CLI (no -f) applies them and
    // changes 72 classes (the signature extension rewrites every getPackageInfo call site);
    // resources.arsc and AndroidManifest.xml stay byte-identical. Emulator (ARM translation, stock
    // re-signed vs patched, same data): stock Settings shows "Become A Legend", patched shows
    // "Thanks for being a subscriber!"; the patched build logs a new FCM token and
    // OnNewTokenWorker SUCCESS, while the re-signed stock build logs 403
    // API_KEY_ANDROID_APP_BLOCKED and "FCM Registration failed!".
    val COMPATIBILITY_FORZA_FOOTBALL = Compatibility(
        name = "Forza Football",
        packageName = "se.footballaddicts.livescore",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x2BC4CC, // The teal of the icon's stripe (its background is white).
        signatures = setOf("57c298f08356061f9028f9b13b641b18a577660a7ff60cf2e7814944effb6c2c"), // O=FootballAddicts
        targets = listOf(AppTarget(version = "6.15.10", versionCode = 731))
    )

    // Verified 2026-10-28 against com.fenchtose.reflog 1.3.3 (versionCode 1331, APKPure single
    // APK, all four ABIs; signer CN=Jay Rambhia, cert SHA-256 5ab41983...6727, the developer's own
    // key). The package is still named reflog but the app label is Taskito (it was Reflog).
    // Kotlin app, R8-renamed, Play Billing, Firebase Analytics, no ad SDK (the triage's
    // "Google Mobile Ads" hits are only the advertising-ID client inside Firebase Measurement).
    // Premium is local: the server entitlement is cached in SharedPreferences "entitlement"
    // ("premium" plus "sku_<id>") and verified Play orders in "orders"/"order_tokens", and one
    // Boolean getter answers "premium" for the app - features.purchase.d.d()Z in 1.3.3, the only
    // method behind purchase-keeper f.d(). Its only caller, features.purchases.g.q(), ORs it into
    // every feature gate (the t7.e implementation), so a single returnEarly(true) unlocks them all.
    // Enable Premium hooks that getter; the billing client and the entitlement sync stay intact,
    // and account-backed features still need a real account.
    // 2026-11-02 (issue #100), 1.3.3: Hide Premium tab. The bottom bar appends a "premium" tab
    // when purchase-keeper o() ("no entitlement and no orders", which Enable Premium leaves alone)
    // and the remote "premium_tab" experiment are both true. Anchor: the builder returning the
    // kept custom View BottomNavigationBar with the "premium" and "base_activity" strings
    // (base.i.d1() in 1.3.3, "base_activity" is unique to it); the experiment result before the
    // if-eqz that skips the tab is forced to 0. Smoke test, CLI without -f and decompile checked;
    // emulator: with "premium_tab":"1" put in the cached Remote Config, stock shows Timeline/Board/
    // Unplanned/More/Premium and the patched build (same data) the first four, all tabs open.
    val COMPATIBILITY_TASKITO = Compatibility(
        name = "Taskito",
        packageName = "com.fenchtose.reflog",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2E7D32, // The green of the icon's background.
        signatures = setOf("5ab419834c1f5279b1ccaf262d75a6db2c2dcd9e8c1dab9bead92a640cf26727"), // CN=Jay Rambhia
        targets = listOf(AppTarget(version = "1.3.3", versionCode = 1331))
    )

    // Verified 2026-10-28 against com.gmail.jmartindev.timetune 5.6.3 (versionCode 584, APKPure
    // single APK, no native libs; signer CN=Joaquin Martin, C=ES, cert SHA-256 e7d2d2ab...4e87).
    // Kotlin app, readable app packages, Play Billing (the old com.android.billingclient library),
    // Firebase Analytics, no ad SDK. Premium is cached in the billing preferences:
    // "PREF_PREMIUM_SUBS" for the premium_subs subscription and "PREF_DIALOG" for the legacy
    // one-time purchase (SKU dialog_title). One static getter per flag feeds the public premium
    // check (5.6.3: Lug$a->a(Context) ORs b() and c()), and the whole app (schedule, backup,
    // calendar, widgets, settings) calls it. Enable Premium returns true from the subscription
    // getter (Lug$a->c(Context), anchored on the PREF_PREMIUM_SUBS string); the billing client and
    // the preference writes stay intact. Local only: Google Play account features are untouched.
    val COMPATIBILITY_TIMETUNE = Compatibility(
        name = "TimeTune",
        packageName = "com.gmail.jmartindev.timetune",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1E88E5, // The blue of the icon.
        signatures = setOf("e7d2d2abeead23bb674aaf5524bced66325b5e57d53e5f3b332ed684931f4e87"), // CN=Joaquin Martin
        targets = listOf(AppTarget(version = "5.6.3", versionCode = 584))
    )

    // Verified 2026-10-28 against bbc.mobile.news.ww 2026.9.1 (versionCode 10007111, APKPure XAPK
    // merged with APKEditor, armeabi-v7a only; signer O=BBC Worldwide Limited, C=GB, cert SHA-256
    // fd76b3b8...65dc7). React Native app (13.5 MB assets/index.android.bundle), 12 dex, 540k
    // methods, Play Billing, Play Integrity and a large analytics stack (AppsFlyer, Firebase,
    // Comscore, Permutive, Optimizely). No premium tier: the only "subscribe" strings are Urban
    // Airship notification topics, and there is no Pro/premium UI, so an Enable Premium patch has
    // nothing to unlock. Ads are Google Mobile Ads only (all eight load entry points present, no
    // AppLovin MAX classes): Disable ads neuters every GMA load with the shared hooks and leaves
    // MobileAds.initialize alone, because the React Native module awaits it and the next-gen
    // statics throw without it. The JS side already handles a failed (no-fill) load. Bytecode-only
    // verification: the APKPure bundle is armeabi-v7a and the x86_64 AVD cannot install it.
    val COMPATIBILITY_BBCNEWS = Compatibility(
        name = "BBC News",
        packageName = "bbc.mobile.news.ww",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xBB1919, // BBC News red.
        signatures = setOf("fd76b3b8df5fe8fd590957eb0f78a996967dd3c8bd87aff41f47e7799d065dc7"), // O=BBC Worldwide Limited
        targets = listOf(AppTarget(version = "2026.9.1", versionCode = 10007111))
    )

    // Verified 2026-10-29 against dk.dr.webplayer 4.39.0 (versionCode 439000, APKMirror bundle
    // merged with APKEditor, no native libs; signer CN=DR TV, O=DR TV, L=København, C=DK, cert
    // SHA-256 0f5de4c3...3743, same as APKPure). The app is the Massive Axis SDK
    // (axis.android.sdk.*) and R8 keeps its class and member names, as it keeps the Firebase,
    // Segment and NPAW ones, so kept names are used as anchors here, each paired with a string or
    // call unique to the method (fingerprints in drtv/misc/telemetry and drtv/player).
    //   - Disable telemetry: Crashlytics DataCollectionArbiter.isAutomaticDataCollectionEnabled
    //     and Firebase Performance ConfigResolver.isPerformanceMonitoringEnabled answer false;
    //     SegmentAnalyticsProvider.initializeSegmentSDK ("writeKey") and NielsenUtilManager's
    //     initNielsen ("Nielsen_AppSDK") return at entry, leaving their clients null (every reader
    //     null-checks; live Nielsen tracking only starts once a NielsenUtil was handed over); the
    //     "npawEnabled" flag reader answers false and initializeNpaw passes false to
    //     AnalyticsOptions.setEnabled. Firebase Analytics is already deactivated in the manifest.
    //     ResumePointService (continue watching) and PlayerStatisticsManager (debug overlay) are
    //     untouched.
    //   - Auto skip intro: in PlayerFragment.checkForBingMarkerButton(J)V (the progress-tick check
    //     that calls BingeMarkerUtility.getTimeCodeWrapper and checkSkipThresholdInRange), right
    //     after the single setViewVisibility(skipButton, 0) the patch calls skipButton.callOnClick(),
    //     which runs the app's own Skip handler (hide, record, seek to the time code's end + 1 s).
    //     Only intro/recap codes get the button; end credits and the server's threshold-0 switch
    //     are left to the app.
    //   - Allow free rotation (opt-in): PlayerActivity.onResume requests sensorLandscape (6) on API
    //     27+; the patch requests full sensor (10) instead, which overrides the manifest's 6. The
    //     player declares orientation in configChanges. Bytecode only, so API 26 and older keep 6.
    // Skipped: a seek-step patch. ExoPlayerSurface builds the player with
    // integer/player_forward_rewind_increment, which is already 15000 ms, not the 10 s default.
    // DrtvSmokeTest asserts every step. The CLI (no -f) applies all three; resources.arsc and
    // AndroidManifest.xml stay byte-identical; a whole-APK compare shows exactly the 8 intended
    // methods. Runtime 2026-10-29 (emulator, dev.3 bundle, stock control): the patched cold start
    // reaches MainActivity and loads the home page with no crash, and the Nielsen SDK that stock
    // starts at launch stays silent. Playback needs a DR login, so the auto-skipped intro and
    // portrait rotation have not been seen; the owner accepted a clean start as enough.
    val COMPATIBILITY_DRTV = Compatibility(
        name = "DRTV",
        packageName = "dk.dr.webplayer",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFD001E,
        signatures = setOf("0f5de4c316dc42f22ed62dd9b442b19902005e005c169cf146180a03998d3743"), // CN=DR TV, O=DR TV
        targets = listOf(AppTarget(version = "4.39.0", versionCode = 439000))
    )

    // Verified 2026-10-29 against com.viaplay.android 26.42.1 (versionCode 2642010, user-supplied
    // APKCube .apks merged with APKEditor, arm64-v8a only; signer CN=Niklas BJorkholm, OU=MTG,
    // cert SHA-256 8b1a306b...aa2c). The app and most of Firebase are R8-obfuscated into rotating
    // top-level classes, so the anchors are stable strings, kept library classes (com.npaw.*,
    // com.nielsen.*, androidx.media3.*), the kept com.viaplay.tracking model classes and method
    // shape (fingerprints in viaplay/misc/telemetry and viaplay/ads).
    //   - Disable telemetry: the Crashlytics data-collection gate (the ()Z method logging
    //     "Crashlytics automatic data collection ") and Firebase Performance's monitoring check
    //     ("fpr_enabled" + "com.google.firebase.perf.SdkEnabled") answer false; the shared
    //     forceAnalyticsDeactivated() makes the "firebase_analytics_collection_deactivated" read
    //     answer true (the manifest does not set it); the NPAW initializer ("Viaplay Android
    //     Mobile", the only NpawPluginProvider.initialize caller) and the Nielsen wrapper ("Failed
    //     to initialize Nielsen SDK", the only AppSdk constructor call) return at entry, and every
    //     reader null-checks NpawPluginProvider.getInstance() / the AppSdk field; the static
    //     Cronos dispatcher (VPTrackingEvent, BaseData, List)V returns at entry, so no
    //     cronos-events.viaplay.com session or event is sent (its callers ignore the result).
    //     The CSE playback/ad beacons, OneTrust and continue watching are untouched.
    // ViaplaySmokeTest asserts every step; the CLI (no -f) applies it. Runtime 2026-10-29
    // (emulator, dev.3 bundle, stock control): the patched cold start reaches the login screen
    // through the permission and consent dialogs with no crash, and Firebase Analytics logs "App
    // measurement deactivated via the manifest" where stock initializes it. Sign-in and VOD
    // playback need a subscription and have not been seen.
    val COMPATIBILITY_VIAPLAY = Compatibility(
        name = "Viaplay",
        packageName = "com.viaplay.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE40050, // The icon's pink-to-red gradient (mid-tone).
        signatures = setOf("8b1a306bfad5bc14025c488f6350751657dcb2b6e7eab311778d64c78a82aa2c"), // CN=Niklas BJorkholm, OU=MTG
        targets = listOf(AppTarget(version = "26.42.1", versionCode = 2642010))
    )

    // Same app, used only by "Skip ads", so Morphe Manager flags it as experimental (2026-10-29,
    // 26.42.1 / versionCode 2642010). VOD ads are server-side inserted DASH periods: the only
    // implementation of Media3's ServerSideAdInsertionMediaSource$AdPlaybackStateUpdater builds
    // an AdPlaybackState for EVERY period: "ad-id-signaling" periods get one server-side ad
    // group, content periods and every live period get an empty state with no ad groups. Its
    // tail marks the ad skipped (withSkippedAd(0, 0)) only when the period is in the set of ad
    // breaks before the resume position. The patch keeps that if-eqz but feeds it the state's
    // adGroupCount instead of Set.contains (an iget inserted right before it), so every state
    // with an ad group is marked skipped and Media3 plays past it, while empty states are left
    // alone (withSkippedAd(0, 0) on them would index adGroups[0] and throw). The ad-period
    // detector is untouched. (The first draft removed the branch outright; the pre-commit review
    // caught that it would have thrown on every content period.)
    // Smoke-verified, and an apktool disassembly of the CLI-patched APK shows the adGroupCount iget
    // before the if-eqz guarding withSkippedAd (2026-10-29). The patched build starts cleanly, but
    // no real ad break has been watched (needs a subscription), and whether the app's ad UI or the
    // CSE ad beacons react badly to never-played ads is unknown, so it stays experimental.
    val COMPATIBILITY_VIAPLAY_EXPERIMENTAL = Compatibility(
        name = "Viaplay",
        packageName = "com.viaplay.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE40050,
        signatures = setOf("8b1a306bfad5bc14025c488f6350751657dcb2b6e7eab311778d64c78a82aa2c"), // CN=Niklas BJorkholm, OU=MTG
        targets = listOf(AppTarget(version = "26.42.1", versionCode = 2642010, isExperimental = true))
    )

    // Verified 2026-10-29 against dk.bold 6.5.2 (versionCode 261, owner-supplied APKCube .apks
    // bundle merged with APKEditor, arm64-v8a; signer OU=Bold.dk, O=Bold.dk, C=NL, cert SHA-256
    // 4a82f8d0...8d3c). Native Android app, 179k methods; Google Mobile Ads is the only ad SDK (all
    // eight load entry points present, no AppLovin MAX) and Firebase Analytics/Crashlytics the only
    // telemetry SDK. There is no Play Billing or RevenueCat class, so the app has no premium tier
    // and no Enable Premium to write. Disable ads neuters every GMA load with the shared hooks and
    // leaves MobileAds.initialize alone (rule 9).
    val COMPATIBILITY_BOLD = Compatibility(
        name = "Bold",
        packageName = "dk.bold",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x111111,
        signatures = setOf("4a82f8d055489660354920bffe80b57f851093b16e98d51043ca564468b28d3c"), // O=Bold.dk
        targets = listOf(AppTarget(version = "6.5.2", versionCode = 261))
    )

    // Verified 2026-11-03 against com.gkfriend.gpsmapcameraeditor 1.0.31 (versionCode 89, Google
    // Play arm64-v8a split set merged with APKEditor; signer CN=Android, OU=Android, O=Google Inc.,
    // cert SHA-256 ad0e1988...8d37 - the Play app-signing key, confirmed by Play and APKPure only).
    // Kotlin app whose own classes keep their names (a keep rule; only R8's synthetic lambdas get
    // letters), so the anchors are those kept names plus PairIP's library API (GitHub issue #118).
    //   - Disable license check: PairIP is the licence-check wrapper only (Application subclass,
    //     LicenseActivity, CHECK_LICENSE; no VMRunner, SignatureCheck or libpairipcore), so
    //     LicenseClient.checkLicense(Context) returns at its entry.
    //   - Disable ads: Google Mobile Ads only (the other networks are mediation adapters). The
    //     canShowAds() gate of AdManager and AppOpenAdManager answers false, the app's own
    //     subscriber/no-consent path: no MobileAds.initialize, no loads, banner containers empty
    //     or GONE, and the rewarded "Advanced search" step reports "Ad failed" at once. The shared
    //     GMA load hooks are neutered as a backstop. The splash waits on no ad.
    //   - Enable Premium: SubscriptionManager.isSubscribed() answers true; every gate reads it
    //     (the Remote Config customize / photo EXIF switches are ANDed with it). The daily
    //     place-search limit applies to subscribers too and is not touched.
    //   - Spoof signature: the Play certificate is injected for every getPackageInfo call, so the
    //     Places SDK and Firebase send the original X-Android-Cert. The Google Maps tiles are
    //     authorised inside Google Play services, not in the app dex, so the re-signed map stays
    //     blank ("Authorization failure", emulator 2026-11-03); place search works. Emulator 2026-11-03 (stock vs patched): the PairIP licence screen is gone, no premium locks, no crash; with GmsCore support the map renders through MicroG RE.
    //   - GmsCore support (added 2026-11-03, opt-in, pulls in Spoof signature): the shared builder
    //     with the MicroG RE check at the start of SplashActivity.onCreate (the manifest
    //     MAIN/LAUNCHER class). The Maps module then loads from MicroG RE, which draws its own map
    //     without Google's key check. No clone option (the Places key is tied to the package).
    // GpsMapCameraSmokeTest asserts every hook.
    val COMPATIBILITY_GPSMAPCAMERA = Compatibility(
        name = "GPS Map Camera Editor",
        packageName = "com.gkfriend.gpsmapcameraeditor",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x3FA9E0,
        signatures = setOf("ad0e198835238d37a5519b4cc50173c2a28a556b8806c3ab963fcbd516238d37"),
        targets = listOf(AppTarget(version = "1.0.31", versionCode = 89))
    )
}
