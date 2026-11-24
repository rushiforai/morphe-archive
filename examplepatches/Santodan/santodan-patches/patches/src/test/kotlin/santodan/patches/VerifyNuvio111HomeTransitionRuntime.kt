package santodan.patches

import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*
import software.santodan.extension.nuviomerged.NuvioHomeTransition

private data class TransitionCard(val id: String, val episode: Int, val kind: String = "next")

/** Reproduce slow native next-up resolution without a wall-clock/network wait. */
fun main() = runBlocking {
    val old = TransitionCard("show", 8, "progress")
    val other = TransitionCard("other", 4)
    val next = TransitionCard("show", 9)
    val visible = MutableStateFlow(listOf(old, other))
    val resolution = CompletableDeferred<List<TransitionCard>>()
    val resolved = async(start = CoroutineStart.UNDISPATCHED) {
        val result = resolution.await()
        // The final native publication intentionally bypasses retention.
        visible.value = result
    }
    repeat(4) {
        visible.value = NuvioHomeTransition.retain(visible.value, listOf(other), setOf("show")) { it.id }
        check(visible.value == listOf(old, other))
    }
    resolution.complete(listOf(next, other)); resolved.await()
    check(visible.value == listOf(next, other) && visible.value.none { it === old })
    check(NuvioHomeTransition.project(visible.value, listOf(old,other), next) { it.id == "show" } == listOf(next,other))
    check(NuvioHomeTransition.project(visible.value, listOf(old,other), null) { it.id == "show" } == listOf(other))
    val proposed = listOf(next, other)
    check(NuvioHomeTransition.retain(listOf(old, other), proposed, setOf("show")) { it.id } === proposed)
    // Native final resolution can remove a fully watched/dismissed show; later stages cannot resurrect it.
    visible.value = listOf(other)
    check(NuvioHomeTransition.retain(visible.value, listOf(other), setOf("show")) { it.id } == listOf(other))
    check(NuvioHomeTransition.retain(listOf(old), emptyList(), emptySet()) { it.id }.isEmpty())
    // A failed/offline resolver keeps an existing card, but no card is invented on a cold/profile-empty Home.
    check(NuvioHomeTransition.retain(listOf(old), emptyList(), setOf("show")) { it.id } == listOf(old))
    check(NuvioHomeTransition.retain(emptyList(), emptyList(), setOf("show")) { c: TransitionCard -> c.id }.isEmpty())
    // Aliases share identity, so a resolved replacement wins and repeated cache entries never duplicate it.
    val alias = old.copy(id = "tmdb:1")
    fun canonical(c: TransitionCard) = if (c.id == "tmdb:1") "show" else c.id
    check(NuvioHomeTransition.retain(listOf(old, alias), emptyList(), setOf("show"), ::canonical).size == 1)
    check(NuvioHomeTransition.retain(listOf(alias), listOf(next), setOf("show"), ::canonical) == listOf(next))
    // Completed local changes alone are eligible; unrelated removals and partial rewatches remain native.
    check(NuvioHomeTransition.retain(listOf(old, other), emptyList(), setOf("show")) { it.id } == listOf(old))
    println("PASS: slow next-up stages retain the card, native replacement/final removal win, no cold/profile resurrection or alias duplicates")
}
