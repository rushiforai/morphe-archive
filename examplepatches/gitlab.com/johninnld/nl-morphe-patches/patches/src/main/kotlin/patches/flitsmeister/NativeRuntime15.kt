package patches.flitsmeister

import app.morphe.patcher.patch.rawResourcePatch
import java.security.MessageDigest

/**
 * PairIP rewrites MapLibre's imports and requires its startup program to repair
 * them before dlopen. Restore the exact upstream 13.6.1 arm64 build when that
 * program is bypassed. Its GNU build ID and original read-only/unwind sections
 * match the publisher library; the protected input is pinned independently.
 *
 * Source: org.maplibre.gl:android-sdk:13.6.1, Maven Central android-sdk-13.6.1.aar
 * SHA-256: 3863ef506991b590270e1418129a44b98d73da31251c011dc440ea6121fb01aa
 */
internal val startupNativeResources15 = rawResourcePatch {
    dependsOn(originalInput)
    execute {
        if (!isFlitsmeister15Resources()) return@execute
        fun ByteArray.sha256(): String = MessageDigest.getInstance("SHA-256").digest(this)
            .joinToString("") { "%02x".format(it.toInt() and 0xff) }

        val destination = get("lib/arm64-v8a").resolve("libmaplibre.so")
        check(destination.readBytes().sha256() == "a16f4ce832821685d0e68196e7981f513659885b173ccfe8bcb4c895725f64f3") {
            "Changed protected Flitsmeister 15.0 MapLibre library"
        }
        val stock = checkNotNull(object {}.javaClass.getResourceAsStream("/libmaplibre-13.6.1-arm64-v8a.so"))
            .use { it.readBytes() }
        check(stock.sha256() == "1e154a4640e4078f4fde31649771d93d4e5fee6f731f608d565d3b3f755ca8f9") {
            "Changed upstream MapLibre 13.6.1 library"
        }
        destination.writeBytes(stock)
    }
}
