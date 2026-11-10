package app.zdrgon.patches.webvideocaster.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Web Video Caster 6.1.0 — premium manager (classes6.dex) ─────────────
//
// The app merges two premium sources into one local state held by the
// manager class Le89; (instantiated once per process):
//   field b: MutableStateFlow<PremiumAccount (Lt79;)>
//   field c: MutableStateFlow<Boolean> — the hasPremium flow, seeded FALSE
//   field d: MutableStateFlow<PremiumAccountState (Ls89;)>
// RevenueCat (Lhz9;) and the Supabase "WVC Premium Account" service
// (Lej4;) are the only feeders, and both funnel through the single
// setter Lv36;->v(Lt79;Ljava/lang/String;)V — v36 is the callback object
// stored in Le89;->g. That setter is therefore the one place where every
// premium decision is written.
//
// Entitlement values (interface Lrc9;): Lqc9; = Unknown, the Lpc9;
// family = known entitlement with Loc9; = "Yes" (active), Lmc9;/Lnc9; =
// "No". Lhz9;->a builds Loc9; exactly when RevenueCat reports the
// "Premium" entitlement active. The synchronous gate Ltc9;->b/c reads
// the same flow and returns true iff the entitlement is Loc9; (or a
// local trial timestamp is still valid).

/**
 * Lv36;->v(Lt79;Ljava/lang/String;)V — the central "set premium account"
 * funnel. PUBLIC only (0x0001, verified in the 6.1.0 dex); the method
 * logs "Setting Has Premium: " and stores the computed Boolean into
 * Le89;->c just before returning. Morphe fingerprints compare access
 * flags by EXACT equality, so no extra flags may be listed here.
 */
object SetPremiumAccountFingerprint : Fingerprint(
    definingClass = "Lv36;",
    name = "v",
    returnType = "V",
    parameters = listOf("Lt79;", "Ljava/lang/String;"),
    accessFlags = listOf(AccessFlags.PUBLIC),
    strings = listOf("Setting Has Premium: "),
)

/**
 * Le89;-><init>(WebVideoCasterApplication)V — the premium manager
 * constructor (0x10001 PUBLIC CONSTRUCTOR, verified in the 6.1.0 dex).
 * It seeds the hasPremium flow (field c) with Boolean.FALSE; the patch
 * flips that single sget-object to Boolean.TRUE so the flow starts
 * premium before the first entitlement sync lands.
 */
object PremiumManagerInitFingerprint : Fingerprint(
    definingClass = "Le89;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Lcom/instantbits/cast/webvideo/WebVideoCasterApplication;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
)

/**
 * Lcom/pairip/SignatureCheck;->verifyIntegrity(Landroid/content/Context;)V
 * (classes2.dex, PUBLIC STATIC, verified in the 6.1.0 dex).
 *
 * PairIP's Application class (com.pairip.application.Application, the
 * app's real Application) calls this FIRST in attachBaseContext —
 * before LicenseClient.checkLicense and before the app's own
 * attachBaseContext/onCreate, with no try/catch around it. The method
 * SHA-256-hashes the installed app's signing certificate and throws
 * SignatureCheck$SignatureTamperedException ("Apk signature is
 * invalid.") unless it matches PairIP's expected developer signature
 * (or a hardcoded test signature). Any re-signed build — Morphe
 * Manager's key included — therefore crashes uncatchably at process
 * start, which is exactly the on-device crash of the v1.35.1 test
 * build ("app crashed" dialog on launch). Gradient Weather ships an
 * older PairIP config whose Application has NO SignatureCheck at all
 * (attachBaseContext there only calls LicenseClient.checkLicense),
 * which is why Gradient survives re-signing with just the installer
 * spoof and WVC does not.
 */
object SignatureCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/SignatureCheck;",
    name = "verifyIntegrity",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    strings = listOf("Apk signature is invalid.", "Signature check ok"),
)

// ── PairIP license check (classes2.dex) ─────────────────────────────────
//
// LicenseClient is PairIP's Play-licensing client. The ONLY dex entry
// points into it are the static checkLicense(Context): PairIP's
// Application.attachBaseContext (right after verifyIntegrity) and
// LicenseContentProvider.onCreate. A cross-dex scan of all 7 dex files
// shows no other class in the app even references LicenseClient,
// LicenseActivity or TrialClient, so every launch path funnels through
// the methods fingerprinted below.
//
// checkLicense posts to the main thread:
// getInstance(ctx).initializeLicenseCheck(), which switches on the
// static licenseCheckState (LicenseCheckState enum, seeded
// CHECK_REQUIRED by <clinit>):
//   CHECK_REQUIRED        -> bind to Play's ILicensingService
//                            (com.android.vending), send a
//                            LicenseCheckV2 request; the local installer
//                            branch is gated on localCheckEnabled, which
//                            is never written in the dex (false), so the
//                            shipped flow is the online check.
//   FULL_CHECK_OK         -> re-validates the cached JWS payload.
//   LOCAL_CHECK_OK /
//   LOCAL_CHECK_REPORTED  -> no-op.
//   REPEATED_CHECK_REQUIRED -> fresh connection (periodic re-check).
// The service answer lands in processResponse(code, bundle):
//   0 LICENSED     -> JWS validated, state becomes FULL_CHECK_OK (or
//                     REPEATED_CHECK_REQUIRED when repeated-check
//                     metadata is present) — the genuine success state.
//   2 NOT_LICENSED -> startPaywallActivity(): LicenseActivity opens
//                     with activitytype=PAYWALL and the service-supplied
//                     PAYWALL_INTENT PendingIntent, which opens the
//                     Play Store listing — for a non-Play install that
//                     page is the "Get this app from Play" block screen
//                     seen on-device with v1.35.3.
//   other          -> LicenseCheckException -> handleError -> error
//                     dialog via the same LicenseActivity vehicle.
// handleTrialEnd (reached only via stopTrial <- the caller-less
// TrialClient facade) is a third, independent re-check trigger: it
// resets licenseCheckState to CHECK_REQUIRED and binds afresh,
// bypassing initializeLicenseCheck.

/**
 * LicenseClient.checkLicense(Landroid/content/Context;)V — the static
 * entry (0x0009 PUBLIC STATIC, verified in the 6.1.0 dex; both of its
 * strings are in the method body).
 */
object LicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    strings = listOf("Cannot check license with null context.", "Skipping license check in isolated process."),
)

/**
 * LicenseClient.initializeLicenseCheck()V — the instance method the
 * static entry posts to the main thread (0x0001 PUBLIC, verified in
 * the 6.1.0 dex). Its body contains no const-strings, so the match
 * rests on class + name + signature + exact access flags; the method
 * is the only one of its name in the class.
 */
object InitializeLicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck",
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC),
)

/**
 * LicenseClient.handleTrialEnd()V — the trial-end re-check trigger
 * (0x0004 PROTECTED, verified in the 6.1.0 dex; its log string is in
 * the method body).
 */
object HandleTrialEndFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "handleTrialEnd",
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PROTECTED),
    strings = listOf("Trial end event triggered; initiating full license check."),
)

// ── PairIP license check, round 3: defense in depth ────────────────────
//
// On-device, the round-2 stubs (checkLicense / initializeLicenseCheck /
// handleTrialEnd, all verified present in the patched output dex) did
// NOT stop the Play Store block page, even on a fresh, current bundle
// with every patch enabled. Execution-mode audit of the stock dex
// (round 3) establishes why these extra layers are still dex work and
// not VM work: VMRunner.invoke is called from exactly five methods in
// classes2.dex (PairIP's StartupLauncher plus four protected app/SDK
// methods) and NO licensecheck method references VMRunner or is
// declared native — every method below is a genuine dex body with a
// full instruction graph, the same execution mode as
// SignatureCheck.verifyIntegrity, whose dex edit demonstrably took
// effect on-device (the startup crash stopped in round 1). The
// PairIP VM asset modules are encrypted (IAP container) and contain
// no plaintext LicenseActivity / licensecheck / PAYWALL strings, and
// libpairipcore.so contains no such strings either, so no
// independent native/VM paywall launcher exists in the shipped
// artifacts. The remaining dex chokepoints, all in classes2.dex:
//
//   processResponse          — the licensing-service verdict handler;
//                              sole caller is the binder callback
//                              LicenseClient$2.verifyLicense. Code 2
//                              (NOT_LICENSED) is the only route to
//                              startPaywallActivity.
//   startPaywallActivity /
//   startErrorDialogActivity — the ONLY two methods that build the
//                              LicenseActivity intent (via
//                              createCloseAppIntentOrExitIfAppInBackground)
//                              and start it; each also calls
//                              scheduleAppShutdown.
//   scheduleAppShutdown      — PairIP's delayed process shutdown:
//                              DelayedTaskExecutor.schedule(exitAction)
//                              where exitAction (LicenseClient$1) is a
//                              Runnable whose run() calls System.exit.
//   LicenseActivity.onStart  — the activity has NO onCreate; onStart
//                              dispatches on the "activitytype" extra
//                              to showPaywallAndCloseApp (sends the
//                              PAYWALL_INTENT PendingIntent, i.e. the
//                              Play listing) or the error dialog.
// Access flags and body strings below are taken from the 6.1.0 dex.

/**
 * LicenseClient.processResponse(ILandroid/os/Bundle;)V — the verdict
 * handler (0x0002 PRIVATE, verified in the 6.1.0 dex).
 */
object ProcessResponseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "processResponse",
    returnType = "V",
    parameters = listOf("I", "Landroid/os/Bundle;"),
    accessFlags = listOf(AccessFlags.PRIVATE),
    strings = listOf("License check succeeded.", "PAYWALL_INTENT"),
)

/**
 * LicenseClient.startPaywallActivity(Landroid/app/PendingIntent;)V —
 * one of the two LicenseActivity launchers (0x0002 PRIVATE, verified
 * in the 6.1.0 dex).
 */
object StartPaywallActivityFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "startPaywallActivity",
    returnType = "V",
    parameters = listOf("Landroid/app/PendingIntent;"),
    accessFlags = listOf(AccessFlags.PRIVATE),
    strings = listOf("paywallintent", "activitytype"),
)

/**
 * LicenseClient.startErrorDialogActivity()V — the other LicenseActivity
 * launcher (0x0002 PRIVATE, verified in the 6.1.0 dex).
 */
object StartErrorDialogActivityFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "startErrorDialogActivity",
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PRIVATE),
    strings = listOf("activitytype"),
)

/**
 * LicenseClient.scheduleAppShutdown()V — the delayed-shutdown
 * scheduler (0x0002 PRIVATE, verified in the 6.1.0 dex; the method
 * body contains no const-strings, so the match rests on class + name
 * + signature + exact flags; it is the only method of its name).
 */
object ScheduleAppShutdownFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "scheduleAppShutdown",
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PRIVATE),
)

/**
 * LicenseClient$1.run()V — the exitAction Runnable itself; its whole
 * body is System.exit (0x0001 PUBLIC, verified in the 6.1.0 dex; no
 * const-strings; the anonymous class declares only <init> and run).
 */
object ExitActionFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient\$1;",
    name = "run",
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC),
)

/**
 * LicenseActivity.onStart()V — the blocking activity's only display
 * entry (the class declares no onCreate) (0x0001 PUBLIC, verified in
 * the 6.1.0 dex; 3 registers, so the parameter register p0 is v2 and
 * safe to name in inserted instructions).
 */
object LicenseActivityOnStartFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseActivity;",
    name = "onStart",
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC),
    strings = listOf("activitytype", "Couldn't process license activity correctly."),
)

// ── PairIP startup program (classes2.dex), round 5 ────────────────────
//
// StartupLauncher.launch() is PairIP's VM bootstrap. It is called
// from the <clinit> of Landroid/app/AppComponentFactory; (a shadow
// class PairIP plants in classes2.dex) and of the manifest-declared
// Landroidx/core/app/CoreComponentFactory; — i.e. when the component
// factory class loads during bindApplication, BEFORE
// Application.attachBaseContext runs, and therefore before every
// method stubbed in rounds 1–3 (verifyIntegrity, checkLicense, the
// whole LicenseClient stack). Its body (24 code units) is a
// synchronized once-guard around a single call:
// VMRunner.invoke(startupProgramName, null), where the static field
// startupProgramName is initialized in <clinit> to
// "Oz9gdoFZqm3JanLF" — the app's largest PairIP VM asset module
// (415,036 bytes of encrypted, natively executed bytecode; its
// contents are not readable from the dex). The VM environment is
// explicitly tooled to act in that pre-Application window:
// InitContextProvider reflectively builds an app Context from
// ActivityThread/AppBindData and installs a basic Instrumentation
// in a method named tryToInitializeBasicInstrumentationForStartActivity.
//
// The round-4 census eliminated every other route to the Play Store
// block page: all 20 other VMRunner.invoke trampolines in the app
// are third-party SDK BroadcastReceiver.onReceive bodies, no dex
// code outside the (fully stubbed) LicenseClient stack references
// the store or the license state, and LicenseActivity is
// manifest-disabled. The startup program is the only in-process
// actor left that runs at every cold start, runs before all patched
// code, and can start activities. That is suspicion by elimination
// and capability, not an identified call path — which is why this
// round ships as its own separate, toggleable patch.

/**
 * Lcom/pairip/StartupLauncher;->launch()V — the VM bootstrap entry
 * (0x20009 PUBLIC STATIC DECLARED_SYNCHRONIZED, verified in the
 * 6.1.0 dex via dexdump — flags read from the class data, and
 * Morphe compares access flags by EXACT equality). The dex bit is
 * DECLARED_SYNCHRONIZED (0x20000), NOT dexlib2's SYNCHRONIZED
 * (0x20): the first shipped fingerprint listed SYNCHRONIZED and
 * failed to match on exactly that bit — the v1.38.0 Desktop run is
 * the evidence. The method body contains no const-string
 * instructions (the program name is a static field read via
 * sget-object), so the match rests on class + name + signature +
 * exact flags; launch is the only method of its name in the class
 * (the class declares only <clinit>, <init> and launch).
 */
object StartupLauncherFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/StartupLauncher;",
    name = "launch",
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.DECLARED_SYNCHRONIZED),
)

// ── PairIP init context / instrumentation (classes2.dex), round 6 ────
//
// Round 5's device verdict split the startup program in two: with
// StartupLauncher.launch() stubbed (v1.38.1) the Play Store block
// page is GONE — the encrypted startup module was the actor opening
// it — but the app now crashes on launch, so the same program also
// performs initialization the runtime depends on. Round 6 therefore
// leaves the program running and cuts only its ability to start
// activities.
//
// The dex-side plumbing (all in classes2.dex, read from the stock
// dex): every VMRunner.invoke(...) call — the startup program and
// all 20 SDK trampolines alike — first calls
// InitContextProvider.tryToCreateContextForBindingApp(), which
// reflectively builds an app Context (ActivityThread.currentActivityThread
// -> mBoundApplication -> AppBindData.info (LoadedApk) ->
// ContextImpl.createAppContext) and, as its last step before
// returning that Context, calls the method fingerprinted below to
// install a basic Instrumentation into
// ActivityThread.mInstrumentation. That install is the VM's
// activity-start enabler for the pre-Application window: a census
// of all 8 dexes finds exactly ONE "mInstrumentation" const-string
// in the entire app, inside this method. The class declares only
// <init>, tryToCreateContextForBindingApp and this method, and this
// method's only dex caller is tryToCreateContextForBindingApp.

/**
 * Lcom/pairip/InitContextProvider;->tryToInitializeBasicInstrumentationForStartActivity(Ljava/lang/Class;Ljava/lang/Object;)V
 * — reflectively replaces ActivityThread.mInstrumentation with a
 * fresh android.app.Instrumentation (0x000a PRIVATE STATIC, verified
 * in the 6.1.0 dex via dexdump; both of its const-strings, the field
 * name "mInstrumentation" and the class name
 * "android.app.Instrumentation", are in the method body).
 */
object InitContextInstrumentationFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/InitContextProvider;",
    name = "tryToInitializeBasicInstrumentationForStartActivity",
    returnType = "V",
    parameters = listOf("Ljava/lang/Class;", "Ljava/lang/Object;"),
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC),
    strings = listOf("mInstrumentation", "android.app.Instrumentation"),
)

// ── PairIP Application entry (classes2.dex), round 10 ─────────────────
//
// Lcom/pairip/application/Application;->attachBaseContext is the ONE
// caller of SignatureCheck.verifyIntegrity and LicenseClient.checkLicense
// in the whole app (round-10 census of all 8 dexes: checkLicense has
// exactly 2 call sites — this method and LicenseContentProvider.onCreate,
// and LicenseContentProvider is NOT declared in the manifest, so that
// entry is inert). The stock body (13 code units, 2 registers,
// no try/catch) is, in order:
//   invoke-static VMRunner.setContext(ctx)
//   invoke-static SignatureCheck.verifyIntegrity(ctx)
//   invoke-static LicenseClient.checkLicense(ctx)
//   invoke-super  Application.attachBaseContext(ctx)  (== the app)
//   return-void
// Rounds 1–3 stubbed the two callees; round 10 additionally rewrites
// this call site so the calls are never made at all (see
// BypassPairipApplicationPatch). Losing the setContext call would be
// safe anyway — VMRunner.invoke re-establishes it when null (its
// prologue calls InitContextProvider.tryToCreateContextForBindingApp
// and setContext) — but the rewrite keeps the original setContext
// instruction and only skips the two checks.

/**
 * Lcom/pairip/application/Application;->attachBaseContext(Landroid/content/Context;)V
 * — the PairIP Application override (0x0004 PROTECTED, verified in the
 * 6.1.0 dex via dexdump; the body contains no const-string
 * instructions, so the match rests on class + name + signature +
 * exact access flags; it is the only attachBaseContext in the class).
 */
object PairipApplicationAttachFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/application/Application;",
    name = "attachBaseContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    accessFlags = listOf(AccessFlags.PROTECTED),
)
