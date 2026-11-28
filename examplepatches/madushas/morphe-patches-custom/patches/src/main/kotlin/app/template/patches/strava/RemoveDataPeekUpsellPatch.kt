package app.template.patches.strava

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import app.template.patches.shared.Constants.STRAVA_COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags

// ─────────────────────────────────────────────────────────────────────────────
// Server-driven upsell removal (P2b → v3, 2026-10-22 → 2026-10-28)
//
// Strava's subscription upsells arrive through the SERVER-DRIVEN modular UI:
//
//   server payload → GSON → hts.a(GenericLayoutModule) dispatches on module
//   TYPE via each converter's getTypes() → converter.createModule(...)
//   → renderable Module → composable renderers.
//
// v3 architecture (runtime-toggleable from Extra Settings):
//
//   1) ONE gate at the dispatcher (hts.a): injected preamble reads the pref
//      "morphe.hide.<module-type>" (default HIDE for the five known upsell
//      types) directly via ActivityThread.currentApplication() →
//      SharedPreferences and returns null. There is deliberately NO
//      extension-class call from patched dex — the ART method-resolution
//      anomaly (SESSION-LOG P3) makes new cross-dex calls unsafe; framework
//      calls only. Register safety: hts.a .locals 5 — the original body
//      writes v0 (iget-object) and v2 (const/4) before any read, so
//      clobbering v0-v3 at entry is safe. Returning null is the supported
//      outcome (hts.a returns null when no converter matches; every consumer
//      null-checks — proven safe on device since P2b).
//
//      Known upsell module types (from the converters' getTypes()):
//        activity-replay-upsell-card   ("Time to flex" replay card)
//        subscriber-feature-header     ("Your predictions are ready" banner)
//        sub-preview-banner-large/small (subscription preview banners)
//        data-peek-upsell              (Progress tab carousel)
//        recap-progress-entrypoint     ("See how far you've come" banner)
//
//   2) Maps "Explore anywhere with confidence" card: CLIENT-rendered
//      (composable rl60.d) — not converter-driven, needs its own gate
//      (pref "morphe.hide.maps-data-peek"). .locals 40 → v0/v1 safe.
//
//   2a) CONVERTER-LEVEL gates: the four upsell converters get the same
//      runtime gate directly on createModule (the home feed renders the
//      subscriber banners through converters outside the subscriptions
//      dispatcher). Register safety verified per-site (.locals 6/16, first
//      instruction writes v0 / reads p1 — v0-v2 dead at entry).
//
//   2b) Celebrations (RUNTIME toggle, pref "morphe.hide.celebrations",
//      default show): CelebrationActivity.onCreate +
//      ChallengeCelebrationBottomSheetActivity.onCreate (gate after
//      super.onCreate; p1/v0-v2 rewritten before read) and
//      CelebrationBottomSheetDialogFragment (NEW show() override — the
//      new-method pattern is the ART-safe one).
//
//   3) Native Settings "Subscriptions" section — unconditional:
//      pr5.a renderer cleared + section-header call (Le130;->i) NOP'd in
//      b130.invoke (inside a Compose ReplaceGroup closed by composer.p()V —
//      an empty group is safe). NOTE: skipping the b$g instance-of dispatch
//      in b130.invoke CRASHES (obfuscated `yzt`) — only renderers may be
//      no-op'd (verified 2026-10-27).
//
//   4) SuperUserToolsActivity console unlocked (exported by the resource
//      patch; onCreate's conditional finish() NOP'd) — Strava's own
//      feature-switch/inspection console, reachable via adb.
//
//   5) (removed in v4 — the investigation-only "log every module type" probe was
//      deleted; the type set it produced is recorded in the v4 note below.)
//
// v4 (2026-11-11) — LEAK FIX. The upsell module gate compared the type against a
// fixed 5-string list, so any upsell type Strava added since leaked (the gate
// defaults to SHOW for unknown types). Proven leaks in 486.x: toolbar-upsell,
// yis-2026-upsell-card-{generic,legendary,rare}, best-efforts-peek-upsell-chart,
// sub-android-year-in-sport-2026-upsell-*, year-in-sport-2026-upsell-android,
// achieve--instant-workouts--runna-banner--android. Fixes:
//   (a) the gate now uses an upsell-SHAPE PREDICATE (contains "upsell", plus the
//       explicit sub-preview-banner / subscriber-feature-header /
//       recap-progress-entrypoint / yis-2026 / year-in-sport-2026 / runna-banner
//       names) → new server types are covered automatically;
//   (b) NEW chokepoint 2b: the subscription bottom-sheet target centralized in
//       StravaTargets.upsellSheet (Lww4; on 486.9/486.11, Lh95; on 490.15)
//       is the single method that shows EVERY subscription bottom-sheet upsell;
//   (c) NEW 2c: dedicated upsell screens (YearInSportUpsellActivity,
//       BestEffortsDataPeekUpsellActivity, DeviceConnectUpsellActivity) get a
//       finish() gate after super.onCreate — the second, non-modular upsell
//       delivery system the v3 patch never covered.
// NOTE: only MODULAR upsells pass through hts.a; the yis/toolbar/
// best-efforts types are NOT converters (verified: only ActivityReplayUpsellCard
// and DataPeekUpsell converters implement createModule(GenericLayoutModule,…)),
// which is why (b)+(c) are needed and why the predicate alone is not enough.
//
// Version history: 486.9 (2026-10-23): obfuscated param types renamed
// (Lzsn;→Lsxn;, Lwns;→Lhts;) — fingerprints updated. 486.11 (2026-10-28):
// all targets byte-shape identical; celebration classes moved to classes3
// (dex location is irrelevant to the lookup). NOTE: keep this file with
// EXACTLY ONE copy of each section — scripted edits duplicated it once and
// the second pass failed with a misleading "classDef is null" (2026-10-28).
// ─────────────────────────────────────────────────────────────────────────────

private const val MODULE_GATE_SMALI = """
    invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;
    move-result-object v0
    if-eqz v0, :morphe_show
    const-string v1, "com.strava_preferences"
    const/4 v2, 0x0
    invoke-virtual {v0, v1, v2}, Landroid/app/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
    invoke-virtual {p1}, Lcom/strava/modularframework/data/GenericLayoutModule;->getType()Ljava/lang/String;
    move-result-object v1

    # ── Upsell predicate (v4) ────────────────────────────────────────────────
    # The default for a type is HIDE when its name is upsell-shaped. Substring
    # matching (not an exact type list) so server-added upsell types stay covered
    # automatically — the v3 list missed toolbar-upsell, yis-2026-upsell-card-*,
    # best-efforts-peek-upsell-chart, sub-*-year-in-sport-2026-upsell-* and
    # achieve--instant-workouts--runna-banner--android, which all leaked.
    const/4 v3, 0x0
    const-string v2, "upsell"
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v2
    if-eqz v2, :morphe_p1
    const/4 v3, 0x1
    :morphe_p1
    const-string v2, "sub-preview-banner"
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v2
    if-eqz v2, :morphe_p2
    const/4 v3, 0x1
    :morphe_p2
    const-string v2, "subscriber-feature-header"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :morphe_p3
    const/4 v3, 0x1
    :morphe_p3
    const-string v2, "recap-progress-entrypoint"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :morphe_p4
    const/4 v3, 0x1
    :morphe_p4
    const-string v2, "yis-2026"
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v2
    if-eqz v2, :morphe_p5
    const/4 v3, 0x1
    :morphe_p5
    const-string v2, "year-in-sport-2026"
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v2
    if-eqz v2, :morphe_p6
    const/4 v3, 0x1
    :morphe_p6
    const-string v2, "runna-banner"
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v2
    if-eqz v2, :morphe_p7
    const/4 v3, 0x1
    :morphe_p7

    # ── Ad predicate (v5, 2026-11-17) ────────────────────────────────────────
    # Sponsored/ad module types are a SEPARATE delivery class from upsells (they do
    # not contain "upsell"), so the v4 predicate let them through. Measured type
    # strings in 486.9: "sponsored-video-android" (SPONSORED_VIDEO_ANDROID enum entry,
    # Lcu6 implements Lvrg), "ss-60d-promo-26*", "settings-samsung-watch-promo", plus
    # DFP/native-ad slot code (Ldfp;). Tokens are chosen to avoid false positives on
    # legit types ("load-instrumentation" etc.): never a bare "ad" substring.
    const-string v2, "sponsored"
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v2
    if-eqz v2, :morphe_p8
    const/4 v3, 0x1
    :morphe_p8
    const-string v2, "promoted"
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v2
    if-eqz v2, :morphe_p9
    const/4 v3, 0x1
    :morphe_p9
    const-string v2, "advertisement"
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v2
    if-eqz v2, :morphe_p10
    const/4 v3, 0x1
    :morphe_p10
    const-string v2, "feed-ad"
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v2
    if-eqz v2, :morphe_p11
    const/4 v3, 0x1
    :morphe_p11
    const-string v2, "native-ad"
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v2
    if-eqz v2, :morphe_p12
    const/4 v3, 0x1
    :morphe_p12
    const-string v2, "dfp"
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v2
    if-eqz v2, :morphe_p13
    const/4 v3, 0x1
    :morphe_p13
    const-string v2, "promo"
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v2
    if-eqz v2, :morphe_p14
    const/4 v3, 0x1
    :morphe_p14

    # ── v6 (2026-11-18) — banners the user reported still showing ────────────
    # "Your predictions are ready" = prediction-deepdive-android /
    # sm-performance-predictions / *performance-predictions*; "See how far
    # you've come" = year-in-sport recap family (year-in-sport, yis-*,
    # mega-share-sheet-yis-android, recap-*). The v5 tokens missed the bare
    # "year-in-sport", "yis" and "prediction" substrings.
    const-string v2, "prediction"
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v2
    if-eqz v2, :morphe_p15
    const/4 v3, 0x1
    :morphe_p15
    const-string v2, "year-in-sport"
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v2
    if-eqz v2, :morphe_p16
    const/4 v3, 0x1
    :morphe_p16
    const-string v2, "yis"
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v2
    if-eqz v2, :morphe_p17
    const/4 v3, 0x1
    :morphe_p17
    const-string v2, "recap"
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v2
    if-eqz v2, :morphe_p18
    const/4 v3, 0x1
    :morphe_p18
    const-string v2, "mega-share"
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v2
    if-eqz v2, :morphe_p19
    const/4 v3, 0x1
    :morphe_p19

    # Per-type user override: morphe.hide.<type> (default = predicate result).
    new-instance v4, Ljava/lang/StringBuilder;
    const-string v2, "morphe.hide."
    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v0
    if-eqz v0, :morphe_show
    const/4 v0, 0x0
    return-object v0
"""

private const val MAPS_GATE_SMALI = """
    invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;
    move-result-object v0
    if-eqz v0, :morphe_show
    const-string v1, "com.strava_preferences"
    const/4 v2, 0x0
    invoke-virtual {v0, v1, v2}, Landroid/app/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
    const-string v1, "morphe.hide.maps-data-peek"
    const/4 v2, 0x1
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v0
    if-eqz v0, :morphe_show
    return-void
"""

// v4: the subscription **bottom-sheet** upsells ("Unlock our best training tools"
// half-sheets). Every one of them is shown by the single target centralized in
// StravaTargets.upsellSheet (Lww4; on 486.9/486.11, Lh95; on 490.15), which maps
// an upsell location to a BottomSheetUpsell enum and instantiates
// BottomSheetUpsellDialogFragment. Returning early here removes the whole family
// (one chokepoint instead of the 20+ call sites). .locals 4 → v0-v2 dead at entry.
private const val UPSELL_SHEET_GATE = """
    invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;
    move-result-object v0
    if-eqz v0, :morphe_ret
    const-string v1, "com.strava_preferences"
    const/4 v2, 0x0
    invoke-virtual {v0, v1, v2}, Landroid/app/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
    const-string v1, "morphe.hide.upsell_sheets"
    const/4 v2, 0x1
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v0
    if-eqz v0, :morphe_ret
    return-void
"""

// v4: dedicated upsell **screens** (activities) that no gate covered:
//   subscriptionsyearinsport/upsell/YearInSportUpsellActivity   (YIS-2026 campaign)
//   subscriptionsdatapeek/BestEffortsDataPeekUpsellActivity     (Best Efforts peek)
//   subscriptionsdeviceconnect/DeviceConnectUpsellActivity      (device-connect promo)
// Injected right after super.onCreate (v0-v2 dead there) → the screen calls
// finish() and the previous screen stays. Same proven pattern as the
// celebration gate. A dedicated pref keeps it independently toggleable.
private const val UPSELL_ACTIVITY_GATE = """
    invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;
    move-result-object v0
    if-eqz v0, :morphe_go
    const-string v1, "com.strava_preferences"
    const/4 v2, 0x0
    invoke-virtual {v0, v1, v2}, Landroid/app/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
    const-string v1, "morphe.hide.upsell_screens"
    const/4 v2, 0x1
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v0
    if-eqz v0, :morphe_go
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
    return-void
"""

@Suppress("unused")
val removeDataPeekUpsellPatch = bytecodePatch(
    name = "Remove upsells & promos",
    description = "Removes Strava's subscription upsells and promos: server-driven modular upsells (matched by an upsell-shape predicate so new server types stay covered), subscription bottom-sheet upsells, and the dedicated upsell screens (Year in Sport 2026, Best Efforts Data Peek, Device Connect). Runtime toggles in Extra Settings; the Settings Subscriptions section is stripped.",
    default = true,
) {
    compatibleWith(STRAVA_COMPATIBILITY)

    execute {
        // 1) Dispatcher gate.
        mutableStravaMethod(
            resolveStravaMethod(
                "Strava modular upsell dispatcher",
                StravaTargets.dispatcher,
            ),
        ).apply {
            addInstructionsWithLabels(
                0,
                MODULE_GATE_SMALI.trimIndent(),
                ExternalLabel("morphe_show", getInstruction(0)),
            )
        }

        // 2) Maps explore card.
        mutableStravaMethod(
            resolveStravaMethod(
                "Strava maps data-peek renderer",
                StravaTargets.mapsRenderer,
            ),
        ).apply {
            addInstructionsWithLabels(
                0,
                MAPS_GATE_SMALI.trimIndent(),
                ExternalLabel("morphe_show", getInstruction(0)),
            )
        }

        // 2a) Converter-level gates.
        for ((convClass, convKey) in listOf(
            "Lcom/strava/subscriptions/ui/modularui/modularcomponents/converters/ActivityReplayUpsellCardConverter;" to "activity-replay-upsell-card",
            "Lcom/strava/subscriptions/ui/modularui/modularcomponents/converters/SubPreviewBannerLargeConverter;" to "sub-preview-banner-large",
            "Lcom/strava/subscriptions/ui/modularui/modularcomponents/converters/SubPreviewBannerSmallConverter;" to "sub-preview-banner-small",
            "Lcom/strava/modularcomponentsconverters/SubscriberFeatureHeaderConverter;" to "subscriber-feature-header",
            // NOTE: lry (recap-progress-entrypoint) is NOT converter-gated —
            // its createModule is .locals 1 with all three p-regs read at
            // entry; the 3-register gate preamble VerifyErrors there
            // (caught live 2026-10-29). The hts.a dispatcher gate covers it.
        )) {
            mutableClassDefBy(convClass).methods.first {
                it.name == "createModule" &&
                    it.returnType == "Lcom/strava/modularframework/data/Module;" &&
                    it.parameters.size == 3
            }.apply {
                addInstructionsWithLabels(
                    0,
                    """
                        invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;
                        move-result-object v0
                        if-eqz v0, :morphe_show
                        const-string v1, "com.strava_preferences"
                        const/4 v2, 0x0
                        invoke-virtual {v0, v1, v2}, Landroid/app/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
                        move-result-object v0
                        const-string v1, "morphe.hide.$convKey"
                        const/4 v2, 0x1
                        invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
                        move-result v0
                        if-eqz v0, :morphe_show
                        const/4 v0, 0x0
                        return-object v0
                    """.trimIndent(),
                    ExternalLabel("morphe_show", getInstruction(0)),
                )
            }
        }
        println("Extra settings: converter-level gates wired (4 upsell converters)")

        // 2b) Subscription bottom-sheet upsells — ONE chokepoint (v4).
        mutableStravaMethod(
            resolveStravaMethod(
                "Strava subscription upsell bottom sheet",
                StravaTargets.upsellSheet,
            ),
        ).apply {
            addInstructionsWithLabels(
                0,
                UPSELL_SHEET_GATE.trimIndent(),
                ExternalLabel("morphe_ret", getInstruction(0)),
            )
        }
        println("Extra settings: subscription bottom-sheet upsell gate wired")

        // 2c) Dedicated upsell screens (v4).
        for (actClass in listOf(
            "Lcom/strava/subscriptionsyearinsport/upsell/YearInSportUpsellActivity;",
            "Lcom/strava/subscriptionsdatapeek/BestEffortsDataPeekUpsellActivity;",
            "Lcom/strava/subscriptionsdeviceconnect/DeviceConnectUpsellActivity;",
        )) {
            val onCreate = mutableClassDefBy(actClass)
                .methods
                .first { it.name == "onCreate" && it.parameters.size == 1 }
            val impl = onCreate.implementation!!
            val superIdx = impl.instructions.indexOfFirst {
                it is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction &&
                    it.opcode == com.android.tools.smali.dexlib2.Opcode.INVOKE_SUPER &&
                    it.reference.toString().contains("onCreate")
            }
            if (superIdx < 0) {
                throw PatchException("$actClass onCreate super not found — re-audit.")
            }
            onCreate.addInstructionsWithLabels(
                superIdx + 1,
                UPSELL_ACTIVITY_GATE.trimIndent(),
                ExternalLabel("morphe_go", onCreate.getInstruction(superIdx + 1)),
            )
        }
        println("Extra settings: upsell screen gates wired (3 activities)")

        // 2d) Celebrations.
        val CELEB_GATE = """
    invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;
    move-result-object v0
    if-eqz v0, :morphe_go
    const-string v1, "com.strava_preferences"
    const/4 v2, 0x0
    invoke-virtual {v0, v1, v2}, Landroid/app/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
    const-string v1, "morphe.hide.celebrations"
    const/4 v2, 0x0
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v0
    if-eqz v0, :morphe_go
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
    return-void
"""
        for (celebClass in listOf(
            "Lcom/strava/celebrations/view/CelebrationActivity;",
            "Lcom/strava/challenges/challengecelebration/ChallengeCelebrationBottomSheetActivity;",
        )) {
            val onCreate = mutableClassDefBy(celebClass)
                .methods
                .first { it.name == "onCreate" && it.parameters.size == 1 }
            val impl = onCreate.implementation!!
            val superIdx = impl.instructions.indexOfFirst {
                it is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction &&
                    it.opcode == com.android.tools.smali.dexlib2.Opcode.INVOKE_SUPER &&
                    it.reference.toString().contains("onCreate")
            }
            if (superIdx < 0) {
                throw PatchException("$celebClass onCreate super not found — re-audit.")
            }
            onCreate.addInstructionsWithLabels(
                superIdx + 1,
                CELEB_GATE.trimIndent(),
                ExternalLabel("morphe_go", onCreate.getInstruction(superIdx + 1)),
            )
        }

        val sheetType = "Lcom/strava/celebrations/view/CelebrationBottomSheetDialogFragment;"
        val sheet = mutableClassDefBy(sheetType)
        sheet.methods.add(
            com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
                sheetType,
                "show",
                listOf(
                    com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(
                        "Landroidx/fragment/app/FragmentManager;", null, null),
                    com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(
                        "Ljava/lang/String;", null, null),
                ),
                "V",
                com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value,
                null,
                null,
                com.android.tools.smali.dexlib2.builder.MutableMethodImplementation(3),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;
                        move-result-object v0
                        if-eqz v0, :morphe_orig
                        const-string v1, "com.strava_preferences"
                        const/4 v2, 0x0
                        invoke-virtual {v0, v1, v2}, Landroid/app/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
                        move-result-object v0
                        const-string v1, "morphe.hide.celebrations"
                        const/4 v2, 0x0
                        invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
                        move-result v0
                        if-eqz v0, :morphe_orig
                        return-void
                        :morphe_orig
                        invoke-super {p0, p1, p2}, Lcom/strava/celebrations/view/Hilt_CelebrationBottomSheetDialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V
                        return-void
                    """.trimIndent(),
                )
            },
        )
        println("Extra settings: celebration gates wired (2 activities + detail sheet)")

        // 3) Settings Subscriptions section.
        val sectionRenderer = mutableStravaMethod(
            resolveStravaMethod(
                "Strava Settings Subscriptions renderer",
                StravaTargets.settingsRenderer,
            ),
        )
        sectionRenderer.apply {
            clearBody()
            addInstructions(0, "return-void")
        }

        val settingsHeader = resolveStravaMethod(
            "Strava Settings Subscriptions header",
            StravaTargets.settingsHeader,
        )
        val settingsCaller = mutableStravaMethod(
            resolveStravaMethod(
                "Strava Settings Subscriptions caller",
                StravaTargets.settingsCaller,
            ),
        )
        var headerKill = false
        val settingsCallerImpl = settingsCaller.implementation!!
        settingsCallerImpl.instructions.forEachIndexed { idx, instr ->
            val isHeaderCall =
                instr is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction &&
                    (instr.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference)
                        ?.let {
                            it.definingClass == settingsHeader.classDef.type &&
                                it.name == settingsHeader.method.name
                        } == true
            if (isHeaderCall) {
                settingsCallerImpl.replaceInstruction(
                    idx,
                    BuilderInstruction10x(com.android.tools.smali.dexlib2.Opcode.NOP),
                )
                headerKill = true
            }
        }
        if (!headerKill) {
            throw PatchException(
                "Section header call (${settingsHeader.classDef.type}->${settingsHeader.method.name}) " +
                    "not found in settings caller — re-audit.",
            )
        }

        // 4) SuperUserToolsActivity console unlock — DEBUG-ONLY, off by
        // default (pairs with the manifest export gate in the resource
        // patch: exported + finish-check removed is a security surface).
        if (morpheSuConsole) {
            val suOnCreate = mutableClassDefBy("Lcom/strava/view/superuser/SuperUserToolsActivity;")
                .methods
                .first { it.name == "onCreate" }
            val suImpl = suOnCreate.implementation!!
            var suKill = false
            suImpl.instructions.forEachIndexed { idx, instr ->
                if (!suKill &&
                    instr is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction &&
                    instr.opcode == com.android.tools.smali.dexlib2.Opcode.INVOKE_VIRTUAL &&
                    (instr.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference)
                        ?.let { it.definingClass == "Landroid/app/Activity;" && it.name == "finish" } == true
                ) {
                    suImpl.replaceInstruction(idx, BuilderInstruction10x(com.android.tools.smali.dexlib2.Opcode.NOP))
                    for (back in 1..6) {
                        val prev = suImpl.instructions[idx - back]
                        if (prev.opcode == com.android.tools.smali.dexlib2.Opcode.IF_NEZ) {
                            suImpl.replaceInstruction(
                                idx - back,
                                BuilderInstruction10x(com.android.tools.smali.dexlib2.Opcode.NOP),
                            )
                            break
                        }
                    }
                    suKill = true
                }
            }
            if (!suKill) {
                throw PatchException("SuperUserTools finish() not found — re-audit.")
            }
            println("Extra settings: SuperUserTools console unlocked")
        }

        // 5) STABILITY: Strava's modular-UI "Print module data to logcat"
        // debug switch (pref modular_ui_dev_tools_data_logging → pss.a) makes
        // every ViewHolder run kotlin-reflect over its module data class —
        // which crashes FATAL on metadata-less data classes (e.g.
        // ActivityCalendarRowData$e; kind=null → KotlinReflectionInternalError
        // at StackViewHolder.onBindView). Force pss.a reads to false so the
        // reflective dump never runs; the debug toggle becomes inert.
        val loggerField = resolveStravaField(
            "Strava module-data logger flag",
            StravaTargets.loggerFieldClasses,
            fieldName = "a",
            fieldType = "Z",
        )
        val bindView = mutableStravaMethod(
            resolveStravaMethod(
                "Strava modular ViewHolder bindView",
                StravaTargets.viewHolder,
            ),
        )
        val bImpl = bindView.implementation!!
        var loggerFlagKill = false
        bImpl.instructions.forEachIndexed { idx, instr ->
            if (!loggerFlagKill &&
                instr.opcode == com.android.tools.smali.dexlib2.Opcode.SGET_BOOLEAN &&
                (instr as com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                    .reference.let {
                        it is com.android.tools.smali.dexlib2.iface.reference.FieldReference &&
                            it.definingClass == loggerField.classDef.type &&
                            it.name == loggerField.field.name &&
                            it.type == loggerField.field.type
                    }
            ) {
                val dest = (instr as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA
                bImpl.replaceInstruction(
                    idx,
                    if (dest <= 15) {
                        com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n(
                            com.android.tools.smali.dexlib2.Opcode.CONST_4, dest, 0,
                        )
                    } else {
                        com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s(
                            com.android.tools.smali.dexlib2.Opcode.CONST_16, dest, 0,
                        )
                    },
                )
                loggerFlagKill = true
            }
        }
        if (!loggerFlagKill) {
            throw PatchException(
                "Logger flag read (${loggerField.classDef.type}->${loggerField.field.name}) " +
                    "not found in ViewHolder bindView — re-audit.",
            )
        }
        println("Extra settings: module-data-logging crash guard wired")

        // 6) Performance Predictions home banner ("Your predictions are
        // ready / Start a free trial …"): NOT modular-UI — a native
        // composable (StravaTargets.predictionsRenderer: Lfg60; on
        // 486.9/486.11, Lw080; on 490.15; Rive text "Performance Predictions")
        // fed by RaceBannerRepository.getSuggestedRaces. Gate the renderer
        // directly; default HIDE. Pref:
        // morphe.hide.performance-predictions-banner.
        mutableStravaMethod(
            resolveStravaMethod(
                "Strava performance-predictions renderer",
                StravaTargets.predictionsRenderer,
            ),
        ).apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;
                    move-result-object v0
                    if-eqz v0, :morphe_show
                    const-string v1, "com.strava_preferences"
                    const/4 v2, 0x0
                    invoke-virtual {v0, v1, v2}, Landroid/app/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
                    move-result-object v0
                    const-string v1, "morphe.hide.performance-predictions-banner"
                    const/4 v2, 0x1
                    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
                    move-result v0
                    if-eqz v0, :morphe_show
                    return-void
                """.trimIndent(),
                ExternalLabel("morphe_show", getInstruction(0)),
            )
        }
        // 6b) The server-driven banner itself: RaceBannerRepositoryImpl
        // .getSuggestedRaces (.locals 0, 3-instruction delegate, no
        // try-blocks). When the hide-pref is set, park the coroutine on
        // COROUTINE_SUSPENDED and never resume: the flow never emits, so
        // the feed never receives banner state. (The predictions renderer is
        // the static preview card with baked text; THIS is the live server
        // banner.)
        // Original body is left intact and reached via the :morphe_show
        // fall-through when the user re-enables the banner.
        val raceTarget = resolveStravaMethod(
            "Strava RaceBannerRepository",
            StravaTargets.raceRepository,
        )
        val coroutineMarker = resolveStravaStaticSelfFieldWithLiteral(
            "Strava coroutine marker",
            StravaTargets.coroutineMarkerClasses,
            literal = "COROUTINE_SUSPENDED",
        )
        val raceClass = mutableClassDefBy(raceTarget.classDef)
        val raceRepository = raceClass.methods.first {
            it.name == raceTarget.method.name &&
                it.returnType == raceTarget.method.returnType &&
                it.parameterTypes == raceTarget.method.parameterTypes
        }
        val raceRepositoryClone = raceTarget.method.cloneRaceBannerWithGate(
            markerClassType = coroutineMarker.classDef.type,
            markerFieldName = coroutineMarker.field.name,
            markerFieldType = coroutineMarker.field.type,
        )
        raceClass.methods.remove(raceRepository)
        raceClass.methods.add(raceRepositoryClone)
        println("Extra settings: RaceBanner suspend gate wired (coroutine park)")

        println("Extra settings: performance-predictions banner gate wired")

        println("Extra settings: module gates wired, Settings Subscriptions section disabled")
    }
}
