package dev.freeman022026.rustore.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

@Suppress("unused")
val disableAdvertisementsPatch = bytecodePatch(
    name = "Disable advertisements",
    description = "Removes ad providers, sanitizes ad identifiers, returns an empty ad list, and keeps advertising consent disabled.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)
    dependsOn(advertisingManifestPatch)

    execute {
        rawAdvertisementRepositoryGetFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lvt0/y;->a:Lvt0/y;
                return-object v0
            """
        )
        advertisementIdsConstructorFingerprint.method.addInstructions(
            0,
            """
                const-string p1, "00000000-0000-0000-0000-000000000000"
                const-string p2, "00000000-0000-0000-0000-000000000000"
                const/4 p3, 0x0
                const/4 p4, 0x0
                const/4 p5, 0x0
            """
        )
        settingConstructorFingerprint.method.addInstruction(0, "const/4 p6, 0x0")
        agreementSettingConstructorFingerprint.method.addInstruction(0, "const/4 p3, 0x0")
    }
}

@Suppress("unused")
val excludeGooglePlayAppsFromUpdateChecksPatch = bytecodePatch(
    name = "Exclude Google Play apps from update checks",
    description = "Excludes only apps whose recorded Android installer is Google Play from update requests.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)

    execute {
        appVersionInfoListFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val equalsIndex = instructions.withIndex().single { (_, instruction) ->
                (instruction as? ReferenceInstruction)?.reference?.toString() ==
                    "Ljava/lang/Object;->equals(Ljava/lang/Object;)Z"
            }.index
            val equalsResult = instructions[equalsIndex + 1]
            require(equalsResult.opcode == Opcode.MOVE_RESULT)
            val equalsRegister = (equalsResult as OneRegisterInstruction).registerA

            addInstruction(
                equalsIndex + 2,
                "xor-int/lit8 v$equalsRegister, v$equalsRegister, 0x1"
            )
            addInstruction(0, "const-string p1, \"com.android.vending\"")
        }
    }
}

@Suppress("unused")
val disableAnalyticsAndTrackersPatch = bytecodePatch(
    name = "Disable analytics and trackers",
    description = "Disables audited analytics transports and replaces the stable request device identifier.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)
    dependsOn(analyticsManifestPatch)

    execute {
        requestDeviceIdFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "00000000-0000-0000-0000-000000000000"
                return-object v0
            """
        )
        listOf(appMetricaActivateFingerprint, myTrackerInitializeFingerprint).forEach { fingerprint ->
            fingerprint.method.addInstruction(0, "return-void")
        }
        mainActivityOnNewIntentFingerprint.method.apply {
            val matchingIndexes = implementation!!.instructions.withIndex()
                .filter { (_, instruction) ->
                    (instruction as? ReferenceInstruction)?.reference?.toString() ==
                        REPORT_APP_OPEN_REFERENCE
                }
                .map { it.index }
            require(matchingIndexes.size == 1) {
                "Expected one AppMetrica reportAppOpen call, found ${matchingIndexes.size}"
            }
            removeInstructions(matchingIndexes.single(), 1)
        }

        altCraftSendFingerprint.method.addInstruction(0, "return-void")
        altCraftScheduleFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "AltCraftFlushEventsWorker"
                invoke-virtual {p0, v0}, Ltb/j0;->a(Ljava/lang/String;)Ltb/a0;
                return-void
            """
        )
        altCraftWorkerFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Landroidx/work/c${'$'}a${'$'}c;
                invoke-direct {v0}, Landroidx/work/c${'$'}a${'$'}c;-><init>()V
                return-object v0
            """
        )

        radarScheduleFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "RadarFlushSnapshotsWorker"
                invoke-virtual {p0, v0}, Ltb/j0;->a(Ljava/lang/String;)Ltb/a0;
                return-void
            """
        )
        radarWorkerFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Landroidx/work/c${'$'}a${'$'}c;
                invoke-direct {v0}, Landroidx/work/c${'$'}a${'$'}c;-><init>()V
                return-object v0
            """
        )
    }
}

@Suppress("unused")
val restrictBackgroundWorkToUpdatesPatch = bytecodePatch(
    name = "Restrict background work to updates",
    description = "Keeps only the background workers required for automatic update checks, downloads, patch application, and installation, including charging-triggered checks.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)
    dependsOn(analyticsManifestPatch, disablePushServicesPatch)

    execute {
        val workerSuccess = """
            new-instance v0, Landroidx/work/c${'$'}a${'$'}c;
            invoke-direct {v0}, Landroidx/work/c${'$'}a${'$'}c;-><init>()V
            return-object v0
        """
        blockedBackgroundCoroutineWorkerFingerprints.forEachIndexed { index, fingerprint ->
            val workerClass = blockedCoroutineWorkerClasses[index]
            requireNotNull(fingerprint.methodOrNull) {
                "Background coroutine worker fingerprint changed: $workerClass"
            }.addInstructions(0, workerSuccess)
        }
        blockedBackgroundWorkerFingerprints.forEachIndexed { index, fingerprint ->
            val workerClass = blockedWorkerClasses[index]
            requireNotNull(fingerprint.methodOrNull) {
                "Background worker fingerprint changed: $workerClass"
            }.addInstructions(0, workerSuccess)
        }

        omicronNetworkRequestFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lt31/e;->ERROR:Lt31/e;
                return-object v0
            """
        )
        omicronDefaultScheduleFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                invoke-virtual {v0}, Lru/mail/omicron/DefaultWorkManagerExecutor;->cancel()V
                return-void
            """
        )
        omicronMultiAccountScheduleFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                invoke-virtual {v0}, Lru/mail/omicron/MultiAccountWorkManagerExecutor;->cancel()V
                return-void
            """
        )

        installIdentifierInitializerFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                iget-object v0, v0, Lru/vk/store/feature/install/identifier/impl/presentation/a;->d:Ltb/j0;
                const-string v1, "InstallIdentifierSyncWorker"
                invoke-virtual {v0, v1}, Ltb/j0;->a(Ljava/lang/String;)Ltb/a0;
                sget-object v0, Lut0/e0;->a:Lut0/e0;
                return-object v0
            """
        )
        usageStatsInitializerFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                iget-object v0, v0, Lru/vk/store/feature/usagestats/impl/presentation/a;->b:Ltb/j0;
                const-string v1, "UsageStatsCollectorWorker"
                invoke-virtual {v0, v1}, Ltb/j0;->a(Ljava/lang/String;)Ltb/a0;
                sget-object v0, Lut0/e0;->a:Lut0/e0;
                return-object v0
            """
        )
        cancelSubscriptionInitializerFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                iget-object v0, v0, Lru/vk/store/feature/payments/subscription/update/impl/presentation/a;->b:Ltb/j0;
                const-string v1, "CancelSubscriptionSyncWorker"
                invoke-virtual {v0, v1}, Ltb/j0;->a(Ljava/lang/String;)Ltb/a0;
                sget-object v0, Lut0/e0;->a:Lut0/e0;
                return-object v0
            """
        )
        remoteAnalyticsInitializerFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                iget-object v0, v0, Ly32/d;->a:Lru/vk/store/feature/storeapp/analytics/remote/impl/presentation/b;
                iget-object v0, v0, Lru/vk/store/feature/storeapp/analytics/remote/impl/presentation/b;->a:Ltb/j0;
                const-string v1, "SendAnalyticsEventPeriodicWorker"
                invoke-virtual {v0, v1}, Ltb/j0;->a(Ljava/lang/String;)Ltb/a0;
                const-string v1, "SendAnalyticsEventWorker"
                invoke-virtual {v0, v1}, Ltb/j0;->a(Ljava/lang/String;)Ltb/a0;
                sget-object v0, Lut0/e0;->a:Lut0/e0;
                return-object v0
            """
        )
        remoteAnalyticsSchedulerFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                iget-object v0, v0, Lru/vk/store/feature/storeapp/analytics/remote/impl/presentation/b;->a:Ltb/j0;
                const-string v1, "SendAnalyticsEventWorker"
                invoke-virtual {v0, v1}, Ltb/j0;->a(Ljava/lang/String;)Ltb/a0;
                sget-object v0, Lut0/e0;->a:Lut0/e0;
                return-object v0
            """
        )

        launcherIconScheduleFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                iget-object v0, v0, Lul1/i;->a:Ltb/j0;
                const-string v1, "LauncherIconUpdate"
                invoke-virtual {v0, v1}, Ltb/j0;->a(Ljava/lang/String;)Ltb/a0;
                return-void
            """
        )
        startDestinationScheduleFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                iget-object v0, v0, Lk32/e;->a:Ltb/j0;
                const-string v1, "PeriodicUpdateStartDestination"
                invoke-virtual {v0, v1}, Ltb/j0;->a(Ljava/lang/String;)Ltb/a0;
                return-void
            """
        )
        tabsOrderScheduleFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                iget-object v0, v0, Lq32/g;->a:Ltb/j0;
                const-string v1, "NavigationTabsOrderUpdate"
                invoke-virtual {v0, v1}, Ltb/j0;->a(Ljava/lang/String;)Ltb/a0;
                return-void
            """
        )
        publisherTrackingScheduleFingerprint.method.addInstruction(0, "return-void")

        listOf(analyticsDispatchFingerprint, analyticsUserIdFingerprint).forEach { fingerprint ->
            fingerprint.method.addInstruction(0, "return-void")
        }
        listOf(
            "VK push provider" to pushProviderOnInitializedFingerprint,
            "VK push authentication" to pushAuthOnInitializedFingerprint
        ).forEach { (feature, fingerprint) ->
            requireNotNull(fingerprint.methodOrNull) {
                "$feature initializer fingerprint changed"
            }.addInstructions(
                0,
                """
                    sget-object v0, Lut0/e0;->a:Lut0/e0;
                    return-object v0
                """
            )
        }
        pushLifecycleFingerprints.forEachIndexed { index, fingerprint ->
            val lifecycleMethod = pushLifecycleMethods.keys.elementAt(index)
            requireNotNull(fingerprint.methodOrNull) {
                "Push lifecycle fingerprint changed: $lifecycleMethod"
            }.addInstruction(0, "return-void")
        }
    }
}

@Suppress("unused")
val disableKasperskyBackgroundScanPatch = bytecodePatch(
    name = "Disable Kaspersky background scan",
    description = "Disables periodic Kaspersky scheduling and reports disabled workers as successfully completed.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)
    dependsOn(kasperskyManifestPatch)

    execute {
        kasperskyPeriodicEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
        kasperskyScheduleFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "PeriodicKasperskyScanner"
                invoke-virtual {p1, v0}, Ltb/j0;->a(Ljava/lang/String;)Ltb/a0;
                invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;
                move-result-object v0
                return-object v0
            """
        )
        kasperskyWorkerFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Landroidx/work/c${'$'}a${'$'}c;
                invoke-direct {v0}, Landroidx/work/c${'$'}a${'$'}c;-><init>()V
                return-object v0
            """
        )
    }
}

@Suppress("unused")
val hideGamingProfilePatch = bytecodePatch(
    name = "Hide gaming profile",
    description = "Removes the gaming profile permission, hides both gaming buttons, and blocks navigation to the gaming profile.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)
    dependsOn(gamingManifestPatch)

    execute {
        mineViewModelOpenGameCenterFingerprint.method.addInstruction(0, "return-void")
        gameCenterV2ButtonFingerprint.method.addInstruction(0, "return-void")
        gameCenterV1ButtonFingerprint.method.addInstruction(0, "return-void")
    }
}

@Suppress("unused")
val skipUpdateAuthenticationPatch = bytecodePatch(
    name = "Skip update authentication",
    description = "Skips the update authentication suggestion and returns a valid completed result.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)
    dependsOn(validatedManifestPatch)

    execute {
        val unitReferences = updateAuthSuggestFingerprint.method.implementation!!.instructions
            .zipWithNext()
            .mapNotNull { (fieldInstruction, returnInstruction) ->
                if (
                    fieldInstruction.opcode != Opcode.SGET_OBJECT ||
                    returnInstruction.opcode != Opcode.RETURN_OBJECT
                ) return@mapNotNull null

                ((fieldInstruction as? ReferenceInstruction)?.reference as? FieldReference)
                    ?.takeIf { it.definingClass == it.type }
            }
            .distinctBy { it.toString() }
        require(unitReferences.size == 1) {
            "Expected one completed-result singleton reference, found ${unitReferences.size}"
        }

        updateAuthSuggestFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, ${unitReferences.single()}
                return-object v0
            """
        )
    }
}
