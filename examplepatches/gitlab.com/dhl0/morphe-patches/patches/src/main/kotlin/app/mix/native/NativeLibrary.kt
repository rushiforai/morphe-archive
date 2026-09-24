package app.mix.native

/** Architecture-neutral parsed library used for fingerprinting and mutation. */
abstract class NativeLibrary(
    /** Logical name of the library (e.g. the .so file name). */
    val name: String,
) {
    /** Virtual address of the start of the code section. */
    abstract val codeStartAddress: Long

    /** Functions discovered in the code section. */
    abstract val functions: List<NativeFunction>

    /** Functions from the symbol table that live in the code section. */
    abstract val symbolFunctions: List<NativeFunction>

    /** Decodes a byte range into instructions starting at [startAddress]. */
    abstract fun decodeRange(startAddress: Long, endAddress: Long): List<NativeInstruction>

    /** Reads the raw bytes of a referenced string at a VA, or null. */
    abstract fun readStringBytes(va: Long): ByteArray?

    /** Maps a VA to its file offset, or the VA minus the load bias. */
    abstract fun vaToFileOffset(va: Long): Long

    /**
     * Decodes raw string bytes into readable text.
     *
     * Libraries with string obfuscation (e.g. XOR-encoded strings) override this.
     */
    var stringDecoder: (ByteArray) -> String? = { bytes ->
        runCatching { String(bytes, Charsets.UTF_8) }.getOrNull()
    }

    override fun toString(): String = "NativeLibrary($name)"
}
