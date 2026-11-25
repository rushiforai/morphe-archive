package nl.johninnl.reolink.calls

/** Visitor is the native physical-doorbell event, distinct from person/motion detections. */
internal object DoorbellEvents {
    fun isRing(nativeCall: Boolean, type: String?): Boolean = nativeCall || type.equals("visitor", ignoreCase = true)
    fun diagnostic(value: String?): String = value?.takeIf { it.matches(Regex("[A-Za-z0-9_-]{1,32}")) } ?: "other"
}
