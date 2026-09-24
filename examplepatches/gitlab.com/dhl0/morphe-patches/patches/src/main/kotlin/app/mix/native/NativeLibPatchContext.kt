package app.mix.native

import java.io.File

/** Parsed native libraries and pending edits for one Android ABI. */
class NativeLibPatchContext(
    /** Parsed libraries. */
    val libraries: List<NativeLibrary>,
    private val outputFiles: Map<MutableNativeLibrary, File> = emptyMap(),
    /** Android ABI represented by this context, or null for manually constructed contexts. */
    @Suppress("unused")
    val abi: String? = null,
) {
    companion object {
        /** Opens [files] with the backend registered for [abi]. */
        fun open(abi: String, files: Map<String, File>): NativeLibPatchContext {
            require(files.isNotEmpty()) { "At least one native library is required" }
            val outputs = linkedMapOf<MutableNativeLibrary, File>()
            files.forEach { (name, file) ->
                require(file.isFile) { "Native library does not exist: $file" }
                val library = NativeLibraries.parse(abi, file.readBytes(), name)
                outputs[library] = file
            }
            return NativeLibPatchContext(outputs.keys.toList(), outputs, abi)
        }
    }

    /** Returns the library with the given name, or null. */
    fun library(name: String): NativeLibrary? = libraries.firstOrNull { it.name == name }

    /** All functions across all libraries. */
    @Suppress("unused")
    val functions: List<NativeFunction> get() = libraries.flatMap { it.functions }

    /** Writes all recorded native instruction replacements to their source files. */
    fun writeChanges() {
        outputFiles.forEach { (library, file) ->
            if (library.hasChanges) library.writeTo(file)
        }
    }
}
