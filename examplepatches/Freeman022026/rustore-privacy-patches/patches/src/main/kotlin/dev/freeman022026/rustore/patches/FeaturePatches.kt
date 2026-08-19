package dev.freeman022026.rustore.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

@Suppress("unused")
val disableAdvertisementsPatch = bytecodePatch(
    name = "Disable advertisements",
    description = "Removes ad providers and ad identifiers, returns an empty ad list, and keeps advertising consent disabled.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)
    dependsOn(advertisingManifestPatch)

    execute {
        rawAdvertisementRepositoryGetFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Liq0/b0;->f56293a:Liq0/b0;
                return-object v0
            """
        )
        settingConstructorFingerprint.method.addInstruction(0, "const/4 p6, 0x0")
        agreementSettingConstructorFingerprint.method.addInstruction(0, "const/4 p3, 0x0")
    }
}

@Suppress("unused")
val disableAnalyticsAndTrackersPatch = bytecodePatch(
    name = "Disable analytics and trackers",
    description = "Disables AppMetrica, MyTracker, AltCraft, Radar, install referrer, metrics, and audited logging transports.",
    default = true
) {
    compatibleWith(RUSTORE_COMPATIBILITY)
    dependsOn(analyticsManifestPatch)

    execute {
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
                invoke-virtual {p0, v0}, Lmb/k0;->a(Ljava/lang/String;)Lmb/b0;
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
                invoke-virtual {p0, v0}, Lmb/k0;->a(Ljava/lang/String;)Lmb/b0;
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
                invoke-virtual {p1, v0}, Lmb/k0;->a(Ljava/lang/String;)Lmb/b0;
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
