package dev.freeman022026.rustore.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val UNIT_RESULT = """
    sget-object v0, Lsu0/e0;->a:Lsu0/e0;
    return-object v0
"""

private const val FALSE_RESULT = """
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    return-object v0
"""

/**
 * Inserts code after App.onCreate's super call, where dependency injection has
 * finished and WorkManager can be initialized. Only p0 and v0-v2 may be used.
 */
private fun MutableMethod.addAfterApplicationSuperOnCreate(smali: String) {
    val superCalls = implementation!!.instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.INVOKE_SUPER &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == APPLICATION_SUPER_ON_CREATE
    }
    require(superCalls.size == 1) {
        "Expected one Application super.onCreate call, found ${superCalls.size}"
    }
    addInstructions(superCalls.single().index + 1, smali)
}

@Suppress("unused")
val disableAdvertisementsPatch = bytecodePatch(
    name = "Disable advertisements",
    description = "Removes ad providers, sanitizes ad identifiers, returns an empty ad list, blocks promo tracking pixels, and keeps advertising consent disabled.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)
    dependsOn(advertisingManifestPatch)

    execute {
        googleAdvertisingIdFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;
                const-string v1, "00000000-0000-0000-0000-000000000000"
                const/4 v2, 0x1
                invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;-><init>(Ljava/lang/String;Z)V
                return-object v0
            """
        )
        rawAdvertisementRepositoryGetFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ltu0/x;->a:Ltu0/x;
                return-object v0
            """
        )
        // Promo cards arrive inside showcase sections; their show, click and install pixels go here.
        promoTrackingUrlFingerprint.method.addInstructions(0, UNIT_RESULT)
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
    description = "Disables audited analytics transports, including VK Push metrics, and replaces the stable request device identifier.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)
    dependsOn(analyticsManifestPatch)

    execute {
        // These paths run directly, outside the blocked WorkManager workers.
        listOf(
            metricsEventCollectionFingerprint,
            mediaScopeTrackFingerprint,
            inAppStoryInitializeFingerprint
        ).forEach { fingerprint ->
            fingerprint.method.addInstructions(0, UNIT_RESULT)
        }
        // Also discard queued events from installations predating this patch.
        metricsEventSendFingerprint.method.addInstruction(0, "return-void")

        // VK Push metrics: stop queuing events and drop batches already queued.
        pushMetricsEventFingerprint.method.addInstruction(0, "return-void")
        pushMetricsBatchSendFingerprint.method.addInstruction(0, "return-void")
        applicationOnCreateFingerprint.method.addAfterApplicationSuperOnCreate(
            """
                const-string v1, "jobscheduler"
                invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
                move-result-object v0
                check-cast v0, Landroid/app/job/JobScheduler;
                const v1, $PUSH_METRICS_JOB_ID
                invoke-virtual {v0, v1}, Landroid/app/job/JobScheduler;->cancel(I)V
            """
        )
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

        altCraftSendFingerprint.method.addInstruction(0, "return-void")
        listOf(altCraftScheduleFingerprint, altCraftFrequentScheduleFingerprint).forEach { fingerprint ->
            fingerprint.method.addInstructions(
                0,
                """
                    const-string v0, "AltCraftFlushEventsWorker"
                    invoke-virtual {p0, v0}, $WORK_MANAGER_CANCEL_UNIQUE
                    return-void
                """
            )
        }
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
                invoke-virtual {p0, v0}, $WORK_MANAGER_CANCEL_UNIQUE
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
val replaceRuStoreSdkDeviceIdentifierPatch = bytecodePatch(
    name = "Replace RuStore SDK device identifier",
    description = "Replaces the RuStore SDK device identifier sent with payment and session requests with the zero UUID.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)

    execute {
        rustoreSdkDeviceIdFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "00000000-0000-0000-0000-000000000000"
                return-object v0
            """
        )
    }
}

@Suppress("unused")
val replaceVkSdkDeviceIdentifierPatch = bytecodePatch(
    name = "Replace VK SDK device identifier",
    description = "Replaces the VK SDK device fingerprint sent by VK ID and VK Pay request paths with the zero UUID.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)

    execute {
        vkSdkDeviceIdFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "00000000-0000-0000-0000-000000000000"
                return-object v0
            """
        )
    }
}

@Suppress("unused")
val restrictBackgroundWorkToUpdatesPatch = bytecodePatch(
    name = "Restrict background work to updates",
    description = "Keeps only the workers required for automatic updates and allows update checks to run while RuStore is foreground or background.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)
    dependsOn(analyticsManifestPatch, disablePushServicesPatch)

    execute {
        // Android preserves explicit component overrides across APK updates.
        val disablePersistedPushServices = listOf(
            "com.vk.push.authsdk.ipc.AuthService",
            "com.vk.push.pushsdk.ipc.PushService",
            "com.vk.push.pushsdk.masterhost.MasterSelectionService"
        ).joinToString("\n") { service ->
            """
                new-instance v1, Landroid/content/ComponentName;
                const-string v2, "$service"
                invoke-direct {v1, v6, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V
                const/4 v3, 0x2
                const/4 v4, 0x1
                invoke-virtual {v0, v1, v3, v4}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V
            """
        }
        applicationOnCreateFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v6, p0
                invoke-virtual {v6}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
                move-result-object v0
                $disablePersistedPushServices
            """
        )
        // The schedulers below now reach WorkManager through a suspending provider, so
        // work persisted by an earlier official install is cancelled here instead.
        val cancelUniqueWork = cancelledUniqueWorkNames.joinToString("\n") { name ->
            """
                const-string v1, "$name"
                invoke-virtual {v0, v1}, $WORK_MANAGER_CANCEL_UNIQUE
            """
        }
        applicationOnCreateFingerprint.method.addAfterApplicationSuperOnCreate(
            """
                invoke-static {p0}, $WORK_MANAGER_GET_INSTANCE
                move-result-object v0
                $cancelUniqueWork
            """
        )
        autoUpdateForegroundRestrictionFingerprint.method.apply {
            val foregroundRead = implementation!!.instructions.withIndex().single { (_, instruction) ->
                instruction.opcode == Opcode.IGET_BOOLEAN &&
                    (instruction as? ReferenceInstruction)?.reference?.toString() == "Lsx2/b;->c:Z"
            }
            val register = (foregroundRead.value as OneRegisterInstruction).registerA
            // Keep the existing update-permission and status checks.
            replaceInstruction(foregroundRead.index, "const/4 v$register, 0x0")
        }

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

        // Its persisted worker is cancelled with the other unique work after App.onCreate.
        tracerDiskUsageInitializerFingerprint.method.addInstruction(0, "return-void")
        tracerSampleUploadFingerprint.method.addInstruction(0, "return-void")

        omicronNetworkRequestFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lt41/e;->ERROR:Lt41/e;
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

        // Initializers and schedulers no longer enqueue work; App.onCreate cancels leftovers.
        listOf(
            installIdentifierInitializerFingerprint,
            usageStatsInitializerFingerprint,
            cancelSubscriptionInitializerFingerprint,
            remoteAnalyticsSchedulerFingerprint,
            remoteAnalyticsPeriodicSchedulerFingerprint,
            launcherIconScheduleFingerprint,
            startDestinationScheduleFingerprint,
            tabsOrderScheduleFingerprint,
            publisherTrackingScheduleFingerprint
        ).forEach { fingerprint ->
            fingerprint.method.addInstructions(0, UNIT_RESULT)
        }

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
                    sget-object v0, Lsu0/e0;->a:Lsu0/e0;
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
    description = "Removes the gaming profile permission, hides the gaming profile widget, and blocks navigation to the gaming profile.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)
    dependsOn(gamingManifestPatch)

    execute {
        mineViewModelOpenGameCenterFingerprint.method.addInstruction(0, "return-void")
        gameCenterV2ButtonFingerprint.method.addInstruction(0, "return-void")
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

@Suppress("unused")
val blockRemoteNetworkPolicyPatch = bytecodePatch(
    name = "Block remote network policy",
    description = "Blocks remote and cached network policies that add TLS trust anchors or override API and static-content hosts.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)

    execute {
        // A non-null embedded snapshot bypasses both cached payload and legacy
        // api_endpoint restoration. The existing certificate pinning stays active.
        networkPolicyConstructorFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Lzp0/m;->a()Lzp0/c;
                move-result-object p2
            """
        )
        networkPolicyLoadFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )
    }
}

@Suppress("unused")
val disableReviewPromptsPatch = bytecodePatch(
    name = "Disable review prompts",
    description = "Hides app rating prompts and stops sending installed catalog apps to the rating-status service.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)

    execute {
        // An empty placement list means the prompt never loads or queries rating status.
        reviewPromptPlacementsFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ltu0/x;->a:Ltu0/x;
                return-object v0
            """
        )
    }
}

@Suppress("unused")
val disableAdLinkAutoInstallPatch = bytecodePatch(
    name = "Disable ad-link auto-install",
    description = "Requires a tap to install apps opened from ad links instead of starting the install automatically.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)

    execute {
        directAutoInstallEnabledFingerprint.method.addInstructions(0, FALSE_RESULT)
    }
}

@Suppress("unused")
val disableTvInstallPatch = bytecodePatch(
    name = "Disable TV install",
    description = "Removes local network and multicast access and disables scanning the network for TVs to install apps over ADB.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)
    dependsOn(tvInstallManifestPatch)

    execute {
        remoteTvInstallEnabledFingerprint.method.addInstructions(0, FALSE_RESULT)
        remoteTvInstallDiscoveryFingerprint.method.addInstruction(0, "return-void")
    }
}
