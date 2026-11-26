package app.sadmod.client.ui.i18n

import androidx.compose.runtime.staticCompositionLocalOf
import app.sadmod.client.data.model.ApkSecurityReport
import app.sadmod.client.data.model.FindingKind
import app.sadmod.client.data.model.SecurityFinding
import app.sadmod.client.data.model.SecurityRiskLevel

data class Strings(
    val appName: String,
    val tabApps: String,
    val tabGames: String,
    val tabSearch: String,
    val tabDownloads: String,
    val searchAppsHint: String,
    val searchGamesHint: String,
    val searchInputHint: String,
    val featured: String,
    val categoryFallback: String,
    val showAll: String,
    val retry: String,
    val clear: String,
    val back: String,
    val close: String,
    val recentSearches: String,
    val trendingSearches: String,
    val noResultsFor: (String) -> String,
    val filterAll: (Int) -> String,
    val filterHighRated: String,
    val loadMore: String,
    val ratingLabel: String,
    val downloadsLabel: String,
    val sizeLabel: String,
    val modsLabel: String,
    val getMod: String,
    val original: String,
    val originalInstalledBtn: String,
    val connecting: String,
    val verifyingShort: String,
    val downloadingPct: (Int) -> String,
    val install: String,
    val modsTab: (Int) -> String,
    val aboutTab: String,
    val noModsHint: String,
    val sortRecommended: String,
    val sortWorkingRate: String,
    val sortSmallest: String,
    val workingPct: (Int) -> String,
    val recommended: String,
    val downloadBtn: String,
    val noDescAvailable: String,
    val currentOriginalVersion: (String, String) -> String,
    val downloadStarted: (String) -> String,
    val downloadingOriginal: String,
    val unknownSourcesNotice: String,
    val allow: String,
    val noDownloadsTitle: String,
    val noDownloadsSubtitle: String,
    val resolvingLink: String,
    val verifyingAndScanning: String,
    val patchingApk: String,
    val completedMeta: (String, String) -> String,
    val failedFallback: String,
    val cancelled: String,
    val cancel: String,
    val retryBtn: String,
    val remove: String,
    val installApk: String,
    val installBundle: String,
    val installPatchedApk: String,
    val details: String,
    val editPermissions: (Int) -> String,
    val restoreOriginal: String,
    val originalRestored: String,
    val apkPatchedSuccess: (Int) -> String,
    val securityWarningTitle: String,
    val securityWarningBody: (String, String) -> String,
    val installAnyway: String,
    val securityReportTitle: (String) -> String,
    val securityCleanBody: String,
    val sha256Label: String,
    val copySha256: String,
    val sha256Copied: String,
    val permEditorTitle: String,
    val permEditorSubtitle: String,
    val stripRiskyQuick: String,
    val applyAndResign: String,
    val noPermissionsDeclared: String,
    val splitBundleNote: String,
    val permRiskHigh: String,
    val permRiskMedium: String,
    val permRiskNormal: String,
    val shieldTitle: String,
    val shieldSubtitle: String,
    val shieldBullets: List<Pair<String, String>>,
    val settingsTitle: String,
    val languageSection: String,
    val langSystem: String,
    val langEnglish: String,
    val langGerman: String,
    val networkSection: String,
    val dohTitle: String,
    val dohDesc: String,
    val proxyLabel: String,
    val proxyDirect: String,
    val proxyTor: String,
    val proxySocks5: String,
    val proxyHttp: String,
    val proxyHostLabel: String,
    val proxyPortLabel: String,
    val testConnection: String,
    val testingConnection: String,
    val connectionOk: (Long) -> String,
    val connectionErr: (String) -> String,
    val anonIdLabel: String,
    val rotateId: String,
    val saveHistoryTitle: String,
    val saveHistoryDesc: String,
    val storageSection: String,
    val storageStats: (Int, String) -> String,
    val clearDownloads: String,
    val clearedDownloadsMsg: (Int) -> String,
    val customEndpointLabel: String,
    val customEndpointHint: String,
    val isGerman: Boolean
) {
    fun riskSummary(report: ApkSecurityReport): String = when {
        !report.isValidArchive -> report.errorDetail.ifBlank {
            if (isGerman) "Ungültiges APK-/ZIP-Archiv." else "Invalid APK/ZIP archive."
        }
        report.riskLevel == SecurityRiskLevel.CLEAN ->
            if (isGerman) "Unauffällig · Keine kritischen Rechte oder Tracker"
            else "Clean · No high-risk permissions or trackers"
        report.riskLevel == SecurityRiskLevel.HIGH -> {
            val c = report.findings.count { it.isHighRisk }
            if (isGerman) "$c kritische Auffälligkeit(en) erkannt!"
            else "$c high-risk issue(s) detected!"
        }
        else -> {
            val c = report.findings.size
            if (isGerman) "$c Hinweis(e) (Rechte / Tracker)"
            else "$c notice(s) (permissions / trackers)"
        }
    }

    fun findingTitle(f: SecurityFinding): String = when (f.kind) {
        FindingKind.PERMISSION -> permissionLabel(f.identifier)
        FindingKind.PACKER -> if (isGerman) "Code-Packer: ${f.identifier}" else "Code Packer: ${f.identifier}"
        FindingKind.TRACKER -> if (isGerman) "Ad/Tracker-SDK: ${f.identifier}" else "Ad/Tracker SDK: ${f.identifier}"
        FindingKind.HARDCODED_IP -> if (isGerman) "Hartcodierte IP-URL: ${f.identifier}" else "Hardcoded IP URL: ${f.identifier}"
        FindingKind.ARCHIVE_ERROR -> f.identifier
    }

    fun findingDetail(f: SecurityFinding): String = when (f.kind) {
        FindingKind.PERMISSION -> f.identifier
        FindingKind.PACKER -> if (isGerman) {
            "Code ist verschleiert – vor Installation prüfen."
        } else {
            "Code is obfuscated/packed – inspect before installing."
        }
        FindingKind.TRACKER -> if (isGerman) {
            "Im Mod-APK-Code enthalten."
        } else {
            "Bundled inside the target mod APK."
        }
        FindingKind.HARDCODED_IP -> if (isGerman) {
            "Direkte IP-Verbindung im DEX-Code (möglicher IP-Logger/C2)."
        } else {
            "Direct IP endpoint in DEX bytecode (possible IP logger/C2)."
        }
        FindingKind.ARCHIVE_ERROR -> ""
    }

    fun permissionLabel(fullPerm: String): String {
        val short = fullPerm.removePrefix("android.permission.")
        return if (isGerman) {
            when (short) {
                "READ_SMS" -> "SMS lesen"
                "SEND_SMS" -> "SMS senden (Kostenfalle/Trojaner)"
                "RECEIVE_SMS" -> "SMS abfangen"
                "BIND_ACCESSIBILITY_SERVICE" -> "Bedienungshilfen-Vollzugriff"
                "READ_CONTACTS" -> "Kontakte lesen"
                "WRITE_CONTACTS" -> "Kontakte ändern"
                "READ_CALL_LOG" -> "Anrufliste lesen"
                "BIND_DEVICE_ADMIN" -> "Geräte-Administrator"
                "INSTALL_PACKAGES" -> "System-Installationsrecht"
                "REQUEST_INSTALL_PACKAGES" -> "Weitere Apps installieren"
                "SYSTEM_ALERT_WINDOW" -> "Über anderen Apps einblenden"
                "CAMERA" -> "Kamera nutzen"
                "RECORD_AUDIO" -> "Mikrofon aufnehmen"
                "ACCESS_FINE_LOCATION" -> "Genauer GPS-Standort"
                "ACCESS_COARSE_LOCATION" -> "Ungefährer Standort"
                "MANAGE_EXTERNAL_STORAGE" -> "Vollzugriff auf Gerätespeicher"
                "READ_EXTERNAL_STORAGE" -> "Speicher lesen"
                "WRITE_EXTERNAL_STORAGE" -> "Speicher schreiben"
                "QUERY_ALL_PACKAGES" -> "Alle installierten Apps auslesen"
                "READ_PHONE_STATE" -> "Telefonstatus & Geräte-IDs lesen"
                "ACCESS_ADSERVICES_AD_ID", "AD_ID" -> "Werbe-ID auslesen"
                "INTERNET" -> "Internetzugriff"
                "ACCESS_NETWORK_STATE" -> "Netzwerkstatus prüfen"
                "ACCESS_WIFI_STATE" -> "WLAN-Status prüfen"
                "POST_NOTIFICATIONS" -> "Benachrichtigungen senden"
                "WAKE_LOCK" -> "Gerät wachhalten"
                "VIBRATE" -> "Vibration"
                "FOREGROUND_SERVICE" -> "Hintergrunddienst"
                else -> short
            }
        } else {
            when (short) {
                "READ_SMS" -> "Read SMS messages"
                "SEND_SMS" -> "Send SMS (billing/trojan risk)"
                "RECEIVE_SMS" -> "Intercept incoming SMS"
                "BIND_ACCESSIBILITY_SERVICE" -> "Full Accessibility Service control"
                "READ_CONTACTS" -> "Read contacts"
                "WRITE_CONTACTS" -> "Modify contacts"
                "READ_CALL_LOG" -> "Read call log"
                "BIND_DEVICE_ADMIN" -> "Device Administrator"
                "INSTALL_PACKAGES" -> "Silent package install"
                "REQUEST_INSTALL_PACKAGES" -> "Install other APKs"
                "SYSTEM_ALERT_WINDOW" -> "Draw over other apps"
                "CAMERA" -> "Use camera"
                "RECORD_AUDIO" -> "Record microphone audio"
                "ACCESS_FINE_LOCATION" -> "Precise GPS location"
                "ACCESS_COARSE_LOCATION" -> "Approximate location"
                "MANAGE_EXTERNAL_STORAGE" -> "All files storage access"
                "READ_EXTERNAL_STORAGE" -> "Read storage"
                "WRITE_EXTERNAL_STORAGE" -> "Write storage"
                "QUERY_ALL_PACKAGES" -> "Query all installed apps"
                "READ_PHONE_STATE" -> "Read phone state & IDs"
                "ACCESS_ADSERVICES_AD_ID", "AD_ID" -> "Read Advertising ID"
                "INTERNET" -> "Internet access"
                "ACCESS_NETWORK_STATE" -> "View network state"
                "ACCESS_WIFI_STATE" -> "View Wi-Fi state"
                "POST_NOTIFICATIONS" -> "Post notifications"
                "WAKE_LOCK" -> "Prevent device from sleeping"
                "VIBRATE" -> "Vibrate"
                "FOREGROUND_SERVICE" -> "Run foreground service"
                else -> short
            }
        }
    }
}

val EnStrings = Strings(
    appName = "SadMod",
    tabApps = "Apps",
    tabGames = "Games",
    tabSearch = "Search",
    tabDownloads = "Downloads",
    searchAppsHint = "Search apps & mods",
    searchGamesHint = "Search games & mods",
    searchInputHint = "Search apps & mods…",
    featured = "Featured",
    categoryFallback = "Category",
    showAll = "Show all",
    retry = "Retry",
    clear = "Clear",
    back = "Back",
    close = "Close",
    recentSearches = "Recent searches",
    trendingSearches = "Popular searches",
    noResultsFor = { q -> "No results for \"$q\"" },
    filterAll = { n -> "All ($n)" },
    filterHighRated = "4.0★+",
    loadMore = "Load more",
    ratingLabel = "Rating",
    downloadsLabel = "Downloads",
    sizeLabel = "Size",
    modsLabel = "Mods",
    getMod = "Get Mod",
    original = "Original",
    originalInstalledBtn = "Install orig.",
    connecting = "Connecting…",
    verifyingShort = "Scanning…",
    downloadingPct = { p -> "$p%" },
    install = "Install",
    modsTab = { n -> "Mods ($n)" },
    aboutTab = "About",
    noModsHint = "No mod builds listed. Use Original above.",
    sortRecommended = "Recommended",
    sortWorkingRate = "Best Rate %",
    sortSmallest = "Smallest",
    workingPct = { p -> "$p% OK" },
    recommended = "Recommended",
    downloadBtn = "Download",
    noDescAvailable = "No detailed description available.",
    currentOriginalVersion = { v, s -> "Official version: $v ($s)" },
    downloadStarted = { t -> "Download started: $t" },
    downloadingOriginal = "Downloading original APK…",
    unknownSourcesNotice = "Allow \"Install unknown apps\" to install APKs directly.",
    allow = "Allow",
    noDownloadsTitle = "No downloads yet",
    noDownloadsSubtitle = "Downloaded APKs are scanned locally here.",
    resolvingLink = "Resolving download mirror…",
    verifyingAndScanning = "Verifying & security scanning…",
    patchingApk = "Patching manifest & re-signing…",
    completedMeta = { s, v -> "Ready · $s · v$v" },
    failedFallback = "Download failed",
    cancelled = "Cancelled",
    cancel = "Cancel",
    retryBtn = "Retry",
    remove = "Remove",
    installApk = "Install",
    installBundle = "Install",
    installPatchedApk = "Install",
    details = "Details",
    editPermissions = { n -> "Perms ($n)" },
    restoreOriginal = "Restore Original",
    originalRestored = "Original APK restored",
    apkPatchedSuccess = { n -> "$n permission(s) stripped & APK re-signed" },
    securityWarningTitle = "Security Warning",
    securityWarningBody = { title, items ->
        "Local SadMod scan detected high-risk permissions, packers, or hardcoded IP endpoints in \"$title\":\n\n$items"
    },
    installAnyway = "Install anyway",
    securityReportTitle = { t -> "Security Report: $t" },
    securityCleanBody = "No high-risk permissions (SMS, Contacts, Accessibility), trackers, or suspicious hardcoded IPs found.",
    sha256Label = "SHA-256 (e.g. for VirusTotal):",
    copySha256 = "Copy SHA-256",
    sha256Copied = "SHA-256 copied",
    permEditorTitle = "Edit APK Permissions",
    permEditorSubtitle = "Uncheck permissions to strip them from AndroidManifest.xml and re-sign the APK locally on your device. Note: apps with strict signature checks may require restoring the original.",
    stripRiskyQuick = "Strip risky perms",
    applyAndResign = "Patch & Re-sign APK",
    noPermissionsDeclared = "No removable permissions declared.",
    splitBundleNote = "Multi-APK bundle (.xapk) detected — manifest permission editing is currently supported for standalone .apk files.",
    permRiskHigh = "High Risk",
    permRiskMedium = "Privacy",
    permRiskNormal = "Standard",
    shieldTitle = "SadMod Shield & Privacy",
    shieldSubtitle = "Clean open-source client with zero ads, zero analytics, and built-in APK protection.",
    shieldBullets = listOf(
        "0 Ad SDKs & 0 Analytics" to "No AdMob, Unity Ads, Meta, Firebase, or crash telemetry.",
        "No IP Loggers or Hardware IDs" to "No GAID, no device serials, random in-RAM session ID with 1-tap rotation.",
        "Anonymous DNS & Proxy Support" to "Built-in DNS-over-HTTPS (Quad9) plus Tor/Orbot (SOCKS5) and custom proxy support.",
        "Pre-Install APK Scanner & Patcher" to "Inspects binary manifests, trackers & hardcoded IPs and lets you strip unwanted permissions before installing."
    ),
    settingsTitle = "Settings",
    languageSection = "Language",
    langSystem = "System",
    langEnglish = "English",
    langGerman = "Deutsch",
    networkSection = "Anonymity & Network",
    dohTitle = "DNS-over-HTTPS (Quad9)",
    dohDesc = "Encrypts DNS lookups when no proxy is active.",
    proxyLabel = "Proxy Routing",
    proxyDirect = "Direct",
    proxyTor = "Tor / Orbot",
    proxySocks5 = "SOCKS5",
    proxyHttp = "HTTP",
    proxyHostLabel = "Proxy Host",
    proxyPortLabel = "Port",
    testConnection = "Test Connection",
    testingConnection = "Testing…",
    connectionOk = { ms -> "Connected · $ms ms" },
    connectionErr = { e -> "Error: $e" },
    anonIdLabel = "Ephemeral Session ID",
    rotateId = "Rotate ID",
    saveHistoryTitle = "Save search history locally",
    saveHistoryDesc = "Off by default so searches leave no local trace.",
    storageSection = "Downloads Storage",
    storageStats = { count, size -> "$count file(s) · $size used" },
    clearDownloads = "Delete all APKs",
    clearedDownloadsMsg = { n -> "Deleted $n file(s)" },
    customEndpointLabel = "Custom Catalog Base URL (optional)",
    customEndpointHint = "Leave empty for default",
    isGerman = false
)

val DeStrings = Strings(
    appName = "SadMod",
    tabApps = "Apps",
    tabGames = "Spiele",
    tabSearch = "Suche",
    tabDownloads = "Downloads",
    searchAppsHint = "Apps & Mods suchen",
    searchGamesHint = "Spiele & Mods suchen",
    searchInputHint = "Apps & Mods suchen…",
    featured = "Empfohlen",
    categoryFallback = "Kategorie",
    showAll = "Alle anzeigen",
    retry = "Erneut laden",
    clear = "Löschen",
    back = "Zurück",
    close = "Schließen",
    recentSearches = "Zuletzt gesucht",
    trendingSearches = "Beliebte Suchen",
    noResultsFor = { q -> "Keine Treffer für „$q“" },
    filterAll = { n -> "Alle ($n)" },
    filterHighRated = "4.0★+",
    loadMore = "Mehr laden",
    ratingLabel = "Bewertung",
    downloadsLabel = "Downloads",
    sizeLabel = "Größe",
    modsLabel = "Mods",
    getMod = "Mod laden",
    original = "Original",
    originalInstalledBtn = "Orig. inst.",
    connecting = "Verbinde…",
    verifyingShort = "Prüfe…",
    downloadingPct = { p -> "$p%" },
    install = "Installieren",
    modsTab = { n -> "Mods ($n)" },
    aboutTab = "Über die App",
    noModsHint = "Keine Mod-Builds gelistet. Nutze oben „Original“.",
    sortRecommended = "Empfohlen",
    sortWorkingRate = "Beste Rate %",
    sortSmallest = "Kleinste",
    workingPct = { p -> "$p% OK" },
    recommended = "Empfohlen",
    downloadBtn = "Herunterladen",
    noDescAvailable = "Keine detaillierte Beschreibung verfügbar.",
    currentOriginalVersion = { v, s -> "Aktuelle Original-Version: $v ($s)" },
    downloadStarted = { t -> "Download gestartet: $t" },
    downloadingOriginal = "Original-APK wird geladen…",
    unknownSourcesNotice = "Erlaube „Unbekannte Apps installieren“, um APKs direkt zu installieren.",
    allow = "Erlauben",
    noDownloadsTitle = "Noch keine Downloads",
    noDownloadsSubtitle = "Geladene APKs werden hier lokal geprüft.",
    resolvingLink = "Download-Mirror wird aufgelöst…",
    verifyingAndScanning = "Prüfe Datei & Sicherheitsscan…",
    patchingApk = "Manifest patchen & neu signieren…",
    completedMeta = { s, v -> "Fertig · $s · v$v" },
    failedFallback = "Download fehlgeschlagen",
    cancelled = "Abgebrochen",
    cancel = "Abbrechen",
    retryBtn = "Wiederholen",
    remove = "Entfernen",
    installApk = "Installieren",
    installBundle = "Installieren",
    installPatchedApk = "Installieren",
    details = "Details",
    editPermissions = { n -> "Rechte ($n)" },
    restoreOriginal = "Original wiederherstellen",
    originalRestored = "Original-APK wiederhergestellt",
    apkPatchedSuccess = { n -> "$n Recht(e) entfernt & APK neu signiert" },
    securityWarningTitle = "Sicherheits-Warnung",
    securityWarningBody = { title, items ->
        "Der lokale SadMod-Scan hat kritische Rechte, Packer oder direkte IP-Endpunkte in „$title“ erkannt:\n\n$items"
    },
    installAnyway = "Trotzdem installieren",
    securityReportTitle = { t -> "Sicherheitsbericht: $t" },
    securityCleanBody = "Keine kritischen Rechte (SMS, Kontakte, Accessibility), Tracker oder verdächtige IP-Endpunkte gefunden.",
    sha256Label = "SHA-256 (z. B. für VirusTotal):",
    copySha256 = "SHA-256 kopieren",
    sha256Copied = "SHA-256 kopiert",
    permEditorTitle = "APK-Rechte bearbeiten",
    permEditorSubtitle = "Hake Berechtigungen ab, um sie aus der AndroidManifest.xml zu entfernen und die APK lokal auf dem Gerät neu zu signieren. Hinweis: Apps mit strenger Signaturprüfung brauchen ggf. das Original.",
    stripRiskyQuick = "Risikorechte abwählen",
    applyAndResign = "Patchen & Signieren",
    noPermissionsDeclared = "Keine entfernbaren Berechtigungen deklariert.",
    splitBundleNote = "Split-APK-Bundle (.xapk) erkannt – das Bearbeiten von Manifest-Rechten wird aktuell nur für normale .apk-Dateien unterstützt.",
    permRiskHigh = "Hohes Risiko",
    permRiskMedium = "Privatsphäre",
    permRiskNormal = "Standard",
    shieldTitle = "SadMod Shield & Privatsphäre",
    shieldSubtitle = "Sauberer Open-Source-Client ohne Werbung, ohne Analytics und mit lokalem APK-Schutz.",
    shieldBullets = listOf(
        "0 Ad-SDKs & 0 Analytics" to "Keine AdMob-, Unity-, Meta-, Firebase- oder Telemetrie-Bibliotheken.",
        "Keine IP-Logger oder Hardware-IDs" to "Keine GAID, keine Seriennummern – nur zufällige RAM-Session-ID mit 1-Tap-Rotation.",
        "Anonymes DNS & Proxy-Routing" to "Integriertes DNS-over-HTTPS (Quad9) sowie Tor/Orbot (SOCKS5) und eigene Proxys.",
        "APK-Scanner & Rechte-Editor" to "Prüft Manifeste, Tracker & hartcodierte IPs und entfernt unerwünschte Rechte vor der Installation."
    ),
    settingsTitle = "Einstellungen",
    languageSection = "Sprache",
    langSystem = "System",
    langEnglish = "English",
    langGerman = "Deutsch",
    networkSection = "Anonymität & Netzwerk",
    dohTitle = "DNS-over-HTTPS (Quad9)",
    dohDesc = "Verschlüsselt DNS-Anfragen, wenn kein Proxy aktiv ist.",
    proxyLabel = "Proxy-Routing",
    proxyDirect = "Direkt",
    proxyTor = "Tor / Orbot",
    proxySocks5 = "SOCKS5",
    proxyHttp = "HTTP",
    proxyHostLabel = "Proxy-Host",
    proxyPortLabel = "Port",
    testConnection = "Verbindung testen",
    testingConnection = "Teste…",
    connectionOk = { ms -> "Verbunden · $ms ms" },
    connectionErr = { e -> "Fehler: $e" },
    anonIdLabel = "Flüchtige Session-ID",
    rotateId = "ID rotieren",
    saveHistoryTitle = "Suchverlauf lokal speichern",
    saveHistoryDesc = "Standardmäßig AUS, damit Suchen keine Spuren hinterlassen.",
    storageSection = "Download-Speicher",
    storageStats = { count, size -> "$count Datei(en) · $size belegt" },
    clearDownloads = "Alle APKs löschen",
    clearedDownloadsMsg = { n -> "$n Datei(en) gelöscht" },
    customEndpointLabel = "Eigene Katalog-Basis-URL (optional)",
    customEndpointHint = "Leer lassen für Standard",
    isGerman = true
)

val LocalStrings = staticCompositionLocalOf { EnStrings }
