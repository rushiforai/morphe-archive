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
//   5) DEBUG probe (investigation builds only): GenericLayoutEntryJsonAdapter
//      .deserialize logs every module "type" as the feed parses — identifies
//      the module types driving home-feed banners. REMOVE BEFORE RELEASE.
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
    const/4 v3, 0x0
    const-string v2, "activity-replay-upsell-card"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :morphe_t2
    const/4 v3, 0x1
    :morphe_t2
    const-string v2, "subscriber-feature-header"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :morphe_t3
    const/4 v3, 0x1
    :morphe_t3
    const-string v2, "sub-preview-banner-large"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :morphe_t4
    const/4 v3, 0x1
    :morphe_t4
    const-string v2, "sub-preview-banner-small"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :morphe_t5
    const/4 v3, 0x1
    :morphe_t5
    const-string v2, "data-peek-upsell"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :morphe_t6
    const/4 v3, 0x1
    :morphe_t6
    const-string v2, "recap-progress-entrypoint"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :morphe_t7
    const/4 v3, 0x1
    :morphe_t7
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

@Suppress("unused")
val removeDataPeekUpsellPatch = bytecodePatch(
    name = "Remove Data Peek upsells",
    description = "Removes server-driven subscription upsells (Data Peek carousel, replay card, prediction banner, SubPreview banners, Maps explore card) with runtime toggles in Extra Settings, and strips the Settings Subscriptions section.",
    default = true,
) {
    compatibleWith(STRAVA_COMPATIBILITY)

    execute {
        // 1) Dispatcher gate.
        mutableClassDefBy("Lhts;").methods.first {
            it.name == "a" &&
                it.returnType == "Lcom/strava/modularframework/data/Module;" &&
                it.parameters.size == 1 &&
                it.parameters[0].type == "Lcom/strava/modularframework/data/GenericLayoutModule;"
        }.apply {
            addInstructionsWithLabels(
                0,
                MODULE_GATE_SMALI.trimIndent(),
                ExternalLabel("morphe_show", getInstruction(0)),
            )
        }

        // 2) Maps explore card.
        mutableClassDefBy("Lrl60;").methods.first {
            it.name == "d" &&
                it.returnType == "V" &&
                it.parameters.size == 5 &&
                it.parameters[1].type == "Ljos;"
        }.apply {
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

        // 2b) Celebrations.
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
        val sectionRenderer = mutableClassDefBy("Lpr5;")
            .methods
            .first { it.name == "a" && it.returnType == "V" }
        sectionRenderer.apply {
            clearBody()
            addInstructions(0, "return-void")
        }

        val b130 = mutableClassDefBy("Lb130;")
            .methods
            .first { it.name == "invoke" }
        var headerKill = false
        val b130impl = b130.implementation!!
        b130impl.instructions.forEachIndexed { idx, instr ->
            val isHeaderCall =
                instr is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction &&
                    (instr.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference)
                        ?.let { it.definingClass == "Le130;" && it.name == "i" } == true
            if (isHeaderCall) {
                b130impl.replaceInstruction(
                    idx,
                    BuilderInstruction10x(com.android.tools.smali.dexlib2.Opcode.NOP),
                )
                headerKill = true
            }
        }
        if (!headerKill) {
            throw PatchException(
                "Section header call (Le130;->i) not found in b130.invoke — re-audit.",
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

        // 5) DEBUG probe — REMOVE BEFORE RELEASE. Materialize the class from
        // its raw ClassDef first: the patcher's lazy MutableClass NPEs on
        // .methods for untouched classes in FULL mode (486.11).
        try {
            val adapterCd = classDefByOrNull(
                "Lcom/strava/modularframework/serialization/GenericLayoutEntryJsonAdapter;",
            ) ?: throw PatchException("adapter class not found")
            mutableClassDefBy(adapterCd).methods.first {
                it.name == "deserialize" && it.returnType == "Ljava/lang/Object;"
            }.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-virtual {p1}, Lcom/google/gson/JsonElement;->isJsonObject()Z
                    move-result v0
                    if-eqz v0, :morphe_done
                    check-cast p1, Lcom/google/gson/JsonObject;
                    const-string v0, "type"
                    invoke-virtual {p1, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;
                    move-result-object v0
                    if-eqz v0, :morphe_done
                    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->isJsonPrimitive()Z
                    move-result v1
                    if-eqz v1, :morphe_done
                    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;
                    move-result-object v0
                    const-string v1, "MorpheTypes"
                    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                    :morphe_done
                """.trimIndent(),
                ExternalLabel("morphe_done", getInstruction(15)),
            )
            }
            println("Extra settings: adapter type probe wired (DEBUG)")
        } catch (e: Exception) {
            println("Extra settings: adapter type probe skipped (${e.message?.take(60)})")
        }

        // 6) STABILITY: Strava's modular-UI "Print module data to logcat"
        // debug switch (pref modular_ui_dev_tools_data_logging → pss.a) makes
        // every ViewHolder run kotlin-reflect over its module data class —
        // which crashes FATAL on metadata-less data classes (e.g.
        // ActivityCalendarRowData$e; kind=null → KotlinReflectionInternalError
        // at StackViewHolder.onBindView). Force pss.a reads to false so the
        // reflective dump never runs; the debug toggle becomes inert.
        val dssCd = classDefByOrNull("Ldss;")
            ?: throw PatchException("dss (ViewHolder base) not found — re-audit.")
        val dss = mutableClassDefBy(dssCd)
        val bindView = dss.methods.first {
            it.name == "bindView" && it.parameters.size == 2
        }
        val bImpl = bindView.implementation!!
        var pssKill = false
        bImpl.instructions.forEachIndexed { idx, instr ->
            if (!pssKill &&
                instr.opcode == com.android.tools.smali.dexlib2.Opcode.SGET_BOOLEAN &&
                (instr as com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                    .reference.let {
                        it is com.android.tools.smali.dexlib2.iface.reference.FieldReference &&
                            it.definingClass == "Lpss;" && it.name == "a"
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
                pssKill = true
            }
        }
        if (!pssKill) {
            throw PatchException("pss.a read not found in dss.bindView — re-audit.")
        }
        println("Extra settings: module-data-logging crash guard wired")

        // 7) Performance Predictions home banner ("Your predictions are
        // ready / Start a free trial …"): NOT modular-UI — a native
        // composable (fg60.c, Rive text "Performance Predictions") fed by
        // RaceBannerRepository.getSuggestedRaces. Gate the renderer
        // directly; default HIDE. fg60.c is .locals 29 — v0-v3 free at
        // entry. Pref: morphe.hide.performance-predictions-banner.
        val ppCd = classDefByOrNull("Lfg60;")
            ?: throw PatchException("fg60 (predictions banner) not found — re-audit.")
        mutableClassDefBy(ppCd).methods.first {
            it.name == "c" && it.parameters.size == 3 &&
                it.parameters[0].type == "Ljos;"
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
        // 7b) The server-driven banner itself: RaceBannerRepositoryImpl
        // .getSuggestedRaces (.locals 0, 3-instruction delegate, no
        // try-blocks). When the hide-pref is set, park the coroutine on
        // COROUTINE_SUSPENDED and never resume: the flow never emits, so
        // the feed never receives banner state. (fg60.c is the static
        // preview card with baked text; THIS is the live server banner.)
        // Original body is left intact and reached via the :morphe_show
        // fall-through when the user re-enables the banner.
        val repoCd = classDefByOrNull(
            "Lcom/strava/performancepredictions/data/RaceBannerRepositoryImpl;",
        ) ?: throw PatchException("RaceBannerRepositoryImpl not found - re-audit.")
        mutableClassDefBy(repoCd).methods.first {
            it.name == "getSuggestedRaces" && it.parameterTypes.size == 1
        }.apply {
            ensureRegisters(5)
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
                    sget-object v0, Lcmb;->a:Lcmb;
                    return-object v0
                """.trimIndent(),
                ExternalLabel("morphe_show", getInstruction(0)),
            )
        }
        println("Extra settings: RaceBanner suspend gate wired (coroutine park)")

        println("Extra settings: performance-predictions banner gate wired")

        println("Extra settings: module gates wired (hts.a + rl60.d), Settings Subscriptions section disabled")
    }
}
