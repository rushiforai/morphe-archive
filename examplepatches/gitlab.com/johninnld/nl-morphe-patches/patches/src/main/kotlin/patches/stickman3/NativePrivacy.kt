package patches.stickman3

import java.io.File
import java.io.RandomAccessFile
import java.security.MessageDigest

internal data class StickmanPrivacyEdit(val name: String, val offset: Long, val expected: String, val replacement: String)
private fun String.nativeBytes() = chunked(2).map { it.toInt(16).toByte() }.toByteArray()

internal fun applyStickmanPrivacy(file: File, expectedSha256: String, edits: List<StickmanPrivacyEdit>) {
    val digest = MessageDigest.getInstance("SHA-256")
    file.inputStream().buffered().use { input ->
        val buffer = ByteArray(65536)
        while (true) { val n = input.read(buffer); if (n < 0) break; digest.update(buffer, 0, n) }
    }
    check(digest.digest().joinToString("") { "%02x".format(it.toInt() and 255) } == expectedSha256) {
        "Stickman native library changed; tracking patch refused"
    }
    check(edits.map { it.offset }.distinct().size == edits.size)
    RandomAccessFile(file, "rw").use { native ->
        for (edit in edits) {
            val before = edit.expected.nativeBytes(); val after = edit.replacement.nativeBytes()
            check(after.isNotEmpty() && after.size % 4 == 0 && before.size >= after.size && edit.offset % 4 == 0L && edit.offset >= 0 && edit.offset <= native.length() - before.size)
            val found = ByteArray(before.size); native.seek(edit.offset); native.readFully(found)
            check(found.contentEquals(before)) { "Stickman telemetry entry changed: ${edit.name}" }
        }
        val ordered = edits.sortedBy { it.offset }
        check(ordered.zipWithNext().all { (a, b) -> a.offset + a.replacement.length / 2 <= b.offset })
        for (edit in edits) { native.seek(edit.offset); native.write(edit.replacement.nativeBytes()) }
    }
}

private val nativePrivacyEdits = listOf(
    StickmanPrivacyEdit(".AnalyticsManager.IdentityInit 0x60006a8", 0x1d4e5ecL, "fe0f1ef8f44f01a9130c01d0d4f30090", "00008052e1031faa5f906f14"),
    StickmanPrivacyEdit(".AnalyticsManager.SetPlayfabId 0x60006aa", 0x1d4e9bcL, "fe57bea9f44f01a9140c01d055f40090", "c0035fd6"),
    StickmanPrivacyEdit(".AnalyticsManager.Flush 0x60006ab", 0x1d4ea08L, "e0031faabd976f14ff8301d1fe6f01a9", "c0035fd6"),
    StickmanPrivacyEdit(".AnalyticsManager.QueueEvent 0x60006db", 0x1d4ebc0L, "fe57bea9f44f01a9150c01d0a8025839", "c0035fd6"),
    StickmanPrivacyEdit("Unity.Services.Analytics.AnalyticsServiceInstance.StartDataCollection 0x600001d", 0x35c6f20L, "fe0f1ef8f44f01a9b448009088f24d39", "c0035fd6"),
    StickmanPrivacyEdit("Unity.Services.Analytics.AnalyticsServiceInstance.Flush 0x6000027", 0x35c74b8L, "fe0f1ef8f44f01a9944800f0881a4e39", "c0035fd6"),
    StickmanPrivacyEdit("Unity.Services.Analytics.AnalyticsServiceInstance.CustomData 0x600002c", 0x35c82c4L, "e2031faa01000014fe5fbda9f65701a9", "c0035fd6"),
    StickmanPrivacyEdit("Unity.Services.Analytics.AnalyticsServiceInstance.CustomData 0x600002d", 0x35c82ccL, "fe5fbda9f65701a9f44f02a9964800d0", "c0035fd6"),
    StickmanPrivacyEdit("Unity.Services.Analytics.AnalyticsServiceInstance.CustomData 0x600002e", 0x35c8334L, "fe0f1bf8fa6701a9f85f02a9f65703a9", "c0035fd6"),
    StickmanPrivacyEdit("Unity.Services.Analytics.AnalyticsServiceInstance.RecordEvent 0x600002f", 0x35c88d4L, "fe57bea9f44f01a9954800d0a82e4e39", "c0035fd6"),
    StickmanPrivacyEdit("Unity.Services.Analytics.AnalyticsServiceInstance.RecordEvent 0x6000030", 0x35c8994L, "fe0f1df8f65701a9f44f02a9954800d0", "c0035fd6"),
    StickmanPrivacyEdit("Unity.Services.Analytics.AnalyticsServiceInstance.RecordEvent 0x6000031", 0x35c89ecL, "fe0f1df8f65701a9f44f02a9964800d0", "c0035fd6"),
    StickmanPrivacyEdit("UnityEngine.Analytics.Analytics.Transaction 0x600002c", 0x393480cL, "e80f1cfcfe0700f9f85f01a9f65702a9", "40008052c0035fd6"),
    StickmanPrivacyEdit("UnityEngine.Analytics.Analytics.SendCustomEventName 0x600002d", 0x3934888L, "fe0f1ef8f44f01a9742d0090818240f9", "40008052c0035fd6"),
    StickmanPrivacyEdit("UnityEngine.Analytics.Analytics.SendCustomEvent 0x600002e", 0x39348c4L, "fe0f1ef8f44f01a9742d0090818640f9", "40008052c0035fd6"),
    StickmanPrivacyEdit("UnityEngine.Analytics.Analytics.FlushEvents 0x600002f", 0x3934900L, "fe4fbfa9732d0090687640f9c80000b5", "40008052c0035fd6"),
    StickmanPrivacyEdit("UnityEngine.Analytics.Analytics.Transaction 0x6000030", 0x3934968L, "e6031f2a01000014e80f1bfcfe0700f9", "40008052c0035fd6"),
    StickmanPrivacyEdit("UnityEngine.Analytics.Analytics.Transaction 0x6000031", 0x3934970L, "e80f1bfcfe0700f9fa6701a9f85f02a9", "40008052c0035fd6"),
    StickmanPrivacyEdit("UnityEngine.Analytics.Analytics.CustomEvent 0x6000032", 0x3934b58L, "fe57bea9f44f01a9732d009068464439", "40008052c0035fd6"),
    StickmanPrivacyEdit("UnityEngine.Analytics.Analytics.FlushArchivedEvents 0x600002b", 0x39347e4L, "fe4fbfa9732d0090607a40f9a00000b5", "00008052c0035fd6"),
)

internal fun disableStickmanNativeAnalytics(file: File) =
    applyStickmanPrivacy(file, "d92dc7e7461e5c76e57b7b829d970f9ee09e7a8322975337058f65b3527de183", nativePrivacyEdits)
