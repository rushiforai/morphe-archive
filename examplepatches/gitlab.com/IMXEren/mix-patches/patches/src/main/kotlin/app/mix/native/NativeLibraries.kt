package app.mix.native

import app.mix.native.arm64.Arm64Library

/** Entry point for the native architecture backends bundled with the patch library. */
object NativeLibraries {
    private val backends: List<NativeLibraryBackend> = listOf(
        Arm64Library,
    )

    /** Android ABI names for which a parser and instruction encoder are available. */
    val supportedAbis: List<String> = backends.map { it.architecture.abi }

    /** Parses a library using the backend registered for [abi]. */
    fun parse(abi: String, bytes: ByteArray, name: String): MutableNativeLibrary {
        val backend = backends.singleOrNull { it.architecture.abi == abi }
            ?: throw IllegalArgumentException("Unsupported native ABI: $abi")
        return backend.parse(bytes, name)
    }
}
