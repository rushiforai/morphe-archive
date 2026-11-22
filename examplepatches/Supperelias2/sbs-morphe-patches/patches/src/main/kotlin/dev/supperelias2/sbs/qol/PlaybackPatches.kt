package dev.supperelias2.sbs.qol

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import dev.supperelias2.sbs.morphe.registerFeature
import dev.supperelias2.sbs.morphe.settingsPatch

private const val VM = "Lcom/sbs/ondemand/player/viewmodels/PlayerViewModel;"
private const val MANAGER = "Lcom/sbs/ondemand/player/viewmodels/PlayerManager;"
private const val EVENTS = "Lcom/sbs/ondemand/player/viewmodels/PlaybackEventViewModel;"
private const val CONTROLLER = "Lcom/sbs/ondemand/player/viewmodels/PlaybackController;"
private const val HOOKS = "Ldev/supperelias2/sbs/morphe/playback/PlaybackHooks;"

private val mobile640 = Compatibility(
    name = "SBS On Demand",
    packageName = "com.sbs.ondemand.android",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0xDCBD1D,
    targets = listOf(AppTarget(version = "6.4.0", isExperimental = true))
)

private class PlaybackMethod(owner: String, methodName: String, args: List<String> = emptyList()) :
    Fingerprint(definingClass = owner, name = methodName, returnType = "V", parameters = args)

private val skipIntro = PlaybackMethod(VM, "skipIntro")
private val skipRecap = PlaybackMethod(VM, "skipRecap")
private val initializeManager = PlaybackMethod(MANAGER, "initialize", listOf(VM))
private val contentTime = PlaybackMethod(EVENTS, "setContentTime", listOf("J"))
private val initializePlayer = PlaybackMethod(MANAGER, "initializePlayer", listOf("Landroidx/media3/ui/PlayerView;"))
private val loadDirect = PlaybackMethod(MANAGER, "loadAkamaiMedia", listOf("Ljava/lang/String;", "Ljava/lang/String;"))
private val play = PlaybackMethod(MANAGER, "play")
private val playAds = PlaybackMethod(MANAGER, "playAds")
private val connectAds = PlaybackMethod(MANAGER, "connectToAdsController", listOf("Lcom/sbs/ondemand/player/viewmodels/AdsController;"))
private val selectProvider = PlaybackMethod(CONTROLLER, "processStreamProvider", listOf("Lcom/sbs/ondemand/model/playback/PlaybackResponse\$PlaybackItem;", "Landroid/content/Context;"))
private val forwardLive = PlaybackMethod(MANAGER, "seekForwardLive")
private val pipActions = Fingerprint(
    definingClass = "Lcom/sbs/ondemand/player/PictureInPictureHandlerKt;",
    name = "buildPipActions",
    returnType = "Ljava/util/List;",
    parameters = listOf("Landroid/content/Context;", "Z")
)

private fun MutableMethod.beforeReturns(hook: String) {
    implementation!!.instructions.indices.reversed().filter {
        getInstruction(it).opcode == Opcode.RETURN_VOID
    }.forEach { index ->
        // Preserve the return's location so incoming branches run the hook too.
        replaceInstruction(index, "invoke-static/range {p0 .. p0}, $HOOKS->$hook(Ljava/lang/Object;)V")
        addInstructions(index + 1, "return-void")
    }
}

/** Retains SBS's seek bookkeeping, UI coroutine and analytics dispatch. */
private fun fixSkip(method: MutableMethod) {
    check(method.implementation!!.registerCount == 12) { "Unexpected SBS skip register layout" }
    val original = method.implementation!!.instructions.toList()
    val mapping = original.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "getStreamTimeMsForContentTimeMs"
    }
    val fallback = original.indexOfFirst { it.opcode == Opcode.MOVE_WIDE }
    val analytics = original.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "trackUpdateMediaPosition"
    }
    val positionMapping = original.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "getContentTimeMsForStreamTimeMs"
    }
    val seek = original.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "seekStarted"
    }
    check(mapping >= 0 && fallback > mapping && analytics > positionMapping && positionMapping > seek && seek > fallback)
    check(original[fallback + 1].opcode == Opcode.CONST_4)
    val end = original.last { it.opcode == Opcode.RETURN_VOID }
    val noteSkip = if (method.name == "skipIntro") "noteIntroSkipped" else "noteRecapSkipped"

    method.replaceInstruction(positionMapping, "invoke-static {p0}, $HOOKS->contentPosition(Ljava/lang/Object;)J")
    // The absent-manager branch targets this invoke directly. Replace its
    // location so that branch also executes the corrected analytics position.
    val analyticsReference = (original[analytics] as ReferenceInstruction).reference
    method.replaceInstruction(analytics, "invoke-static {p0}, $HOOKS->$noteSkip(Ljava/lang/Object;)V")
    method.addInstructions(
        analytics + 1,
        """
            invoke-static {p0}, $HOOKS->contentPosition(Ljava/lang/Object;)J
            move-result-wide v3
            invoke-virtual {v0, v3, v4}, $analyticsReference
        """
    )
    // Insert after the original convergence target so its existing goto also
    // executes the guard. v3:v4 still contain zero; restore v2 for the iput.
    method.addInstructionsWithLabels(
        fallback + 2,
        """
            cmp-long v2, v0, v3
            if-ltz v2, :sbs_invalid_marker
            const/4 v2, 0x1
        """,
        ExternalLabel("sbs_invalid_marker", end)
    )
    method.replaceInstruction(fallback, "invoke-static {p0, v0, v1}, $HOOKS->skipTarget(Ljava/lang/Object;J)J")
    method.addInstructions(fallback + 1, "move-result-wide v0")
    method.replaceInstruction(mapping, "invoke-static {p0, v0, v1}, $HOOKS->skipTarget(Ljava/lang/Object;J)J")
}

@Suppress("unused")
val correctDirectSkipPatch = bytecodePatch(
    name = "Experimental: correct intro and recap seeking",
    description = "Experimental provider-aware VOD skip correction. Enabled in Morphe settings by default.",
    default = true
) {
    category("Experimental")
    compatibleWith(mobile640)
    dependsOn(settingsPatch)
    execute {
        registerFeature("fix_skip")
        fixSkip(skipIntro.method)
        fixSkip(skipRecap.method)
    }
}

@Suppress("unused")
val autoSkipPatch = bytecodePatch(
    name = "Experimental: automatic intro and recap skipping",
    description = "Experimental separate opt-in VOD intro and recap skipping, once per segment and media item.",
    default = true
) {
    category("Experimental")
    compatibleWith(mobile640)
    dependsOn(settingsPatch, correctDirectSkipPatch)
    execute {
        registerFeature("auto_skip_intro")
        registerFeature("auto_skip_recap")
        initializeManager.method.addInstructions(0, "invoke-static/range {p1 .. p1}, $HOOKS->attach(Ljava/lang/Object;)V")
        contentTime.method.beforeReturns("onContentTime")
    }
}

@Suppress("unused")
val customSeekIntervalsPatch = bytecodePatch(
    name = "Experimental: custom seek intervals",
    description = "Experimental separate rewind and forward intervals for player and live controls, with matching PiP descriptions. Defaults to 15 seconds.",
    default = true
) {
    category("Experimental")
    compatibleWith(mobile640)
    dependsOn(settingsPatch)
    execute {
        registerFeature("seek_intervals")
        initializePlayer.method.apply {
            val fields = implementation!!.instructions.mapIndexedNotNull { index, instruction ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                if (field?.definingClass == MANAGER && field.name in listOf("fastforwardIncrement", "rewindIncrement")) {
                    Triple(index, (instruction as OneRegisterInstruction).registerA, field.name)
                } else null
            }
            check(fields.size == 2) { "Unexpected SBS seek increment initialization" }
            fields.reversed().forEach { (index, register, field) ->
                val hook = if (field == "fastforwardIncrement") "forwardMillis" else "backMillis"
                addInstructions(index + 1, "invoke-static {}, $HOOKS->$hook()I\nmove-result v$register")
            }
        }
        forwardLive.method.apply {
            val index = implementation!!.instructions.indexOfFirst {
                (it as? WideLiteralInstruction)?.wideLiteral == 15L
            }
            check(index >= 0 && implementation!!.registerCount == 3)
            replaceInstruction(index, "invoke-static {}, $HOOKS->forwardSeconds()J")
            addInstructions(index + 1, "move-result-wide v0")
        }
        pipActions.method.apply {
            implementation!!.instructions.mapIndexedNotNull { index, instruction ->
                val value = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
                if (value == "Rewind 15 seconds" || value == "Forward 15 seconds") {
                    Triple(index, (instruction as OneRegisterInstruction).registerA, value.startsWith("Rewind"))
                } else null
            }.also { check(it.size == 2) }.reversed().forEach { (index, register, back) ->
                val hook = if (back) "backDescription" else "forwardDescription"
                addInstructions(index + 1, "invoke-static {}, $HOOKS->$hook()Ljava/lang/String;\nmove-result-object v$register")
            }
        }
    }
}

@Suppress("unused")
val persistentPlaybackSpeedPatch = bytecodePatch(
    name = "Experimental: persistent VOD playback speed",
    description = "Experimental saved playback speed for direct VOD. Opt-in; live and Google DAI remain at normal speed.",
    default = true
) {
    category("Experimental")
    compatibleWith(mobile640)
    dependsOn(settingsPatch)
    execute {
        registerFeature("playback_speed")
        initializePlayer.method.beforeReturns("applySpeed")
        loadDirect.method.beforeReturns("applySpeed")
        play.method.beforeReturns("applySpeed")
        playAds.method.addInstructions(0, "invoke-static/range {p0 .. p0}, $HOOKS->normalSpeed(Ljava/lang/Object;)V")
        connectAds.method.addInstructions(0, "invoke-static/range {p0 .. p0}, $HOOKS->normalSpeed(Ljava/lang/Object;)V")
        selectProvider.method.addInstructions(0, "invoke-static/range {p0 .. p0}, $HOOKS->beforeProviderChange(Ljava/lang/Object;)V")
    }
}
