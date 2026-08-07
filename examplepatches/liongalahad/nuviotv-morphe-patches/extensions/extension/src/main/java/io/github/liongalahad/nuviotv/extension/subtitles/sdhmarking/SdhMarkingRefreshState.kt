package io.github.liongalahad.nuviotv.extension.subtitles.sdhmarking

import java.lang.reflect.Method
import java.util.concurrent.atomic.AtomicInteger

/**
 * A snapshot dependency read by each visible subtitle row.
 * Updating it redraws titles without rebuilding or reordering the source list.
 */
object SdhMarkingRefreshState {
    private val fallbackEpoch = AtomicInteger(0)
    private val runtimeState: Any? = createRuntimeState()
    private val getValue: Method? = runtimeState?.javaClass?.methods?.firstOrNull {
        it.name == "getValue" && it.parameterTypes.isEmpty()
    }
    private val setValue: Method? = runtimeState?.javaClass?.methods?.firstOrNull {
        it.name == "setValue" && it.parameterTypes.contentEquals(arrayOf(Object::class.java))
    }

    @JvmStatic
    fun observe(): Int = try {
        (getValue?.invoke(runtimeState) as? Number)?.toInt() ?: fallbackEpoch.get()
    } catch (_: Throwable) {
        fallbackEpoch.get()
    }

    /** Read directly from each visible subtitle row's Compose scope. */
    @JvmStatic
    fun observeForCompose() {
        observe()
    }

    @JvmStatic
    fun invalidate() {
        val next = fallbackEpoch.incrementAndGet()
        try {
            setValue?.invoke(runtimeState, next)
        } catch (_: Throwable) {
            // Detection remains cached even if a future Nuvio runtime cannot be bridged.
        }
    }

    internal fun resetForTests() {
        fallbackEpoch.set(0)
        try {
            setValue?.invoke(runtimeState, 0)
        } catch (_: Throwable) {
            // The JVM test runtime does not contain Nuvio's optimized Compose classes.
        }
    }

    /**
     * Nuvio optimizes Compose into short package names. Calling its own state factory
     * reflectively keeps this extension in the same snapshot system without bundling a
     * second Compose runtime.
     */
    private fun createRuntimeState(): Any? = try {
        Class.forName("e1.j")
            .getDeclaredMethod("q", Object::class.java)
            .apply { isAccessible = true }
            .invoke(null, 0)
    } catch (_: Throwable) {
        null
    }
}
