package io.github.liongalahad.nuviotv.extension.subtitles.localstoragesubtitles

import java.lang.reflect.Method
import java.util.concurrent.atomic.AtomicInteger

/** A patch-local snapshot dependency that redraws the subtitle overlay after an import. */
object LocalSubtitleRefreshState {
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

    /** Read from Nuvio's subtitle-overlay Compose scope. */
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
            // The import remains persisted if a future Nuvio runtime cannot be bridged.
        }
    }

    internal fun resetForTests() {
        fallbackEpoch.set(0)
        try {
            setValue?.invoke(runtimeState, 0)
        } catch (_: Throwable) {
            // JVM tests do not contain Nuvio's optimized Compose classes.
        }
    }

    private fun createRuntimeState(): Any? = try {
        Class.forName("e1.j")
            .getDeclaredMethod("q", Object::class.java)
            .apply { isAccessible = true }
            .invoke(null, 0)
    } catch (_: Throwable) {
        null
    }
}
