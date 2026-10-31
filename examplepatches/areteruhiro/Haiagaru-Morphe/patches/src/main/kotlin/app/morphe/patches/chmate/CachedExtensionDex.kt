package app.morphe.patches.chmate

import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import java.nio.ByteBuffer

/** Per-shard read cache, discarded with the extension merge; never caches app data. */
internal class CachedExtensionDex(bytes: ByteArray) : DexBackedDexFile(null, ByteBuffer.wrap(bytes)) {
    private var strings: OptionalIndexedSection<String>? = null
    private var types: OptionalIndexedSection<String>? = null

    override fun getStringSection(): OptionalIndexedSection<String> =
        strings ?: CachedSection(super.getStringSection()).also { strings = it }

    override fun getTypeSection(): OptionalIndexedSection<String> =
        types ?: CachedSection(super.getTypeSection()).also { types = it }

    private class CachedSection(private val original: OptionalIndexedSection<String>) : OptionalIndexedSection<String>() {
        private val values = arrayOfNulls<String>(original.size)
        override val size: Int get() = original.size
        override fun get(index: Int): String {
            // Delegate invalid indices so dexlib's original validation is retained.
            if (index !in values.indices) return original[index]
            return values[index] ?: original[index].also { values[index] = it }
        }
        override fun getOptional(index: Int): String? =
            if (index in values.indices) get(index) else original.getOptional(index)
        override fun getOffset(index: Int): Int = original.getOffset(index)
    }
}
