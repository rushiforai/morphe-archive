package app.modprod.patches.app

import app.modprod.patches.shared.Constants.COMPATIBILITY_BASE
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.colorOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val MAIN_ACTIVITY = "start.MainActivity"

/** Couleur de fond d'origine de l'APK de base (thème, layout, pages helpers). */
private const val BASE_BACKGROUND = "141a21"

/** #RGB, #RRGGBB ou #AARRGGBB → #aarrggbb, ou null si invalide. */
internal fun normalizeColor(value: String?): String? {
    val hex = value?.trim()?.removePrefix("#")?.lowercase() ?: return null
    if (!hex.matches(Regex("^[0-9a-f]+$"))) return null
    return when (hex.length) {
        3 -> "#ff" + hex.map { "$it$it" }.joinToString("")
        6 -> "#ff$hex"
        8 -> "#$hex"
        else -> null
    }
}

/** Couleur claire → icônes sombres dans les barres système. */
internal fun isLightColor(argb: String): Boolean {
    val r = argb.substring(3, 5).toInt(16)
    val g = argb.substring(5, 7).toInt(16)
    val b = argb.substring(7, 9).toInt(16)
    return (0.299 * r + 0.587 * g + 0.114 * b) / 255 > 0.6
}

private fun isColorOrEmpty(value: String?) = value.isNullOrBlank() || normalizeColor(value) != null

@Suppress("unused")
val modProdSettingsPatch = resourcePatch(
    name = "ModProd Réglages",
    description = "Réglages Android de l'appli : orientation, plein écran, captures d'écran, écran allumé, " +
        "zoom, couleurs, autorisations (caméra, micro, localisation).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BASE)

    // region Affichage

    val orientation by stringOption(
        key = "orientation",
        default = "portrait",
        values = mapOf("Portrait" to "portrait", "Automatique (rotation)" to "auto"),
        title = "Orientation",
        description = "Portrait bloqué, ou suit la rotation du téléphone.",
        required = true,
    ) { it == "portrait" || it == "auto" }

    val fullscreen by booleanOption(
        key = "fullscreen",
        default = false,
        title = "Plein écran",
        description = "Masque la barre d'état.",
    )

    val keepScreenOn by booleanOption(
        key = "keepScreenOn",
        default = false,
        title = "Écran toujours allumé",
        description = "L'écran ne se met pas en veille tant que l'appli est ouverte.",
    )

    val blockScreenshots by booleanOption(
        key = "blockScreenshots",
        default = false,
        title = "Bloquer les captures d'écran",
        description = "Interdit captures et enregistrements, masque l'aperçu dans les applis récentes.",
    )

    val zoom by booleanOption(
        key = "zoom",
        default = false,
        title = "Zoom à deux doigts",
    )

    val scrollBars by booleanOption(
        key = "scrollBars",
        default = false,
        title = "Barres de défilement",
    )

    val debug by booleanOption(
        key = "debug",
        default = false,
        title = "Inspection depuis Chrome PC",
        description = "Permet d'inspecter la page via chrome://inspect. À désactiver pour une version publiée.",
    )

    // endregion

    // region Couleurs

    val webTheme by stringOption(
        key = "webTheme",
        default = "auto",
        values = mapOf(
            "Automatique (respecter le site)" to "auto",
            "Sombre natif Android" to "native",
            "Sombre CSS (expérimental)" to "css",
            "Inversion des couleurs (expérimental)" to "invert",
        ),
        title = "Thème des sites web",
        description = "Thème appliqué aux pages au premier lancement. Natif : assombrissement Android ; CSS : fond sombre forcé ; " +
            "inversion : couleurs inversées. Modifiable dans l'appli par un appui long sur une zone vide de la page.",
        required = true,
    ) { it in setOf("auto", "native", "css", "invert") }

    val backgroundColor by colorOption(
        key = "backgroundColor",
        title = "Couleur de fond",
        description = "Fond de l'appli au démarrage, de l'écran de chargement et de la page d'erreur. " +
            "Vide = inchangé (#141a21).",
    ) { isColorOrEmpty(it) }

    val barsColor by colorOption(
        key = "barsColor",
        title = "Couleur des barres système",
        description = "Barre d'état et barre de navigation. Couleur claire = icônes sombres. " +
            "Vide = inchangé (#141a21).",
    ) { isColorOrEmpty(it) }

    val accentColor by colorOption(
        key = "accentColor",
        title = "Couleur d'accent",
        description = "Boutons et curseurs des fenêtres Android (« Save As »…). Vide = inchangé (#f08a24).",
    ) { isColorOrEmpty(it) }

    // endregion

    // region Autorisations

    val camera by booleanOption(
        key = "camera",
        default = false,
        title = "Autorisation : caméra",
        description = "Photo depuis un champ fichier, getUserMedia vidéo.",
    )

    val microphone by booleanOption(
        key = "microphone",
        default = false,
        title = "Autorisation : micro",
        description = "getUserMedia audio, enregistrement vocal.",
    )

    val location by booleanOption(
        key = "location",
        default = false,
        title = "Autorisation : localisation",
        description = "navigator.geolocation.",
    )

    // endregion

    execute {
        setBools(
            mapOf(
                "portrait" to (orientation != "auto"),
                "fullscr" to (fullscreen == true),
                "keepScreenOn" to (keepScreenOn == true),
                "flag_secure" to (blockScreenshots == true),
                "Zoom" to (zoom == true),
                "ScrollBars" to (scrollBars == true),
                "isDebugMode" to (debug == true),
            ),
        )

        document("AndroidManifest.xml").use { document ->
            setOrientation(document, orientation != "auto")
            val permissions = buildList {
                if (camera == true) add("android.permission.CAMERA")
                if (microphone == true) {
                    add("android.permission.RECORD_AUDIO")
                    add("android.permission.MODIFY_AUDIO_SETTINGS")
                }
                if (location == true) {
                    add("android.permission.ACCESS_FINE_LOCATION")
                    add("android.permission.ACCESS_COARSE_LOCATION")
                }
            }
            addPermissions(document, permissions)
        }

        setWebTheme(webTheme ?: "auto")
        // Android 13+ : l'assombrissement natif ne marche qu'avec un thème d'appli sombre.
        if (webTheme == "native") {
            document("res/values/styles.xml").use { setThemeItems(it, mapOf("android:isLightTheme" to "false")) }
        }
        normalizeColor(backgroundColor)?.let { setBackground(it) }
        normalizeColor(barsColor)?.let { setBars(it) }
        normalizeColor(accentColor)?.let { setAccent(it) }
    }
}

/** Valeurs de res/values/bools.xml, lues par smali/start/Cfg.smali au démarrage. */
private fun ResourcePatchContext.setBools(values: Map<String, Boolean>) {
    document("res/values/bools.xml").use { document ->
        val existing = mutableMapOf<String, Element>()
        val nodes = document.getElementsByTagName("bool")
        for (i in 0 until nodes.length) {
            val element = nodes.item(i) as Element
            existing[element.getAttribute("name")] = element
        }
        values.forEach { (name, value) ->
            val element = existing[name] ?: document.createElement("bool").also {
                it.setAttribute("name", name)
                document.documentElement.appendChild(it)
            }
            element.textContent = value.toString()
        }
    }
}

private fun mainActivity(document: Document): Element {
    val activities = document.getElementsByTagName("activity")
    for (i in 0 until activities.length) {
        val element = activities.item(i) as Element
        if (element.getAttribute("android:name") == MAIN_ACTIVITY) return element
    }
    throw PatchException("Activité $MAIN_ACTIVITY introuvable dans le manifeste")
}

private fun setOrientation(document: Document, portrait: Boolean) {
    mainActivity(document).setAttributeNS(ANDROID_NS, "android:screenOrientation", if (portrait) "portrait" else "unspecified")
}

private fun addPermissions(document: Document, permissions: List<String>) {
    if (permissions.isEmpty()) return
    val present = mutableSetOf<String>()
    val nodes = document.getElementsByTagName("uses-permission")
    for (i in 0 until nodes.length) present += (nodes.item(i) as Element).getAttribute("android:name")

    val manifest = document.documentElement
    val application = document.getElementsByTagName("application").item(0)
    permissions.filter { it !in present }.forEach { name ->
        val element = document.createElementNS(null, "uses-permission")
        element.setAttributeNS(ANDROID_NS, "android:name", name)
        manifest.insertBefore(element, application)
    }
}

/** Remplace un <item name="…"> du style AppTheme (ou l'ajoute). */
private fun setThemeItems(document: Document, items: Map<String, String>) {
    val styles = document.getElementsByTagName("style")
    val theme = (0 until styles.length)
        .map { styles.item(it) as Element }
        .firstOrNull { it.getAttribute("name") == "AppTheme" }
        ?: throw PatchException("Style AppTheme introuvable dans res/values/styles.xml")

    val existing = mutableMapOf<String, Element>()
    val children = theme.getElementsByTagName("item")
    for (i in 0 until children.length) {
        val element = children.item(i) as Element
        existing[element.getAttribute("name")] = element
    }
    items.forEach { (name, value) ->
        val element = existing[name] ?: document.createElement("item").also {
            it.setAttribute("name", name)
            theme.appendChild(it)
        }
        element.textContent = value
    }
}

private fun ResourcePatchContext.setBackground(color: String) {
    document("res/values/styles.xml").use { document ->
        setThemeItems(
            document,
            mapOf(
                "android:windowBackground" to color,
                "android:windowSplashScreenBackground" to color,
            ),
        )
    }

    document("res/layout/activity_main.xml").use { document ->
        fun walk(element: Element) {
            if (element.hasAttribute("android:background")) element.setAttributeNS(ANDROID_NS, "android:background", color)
            val children = element.childNodes
            for (i in 0 until children.length) (children.item(i) as? Element)?.let(::walk)
        }
        walk(document.documentElement)
    }

    // Pages HTML de chargement et d'erreur : même fond que l'appli.
    val css = "#" + color.substring(3)
    listOf("assets/htmlapp/helpers/loading.html", "assets/htmlapp/helpers/error.html").forEach { path ->
        val file = get(path)
        if (file.isFile) {
            file.writeText(
                file.readText(Charsets.UTF_8).replace(Regex("#$BASE_BACKGROUND", RegexOption.IGNORE_CASE), css),
                Charsets.UTF_8,
            )
        }
    }
}

private fun ResourcePatchContext.setBars(color: String) {
    val light = isLightColor(color).toString()
    // Android 15+ (bord à bord) : la base peint elle-même la zone des barres avec modprod_bars,
    // et choisit la couleur des icônes avec lightBars.
    setBools(mapOf("lightBars" to isLightColor(color)))
    setColor("modprod_bars", color)
    document("res/values/styles.xml").use { document ->
        setThemeItems(
            document,
            mapOf(
                "android:statusBarColor" to color,
                "android:navigationBarColor" to color,
                "android:windowLightStatusBar" to light,
                "android:windowLightNavigationBar" to light,
            ),
        )
    }
}

private fun ResourcePatchContext.setAccent(color: String) {
    document("res/values/colors.xml").use { document ->
        val nodes = document.getElementsByTagName("color")
        for (i in 0 until nodes.length) {
            val element = nodes.item(i) as Element
            if (element.getAttribute("name") == "colorAccent") element.textContent = color
        }
    }
}

/** Le moteur Android lit cette ressource au lancement. */
private fun ResourcePatchContext.setWebTheme(mode: String) {
    document("res/values/strings.xml").use { document ->
        val nodes = document.getElementsByTagName("string")
        var element: Element? = null
        for (i in 0 until nodes.length) {
            val candidate = nodes.item(i) as Element
            if (candidate.getAttribute("name") == "web_theme") {
                element = candidate
                break
            }
        }
        val target = element ?: document.createElement("string").also {
            it.setAttribute("name", "web_theme")
            document.documentElement.appendChild(it)
        }
        target.textContent = mode
    }
}

/** Remplace (ou ajoute) une couleur de res/values/colors.xml. */
private fun ResourcePatchContext.setColor(name: String, color: String) {
    document("res/values/colors.xml").use { document ->
        val nodes = document.getElementsByTagName("color")
        var element: Element? = null
        for (i in 0 until nodes.length) {
            val candidate = nodes.item(i) as Element
            if (candidate.getAttribute("name") == name) {
                element = candidate
                break
            }
        }
        val target = element ?: document.createElement("color").also {
            it.setAttribute("name", name)
            document.documentElement.appendChild(it)
        }
        target.textContent = color
    }
}
