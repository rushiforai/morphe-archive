package app.modprod.patches.atv

import app.modprod.patches.app.escapeAndroidString
import app.modprod.patches.app.isValidPackageName
import app.modprod.patches.shared.Constants.COMPATIBILITY_ATV
import app.morphe.patcher.patch.ImageSize
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.imageOption
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element
import java.io.File
import java.util.logging.Logger

private val logger = Logger.getLogger("AtvLauncherPatch")

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

/** Mode → classe de l'activité lancée (smali/atv/links/). */
private val MODES = mapOf(
    "url" to "atv.links.Url",
    "apk" to "atv.links.Apk",
    "apkToUrl" to "atv.links.ApkToUrl",
)

/** Nom de package d'une appli cible (les mots réservés Java ne sont pas vérifiés : appli d'un tiers). */
private fun isValidTargetPackage(value: String?) =
    value?.trim()?.matches(Regex("^[a-zA-Z][a-zA-Z0-9_]*(\\.[a-zA-Z][a-zA-Z0-9_]*)+$")) == true

/** Lien web (http/https) ou intent Android (intent://…;end) ou schéma d'appli (xxx://). */
private fun isValidTarget(value: String?) =
    value?.trim()?.matches(Regex("^[a-zA-Z][a-zA-Z0-9+.-]*:\\S+$")) == true

@Suppress("unused")
val atvLauncherPatch = resourcePatch(
    name = "ATV Launcher",
    description = "Crée un lanceur Android TV : ouvre un lien, une appli installée, ou l'appli sinon le lien. " +
        "Nom, package, bannière TV, icône et version.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ATV)

    val appName by stringOption(
        key = "appName",
        title = "Nom du lanceur",
        description = "Nom affiché sur l'écran d'accueil de la TV.",
        required = true,
    ) { !it.isNullOrBlank() }

    val packageName by stringOption(
        key = "packageName",
        title = "Nom de package",
        description = "Identifiant unique du lanceur (ex. app.modprod.atvlink.youtube). " +
            "Minuscules, au moins deux segments, lettres/chiffres/_, pas de mot réservé Java.",
        required = true,
    ) { isValidPackageName(it) }

    val mode by stringOption(
        key = "mode",
        default = "url",
        values = mapOf(
            "Lien (URL ou intent)" to "url",
            "Appli installée" to "apk",
            "Appli installée, sinon lien" to "apkToUrl",
        ),
        title = "Action au lancement",
        required = true,
    ) { it != null && it in MODES }

    val targetUrl by stringOption(
        key = "targetUrl",
        title = "Lien cible",
        description = "Pour « Lien » et « Appli, sinon lien » : https://… ou intent://…#Intent;scheme=https;end",
    ) { it.isNullOrBlank() || isValidTarget(it) }

    val targetApk by stringOption(
        key = "targetApk",
        title = "Package de l'appli cible",
        description = "Pour « Appli installée » : ex. com.google.android.youtube.tv",
    ) { it.isNullOrBlank() || isValidTargetPackage(it) }

    val banner by imageOption(
        key = "banner",
        title = "Bannière TV",
        description = "Image PNG 320 × 180 affichée sur l'écran d'accueil Android TV.",
        allowedExtensions = listOf("png"),
        recommendedSize = ImageSize(320, 180),
    )

    val icon by imageOption(
        key = "icon",
        title = "Icône",
        description = "Image PNG carrée (512 × 512 conseillé).",
        allowedExtensions = listOf("png"),
        recommendedSize = ImageSize(512, 512),
    )

    val isGame by booleanOption(
        key = "isGame",
        default = false,
        title = "Ranger dans « Jeux »",
        description = "Le lanceur apparaît dans la rangée des jeux de la TV.",
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
        val selectedMode = mode ?: "url"
        val url = targetUrl?.trim()?.takeIf { it.isNotEmpty() }
        val apk = targetApk?.trim()?.takeIf { it.isNotEmpty() }
        if (selectedMode != "apk" && url == null) throw PatchException("Le mode « $selectedMode » demande un lien cible")
        if (selectedMode != "url" && apk == null) throw PatchException("Le mode « $selectedMode » demande le package de l'appli cible")

        setStrings(
            mapOfNotNull(
                "app_name" to appName!!.trim(),
                "target_url" to url,
                "target_apk" to apk,
            ),
        )

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            manifest.setAttribute("package", packageName!!.trim())
            versionName?.trim()?.takeIf { it.isNotEmpty() }?.let {
                manifest.setAttributeNS(ANDROID_NS, "android:versionName", it)
            }
            versionCode?.let { manifest.setAttributeNS(ANDROID_NS, "android:versionCode", it.toString()) }

            val application = document.getElementsByTagName("application").item(0) as Element
            application.setAttributeNS(ANDROID_NS, "android:isGame", (isGame == true).toString())

            // Valeurs littérales : aapt2 refuse @string/… pour un nom d'activité ou de package.
            val activity = document.getElementsByTagName("activity").item(0) as Element
            activity.setAttributeNS(ANDROID_NS, "android:name", MODES.getValue(selectedMode))

            val packages = document.getElementsByTagName("package")
            for (i in 0 until packages.length) {
                (packages.item(i) as Element).setAttributeNS(ANDROID_NS, "android:name", apk ?: "com.exemple.apk")
            }
        }

        banner?.takeIf { it.isNotBlank() }?.let { copyImage(File(it.trim()), listOf("res/drawable/ic_banner.png")) }
        icon?.takeIf { it.isNotBlank() }?.let { path ->
            copyImage(File(path.trim()), listDecodableFiles("res/mipmap*").filter { it.endsWith("/ic_launcher.png") })
        }

        logger.info("Lanceur TV « ${appName!!.trim()} » ($selectedMode) créé avec le package ${packageName!!.trim()}")
    }
}

private fun mapOfNotNull(vararg pairs: Pair<String, String?>) =
    pairs.mapNotNull { (k, v) -> v?.let { k to it } }.toMap()

private fun ResourcePatchContext.setStrings(values: Map<String, String>) {
    document("res/values/strings.xml").use { document ->
        val strings = document.getElementsByTagName("string")
        for (i in 0 until strings.length) {
            val element = strings.item(i) as Element
            values[element.getAttribute("name")]?.let { element.textContent = escapeAndroidString(it) }
        }
    }
}

private fun ResourcePatchContext.copyImage(source: File, targets: List<String>) {
    if (!source.isFile) throw PatchException("Image introuvable : ${source.absolutePath}")
    targets.forEach { path ->
        val target = get(path, false)
        target.parentFile?.mkdirs()
        source.copyTo(target, overwrite = true)
    }
}
