package android.util
object Log {
    val messages = java.util.Collections.synchronizedList(mutableListOf<String>())
    @JvmStatic fun d(tag: String, message: String): Int { messages.add("$tag: $message"); return 0 }
    val errors = java.util.Collections.synchronizedList(mutableListOf<String>())
    @JvmStatic fun e(tag: String, message: String, error: Throwable): Int {
        errors.add("$tag: $message: $error")
        error.printStackTrace()
        return 0
    }
}
