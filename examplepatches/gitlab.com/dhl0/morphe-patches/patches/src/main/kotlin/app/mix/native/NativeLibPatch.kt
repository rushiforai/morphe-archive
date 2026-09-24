package app.mix.native

import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.ResourcePatch
import app.morphe.patcher.patch.ResourcePatchBuilder
import app.morphe.patcher.patch.resourcePatch

/**
 * Builder for a native library patch backed by Morphe's resource patch lifecycle.
 * Native libraries are opened per supported ABI and changes are written automatically.
 */
class NativeLibPatchBuilder internal constructor(
    private val delegate: ResourcePatchBuilder,
) {
    private val libraryNames = linkedSetOf<String>()
    private var executeBlock: NativeLibPatchContext.() -> Unit = {}

    /** Declares native library file names required by this patch. */
    fun libraries(vararg names: String) {
        require(names.none(String::isBlank)) { "Native library names must not be blank" }
        libraryNames += names
    }

    /** Adds compatible packages to this patch. */
    fun compatibleWith(vararg compatibility: Compatibility) {
        delegate.compatibleWith(*compatibility)
    }

    /** Adds patch dependencies. */
    fun dependsOn(vararg patches: Patch<*>) {
        delegate.dependsOn(*patches)
    }

    /** Adds an option to this patch. */
    operator fun <T> Option<T>.invoke(): Option<T> = apply {
        delegate.run { this@invoke() }
    }

    /** Sets the block executed once for every supported ABI found in the target app. */
    fun execute(block: NativeLibPatchContext.() -> Unit) {
        executeBlock = block
    }

    internal fun install() {
        require(libraryNames.isNotEmpty()) { "A native library patch must declare at least one library" }
        val requiredLibraries = libraryNames.toList()
        delegate.execute {
            val contexts = NativeLibraries.supportedAbis.mapNotNull { abi ->
                val files = requiredLibraries.associateWith { name ->
                    runCatching { this["lib/$abi/$name"] }.getOrNull()?.takeIf { it.isFile }
                }
                val presentFiles = files.values.filterNotNull()
                if (presentFiles.isEmpty()) {
                    null
                } else {
                    require(presentFiles.size == requiredLibraries.size) {
                        "Incomplete native library set for $abi"
                    }
                    NativeLibPatchContext.open(abi, files.mapValues { it.value!! })
                }
            }
            require(contexts.isNotEmpty()) {
                "No supported native library set found for ${NativeLibraries.supportedAbis.joinToString()}"
            }

            contexts.forEach { context ->
                context.executeBlock()
                context.writeChanges()
            }
        }
    }
}

/**
 * Creates a native library patch.
 *
 * The returned object is a [ResourcePatch], allowing it to participate in Morphe's normal
 * compatibility, dependency, option, execution, and patch-loading behavior.
 */
fun nativeLibPatch(
    name: String? = null,
    description: String? = null,
    default: Boolean = true,
    block: NativeLibPatchBuilder.() -> Unit = {},
): ResourcePatch = resourcePatch(name, description, default) {
    NativeLibPatchBuilder(this).apply(block).install()
}
