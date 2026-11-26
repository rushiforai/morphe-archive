package app.sadmod.client.data.download

import app.sadmod.client.data.model.ApkSecurityReport
import app.sadmod.client.data.model.FindingKind
import app.sadmod.client.data.model.SecurityFinding
import app.sadmod.client.data.model.SecurityRiskLevel
import app.sadmod.client.data.patcher.ApkManifestParser
import java.io.File
import java.io.FileInputStream
import java.security.MessageDigest
import java.util.zip.ZipInputStream

object ApkSecurityScanner {

    private val highRiskPermissions = setOf(
        "android.permission.READ_SMS",
        "android.permission.SEND_SMS",
        "android.permission.RECEIVE_SMS",
        "android.permission.BIND_ACCESSIBILITY_SERVICE",
        "android.permission.READ_CONTACTS",
        "android.permission.WRITE_CONTACTS",
        "android.permission.READ_CALL_LOG",
        "android.permission.BIND_DEVICE_ADMIN",
        "android.permission.INSTALL_PACKAGES"
    )

    private val mediumRiskPermissions = setOf(
        "android.permission.SYSTEM_ALERT_WINDOW",
        "android.permission.REQUEST_INSTALL_PACKAGES",
        "android.permission.RECORD_AUDIO",
        "android.permission.CAMERA",
        "android.permission.ACCESS_FINE_LOCATION",
        "android.permission.ACCESS_COARSE_LOCATION",
        "android.permission.MANAGE_EXTERNAL_STORAGE",
        "android.permission.QUERY_ALL_PACKAGES",
        "android.permission.READ_PHONE_STATE",
        "com.google.android.gms.permission.AD_ID",
        "android.permission.ACCESS_ADSERVICES_AD_ID"
    )

    private val trackerSignatures = mapOf(
        "com/google/android/gms/ads" to "Google AdMob",
        "com/unity3d/services/ads" to "Unity Ads",
        "com/facebook/ads" to "Meta Audience Network",
        "com/applovin" to "AppLovin Ads",
        "com/appsflyer" to "AppsFlyer Tracker",
        "com/adjust/sdk" to "Adjust Tracker",
        "io/branch" to "Branch Tracker",
        "com/mbridge" to "Mintegral Ads",
        "com/ironsource" to "ironSource Ads",
        "com/bytedance/sdk" to "Pangle / ByteDance Ads",
        "com/onesignal" to "OneSignal Push/Analytics",
        "com/mixpanel" to "Mixpanel Analytics",
        "com/flurry" to "Flurry Analytics"
    )

    private val packerSignatures = mapOf(
        "libSecShell" to "Bangcle / SecShell",
        "libjiagu" to "Qihoo 360 Jiagu",
        "libDexHelper" to "Bangcle DexHelper",
        "libexec.so" to "Ijiami Packer"
    )

    private val rawIpUrlRegex = Regex("https?://((?:\\d{1,3}\\.){3}\\d{1,3})(?::\\d+)?(?:/[\\w./?=&%-]*)?")

    fun isHighRiskPermission(permission: String): Boolean = permission in highRiskPermissions

    fun isMediumRiskPermission(permission: String): Boolean = permission in mediumRiskPermissions

    fun scan(file: File): ApkSecurityReport {
        if (!file.exists() || file.length() == 0L) {
            return ApkSecurityReport(
                riskLevel = SecurityRiskLevel.HIGH,
                isValidArchive = false,
                errorDetail = "File missing or empty."
            )
        }

        val sha256 = computeSha256(file)
        var hasManifest = false
        var apkEntryCount = 0
        var manifestBytes: ByteArray? = null
        val foundTrackers = linkedSetOf<String>()
        val foundPackers = linkedSetOf<String>()
        val foundRawIps = linkedSetOf<String>()

        try {
            ZipInputStream(FileInputStream(file)).use { zis ->
                val buf = ByteArray(64 * 1024)
                while (true) {
                    val entry = zis.nextEntry ?: break
                    val name = entry.name
                    if (name == "AndroidManifest.xml") {
                        hasManifest = true
                        manifestBytes = zis.readBytes()
                    } else if (!entry.isDirectory && name.endsWith(".apk", ignoreCase = true)) {
                        apkEntryCount++
                    } else if (name.endsWith(".so", ignoreCase = true)) {
                        packerSignatures.forEach { (sig, label) ->
                            if (name.contains(sig, ignoreCase = true)) foundPackers.add(label)
                        }
                    } else if (name.startsWith("classes") && name.endsWith(".dex")) {
                        var tail = ""
                        while (true) {
                            val read = zis.read(buf)
                            if (read <= 0) break
                            val chunk = tail + String(buf, 0, read, Charsets.ISO_8859_1)
                            trackerSignatures.forEach { (sig, label) ->
                                if (chunk.contains(sig)) foundTrackers.add(label)
                            }
                            if (foundRawIps.size < 5) {
                                rawIpUrlRegex.findAll(chunk).forEach { match ->
                                    val ip = match.groupValues[1]
                                    if (!isBenignIp(ip) && isValidIpv4(ip)) {
                                        foundRawIps.add(match.value.take(64))
                                    }
                                }
                            }
                            tail = if (chunk.length > 96) chunk.takeLast(96) else chunk
                        }
                    }
                    zis.closeEntry()
                }
            }
        } catch (t: Throwable) {
            return ApkSecurityReport(
                riskLevel = SecurityRiskLevel.HIGH,
                sha256 = sha256,
                isValidArchive = false,
                errorDetail = t.message ?: "Corrupt archive"
            )
        }

        if (!hasManifest && apkEntryCount == 0) {
            return ApkSecurityReport(
                riskLevel = SecurityRiskLevel.HIGH,
                sha256 = sha256,
                isValidArchive = false,
                errorDetail = "Not a valid Android package."
            )
        }

        val declaredPermissions = if (manifestBytes != null) {
            ApkManifestParser.parsePermissions(manifestBytes!!)
        } else {
            emptyList()
        }

        val findings = mutableListOf<SecurityFinding>()
        declaredPermissions.forEach { perm ->
            when (perm) {
                in highRiskPermissions -> findings.add(
                    SecurityFinding(FindingKind.PERMISSION, perm, isHighRisk = true)
                )
                in mediumRiskPermissions -> findings.add(
                    SecurityFinding(FindingKind.PERMISSION, perm, isHighRisk = false)
                )
            }
        }

        foundPackers.forEach { packer ->
            findings.add(SecurityFinding(FindingKind.PACKER, packer, isHighRisk = true))
        }

        foundRawIps.forEach { ipUrl ->
            findings.add(SecurityFinding(FindingKind.HARDCODED_IP, ipUrl, isHighRisk = true))
        }

        foundTrackers.forEach { tracker ->
            findings.add(SecurityFinding(FindingKind.TRACKER, tracker, isHighRisk = false))
        }

        val highCount = findings.count { it.isHighRisk }
        val level = when {
            highCount > 0 -> SecurityRiskLevel.HIGH
            findings.isNotEmpty() -> SecurityRiskLevel.MEDIUM
            else -> SecurityRiskLevel.CLEAN
        }

        return ApkSecurityReport(
            riskLevel = level,
            findings = findings,
            declaredPermissions = declaredPermissions,
            sha256 = sha256,
            isValidArchive = true,
            isSplitBundle = !hasManifest && apkEntryCount > 0
        )
    }

    private fun isValidIpv4(ip: String): Boolean {
        val parts = ip.split(".")
        if (parts.size != 4) return false
        return parts.all { p -> p.toIntOrNull()?.let { it in 0..255 } == true }
    }

    private fun isBenignIp(ip: String): Boolean {
        return ip.startsWith("127.") ||
            ip.startsWith("10.") ||
            ip.startsWith("192.168.") ||
            ip.startsWith("172.16.") ||
            ip == "0.0.0.0" ||
            ip == "8.8.8.8" ||
            ip == "8.8.4.4" ||
            ip == "1.1.1.1"
    }

    private fun computeSha256(file: File): String {
        val digest = MessageDigest.getInstance("SHA-256")
        file.inputStream().use { fis ->
            val buf = ByteArray(64 * 1024)
            while (true) {
                val read = fis.read(buf)
                if (read <= 0) break
                digest.update(buf, 0, read)
            }
        }
        return digest.digest().joinToString("") { "%02x".format(it) }
    }
}
