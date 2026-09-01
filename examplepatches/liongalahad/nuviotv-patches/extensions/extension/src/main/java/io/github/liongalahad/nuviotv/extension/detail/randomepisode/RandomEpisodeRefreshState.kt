package io.github.liongalahad.nuviotv.extension.detail.randomepisode

import java.lang.reflect.Method
import java.lang.reflect.Modifier
import java.util.concurrent.atomic.AtomicInteger

/** Patch-local Compose dependency for detail toggles and Continue Watching badges. */
object RandomEpisodeRefreshState {
    private val fallbackEpoch = AtomicInteger(0)
    private val runtimeState: Any? = createRuntimeState()
    private val getValue: Method? = runtimeState?.javaClass?.methods?.firstOrNull {
        it.name == "getValue" && it.parameterTypes.isEmpty()
    }
    private val setValue: Method? = runtimeState?.javaClass?.methods?.firstOrNull {
        it.name == "setValue" && it.parameterTypes.contentEquals(arrayOf(Object::class.java))
    }

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
            // Preference state remains authoritative if the Compose bridge changes.
        }
    }

    internal fun epochForTests(): Int = fallbackEpoch.get()

    private fun createRuntimeState(): Any? = try {
        Class.forName("e1.j").declaredMethods.firstOrNull {
            Modifier.isStatic(it.modifiers) && it.returnType != Void.TYPE &&
                it.parameterTypes.contentEquals(arrayOf(Object::class.java))
        }?.apply { isAccessible = true }?.invoke(null, 0)
    } catch (_: Throwable) {
        null
    }
}
