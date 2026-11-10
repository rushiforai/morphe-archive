package app.modprod.patches.app

import app.modprod.patches.shared.Constants.ASSETS_CONFIG
import app.modprod.patches.shared.Constants.ASSETS_INDEX
import app.modprod.patches.shared.Constants.ASSETS_ROOT
import app.modprod.patches.shared.Constants.COMPATIBILITY_BASE
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.filePathOption
import app.morphe.patcher.patch.folderOption
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element
import java.io.File
import java.util.logging.Logger

private val logger = Logger.getLogger("ModProdAppPatch")

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

/** Mots réservés Java : interdits comme segment d'un nom de package. */
private val JAVA_RESERVED = setOf(
    "abstract", "assert", "boolean", "break", "byte", "case", "catch", "char", "class", "const",
    "continue", "default", "do", "double", "else", "enum", "extends", "final", "finally", "float",
    "for", "goto", "if", "implements", "import", "instanceof", "int", "interface", "long", "native",
    "new", "package", "private", "protected", "public", "return", "short", "static", "strictfp",
    "super", "switch", "synchronized", "this", "throw", "throws", "transient", "try", "void",
    "volatile", "while", "true", "false", "null", "var", "record", "yield",
)

/** Minuscules, au moins deux segments, lettres/chiffres/_, pas de mot réservé Java. */
internal fun isValidPackageName(name: String?): Boolean {
    val value = name?.trim() ?: return false
    if (!value.matches(Regex("^[a-z][a-z0-9_]*(\\.[a-z][a-z0-9_]*)+$"))) return false
    return value.split('.').none { it in JAVA_RESERVED }
}

/** Échappe un texte pour une ressource <string> Android. */
internal fun escapeAndroidString(text: String): String {
    val escaped = text
        .replace("\\", "\\\\")
        .replace("'", "\\'")
        .replace("\"", "\\\"")
        .replace("\n", "\\n")
    return if (escaped.startsWith("@") || escaped.startsWith("?")) "\\$escaped" else escaped
}

/** Adresse https:// complète, sans espace. */
internal fun isValidWebUrl(url: String?): Boolean =
    url?.trim()?.matches(Regex("^https://[^\\s/?#]+\\.[^\\s]*$", RegexOption.IGNORE_CASE)) == true

/** Texte sûr dans une chaîne JavaScript placée dans une balise <script>. */
internal fun jsString(text: String): String =
    "\"" + text
        .replace("\\", "\\\\")
        .replace("\"", "\\\"")
        .replace("\n", "\\n")
        .replace("\r", "\\r")
        .replace("<", "\\u003c")
        .replace("\u2028", "\\u2028")
        .replace("\u2029", "\\u2029") + "\""

/** Texte sûr dans du HTML. */
internal fun htmlText(text: String): String =
    text.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;")

/** Densités des icônes de lancement de l'APK de base. */
private val MIPMAP_FOLDERS = listOf(
    "mipmap", "mipmap-mdpi", "mipmap-hdpi", "mipmap-xhdpi", "mipmap-xxhdpi", "mipmap-xxxhdpi",
)

@Suppress("unused")
val modProdAppPatch = resourcePatch(
    name = "ModProd App",
    description = "Transforme l'APK de base en une nouvelle appli : nom, nom de package, " +
        "page HTML ou adresse web, configuration, icône et version.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BASE)

    val appName by stringOption(
        key = "appName",
        title = "Nom de l'appli",
        description = "Nom affiché sous l'icône (ex. QuantiX 3D).",
        required = true,
    ) { !it.isNullOrBlank() }

    val packageName by stringOption(
        key = "packageName",
        title = "Nom de package",
        description = "Identifiant unique de l'appli (ex. app.modprod.quantix). " +
            "Minuscules, au moins deux segments, lettres/chiffres/_, pas de mot réservé Java.",
        required = true,
    ) { isValidPackageName(it) }

    val htmlFolder by folderOption(
        key = "htmlFolder",
        title = "Dossier de l'appli HTML",
        description = "Dossier contenant la page .html de l'appli (et ses fichiers : images, css, js…). " +
            "Son contenu remplace assets/htmlapp/root/index/. " +
            "Le lanceur ouvre index.html, sinon le premier .html par ordre alphabétique.",
    )

    val webUrl by stringOption(
        key = "webUrl",
        title = "Adresse web (au lieu du HTML)",
        description = "Adresse https:// d'un site à ouvrir à la place de la page HTML intégrée " +
            "(ex. https://quantix.modprod.app/). Si elle est remplie, le dossier HTML est ignoré. " +
            "Les liens http(s) restent dans l'appli, mailto:/tel:… ouvrent l'appli Android correspondante.",
    ) { it.isNullOrBlank() || isValidWebUrl(it) }

    val configFile by filePathOption(
        key = "configFile",
        title = "Fichier de configuration",
        description = "Fichier .js de configuration (window.APP_CONFIG). " +
            "Remplace le fichier de assets/htmlapp/root/config/.",
        allowedExtensions = listOf("js"),
    )

    val webIcon by booleanOption(
        key = "webIcon",
        default = true,
        title = "Icône du site (adresse web)",
        description = "Avec une adresse web et sans icône choisie : récupère l'icône PNG du site " +
            "(manifest web, apple-touch-icon…) pendant le patch. Sans connexion ou sans icône PNG : icône par défaut.",
    )

    val iconFile by filePathOption(
        key = "iconFile",
        title = "Icône",
        description = "Image PNG carrée (512 × 512 conseillé). " +
            "Remplace l'icône de lancement (normale et ronde) et assets/htmlapp/root/icon.png.",
        allowedExtensions = listOf("png"),
    )

    val versionName by stringOption(
        key = "versionName",
        title = "Version (nom)",
        description = "Ex. 1.0.0. Vide = inchangé.",
    )

    val versionCode by intOption(
        key = "versionCode",
        title = "Version (code)",
        description = "Nombre entier, à augmenter à chaque mise à jour. Vide = inchangé.",
    ) { it == null || it > 0 }

    execute {
        val oldPackage = packageMetadata.packageName
        val newPackage = packageName!!.trim()

        setAppName(appName!!.trim())
        renamePackage(oldPackage, newPackage, versionName?.trim(), versionCode?.toString())
        val url = webUrl?.trim()?.takeIf { it.isNotEmpty() }
        if (url != null) {
            if (!htmlFolder.isNullOrBlank()) logger.warning("Adresse web remplie : le dossier HTML est ignoré")
            writeWebLauncher(url, appName!!.trim())
        } else {
            htmlFolder?.takeIf { it.isNotBlank() }?.let { copyHtmlFolder(File(it.trim())) }
        }
        configFile?.takeIf { it.isNotBlank() }?.let { copyConfig(File(it.trim())) }
        val chosenIcon = iconFile?.trim()?.takeIf { it.isNotEmpty() }
        if (chosenIcon != null) {
            copyIcon(File(chosenIcon))
        } else if (url != null && webIcon != false) {
            val bytes = fetchWebIcon(url)
            if (bytes != null) {
                val temp = File.createTempFile("web-icon", ".png").apply { deleteOnExit() }
                temp.writeBytes(bytes)
                copyIcon(temp)
            } else {
                logger.warning("Aucune icône PNG trouvée sur $url : icône par défaut conservée")
            }
        }

        logger.info("Appli « ${appName!!.trim()} » créée avec le package $newPackage")
    }
}

/** Remplace la ressource app_name (utilisée par android:label). */
private fun ResourcePatchContext.setAppName(name: String) {
    var found = false
    document("res/values/strings.xml").use { document ->
        val strings = document.getElementsByTagName("string")
        for (i in 0 until strings.length) {
            val element = strings.item(i) as Element
            if (element.getAttribute("name") == "app_name") {
                element.textContent = escapeAndroidString(name)
                found = true
            }
        }
    }
    if (!found) throw PatchException("Ressource app_name introuvable dans res/values/strings.xml")
}

/** Change le package, les permissions et les providers qui en dépendent, et la version. */
private fun ResourcePatchContext.renamePackage(
    oldPackage: String,
    newPackage: String,
    versionName: String?,
    versionCode: String?,
) {
    document("AndroidManifest.xml").use { document ->
        val manifest = document.documentElement
        manifest.setAttribute("package", newPackage)
        // setAttributeNS remplace l'attribut android: existant (setAttribute en ajouterait un second).
        if (!versionName.isNullOrEmpty()) manifest.setAttributeNS(ANDROID_NS, "android:versionName", versionName)
        if (!versionCode.isNullOrEmpty()) manifest.setAttributeNS(ANDROID_NS, "android:versionCode", versionCode)

        fun rename(value: String) =
            if (value.startsWith("$oldPackage.")) value.replaceFirst(oldPackage, newPackage) else value

        listOf("permission", "uses-permission").forEach { tag ->
            val nodes = document.getElementsByTagName(tag)
            for (i in 0 until nodes.length) {
                val element = nodes.item(i) as Element
                element.setAttribute("android:name", rename(element.getAttribute("android:name")))
            }
        }

        val providers = document.getElementsByTagName("provider")
        for (i in 0 until providers.length) {
            val element = providers.item(i) as Element
            val authorities = element.getAttribute("android:authorities").split(';')
            element.setAttribute("android:authorities", authorities.joinToString(";") { rename(it) })
        }
    }
}

/** Remplace le contenu de assets/htmlapp/root/index/ par celui du dossier choisi. */
private fun ResourcePatchContext.copyHtmlFolder(folder: File) {
    if (!folder.isDirectory) throw PatchException("Dossier HTML introuvable : ${folder.absolutePath}")

    val files = folder.walkTopDown()
        .onEnter { !it.name.startsWith(".") }
        .filter { it.isFile && !it.name.startsWith(".") }
        .toList()
    val relativePaths = files.associateWith { it.relativeTo(folder).invariantSeparatorsPath }

    if (relativePaths.values.none { !it.contains('/') && it.matches(Regex("(?i).+\\.html?$")) }) {
        throw PatchException("Le dossier ${folder.absolutePath} ne contient aucun fichier .html à sa racine")
    }

    // Supprime les anciens fichiers qui ne sont pas remplacés.
    val newEntries = relativePaths.values.map { ASSETS_INDEX + it }.toSet()
    listApkEntries(ASSETS_INDEX)
        .filter { !it.endsWith("/") && it !in newEntries }
        .forEach { delete(it) }

    relativePaths.forEach { (file, path) -> writeEntry(ASSETS_INDEX + path, file) }
}

/** Remplace le lanceur (root/index.html) par une redirection vers l'adresse web. */
private fun ResourcePatchContext.writeWebLauncher(url: String, appName: String) {
    val html = """
        |<!DOCTYPE html>
        |<html lang="fr">
        |<head>
        |<meta charset="UTF-8">
        |<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
        |<meta name="color-scheme" content="dark">
        |<title>${htmlText(appName)}</title>
        |<style>html,body{margin:0;height:100%;background:#141a21}</style>
        |</head>
        |<body>
        |<script>
        |/* Lanceur web (patch ModProd App) : ouvre le site dans l'appli. */
        |location.replace(${jsString(url)});
        |</script>
        |</body>
        |</html>
        |""".trimMargin()
    get(ASSETS_ROOT + "index.html", false).writeText(html, Charsets.UTF_8)
}

/** Remplace le fichier de configuration (le premier .js de config/ est chargé). */
private fun ResourcePatchContext.copyConfig(file: File) {
    if (!file.isFile) throw PatchException("Fichier de configuration introuvable : ${file.absolutePath}")
    val target = ASSETS_CONFIG + "config.js"
    listApkEntries(ASSETS_CONFIG)
        .filter { !it.endsWith("/") && it != target }
        .forEach { delete(it) }
    writeEntry(target, file)
}

/** Remplace l'icône de lancement et l'icône utilisée par la page. */
private fun ResourcePatchContext.copyIcon(file: File) {
    if (!file.isFile) throw PatchException("Icône introuvable : ${file.absolutePath}")
    val existing = listDecodableFiles("res/mipmap*").toSet()
    MIPMAP_FOLDERS.forEach { folder ->
        listOf("ic_launcher.png", "ic_launcher_round.png").forEach { name ->
            val path = "res/$folder/$name"
            if (path in existing) writeEntry(path, file)
        }
    }
    writeEntry(ASSETS_ROOT + "icon.png", file)
}

private fun ResourcePatchContext.writeEntry(path: String, source: File) {
    val target = get(path, false)
    target.parentFile?.mkdirs()
    source.copyTo(target, overwrite = true)
}
