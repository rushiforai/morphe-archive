package app.czyeru.patches.uvm

/**
 * Stops the store update pop-up (`ModalUpdateApp`) of Conexión Lince UVM 1.0.63.
 *
 * When the school's server rejects an API request with HTTP `307`, the error interceptors of the two
 * Axios clients (`HttpService` and `Consumer`) dispatch `setGlobalProp({ showModalUpdateStore: true })`.
 * The screen `ModalUpdateApp` watches that flag and opens the blocking "Actualización disponible" modal.
 * Both interceptors are changed to load `false` instead of `true` into `showModalUpdateStore`.
 *
 * Every edit has the same length as what it replaces. The patch stops instead of guessing when the code is
 * not the expected one.
 */
internal object UvmUpdatePopupPatcher {
    private const val PUT_NEW_OWN_BY_ID = 64
    private const val LOAD_CONST_TRUE = 120
    private const val LOAD_CONST_FALSE = 121
    private const val FLAG_REGISTER = 6

    private const val HTTP_ERROR_INTERCEPTOR = 12297
    private const val HTTP_ERROR_INTERCEPTOR_SIZE = 1088
    private const val HTTP_TRUE_AT = 0x0429

    private const val CONSUMER_ERROR_INTERCEPTOR = 12340
    private const val CONSUMER_ERROR_INTERCEPTOR_SIZE = 1085
    private const val CONSUMER_TRUE_AT = 0x0426

    /** What was done, for the log. */
    class Report(val edits: Int) {
        override fun toString() = "$edits interceptor(s) of the store update pop-up changed"
    }

    /** The bytes of [bundle] are edited in place. */
    fun apply(bundle: ByteArray): Report {
        val before = bundle.copyOf()
        val bytecode = HermesBundle(bundle)
        ensure(bytecode.sourceHash == UvmBundlePatcher.SOURCE_HASH) {
            "This is not the bundle of Conexión Lince UVM 1.0.63 (source ${bytecode.sourceHash})"
        }

        val strings = Array(bytecode.stringCount) { bytecode.string(it) }
        val allowed = BooleanArray(bundle.size)
        fun allow(from: Int, to: Int) = (from until to).forEach { allowed[it] = true }

        fun disableModalAt(function: Int, size: Int, trueAt: Int, label: String) {
            val (offset, actualSize) = bytecode.function(function)
            ensure(actualSize == size) { "The $label interceptor has changed (function $function)" }

            val site = offset + trueAt
            ensure(
                bytecode.readU8(site) == LOAD_CONST_TRUE &&
                    bytecode.readU8(site + 1) == FLAG_REGISTER &&
                    bytecode.readU8(site + 2) == PUT_NEW_OWN_BY_ID &&
                    bytecode.readU8(site + 4) == FLAG_REGISTER &&
                    strings[bytecode.readU16(site + 5)] == "showModalUpdateStore"
            ) { "$label showModalUpdateStore assignment is not as expected" }

            bundle[site] = LOAD_CONST_FALSE.toByte()
            allow(site, site + 1)
        }

        disableModalAt(
            HTTP_ERROR_INTERCEPTOR,
            HTTP_ERROR_INTERCEPTOR_SIZE,
            HTTP_TRUE_AT,
            "HttpService",
        )
        disableModalAt(
            CONSUMER_ERROR_INTERCEPTOR,
            CONSUMER_ERROR_INTERCEPTOR_SIZE,
            CONSUMER_TRUE_AT,
            "Consumer",
        )

        allow(bundle.size - HermesBundle.FOOTER_SIZE, bundle.size)
        bytecode.refreshFooter()
        for (i in bundle.indices) {
            ensure(bundle[i] == before[i] || allowed[i]) { "Byte $i changed without being planned" }
        }
        return Report(2)
    }
}
