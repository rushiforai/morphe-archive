package app.sadmod.patches.happymod

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import java.io.File
import java.util.zip.ZipFile

internal data class ExtractedBridge(
    val appVersion: String,
    val aid: String,
    val stampKey: String,
    val hashSalt: String,
    val apiBase: String,
    val downloadBase: String
) {
    fun toJson(): String {
        return "{\n" +
            "  \"appVersion\": ${jsonQuote(appVersion)},\n" +
            "  \"aid\": ${jsonQuote(aid)},\n" +
            "  \"stampKey\": ${jsonQuote(stampKey)},\n" +
            "  \"hashSalt\": ${jsonQuote(hashSalt)},\n" +
            "  \"apiBase\": ${jsonQuote(apiBase)},\n" +
            "  \"downloadBase\": ${jsonQuote(downloadBase)}\n" +
            "}"
    }
}

private fun jsonQuote(v: String): String {
    val sb = StringBuilder(v.length + 2)
    sb.append('"')
    for (i in 0 until v.length) {
        val ch = v[i]
        when (ch) {
            '\\' -> sb.append("\\\\")
            '"' -> sb.append("\\\"")
            '\n' -> sb.append("\\n")
            else -> sb.append(ch)
        }
    }
    sb.append('"')
    return sb.toString()
}

/**
 * Dynamically extracts protocol parameters (endpoints, version, and native handshake tokens)
 * directly from the user's supplied target APK at patch time so the patch repository itself
 * contains zero target domains or cryptographic keys.
 */
internal object BridgeExtractor {

    private val printableTokenRegex = Regex("[A-Za-z0-9_]{8,40}")
    private val stampKeyRegex = Regex("^this_is_[a-z0-9_]+$")
    private val aidTokenRegex = Regex("^[a-z0-9]{16}$")

    private val apiBaseRegex = Regex("https://app\\.[a-z0-9-]{4,32}\\.[a-z]{2,10}")
    private val imgHostRegex = Regex("https://img\\.([a-z0-9-]{4,32}\\.[a-z]{2,10})")
    private val logHostRegex = Regex("https://log\\.([a-z0-9-]{4,32}\\.[a-z]{2,10})")
    private val hashSaltRegex = Regex("android_[a-z]{3,16}_apk")

    fun extract(
        context: ResourcePatchContext,
        cstampEntries: List<String>,
        appVersion: String
    ): ExtractedBridge {
        val apkFile = resolveInputApkFile(context)
        var aid = ""
        var stampKey = ""
        var apiBase = ""
        var hashSalt = ""
        val imgDomains = linkedSetOf<String>()
        val logDomains = linkedSetOf<String>()

        ZipFile(apkFile).use { zip ->
            for (entry in cstampEntries) {
                val zipEntry = zip.getEntry(entry) ?: continue
                val bytes = zip.getInputStream(zipEntry).use { it.readBytes() }
                val text = String(bytes, Charsets.ISO_8859_1)
                for (match in printableTokenRegex.findAll(text)) {
                    val token = match.value
                    if (stampKey.isEmpty() && stampKeyRegex.matches(token)) {
                        stampKey = token
                    } else if (aid.isEmpty() && aidTokenRegex.matches(token) && isMixedAlnumId(token)) {
                        aid = token
                    }
                    if (aid.isNotEmpty() && stampKey.isNotEmpty()) break
                }
                if (aid.isNotEmpty() && stampKey.isNotEmpty()) break
            }

            val dexEntries = zip.entries().asSequence()
                .filter { !it.isDirectory && it.name.startsWith("classes") && it.name.endsWith(".dex") }
                .sortedBy { it.name }
                .toList()

            val buffer = ByteArray(64 * 1024)
            for (dexEntry in dexEntries) {
                var tail = ""
                zip.getInputStream(dexEntry).use { ins ->
                    while (true) {
                        val read = ins.read(buffer)
                        if (read <= 0) break
                        val chunk = tail + String(buffer, 0, read, Charsets.ISO_8859_1)

                        if (apiBase.isEmpty()) {
                            apiBase = apiBaseRegex.find(chunk)?.value.orEmpty()
                        }
                        if (hashSalt.isEmpty()) {
                            hashSalt = hashSaltRegex.find(chunk)?.value.orEmpty()
                        }
                        for (m in imgHostRegex.findAll(chunk)) {
                            imgDomains.add(m.groupValues[1])
                        }
                        for (m in logHostRegex.findAll(chunk)) {
                            logDomains.add(m.groupValues[1])
                        }

                        tail = if (chunk.length > 256) chunk.takeLast(256) else chunk
                    }
                }
            }
        }

        val cdnDomain = imgDomains.firstOrNull { it in logDomains }
            ?: logDomains.firstOrNull()
            ?: imgDomains.firstOrNull()
            ?: ""
        val downloadBase = if (cdnDomain.isNotBlank()) "https://d.$cdnDomain" else ""

        val missing = mutableListOf<String>()
        if (aid.isEmpty()) missing.add("aid")
        if (stampKey.isEmpty()) missing.add("stampKey")
        if (hashSalt.isEmpty()) missing.add("hashSalt")
        if (apiBase.isEmpty()) missing.add("apiBase")
        if (downloadBase.isEmpty()) missing.add("downloadBase")
        if (missing.isNotEmpty()) {
            throw PatchException(
                "Could not extract required protocol parameters (${missing.joinToString()}) from the supplied APK. " +
                    "Please make sure you selected an unmodified HappyMod 3.x APK."
            )
        }

        return ExtractedBridge(
            appVersion = appVersion.ifBlank { "3.4.5" },
            aid = aid,
            stampKey = stampKey,
            hashSalt = hashSalt,
            apiBase = apiBase,
            downloadBase = downloadBase
        )
    }

    private fun isMixedAlnumId(token: String): Boolean {
        var digits = 0
        var letters = 0
        for (c in token) {
            if (c in '0'..'9') digits++
            else if (c in 'a'..'z') letters++
        }
        return digits >= 3 && letters >= 3
    }

    private fun resolveInputApkFile(context: ResourcePatchContext): File {
        val configField = ResourcePatchContext::class.java.getDeclaredField("config").apply {
            isAccessible = true
        }
        val config = configField.get(context)!!
        val apkField = config.javaClass.getDeclaredField("apkFile").apply {
            isAccessible = true
        }
        return apkField.get(config) as File
    }
}
