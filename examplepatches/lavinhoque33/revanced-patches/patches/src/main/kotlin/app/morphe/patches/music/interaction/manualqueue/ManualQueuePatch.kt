/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-22.
 */
package app.morphe.patches.music.interaction.manualqueue

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.music.flyoutmenu.components.flyoutMenuComponentsPatch
import app.morphe.patches.music.flyoutmenu.components.menuItemFingerprint
import app.morphe.patches.music.flyoutmenu.components.menuItemIconFingerprint
import app.morphe.patches.music.interaction.jam.QueueEnqueueFingerprint
import app.morphe.patches.music.interaction.jam.addBridge
import app.morphe.patches.music.interaction.jam.getMutableMethod
import app.morphe.patches.music.interaction.jam.p0Register
import app.morphe.patches.music.interaction.playlisttracktap.QueueAddEndpointCommandFingerprint
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.utils.extension.sharedExtensionPatch
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.addSwitchPreference
import app.morphe.patches.music.utils.settings.settingsPatch
import app.morphe.util.Utils.printWarn
import app.morphe.util.addFreeRegisters
import app.morphe.util.getReference
import app.morphe.util.fingerprint.matchOrThrow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val EXT = "Lapp/morphe/extension/music/patches/manualqueue/ManualQueue;"
internal const val ACCESS = $$"Lapp/morphe/extension/music/patches/manualqueue/ManualQueue$Access;"
internal const val QUEUE = $$"Lapp/morphe/extension/music/patches/manualqueue/ManualQueue$Queue;"
internal const val LANE = $$"Lapp/morphe/extension/music/patches/manualqueue/ManualQueue$Lane;"
internal const val STATE = $$"Lapp/morphe/extension/music/patches/manualqueue/ManualQueue$State;"
internal const val DISPATCH = $$"Lapp/morphe/extension/music/patches/manualqueue/ManualQueue$Dispatch;"
internal const val MAP = "Ljava/util/Map;"
internal const val OBJECT = "Ljava/lang/Object;"
internal const val STRING = "Ljava/lang/String;"
internal const val EXECUTOR = "Ljava/util/concurrent/Executor;"
internal const val COLLECTION = "Ljava/util/Collection;"

internal fun supportsFifoQueue(version: String) = when (version) {
    "9.15.51", "9.40.51", "9.45.51" -> true
    else -> false
}

@Suppress("unused")
val fifoAddToQueuePatch = bytecodePatch(
    name = "Add to queue in tap order",
    description = "Adds an opt-in setting to play songs added from the native song menu in tap order, " +
        "before the rest of a local, unshuffled queue. Leaves Play next unchanged.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    // The shared popup fingerprints are initialized after Flyout maps its resource IDs.
    dependsOn(sharedExtensionPatch, settingsPatch, flyoutMenuComponentsPatch)

    execute {
        if (!supportsFifoQueue(packageMetadata.versionName)) {
            printWarn("Add to queue in tap order: this Music version does not have the supported native queue ABI.")
            return@execute
        }

        val install = try {
            val enqueue = QueueEnqueueFingerprint.match().originalMethod
            val resolver = QueueAddEndpointCommandFingerprint.match().originalMethod
            val nativeQueue = resolveManualQueue(enqueue, resolver)
            val popup = resolvePopupQueueOrigin(enqueue.parameterTypes.single().toString())
            val route = resolveQueueRoute(resolver, enqueue, nativeQueue.modeType)
            listOf(nativeQueue.install, popup, route)
        } catch (exception: Exception) {
            printWarn("Add to queue in tap order: native hooks unavailable (${exception.message}). Skipping.")
            return@execute
        }

        install.forEach { it() }
        addSwitchPreference(CategoryType.PLAYER, "morphe_music_fifo_add_to_queue", "false")
    }
}

private fun BytecodePatchContext.resolvePopupQueueOrigin(command: String): () -> Unit {
    val iconMatch = menuItemIconFingerprint.matchOrThrow(menuItemFingerprint)
    val icon = iconMatch.instructionMatches
    val iconCode = iconMatch.originalMethod.implementation!!.instructions.toList()
    val row = (iconCode[icon[0].index] as ReferenceInstruction).reference as FieldReference
    val iconObject = (iconCode[icon[1].index] as ReferenceInstruction).reference as MethodReference
    val iconNumber = (iconCode[icon[3].index] as ReferenceInstruction).reference as FieldReference
    check(row.type == iconObject.parameterTypes.single() && iconObject.returnType == iconNumber.definingClass) {
        "Popup renderer icon fields do not belong to the bound row"
    }
    val popup = mutableClassDefBy(row.definingClass)
    val click = popup.methods.single {
        it.name == "onClick" && it.parameterTypes == listOf("Landroid/view/View;") && it.returnType == "V"
    }
    val dispatches = click.code().withIndex().filter { (_, instruction) ->
        instruction.getReference<MethodReference>()?.let {
            it.parameterTypes == listOf(command, MAP) && it.returnType == "V"
        } == true
    }
    check(dispatches.size == 2) { "Native song flyout dispatch is incomplete" }
    check(dispatches.all { (_, instruction) -> instruction is ReferenceInstruction &&
        instruction.reg(2) <= 15 && click.p0Register <= 15 }) { "Popup dispatch registers unavailable" }

    return {
        popup.addBridge("rvxManualFlyoutExtras", listOf(MAP), MAP, 4, body = """
            invoke-static {}, $EXT->enabled()Z
            move-result v0
            if-eqz v0, :native
            iget-object v0, p0, $row
            if-eqz v0, :native
            invoke-static {v0}, $iconObject
            move-result-object v0
            if-eqz v0, :native
            iget v0, v0, $iconNumber
            const/16 v1, 520
            if-ne v0, v1, :native
            invoke-static {p1}, $EXT->fromFlyout($MAP)$MAP
            move-result-object p1
            :native
            return-object p1
        """)
        for ((index, instruction) in dispatches.asReversed()) {
            val map = (instruction as ReferenceInstruction).reg(2)
            click.addInstructions(index, """
                invoke-virtual {p0, v$map}, ${popup.type}->rvxManualFlyoutExtras($MAP)$MAP
                move-result-object v$map
            """)
        }
    }
}

private fun BytecodePatchContext.resolveQueueRoute(
    resolver: MethodReference,
    enqueue: MethodReference,
    mode: String,
): () -> Unit {
    val method = resolver.getMutableMethod()
    val code = method.code()
    val slow = code.indices.single { code[it].getReference<MethodReference>() == enqueue }
    val slowCall = code[slow] as ReferenceInstruction
    val fast = code.indices.single {
        code[it].getReference<MethodReference>()?.let { call ->
            call.definingClass == enqueue.definingClass && call.parameterTypes.size == 2 &&
                call.parameterTypes[1] == mode && call.returnType == "Z"
        } == true
    }
    val fastCall = code[fast] as ReferenceInstruction
    val fastMethod = fastCall.reference as MethodReference
    val managerReg = slowCall.reg(0)
    check(managerReg == fastCall.reg(0) && fast < slow) { "Native local queue routes do not share an owner" }

    val positionRead = (0 until fast).last { index ->
        val next = code[index + 1].getReference<MethodReference>()
        code[index].opcode == Opcode.IGET && next?.definingClass == mode &&
            next.parameterTypes == listOf("I") && next.returnType == mode
    }
    val position = code[positionRead].getReference<FieldReference>()!!
    val endpoint = position.definingClass
    val notifyCalls = (0 until code.size).filter { index ->
        code[index].getReference<MethodReference>()?.let {
            it.definingClass == resolver.definingClass && it.parameterTypes == listOf(endpoint) && it.returnType == "V"
        } == true
    }
    val metadata = code.indices.single {
        code[it].getReference<StringReference>()?.string ==
            "com.google.android.libraries.youtube.innertube.endpoint.tag"
    }
    val local = notifyCalls.last { it < metadata }
    check(local < metadata && metadata < fast && slow < notifyCalls.last()) {
        "Cannot isolate the nonempty, non-Cast enqueue branch"
    }
    val localCall = code[local] as ReferenceInstruction
    val target = code.subList(local, positionRead).mapNotNull { it.getReference<FieldReference>() }
        .filter { it.definingClass == endpoint && it.type.startsWith("L") }.distinct().single()
    val video = code.subList(local, positionRead).mapNotNull { it.getReference<FieldReference>() }
        .filter { it.definingClass == target.type && it.type == STRING }.distinct().single()
    val targetFields = classDefBy(target.type).fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }
    val playlist = targetFields.single { it.type == STRING && it != video }
    val owner = mutableClassDefBy(resolver.definingClass)
    val prepare = "${owner.type}->rvxManualPrepare(${enqueue.definingClass}$endpoint$MAP)$DISPATCH"

    return {
        owner.addBridge("rvxManualPrepare", listOf(enqueue.definingClass, endpoint, MAP), DISPATCH, 5,
            accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, body = """
                invoke-static {p2}, $EXT->hasOrigin($MAP)Z
                move-result v0
                if-eqz v0, :native
                iget v0, p1, $position
                const/4 v1, 0x2
                if-ne v0, v1, :native
                iget-object v0, p1, $target
                if-eqz v0, :native
                iget-object v1, v0, $video
                invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z
                move-result v1
                if-nez v1, :native
                iget-object v0, v0, $playlist
                invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z
                move-result v0
                if-eqz v0, :native
                invoke-static {p0}, $EXT->prepare($ACCESS)$DISPATCH
                move-result-object v0
                return-object v0
                :native
                const/4 v0, 0x0
                return-object v0
            """)
        val request = method.implementation!!.registerCount
        val args = request + 1
        val (patched, copies) = method.addFreeRegisters(4)
        val slowIndex = slow + copies
        val fastIndex = fast + copies
        val localIndex = local + copies
        val originalMap = method.p0Register + 2

        // Replace the first instruction at each existing branch target; keep all incoming labels.
        patched.replaceInstruction(slowIndex, "move-object/from16 v$args, v$managerReg")
        patched.addInstructions(slowIndex + 1, """
            move-object/from16 v${args + 1}, v${slowCall.reg(1)}
            move-object/from16 v${args + 2}, v$request
            invoke-static/range {v$args .. v${args + 2}}, $EXT->dispatch($ACCESS$OBJECT$DISPATCH)V
        """)
        val slowEntry = patched.code()[slowIndex]
        patched.replaceInstruction(fastIndex, "nop")
        patched.addInstructionsWithLabels(fastIndex + 1, """
            if-nez v$request, :skip_native_move
            invoke-virtual {v${fastCall.reg(0)}, v${fastCall.reg(1)}, v${fastCall.reg(2)}}, $fastMethod
        """, ExternalLabel("skip_native_move", slowEntry))
        // This label is also the local branch entry from the Cast decision.
        patched.replaceInstruction(localIndex, "move-object/from16 v$args, v$managerReg")
        patched.addInstructions(localIndex + 1, """
            move-object/from16 v${args + 1}, v${localCall.reg(1)}
            move-object/from16 v${args + 2}, v$originalMap
            invoke-static/range {v$args .. v${args + 2}}, $prepare
            move-result-object v$request
            invoke-direct {v${localCall.reg(0)}, v${localCall.reg(1)}}, ${localCall.reference}
        """)
        // Some stock Cast branches can also reach the slow call, without a manual dispatch.
        patched.addInstructions(copies, "const/16 v$request, 0x0")
    }
}

internal fun MutableMethod.code() = implementation!!.instructions.toList()
