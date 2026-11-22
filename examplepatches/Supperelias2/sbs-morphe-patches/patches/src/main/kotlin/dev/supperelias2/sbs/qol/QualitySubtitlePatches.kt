package dev.supperelias2.sbs.qol

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.supperelias2.sbs.morphe.registerFeature
import dev.supperelias2.sbs.morphe.settingsPatch

private const val TRACKS = "Lcom/sbs/ondemand/player/viewmodels/TrackSelectorController;"
private const val TRACK = "Lcom/sbs/ondemand/player/viewmodels/TrackInfoItem;"
private const val OD_PLAYER = "Lcom/sbs/ondemand/player/ODPlayerKt;"
private const val SUBTITLE = "Landroidx/media3/ui/SubtitleView;"
private const val QUALITY_HOOKS = "Ldev/supperelias2/sbs/morphe/features/QualityHooks;"
private const val SUBTITLE_HOOKS = "Ldev/supperelias2/sbs/morphe/features/SubtitleHooks;"

private object QualitySelectedFingerprint : Fingerprint(
    definingClass = TRACKS,
    name = "videoQualitySelected",
    parameters = listOf(TRACK),
    returnType = "V",
    filters = listOf(methodCall(definingClass = TRACKS, name = "setMaxVideoBitrate"))
)

private object QualityTracksFingerprint : Fingerprint(
    definingClass = TRACKS,
    name = "extractTracks",
    parameters = listOf("Landroidx/media3/common/Tracks;"),
    returnType = "V",
    filters = listOf(methodCall(definingClass = TRACKS, name = "processVideoTrack"))
)

private object SubtitleFactoryFingerprint : Fingerprint(
    definingClass = OD_PLAYER,
    name = "SubtitleOverlay\$lambda\$144\$lambda\$143\$lambda\$140\$lambda\$139",
    parameters = listOf("Landroid/content/Context;"),
    returnType = SUBTITLE,
    filters = listOf(
        methodCall(definingClass = SUBTITLE, name = "setStyle"),
        methodCall(definingClass = SUBTITLE, name = "setApplyEmbeddedStyles")
    )
)

private object SubtitleUpdateFingerprint : Fingerprint(
    definingClass = OD_PLAYER,
    name = "SubtitleOverlay\$lambda\$144\$lambda\$143\$lambda\$142\$lambda\$141",
    parameters = listOf("Landroidx/compose/runtime/State;", SUBTITLE),
    returnType = "Lkotlin/Unit;",
    filters = listOf(methodCall(definingClass = SUBTITLE, name = "setCues"))
)

@Suppress("unused")
val rememberVideoQualityPatch = bytecodePatch(
    name = "Experimental: remember video quality",
    description = "Adds optional remembered bitrate, automatic, and highest-supported quality modes to Morphe settings. Disabled at runtime by default; SBS mobile 6.4.0 only.",
    default = true
) {
    category("Experimental")
    compatibleWith(
        Compatibility(
            name = "SBS On Demand",
            packageName = "com.sbs.ondemand.android",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xDCBD1D,
            targets = listOf(AppTarget(version = "6.4.0", isExperimental = true))
        )
    )
    dependsOn(settingsPatch)

    execute {
        val selected = QualitySelectedFingerprint.method
        val tracks = QualityTracksFingerprint.method
        val returns = tracks.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
            index.takeIf { instruction.opcode == Opcode.RETURN_VOID }
        }
        check(returns.isNotEmpty()) { "No return in SBS quality track extraction" }
        selected.addInstructions(0, "invoke-static/range {p0 .. p1}, $QUALITY_HOOKS->record(Ljava/lang/Object;Ljava/lang/Object;)V")
        returns.asReversed().forEach { index ->
            // Keep existing branch labels on the hook so early-return branches run it too.
            tracks.replaceInstruction(index, "invoke-static/range {p0 .. p0}, $QUALITY_HOOKS->restore(Ljava/lang/Object;)V")
            tracks.addInstructions(index + 1, "return-void")
        }
        registerFeature("remember_quality")
    }
}

@Suppress("unused")
val subtitleCustomizationPatch = bytecodePatch(
    name = "Experimental: customize subtitles",
    description = "Adds optional subtitle size, bottom margin, and high-contrast styling to Morphe settings. Disabled at runtime by default; SBS mobile 6.4.0 only.",
    default = true
) {
    category("Experimental")
    compatibleWith(
        Compatibility(
            name = "SBS On Demand",
            packageName = "com.sbs.ondemand.android",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xDCBD1D,
            targets = listOf(AppTarget(version = "6.4.0", isExperimental = true))
        )
    )
    dependsOn(settingsPatch)

    execute {
        val factory = SubtitleFactoryFingerprint.method
        val update = SubtitleUpdateFingerprint.method
        val factoryReturns = factory.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode != Opcode.RETURN_OBJECT) null
            else index to (instruction as OneRegisterInstruction).registerA
        }
        val updateReturns = update.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode != Opcode.RETURN_OBJECT) null
            else index to (instruction as OneRegisterInstruction).registerA
        }
        check(factoryReturns.isNotEmpty() && updateReturns.isNotEmpty()) { "No return in SBS subtitle callbacks" }
        factoryReturns.asReversed().forEach { (index, register) ->
            factory.replaceInstruction(index, "invoke-static/range {v$register .. v$register}, $SUBTITLE_HOOKS->apply(Ljava/lang/Object;)V")
            factory.addInstructions(index + 1, "return-object v$register")
        }
        updateReturns.asReversed().forEach { (index, register) ->
            update.replaceInstruction(index, "invoke-static/range {p1 .. p1}, $SUBTITLE_HOOKS->apply(Ljava/lang/Object;)V")
            update.addInstructions(index + 1, "return-object v$register")
        }
        registerFeature("subtitle_customization")
    }
}
