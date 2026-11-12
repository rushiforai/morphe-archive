/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-11.
 */
package app.morphe.patches.music.misc.androidauto

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.music.interaction.downloads.resolveNativeQueueBatch
import app.morphe.patches.music.interaction.jam.*
import app.morphe.util.getReference
import app.morphe.util.numberOfParameterRegisters
import app.morphe.util.addFreeRegisters
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.util.returnEarly
import app.morphe.util.Utils.printInfo
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val QUEUE = "Lapp/morphe/extension/music/patches/downloads/AndroidAutoQueue;"
private const val OWNER = $$"Lapp/morphe/extension/music/patches/downloads/AndroidAutoQueue$Owner;"
private const val SESSION = $$"Lapp/morphe/extension/music/patches/downloads/AndroidAutoQueue$Session;"
private const val OBSERVER = $$"Lapp/morphe/extension/music/patches/downloads/AndroidAutoQueue$Observer;"

/** Uses the session controller's own provider, not the last constructed phone or Jam manager. */
internal fun BytecodePatchContext.installAutoQueue() {
    val queue = resolveJamQueueAbi()
    val controller = Fingerprint(
        strings = listOf("com/google/android/apps/youtube/music/mediabrowser/MusicMediaSessionPlayerController"),
        custom = { _, type ->
            type.methods.any { method ->
                method.implementation?.instructions?.any {
                    it.opcode == Opcode.CHECK_CAST && it.getReference<TypeReference>()?.type == queue.managerType
                } == true
            }
        },
    ).match().originalClassDef
    val castMethod = controller.methods.first { method ->
        method.implementation?.instructions?.any {
            it.opcode == Opcode.CHECK_CAST && it.getReference<TypeReference>()?.type == queue.managerType
        } == true
    }
    val code = castMethod.implementation!!.instructions.toList()
    val cast = code.indexOfFirst {
        it.opcode == Opcode.CHECK_CAST && it.getReference<TypeReference>()?.type == queue.managerType
    }
    val provider = code.take(cast).mapNotNull { it.getReference<FieldReference>() }
        .last { it.definingClass == controller.type }
    val get = code.take(cast).mapNotNull { it.getReference<MethodReference>() }
        .last { it.definingClass == provider.type && it.parameterTypes.isEmpty() }
    val play = controller.methods.single { method ->
        method.returnType == "V" && queue.command.type in method.parameterTypes.map { it.toString() } &&
                "Landroid/os/Bundle;" in method.parameterTypes.map { it.toString() }
    }.getMutableMethod()
    val indexMethod = queue.storage.currentIndex.getMutableMethod()
    val model = indexMethod.instructions.mapNotNull { it.getReference<FieldReference>() }
        .first { it.definingClass == queue.storage.type }
    val playNext = resolveNativePlayNext(queue)
    val batch = resolveNativeQueueBatch(queue.menu.dispatch.getMutableMethod(),
        Fingerprint(strings = listOf("music/get_queue")).classDef.type)
    val subscription = resolveCurrentItemSubscription(queue.storage.type)
    val decision = controller.methods.single {
        it.parameterTypes.map { type -> type.toString() } ==
                listOf(queue.command.type, "Landroid/os/Bundle;")
    }
    val decisionCode = decision.implementation!!.instructions.toList()
    val emptyCheck = decisionCode.indices.single { index ->
        decisionCode[index].getReference<MethodReference>()?.name == "isEmpty" &&
                decisionCode.subList(maxOf(0, index - 10), index).any {
                    it.getReference<FieldReference>()?.definingClass == queue.storage.type
                }
    }
    val reuse = (emptyCheck + 1..emptyCheck + 3).first { decisionCode[it].opcode == Opcode.IF_NEZ } + 1
    val originalRegisters = decision.implementation!!.registerCount
    val firstParameter = originalRegisters - decision.numberOfParameterRegisters
    val (pinned, moves) = decision.getMutableMethod().addFreeRegisters(1)
    pinned.addInstruction(reuse + moves,
        "invoke-static/range {v$originalRegisters .. v$originalRegisters}, $QUEUE->onReuse(Ljava/lang/Object;)V")
    pinned.addInstruction(moves, "move-result-object v$originalRegisters")
    pinned.addInstruction(moves,
        "invoke-static/range {v$firstParameter .. v${firstParameter + 2}}, " +
                "$QUEUE->onDecision(${SESSION}Ljava/lang/Object;Landroid/os/Bundle;)Ljava/lang/Object;")
    val sessionClass = mutableClassDefBy(controller.type)
    sessionClass.interfaces.add(SESSION)
    sessionClass.addBridge("rvxAutoQueueOwner", emptyList(), OWNER, 2, body = """
        iget-object v0, p0, $provider
        ${invokeKind(get)} {v0}, $get
        move-result-object v0
        check-cast v0, $OWNER
        return-object v0
    """)
    play.addInstruction(0, "invoke-static/range {p0 .. p3}, " +
            "$QUEUE->onSession(${SESSION}Ljava/lang/Object;Ljava/lang/Object;Landroid/os/Bundle;)V")

    val manager = mutableClassDefBy(queue.managerType)
    mutableClassDefBy(batch.definingClass).methods.add(batch)
    manager.interfaces.add(OWNER)
    manager.addReferenceGetter("rvxAutoExecutor", queue.executor)
    manager.addBridge("rvxAutoStorage", emptyList(), "Ljava/lang/Object;", 2, body = """
        iget-object v0, p0, ${queue.storage.field}
        return-object v0
    """)
    mutableClassDefBy(queue.storage.type).addReferenceGetter("rvxAutoQueueModel", model)
    manager.addBridge("rvxAutoModel", emptyList(), "Ljava/lang/Object;", 2, body = """
        iget-object v0, p0, ${queue.storage.field}
        invoke-virtual {v0}, ${queue.storage.type}->rvxAutoQueueModel()${model.type}
        move-result-object v0
        return-object v0
    """)
    installNativeAccessor(manager, "rvxAutoCurrent", queue.storage.currentIndex,
        receiverField = queue.storage.field)
    installNativeAccessor(manager, "rvxAutoVideoId", queue.item.videoId, opaqueReceiver = true)
    installNativeAccessor(manager, "rvxAutoItemId", queue.item.persistentId, opaqueReceiver = true)
    manager.addBridge("rvxAutoItems", emptyList(), "Ljava/util/List;", 3, body = """
        iget-object v0, p0, ${queue.storage.field}
        const/4 v1, 0x0
        ${invokeKind(queue.storage.items)} {v0, v1}, ${queue.storage.items}
        move-result-object v0
        return-object v0
    """)
    manager.addBridge("rvxAutoResolve", listOf("[B", "Ljava/util/List;"), "Ljava/util/concurrent/Future;", 6,
        body = queue.command.decode("p1", "v0") + """
        iget-object v1, p0, ${queue.menu.dispatcher}
        iget-object v2, p0, ${queue.executor}
        ${invokeKind(batch)} {v1, v0, v2, p2}, $batch
        move-result-object v0
        return-object v0
    """)
    manager.addBridge("rvxAutoResolved", listOf("Ljava/lang/Object;"), "Ljava/util/List;", 2, body = """
        check-cast p1, ${queue.menu.responseType}
        iget-object p1, p1, ${queue.menu.responseItems}
        return-object p1
    """)
    manager.addBridge("rvxAutoInsert", listOf("Ljava/lang/Object;"), "V", 4, body = """
        new-instance v0, ${queue.callback.type}
        sget-object v1, $playNext
        invoke-direct {v0, p0, v1}, ${queue.callback.constructor}
        ${invokeKind(queue.callback.success)} {v0, p1}, ${queue.callback.success}
        return-void
    """)
    val observer = mutableClassDefBy(OBSERVER)
    observer.interfaces.add(subscription.add.parameterTypes.single().toString())
    observer.addBridge(subscription.callback.name, subscription.callback.parameterTypes.map { it.toString() },
        "V", 3, body = """
        invoke-virtual/range {p0 .. p2}, $OBSERVER->onChanged(Ljava/lang/Object;Ljava/lang/Object;)V
        return-void
    """)
    for ((name, reference) in listOf("rvxAutoObserve" to subscription.add,
        "rvxAutoStopObserving" to subscription.remove)) {
        manager.addBridge(name, listOf(OBSERVER), "V", 3, body = """
            iget-object v0, p0, ${queue.storage.field}
            check-cast p1, ${reference.parameterTypes.single()}
            ${invokeKind(reference)} {v0, p1}, $reference
            return-void
        """)
    }
    mutableClassDefBy(QUEUE).methods.single { it.name == "supported" }.returnEarly(true)
    printInfo("Android Auto saved queue: session ${controller.type}, owner ${queue.managerType}, model $model")
}

private data class CurrentItemSubscription(val add: Method, val remove: Method, val callback: Method)

private fun Method.callsSet(operation: String): Boolean = implementation?.instructions?.any {
    it.getReference<MethodReference>()?.let { call ->
        call.definingClass == "Ljava/util/Set;" && call.name == operation
    } == true
} == true

private fun BytecodePatchContext.resolveCurrentItemSubscription(type: String): CurrentItemSubscription {
    val methods = classDefBy(type).methods
    val add = methods.single { method ->
        method.returnType == "V" && method.parameterTypes.size == 1 && method.callsSet("add") &&
                classDefByOrNull(method.parameterTypes[0].toString())?.methods?.any {
                    it.implementation == null && it.returnType == "V" && it.parameterTypes.size == 2 &&
                            it.parameterTypes[0] == "Ljava/lang/Object;"
                } == true
    }
    val remove = methods.single {
        it.parameterTypes == add.parameterTypes && it.returnType == "V" && it.callsSet("remove")
    }
    val callback = classDefBy(add.parameterTypes.single().toString()).methods.single {
        it.implementation == null && it.returnType == "V" && it.parameterTypes.size == 2 &&
                it.parameterTypes[0] == "Ljava/lang/Object;"
    }
    return CurrentItemSubscription(add, remove, callback)
}

private fun BytecodePatchContext.resolveNativePlayNext(queue: JamQueueAbi): FieldReference {
    val constructor = classDefBy(queue.callback.type).methods.single {
        it.name == "<init>" && it.parameterTypes == queue.callback.constructor.parameterTypes
    }
    require(constructor.parameterTypes.size == 2 && constructor.parameterTypes[0] == queue.managerType) {
        "Native Play-next callback owner is unavailable"
    }
    val modeType = constructor.parameterTypes[1].toString()
    val code = constructor.implementation!!.instructions.toList()
    val label = code.indexOfFirst { it.getReference<StringReference>()?.string == "PLAY_NEXT" }
    require(label >= 0) { "Native Play-next mode is unavailable" }
    return code.take(label).mapNotNull { it.getReference<FieldReference>() }
        .last { it.definingClass == modeType && it.type == modeType }
}
