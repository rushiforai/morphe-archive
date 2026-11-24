package software.santodan.extension.nuviomerged

/** Keep a locally completed show's visible card until native next-up resolution finishes. */
object NuvioHomeTransition {
    fun <T> project(current: List<T>, proposed: List<T>, replacement: T?, same: (T) -> Boolean): List<T> {
        val at = proposed.indexOfFirst(same).takeIf { it >= 0 } ?: current.indexOfFirst(same).coerceAtLeast(0)
        val rows = proposed.filterNot(same).toMutableList()
        if (replacement != null) rows.add(at.coerceAtMost(rows.size), replacement)
        return rows
    }
    fun <T> retain(current: List<T>, proposed: List<T>, pending: Set<String>, key: (T) -> String?): List<T> {
        if (pending.isEmpty() || current.isEmpty()) return proposed
        val present = proposed.mapNotNullTo(HashSet(), key)
        var result: MutableList<T>? = null
        current.forEachIndexed { index, item ->
            val id = key(item)
            if (id != null && id in pending && present.add(id)) {
                val output = result ?: proposed.toMutableList().also { result = it }
                output.add(index.coerceAtMost(output.size), item)
            }
        }
        return result ?: proposed
    }
}
