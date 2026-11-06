package app.morphe.util

import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.util.Document
import app.morphe.util.Utils.printInfo
import app.morphe.util.Utils.printWarn
import app.morphe.patches.shared.layout.branding.vectorPathBounds
import org.w3c.dom.Element
import org.w3c.dom.Node
import org.w3c.dom.NodeList
import java.io.File
import java.io.InputStream
import java.nio.file.Files
import java.nio.file.StandardCopyOption

private val classLoader = object {}.javaClass.classLoader

@Suppress("UNCHECKED_CAST")
fun Patch<*>.getStringOptionValue(key: String) =
    options[key] as Option<String>

@Suppress("UNCHECKED_CAST")
fun Patch<*>.getBooleanOptionValue(key: String) =
    options[key] as Option<Boolean>

fun Option<String>.valueOrThrow() = value
    ?: throw PatchException("Invalid patch option: $title.")

fun Option<Int?>.valueOrThrow() = value
    ?: throw PatchException("Invalid patch option: $title.")

fun Option<String>.lowerCaseOrThrow() = valueOrThrow()
    .lowercase()

fun Option<String>.underBarOrThrow() = lowerCaseOrThrow()
    .replace(" ", "_")

fun Node.adoptChild(tagName: String, block: Element.() -> Unit) {
    val child = ownerDocument.createElement(tagName)
    child.block()
    appendChild(child)
}

fun Node.cloneNodes(parent: Node) {
    val node = cloneNode(true)
    parent.appendChild(node)
    parent.removeChild(this)
}

/**
 * Removes a node from its parent.
 *
 * @return The node that was removed (object this method was called on).
 */
fun Node.removeFromParent() : Node = parentNode.removeChild(this)

/**
 * Returns a sequence for all child nodes.
 */
fun NodeList.asSequence() = (0 until this.length).asSequence().map { this.item(it) }

/**
 * Returns a sequence for all child nodes.
 */
@Suppress("UNCHECKED_CAST")
fun Node.childElementsSequence() =
    this.childNodes.asSequence().filter { it.nodeType == Node.ELEMENT_NODE } as Sequence<Element>

/**
 * Performs the given [action] on each child element.
 */
inline fun Node.forEachChildElement(action: (Element) -> Unit) =
    childElementsSequence().forEach {
        action(it)
    }

/**
 * Recursively traverse the DOM tree starting from the given root node.
 *
 * @param action function that is called for every node in the tree.
 */
fun Node.doRecursively(action: (Node) -> Unit) {
    action(this)
    val childNodes = this.childNodes
    for (i in 0 until childNodes.length) childNodes.item(i).doRecursively(action)
}

fun List<String>.getResourceGroup(fileNames: Array<String>) = map { directory ->
    ResourceGroup(
        directory, *fileNames
    )
}

private fun ResourcePatchContext.getMipMapPath(): String {
    var path: String
    document("AndroidManifest.xml").use { document ->
        val manifestElement = document.getNode("application") as Element
        val mipmapResourceFile = manifestElement.getAttribute("android:icon").split("/")[1]
        path = "res/mipmap-anydpi/$mipmapResourceFile.xml"
    }
    return path
}

private fun ResourcePatchContext.getAdaptiveIconResourceFile(tag: String): String {
    val path = getMipMapPath()
    document(path).use { document ->
        val adaptiveIcon = document
            .getElementsByTagName("adaptive-icon")
            .item(0) as Element

        val childNodes = adaptiveIcon.childNodes
        for (i in 0 until childNodes.length) {
            val node = childNodes.item(i)
            if (node is Element && node.tagName == tag && node.hasAttribute("android:drawable")) {
                return node.getAttribute("android:drawable").split("/")[1]
            }
        }
        throw PatchException("Element not found: $tag")
    }
}

private fun ResourcePatchContext.getAdaptiveIconBackgroundResourceFile() =
    getAdaptiveIconResourceFile("background")

private fun ResourcePatchContext.getAdaptiveIconForegroundResourceFile() =
    getAdaptiveIconResourceFile("foreground")

private fun ResourcePatchContext.getAdaptiveIconMonoChromeResourceFile() =
    getAdaptiveIconResourceFile("monochrome")

fun ResourcePatchContext.copyAdaptiveIcon(
    adaptiveIconBackgroundFileName: String,
    adaptiveIconForegroundFileName: String,
    mipmapDirectories: List<String>,
    adaptiveIconMonoChromeFileName: String? = null,
) {
    mapOf(
        adaptiveIconBackgroundFileName to getAdaptiveIconBackgroundResourceFile(),
        adaptiveIconForegroundFileName to getAdaptiveIconForegroundResourceFile()
    ).forEach { (oldIconResourceFile, newIconResourceFile) ->
        if (oldIconResourceFile != newIconResourceFile) {
            mipmapDirectories.forEach {
                val mipmapDirectory = get("res").resolve(it)
                FilesCompat.copy(
                    mipmapDirectory.resolve("$oldIconResourceFile.png"),
                    mipmapDirectory.resolve("$newIconResourceFile.png")
                )
            }
        }
    }

    if (adaptiveIconMonoChromeFileName != null &&
        adaptiveIconMonoChromeFileName != getAdaptiveIconMonoChromeResourceFile()
    ) {
        val drawableDirectory = get("res").resolve("drawable")
        FilesCompat.copy(
            drawableDirectory.resolve("$adaptiveIconMonoChromeFileName.xml"),
            drawableDirectory.resolve("${getAdaptiveIconMonoChromeResourceFile()}.xml")
        )
    }
}

fun ResourcePatchContext.appendAppVersion(
    appVersion: String,
    key: String = "revanced_spoof_app_version_target"
) {
    addEntryValues(
        "${key}_entries",
        "@string/${key}_entry_" + appVersion.replace(".", "_"),
        prepend = false
    )
    addEntryValues(
        "${key}_entry_values",
        appVersion,
        prepend = false
    )
}

fun ResourcePatchContext.addEntryValues(
    attributeName: String,
    attributeValue: String,
    path: String = "res/values/arrays.xml",
    prepend: Boolean = true,
) {
    document(path).use { document ->
        with(document) {
            val resourcesNode = documentElement
            val childNodes = resourcesNode.childNodes
            val newElement: Element = createElement("item")
            for (i in 0 until childNodes.length) {
                val node = childNodes.item(i) as? Element ?: continue

                if (node.getAttribute("name") == attributeName) {
                    newElement.appendChild(createTextNode(attributeValue))

                    if (prepend) {
                        node.appendChild(newElement)
                    } else {
                        node.insertBefore(newElement, node.firstChild)
                    }
                    break
                }
            }
        }
    }
}

fun ResourcePatchContext.copyFile(
    resourceGroup: List<ResourceGroup>,
    path: String,
    warning: String
): Boolean {
    resourceGroup.let { resourceGroups ->
        try {
            val filePath = File(path)
            val resourceDirectory = get("res")

            resourceGroups.forEach { group ->
                val fromDirectory = filePath.resolve(group.resourceDirectoryName)
                val toDirectory = resourceDirectory.resolve(group.resourceDirectoryName)

                group.resources.forEach { iconFileName ->
                    FilesCompat.copy(
                        fromDirectory.resolve(iconFileName),
                        toDirectory.resolve(iconFileName)
                    )
                }
            }

            return true
        } catch (_: Exception) {
            printWarn(warning)
        }
    }
    return false
}

fun ResourcePatchContext.removeOverlayBackground(
    files: Array<String>,
    targetId: Array<String>,
) {
    files.forEach { file ->
        val resourceDirectory = get("res")
        val targetXmlPath = resourceDirectory.resolve("layout").resolve(file)

        if (targetXmlPath.exists()) {
            targetId.forEach { identifier ->
                document("res/layout/$file").use { document ->
                    document.doRecursively {
                        arrayOf("height", "width").forEach replacement@{ replacement ->
                            if (it !is Element) return@replacement

                            if (it.attributes.getNamedItem("android:id")?.nodeValue?.endsWith(
                                    identifier
                                ) == true
                            ) {
                                it.getAttributeNode("android:layout_$replacement")
                                    ?.let { attribute ->
                                        attribute.textContent = "0.0dip"
                                    }
                            }
                        }
                    }
                }
            }
        }
    }
}

fun ResourcePatchContext.removeStringsElements(
    replacements: Array<String>
) {
    var languageList = emptyArray<String>()
    val resourceDirectory = get("res")
    val dir = resourceDirectory.listFiles()
    for (file in dir!!) {
        val path = file.name
        if (path.startsWith("values")) {
            val targetXml = resourceDirectory.resolve(path).resolve("strings.xml")
            if (targetXml.exists()) languageList += path
        }
    }
    removeStringsElements(languageList, replacements)
}

fun ResourcePatchContext.removeStringsElements(
    paths: Array<String>,
    replacements: Array<String>
) {
    paths.forEach { path ->
        val resourceDirectory = get("res")
        val targetXmlPath = resourceDirectory.resolve(path).resolve("strings.xml")

        if (targetXmlPath.exists()) {
            val targetXml = get("res/$path/strings.xml")

            replacements.forEach replacementsLoop@{ replacement ->
                targetXml.writeText(
                    targetXml.readText()
                        .replaceFirst(""" +<string name="$replacement".+""".toRegex(), "")
                )
            }
        }
    }
}

fun Node.insertNode(tagName: String, targetNode: Node, block: Element.() -> Unit) {
    val child = ownerDocument.createElement(tagName)
    child.block()
    parentNode.insertBefore(child, targetNode)
}

/**
 * Copy resources from the current class loader to the resource directory.
 *
 * @param sourceResourceDirectory The source resource directory name.
 * @param resources The resources to copy.
 */
fun ResourcePatchContext.copyResources(
    sourceResourceDirectory: String,
    vararg resources: ResourceGroup,
) {
    val resourceDirectory = get("res")

    for (resourceGroup in resources) {
        resourceGroup.resources.forEach { resource ->
            val resourceDirectoryName = resourceGroup.resourceDirectoryName
            val targetDirectory = resourceDirectory.resolve(resourceDirectoryName)
            if (!targetDirectory.isDirectory) targetDirectory.mkdirs()
            val resourceFile = "$resourceDirectoryName/$resource"
            inputStreamFromBundledResource(
                sourceResourceDirectory,
                resourceFile
            )?.let { inputStream ->
                FilesCompat.copy(
                    inputStream,
                    resourceDirectory.resolve(resourceFile),
                )
            }
        }
    }
}

/**
 * Copy resources from the current class loader to the resource directory with the option to rename.
 *
 * @param sourceResourceDirectory The source resource directory name.
 * @param resourceMap The map containing resource titles and their respective path data.
 */
fun ResourcePatchContext.copyResourcesWithRename(
    sourceResourceDirectory: String,
    resourceMap: Map<String, String>
) {
    val targetResourceDirectory = this["res"]

    for ((title, pathData) in resourceMap) {
        // Check if pathData is another title
        if (resourceMap.containsKey(pathData)) {
            continue // Skip copying if the pathData is another title
        }

        val resourceFile = "drawable/icon.xml"
        val inputStream = inputStreamFromBundledResource(sourceResourceDirectory, resourceFile)!!
        val targetFile = targetResourceDirectory.resolve("drawable/${title}_icon.xml").toPath()

        Files.copy(inputStream, targetFile, StandardCopyOption.REPLACE_EXISTING)

        // Update the XML with the new path data
        document(targetFile.toString()).use { document ->
            updatePathData(document, pathData)
        }
    }
}

/**
 * Generates each preference's own drawable so a mapped alias can override its shared RVX glyph.
 * Stock vectors are copied, not referenced: their theme tint must match the RVX template without
 * changing the original drawable used by native settings. Their viewport, paths and size stay intact.
 */
fun ResourcePatchContext.copyPreferenceIconsWithStockGlyphs(
    sourceResourceDirectory: String,
    resourceMap: Map<String, String>,
    stockIcons: Map<String, String>,
    iconKeys: Set<String>,
    resolveStockIconName: (String) -> String,
) {
    var mappedCount = 0
    val stockFamilyAvailable = get("res/drawable").listFiles()?.any {
        it.name.startsWith("yt_outline_experimental_") && it.name.endsWith("_vd_theme_24.xml")
    } == true

    if (!stockFamilyAvailable) {
        printWarn("YouTube icon style: this app has no experimental settings icons; using rounded RVX icons.")
    }

    resourceMap.filterKeys { it in iconKeys }.forEach { (key, value) ->
        var pathData = value
        val visited = mutableSetOf(key)

        while (pathData in resourceMap) {
            check(visited.add(pathData)) { "Cyclic preference icon mapping for $key" }
            pathData = resourceMap.getValue(pathData)
        }

        val stockName = stockIcons[key]
        val targetDrawable = "res/drawable/${key}_icon.xml"

        if (stockFamilyAvailable && stockName != null &&
            copyStockPreferenceIcon(stockName, targetDrawable, resolveStockIconName)
        ) {
            mappedCount++
        } else {
            inputStreamFromBundledResource(sourceResourceDirectory, "drawable/icon.xml")!!.use { input ->
                Files.copy(input, get(targetDrawable).toPath(), StandardCopyOption.REPLACE_EXISTING)
            }

            document(targetDrawable).use { updatePathData(it, pathData) }
            makeBold(targetDrawable)
            setStockPreferenceIconGeometry(targetDrawable)
            roundPreferenceIconStroke(targetDrawable)
        }
    }

    printInfo("YouTube icon style: $mappedCount mapped icons, ${iconKeys.size - mappedCount} rounded RVX fallbacks.")
}

/** Copy only existing stock glyphs; older apps retain the caller's fallback. */
fun ResourcePatchContext.copyStockPreferenceIcon(
    stockName: String,
    targetDrawable: String,
    resolveStockIconName: (String) -> String,
): Boolean {
    val drawableName = resolveStockIconName("yt_outline_experimental_${stockName}_vd_theme_24")
    val stockDrawable = get("res/drawable/$drawableName.xml")
    if (!stockDrawable.exists()) return false

    stockDrawable.copyTo(get(targetDrawable), overwrite = true)
    setPreferenceIconColor(targetDrawable)
    return true
}

/** Use the same theme attribute as RVX icons, rather than stock colorControlNormal's secondary tint. */
private fun ResourcePatchContext.setPreferenceIconColor(drawable: String) {
    document(drawable).use { document ->
        document.documentElement.removeAttribute("android:tint")

        document.getElementsByTagName("path").asSequence().filterIsInstance<Element>().forEach { path ->
            path.setAttribute("android:fillColor", "?attr/ytTextPrimary")
        }
    }
}

/** Only the YouTube style rounds the added stroke's caps; existing bold styles stay unchanged. */
private fun ResourcePatchContext.roundPreferenceIconStroke(drawable: String) {
    document(drawable).use { document ->
        document.getElementsByTagName("path").asSequence().filterIsInstance<Element>().forEach { path ->
            path.setAttribute("android:strokeLineCap", "round")
            path.setAttribute("android:strokeLineJoin", "round")
        }
    }
}

/**
 * Update the `android:pathData` attribute in the XML document.
 *
 * @param document The XML document.
 * @param pathData The new path data to set.
 */
fun updatePathData(document: org.w3c.dom.Document, pathData: String) {
    val elements = document.getElementsByTagName("path")
    for (i in 0 until elements.length) {
        val pathElement = elements.item(i) as? Element
        pathElement?.setAttribute("android:pathData", pathData)
    }
}

/**
 * Stroke width in viewport units (960 x 960) that thickens the outline icons.
 * The outlines are about 31 units wide, so this roughly doubles them
 * without closing the small gaps inside the icons.
 */
private const val BOLD_ICON_STROKE_WIDTH = "28"

/**
 * Thickens a vector drawable by stroking every path with its own fill color.
 * Does nothing if the drawable does not exist.
 *
 * @param drawable path of the drawable, relative to the decoded APK, e.g. `res/drawable/icon.xml`.
 */
fun ResourcePatchContext.makeBold(drawable: String) {
    if (!get(drawable).exists()) return
    document(drawable).use { document ->
        val paths = document.getElementsByTagName("path")
        for (i in 0 until paths.length) {
            (paths.item(i) as? Element)?.apply {
                setAttribute("android:strokeColor", getAttribute("android:fillColor"))
                setAttribute("android:strokeWidth", BOLD_ICON_STROKE_WIDTH)
                setAttribute("android:strokeLineJoin", "round")
            }
        }
    }
}

const val DEFAULT_PREFERENCE_ICON_SIZE_DP = 48
const val STOCK_PREFERENCE_ICON_SIZE_DP = 24
private const val STOCK_PREFERENCE_ICON_STROKE_WIDTH = "36"
private const val STOCK_PREFERENCE_ICON_SCALE = "1.04"

private const val STOCK_PREFERENCE_LAYOUT = "res/layout/revanced_preference_stock_icon.xml"

/**
 * RVX uses framework preferences, whose material icon frame reserves 60 dp even for a 24 dp icon.
 * Copy the app's material row without changing its AndroidX layouts or the other icon styles.
 */
fun ResourcePatchContext.installStockPreferenceIconLayout(
    paddingStartDp: Int,
    titleInsetDp: Int,
) {
    val rowPath = "res/layout/preference_material.xml"
    val framePath = "res/layout/image_frame.xml"
    if (!get(rowPath).exists() || !get(framePath).exists()) {
        printWarn("Stock icon spacing: material preference layout not found; keeping the current spacing.")
        return
    }

    document(rowPath).use { row ->
        val include = row.getElementsByTagName("include").asSequence()
            .filterIsInstance<Element>()
            .firstOrNull { it.getAttribute("layout") == "@layout/image_frame" }
        if (include == null) {
            printWarn("Stock icon spacing: material icon frame not found; keeping the current spacing.")
            return
        }

        document(framePath).use { frameDocument ->
            val image = frameDocument.getElementsByTagName("androidx.preference.internal.PreferenceImageView")
                .item(0) as? Element
            if (image == null) {
                printWarn("Stock icon spacing: preference image not found; keeping the current spacing.")
                return
            }

            get(rowPath).copyTo(get(STOCK_PREFERENCE_LAYOUT), overwrite = true)
        }
    }

    document(STOCK_PREFERENCE_LAYOUT).use { row ->
        val root = row.documentElement
        root.setAttribute("android:paddingLeft", "${paddingStartDp}dp")
        root.setAttribute("android:paddingStart", "${paddingStartDp}dp")
        root.setAttribute("android:minHeight", "54dp")

        val include = row.getElementsByTagName("include").item(0)
        document(framePath).use { frameDocument ->
            val frame = row.importNode(frameDocument.documentElement, true) as Element
            frame.setAttribute("android:id", "@android:id/icon_frame")
            frame.setAttribute("android:layout_width", "${titleInsetDp - paddingStartDp}dp")
            frame.setAttribute("android:minWidth", "${titleInsetDp - paddingStartDp}dp")
            frame.setAttribute("android:paddingRight", "0dp")
            frame.setAttribute("android:paddingEnd", "0dp")

            val oldImage = frame.getElementsByTagName("androidx.preference.internal.PreferenceImageView").item(0)
            val image = row.createElement("ImageView")
            image.setAttribute("android:id", "@android:id/icon")
            image.setAttribute("android:layout_width", "${STOCK_PREFERENCE_ICON_SIZE_DP}dp")
            image.setAttribute("android:layout_height", "${STOCK_PREFERENCE_ICON_SIZE_DP}dp")
            frame.replaceChild(image, oldImage)
            include.parentNode.replaceChild(frame, include)
        }
    }

    document("res/values/dimens.xml").use { document ->
        document.documentElement.appendChild(document.createElement("dimen").apply {
            setAttribute("name", "revanced_stock_preference_icon_size")
            textContent = "${STOCK_PREFERENCE_ICON_SIZE_DP}dp"
        })
    }
}

/** Apply only to icon-bearing RVX rows; preserve categories and purpose-built preference layouts. */
fun ResourcePatchContext.setStockPreferenceIconLayout(preference: Element) {
    if (!get(STOCK_PREFERENCE_LAYOUT).exists() ||
        preference.tagName.endsWith("PreferenceCategory") ||
        !preference.hasAttribute("android:icon") ||
        preference.hasAttribute("android:layout")
    ) return

    preference.setAttribute("android:layout", "@layout/revanced_preference_stock_icon")
}

/** Centers a larger, heavier glyph inside the native 24 dp slot, without Music's legacy left nudge. */
fun ResourcePatchContext.setStockPreferenceIconGeometry(drawable: String) {
    if (!get(drawable).exists()) return

    document(drawable).use { document ->
        val vector = document.documentElement
        vector.setAttribute("android:width", "${STOCK_PREFERENCE_ICON_SIZE_DP}dp")
        vector.setAttribute("android:height", "${STOCK_PREFERENCE_ICON_SIZE_DP}dp")

        val pivotX = vector.getAttribute("android:viewportWidth").toFloat() / 2
        val pivotY = vector.getAttribute("android:viewportHeight").toFloat() / 2

        val paths = document.getElementsByTagName("path").asSequence().filterIsInstance<Element>().toList()
        paths.filter { it.getAttribute("android:strokeWidth") == BOLD_ICON_STROKE_WIDTH }.forEach {
            it.setAttribute("android:strokeWidth", STOCK_PREFERENCE_ICON_STROKE_WIDTH)
        }
        val fittedScale = stockPreferenceIconScale(paths, pivotX, pivotY)
        val scale = fittedScale.coerceIn(1.0, STOCK_PREFERENCE_ICON_SCALE.toDouble())

        document.doRecursively { node ->
            if (node is Element && node.tagName == "group") {
                node.setAttribute("android:scaleX", scale.toString())
                node.setAttribute("android:scaleY", scale.toString())
                node.setAttribute("android:pivotX", pivotX.toString())
                node.setAttribute("android:pivotY", pivotY.toString())
            }
        }

        if (fittedScale < 1.0) {
            val artwork = vector.getElementsByTagName("group").item(0) as? Element ?: vector
            val fit = document.createElement("group").apply {
                setAttribute("android:scaleX", fittedScale.toString())
                setAttribute("android:scaleY", fittedScale.toString())
                setAttribute("android:pivotX", pivotX.toString())
                setAttribute("android:pivotY", pivotY.toString())
            }
            while (artwork.hasChildNodes()) fit.appendChild(artwork.firstChild)
            artwork.appendChild(fit)
        }
    }
}

/** Reserves one raster pixel at 400 dpi, including the painted stroke, around the fitted artwork. */
private fun stockPreferenceIconScale(paths: List<Element>, pivotX: Float, pivotY: Float): Double {
    var scale = STOCK_PREFERENCE_ICON_SCALE.toDouble()
    val insetX = pivotX / 30.0
    val insetY = pivotY / 30.0

    paths.forEach { path ->
        val fill = path.getAttribute("android:fillColor")
        val stroke = path.getAttribute("android:strokeColor")
        if ((fill.isEmpty() || fill == "#00000000") && (stroke.isEmpty() || stroke == "#00000000")) {
            return@forEach
        }

        val bounds = vectorPathBounds(path.getAttribute("android:pathData")) ?: return 1.0
        val padding = if (stroke.isEmpty() || stroke == "#00000000") {
            0.0
        } else {
            (path.getAttribute("android:strokeWidth").toDoubleOrNull() ?: 0.0) / 2
        }
        val extentX = maxOf(pivotX - bounds.left, bounds.right - pivotX) + padding
        val extentY = maxOf(pivotY - bounds.top, bounds.bottom - pivotY) + padding
        scale = minOf(scale, (pivotX - insetX) / extentX, (pivotY - insetY) / extentY)
    }

    return scale
}

/** Reports missing preference icons without turning coverage gaps into patch failures. */
fun ResourcePatchContext.warnMissingPreferenceIcons(vararg xmlFiles: String) {
    val missingKeys = linkedSetOf<String>()
    val ownedKeyPrefixes = arrayOf("revanced_", "morphe_", "sb_", "ryd_", "vot_", "gms_core_")

    xmlFiles.forEach { xmlFile ->
        if (!get(xmlFile).exists()) return@forEach

        document(xmlFile).use { document ->
            document.doRecursively loop@{ node ->
                if (node !is Element) return@loop

                if (node.tagName.endsWith("PreferenceCategory") ||
                    node.tagName.endsWith("PreferenceCategoryCompat")
                ) return@loop

                val key = node.getAttribute("android:key").removePrefix("@string/")
                if (key.isEmpty() || node.getAttribute("android:icon").isNotEmpty()) return@loop

                // Stock settings rows, including Music's developer headers, keep their existing behavior.
                if (ownedKeyPrefixes.none { key.startsWith(it) }) return@loop

                // Cairo binds its RVX entry icon through this layout instead of android:icon.
                if (key == "revanced_settings_key" &&
                    node.getAttribute("android:layout") == "@layout/revanced_preference_with_icon"
                ) return@loop

                missingKeys.add(key)
            }
        }
    }

    if (missingKeys.isEmpty()) return

    val maximumReportedKeys = 10
    val reportedKeys = missingKeys.take(maximumReportedKeys).joinToString(", ")
    val remainingCount = missingKeys.size - maximumReportedKeys
    val suffix = if (remainingCount > 0) ", ... and $remainingCount more" else ""

    printWarn("Visual preferences icons: ${missingKeys.size} preferences without an icon: $reportedKeys$suffix")
}

/**
 * Delete resources from the resource directory.
 *
 * @param resources The resources to delete.
 */
fun ResourcePatchContext.removeResources(
    vararg resources: ResourceGroup,
    createDirectoryIfNotExist: Boolean = false,
) {
    val resourceDirectory = get("res")

    for (resourceGroup in resources) {
        resourceGroup.resources.forEach { resource ->
            val resourceDirectoryName = resourceGroup.resourceDirectoryName
            if (createDirectoryIfNotExist) {
                val targetDirectory = resourceDirectory.resolve(resourceDirectoryName)
                if (!targetDirectory.isDirectory) Files.createDirectories(targetDirectory.toPath())
            }
            val resourceFile = "$resourceDirectoryName/$resource"
            val targetFile = resourceDirectory.resolve(resourceFile)
            if(targetFile.exists()) {
                Files.delete(targetFile.toPath())
            }
        }
    }
}

internal fun inputStreamFromBundledResourceOrThrow(
    sourceResourceDirectory: String,
    resourceFile: String,
) = classLoader.getResourceAsStream("$sourceResourceDirectory/$resourceFile")
    ?: throw PatchException("Could not find $resourceFile")

internal fun inputStreamFromBundledResource(
    sourceResourceDirectory: String,
    resourceFile: String,
): InputStream? = classLoader.getResourceAsStream("$sourceResourceDirectory/$resourceFile")

/**
 * Resource names mapped to their corresponding resource data.
 * @param resourceDirectoryName The name of the directory of the resource.
 * @param resources A list of resource names.
 */
class ResourceGroup(val resourceDirectoryName: String, vararg val resources: String)

/**
 * Copy resources from the current class loader to the resource directory.
 * @param resourceDirectory The directory of the resource.
 * @param targetResource The target resource.
 * @param elementTag The element to copy.
 */
fun ResourcePatchContext.copyXmlNode(
    resourceDirectory: String,
    targetResource: String,
    elementTag: String
) = inputStreamFromBundledResource(
    resourceDirectory,
    targetResource
)?.let { inputStream ->
    val outputPath = "res/$targetResource"
    if (get(outputPath).exists()) {
        // Copy nodes from the resources node to the real resource node
        elementTag.copyXmlNode(
            document(inputStream),
            document(outputPath),
        ).close()
    }
}

/**
 * Copies the specified node of the source [Document] to the target [Document].
 * @param source the source [Document].
 * @param target the target [Document]-
 * @return AutoCloseable that closes the [Document]s.
 */
fun String.copyXmlNode(
    source: Document,
    target: Document,
): AutoCloseable {
    val hostNodes = source.getElementsByTagName(this).item(0).childNodes

    val destinationNode = target.getElementsByTagName(this).item(0)

    for (index in 0 until hostNodes.length) {
        val node = hostNodes.item(index).cloneNode(true)
        target.adoptNode(node)
        destinationNode.appendChild(node)
    }

    return AutoCloseable {
        source.close()
        target.close()
    }
}

internal fun org.w3c.dom.Document.getNode(tagName: String) =
    this.getElementsByTagName(tagName).item(0)

internal fun NodeList.findElementByAttributeValue(attributeName: String, value: String): Element? {
    for (i in 0 until length) {
        val node = item(i)
        if (node.nodeType == Node.ELEMENT_NODE) {
            val element = node as Element

            if (element.getAttribute(attributeName) == value) {
                return element
            }

            // Recursively search.
            val found = element.childNodes.findElementByAttributeValue(attributeName, value)
            if (found != null) {
                return found
            }
        }
    }

    return null
}

internal fun NodeList.findElementByAttributeValueOrThrow(attributeName: String, value: String) =
    findElementByAttributeValue(attributeName, value)
        ?: throw PatchException("Could not find: $attributeName $value")
