package patches.eclipse

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import patches.shared.exactMethod

private const val SONG = "Lcom/eclipse/android/data/models/Song;"

/** One mutator of the app's play queue (`le8`) that tells the car UI the queue changed. */
internal data class QueueHook(val name: String, val parameters: List<String>) {
    val owner get() = QUEUE_OWNER
    val returnType get() = "V"
    val descriptor get() = "$QUEUE_OWNER->$name(${parameters.joinToString("")})V"
}

internal const val QUEUE_OWNER = "Lle8;"

/** The call each hooked mutator starts with; the extension's Signals only schedules a refresh. */
internal const val SIGNAL_CALL = "invoke-static {}, Lnl/johninnl/eclipse/auto/app/Signals;->queueChanged()V"

/** The 12 `le8` mutators of build 155 that change what Up Next or the queue shows, from the design's symbol map. */
internal val QUEUE_HOOKS = listOf(
    QueueHook("a", listOf(SONG)),
    QueueHook("B", listOf(SONG)),
    QueueHook("D", listOf("I")),
    QueueHook("E", listOf("I")),
    QueueHook("A", listOf("I")),
    QueueHook("L", listOf("Ljava/util/List;", "I", "Lke8;")),
    QueueHook("f", emptyList()),
    QueueHook("g", emptyList()),
    QueueHook("e", emptyList()),
    QueueHook("t", listOf("I", "I")),
    QueueHook("u", listOf("I", "I")),
    QueueHook("v", listOf("I", "I")),
)

/**
 * Insert [SIGNAL_CALL] at the start of every [QUEUE_HOOKS] method. Each hook must resolve to
 * exactly one method (exact owner, name, return type and parameters), or patching fails. No hook
 * returns a value or changes a result. Returns the descriptors that were hooked.
 */
context(context: BytecodePatchContext)
internal fun injectQueueSignals(): List<String> = QUEUE_HOOKS.map { hook ->
    exactMethod(hook.owner, hook.name, hook.returnType, *hook.parameters.toTypedArray())
        .method.addInstructions(0, SIGNAL_CALL)
    hook.descriptor
}
