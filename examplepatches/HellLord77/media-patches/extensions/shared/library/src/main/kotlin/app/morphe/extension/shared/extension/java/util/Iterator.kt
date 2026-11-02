package app.morphe.extension.shared.extension.java.util

fun <T> Iterator<T>.matches(other: List<T>): Boolean {
    for (element in other) {
        if (!hasNext() || next() != element) return false
    }
    return !hasNext()
}

fun <T> Iterator<T>.matches(other: Set<T>): Boolean {
    var count = 0
    while (hasNext()) {
        if (next() !in other) return false
        count++
    }
    return count == other.size
}
