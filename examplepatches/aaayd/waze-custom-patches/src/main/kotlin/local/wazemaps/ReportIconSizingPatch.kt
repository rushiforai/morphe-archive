package local.wazemaps

import app.morphe.patcher.patch.*
import java.security.MessageDigest
import java.util.Properties

private object ReportIconSizingResources

@Suppress("unused")
val reportIconSizingPatch = rawResourcePatch(
    name = "Detailed report icons at normal sizes",
    description = "Keep specific hazard icons when zooming out, using Waze's original small and tiny sizes. ARM64 only. Use alone or together with Selectable report icon packs from this bundle.",
    default = true
) {
    compatibleWith(Compatibility(
        packageName = "com.waze", name = "Waze", apkFileType = ApkFileType.XAPK,
        signatures = setOf("03637f6c5d8f604e6fdb79a6ffbfa578de4e318f8da22fc6106665247f8807d7"),
        targets = TESTED_WAZE_VERSIONS.map { AppTarget(it) }
    ))
    dependsOn(reportIconAssets)
    execute {
        val native = get("lib/arm64-v8a/libwaze.so")
        if (!native.isFile) throw PatchException("Report icon sizing requires the ARM64 Waze build")
        val bytes = native.readBytes()
        val digest = MessageDigest.getInstance("SHA-256").digest(bytes)
            .joinToString("") { "%02x".format(it.toInt() and 255) }
        val profile = ReportIconSizingResources::class.java.getResourceAsStream("/themes/native-profiles/$digest.properties")
            ?: throw PatchException("No verified icon-sizing profile for this ARM64 renderer. Refresh the Morphe source after the nightly build. Renderer SHA-256: $digest")
        val rules = Properties().apply { profile.use(::load) }
        if (digest != rules.getProperty("source.sha256") || rules.getProperty("profile.schema") != "2")
            throw PatchException("Invalid report icon profile identity")
        fun unhex(value: String): ByteArray {
            if (value.isEmpty() || value.length % 2 != 0 || value.any { it !in "0123456789abcdef" })
                throw PatchException("Invalid report icon profile bytes")
            return value.chunked(2).map { it.toInt(16).toByte() }.toByteArray()
        }
        val keys = rules.stringPropertyNames().filter { it.startsWith("patch.") }.sortedBy { it.substringAfter('.').toInt(16) }
        if (keys.size != rules.getProperty("call.sites").toInt() + 2 || rules.getProperty("report.groups").toInt() <= 0)
            throw PatchException("Incomplete report icon profile")
        var previousEnd = 0
        val edits = keys.map { key ->
            val offset = key.substringAfter('.').toInt(16)
            val (beforeHex, afterHex) = rules.getProperty(key).split(':')
            val before = unhex(beforeHex)
            val after = unhex(afterHex)
            if (before.size != after.size || offset < previousEnd || offset > bytes.size - before.size ||
                !bytes.copyOfRange(offset, offset + before.size).contentEquals(before))
                throw PatchException("Unexpected report-renderer patch site")
            previousEnd = offset + before.size
            offset to after
        }
        edits.forEach { (offset, after) -> after.copyInto(bytes, offset) }
        val appended = rules.getProperty("append") ?: throw PatchException("Missing native append definition")
        val output = if (appended.isEmpty()) bytes else bytes + unhex(appended)
        val outputDigest = MessageDigest.getInstance("SHA-256").digest(output)
            .joinToString("") { "%02x".format(it.toInt() and 255) }
        if (output.size != rules.getProperty("output.size").toInt() || outputDigest != rules.getProperty("output.sha256"))
            throw PatchException("Native icon profile output verification failed")
        native.writeBytes(output)
    }
}
