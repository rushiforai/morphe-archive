package io.github.liongalahad.nuviotv.extension.playback.localdownloads

import java.lang.reflect.Method
import java.util.concurrent.atomic.AtomicInteger

/** Patch-local Compose dependency that refreshes visible episode download badges. */
object LocalDownloadsRefreshState {
    private val fallbackEpoch = AtomicInteger(0)
    private val runtimeState: Any? = createRuntimeState()
    private val getValue: Method? = runtimeState?.javaClass?.methods?.firstOrNull {
        it.name == "getValue" && it.parameterTypes.isEmpty()
    }
    private val setValue: Method? = runtimeState?.javaClass?.methods?.firstOrNull {
        it.name == "setValue" && it.parameterTypes.contentEquals(arrayOf(Object::class.java))
    }

    /** Read inside the episode-card composition so index changes invalidate visible badges. */
    @JvmStatic
    fun observeForCompose() {
        try {
            getValue?.invoke(runtimeState)
        } catch (_: Throwable) {
            fallbackEpoch.get()
        }
    }

    @JvmStatic
    fun invalidate() {
        val next = fallbackEpoch.incrementAndGet()
        try {
            setValue?.invoke(runtimeState, next)
        } catch (_: Throwable) {
            // Download state remains correct if a future Compose runtime cannot be bridged.
        }
    }

    internal fun epochForTests(): Int = fallbackEpoch.get()

    private fun createRuntimeState(): Any? = try {
        Class.forName("e1.j")
            .getDeclaredMethod("q", Object::class.java)
            .apply { isAccessible = true }
            .invoke(null, 0)
    } catch (_: Throwable) {
        null
    }
}
