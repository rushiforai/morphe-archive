package app.mix.native

/** A semantic instruction that a native backend can encode. */
enum class NativeOpcode {
    RETURN,
}

/** Architecture-specific instruction encoding used by mutable native libraries. */
interface NativeArchitecture {
    /** Android ABI directory name, such as `arm64-v8a`. */
    val abi: String

    /** ELF machine identifier handled by this architecture. */
    val elfMachine: Int

    /** Encodes [opcode] at [address]. */
    fun encode(opcode: NativeOpcode, address: Long): ByteArray
}

/** Parser supplied by a concrete native architecture implementation. */
interface NativeLibraryBackend {
    val architecture: NativeArchitecture

    /** Parses [bytes] into a mutable native library. */
    fun parse(bytes: ByteArray, name: String): MutableNativeLibrary
}
