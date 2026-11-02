package local.transit

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult

private const val ANDROID = "http://schemas.android.com/apk/res/android"
private val target = Compatibility(
    packageName = "jp.co.yahoo.android.apps.transit",
    name = "Yahoo!乗換案内",
    targets = listOf(AppTarget(version = "8.5.5", versionCode = 478, isExperimental = true))
)
private fun parse(file: File): Document {
    val xml = file.readText(Charsets.UTF_8)
    // Android's Harmony parser does not support the Xerces DOCTYPE feature.
    // Reject DTDs before parsing rather than requesting that unsupported feature.
    require(!xml.contains("<!DOCTYPE", ignoreCase = true)) { "DOCTYPE is not accepted: ${file.name}" }
    val builder = DocumentBuilderFactory.newInstance().apply {
        isNamespaceAware = true
    }.newDocumentBuilder()
    builder.setEntityResolver { _, _ -> throw org.xml.sax.SAXException("External entities are not accepted") }
    return builder.parse(org.xml.sax.InputSource(java.io.StringReader(xml)))
}
private fun write(doc: Document, file: File) {
    file.parentFile.mkdirs()
    TransformerFactory.newInstance().newTransformer().transform(DOMSource(doc), StreamResult(file))
}
private fun strings(doc: Document): List<Element> {
    val nodes = doc.getElementsByTagName("string")
    return (0 until nodes.length).map { nodes.item(it) as Element }
}

val hideAdLayoutsPatch = resourcePatch(
    name = "Hide selected ad layouts (experimental)",
    description = "Removes ads.",
    default = false
) {
    compatibleWith(target)
    execute {
        check(packageMetadata.packageName == "jp.co.yahoo.android.apps.transit" &&
            packageMetadata.versionName == "8.5.5" && packageMetadata.versionCode == "478")
        val layouts = listOf(
            "view_navi_search_top_ad", "view_navi_search_bottom_ad",
            "view_search_result_ad", "search_result_list_row_ad",
            "view_diainfo_bottom_ad", "view_diainfo_detail_ad",
            "view_my_page_ad", "view_station_ad_bottom",
            "view_reservation_ad", "view_ydn_infeed_002_full_width_image"
        )
        // Keep child IDs, classes and binding tags; removing them can break data binding.
        val pending = layouts.map { name ->
            val file = get("res/layout/$name.xml")
            check(file.isFile) { "Missing inspected layout: $name" }
            file to parse(file)
        }
        // This ad is embedded in the results fragment, not an ad-only layout.
        // Preserve its class/IDs for bindings; collapse its dedicated parent as well.
        val bottomFile = get("res/layout/fragment_search_result_list.xml")
        val bottomDoc = parse(bottomFile)
        val bottomNodes = bottomDoc.getElementsByTagName(
            "jp.co.yahoo.android.apps.transit.ad.SearchResultListBottomAdView"
        )
        check(bottomNodes.length == 1) { "Unexpected bottom-ad view count" }
        val bottomView = bottomNodes.item(0) as Element
        val bottomParent = bottomView.parentNode as? Element ?: error("Missing bottom-ad parent")
        check(bottomParent.tagName == "FrameLayout") { "Unexpected bottom-ad parent" }
        val parentChildren = (0 until bottomParent.childNodes.length)
            .map { bottomParent.childNodes.item(it) }.filterIsInstance<Element>()
        check(parentChildren.size == 1 && parentChildren.single() === bottomView) {
            "Bottom-ad parent also contains non-ad content"
        }
        listOf(bottomView, bottomParent).forEach { node ->
            node.setAttributeNS(ANDROID, "android:visibility", "gone")
            node.setAttributeNS(ANDROID, "android:layout_height", "0dp")
            node.setAttributeNS(ANDROID, "android:minHeight", "0dp")
        }
        write(bottomDoc, bottomFile)
        pending.forEach { (file, doc) ->
            doc.documentElement.setAttributeNS(ANDROID, "android:visibility", "gone")
            doc.documentElement.setAttributeNS(ANDROID, "android:layout_height", "0dp")
            write(doc, file)
        }
    }
}

private val languageResourcesPatch = resourcePatch {
    execute {
        check(packageMetadata.packageName == "jp.co.yahoo.android.apps.transit" &&
            packageMetadata.versionName == "8.5.5" && packageMetadata.versionCode == "478")
        val source = strings(parse(get("res/values/strings.xml"))).associateBy { it.getAttribute("name") }
        val translations = object {}.javaClass.getResourceAsStream("/transit/en.xml").use {
            checkNotNull(it) { "Missing English translations" }
            strings(DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(it))
        }
        translations.forEach {
            val key = it.getAttribute("name")
            check(source[key]?.textContent?.replace("\\n", "\n") == it.getAttribute("source")) {
                "English source mismatch: $key"
            }
        }
        val file = get("res/values-en/strings.xml", copy = false)
        val doc = if (file.isFile) parse(file) else
            DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument().apply {
                appendChild(createElement("resources"))
            }
        val names = translations.map { it.getAttribute("name") }.toSet()
        strings(doc).filter { it.getAttribute("name") in names }.forEach { it.parentNode.removeChild(it) }
        translations.forEach {
            val node = doc.importNode(it, true) as Element
            node.removeAttribute("source")
            doc.documentElement.appendChild(node)
        }
        write(doc, file)

        // English-only header: reserve the previous/next button widths and fit text inside.
        val header = parse(get("res/layout/view_pre_next_header.xml"))
        val headerViews = header.getElementsByTagName("*")
        val headerElements = (0 until headerViews.length).map { headerViews.item(it) as Element }
        fun headerView(id: String) = headerElements.single {
            it.getAttributeNS(ANDROID, "id") == "@id/$id"
        }
        headerView("result_list_condition").apply {
            setAttributeNS(ANDROID, "android:layout_width", "match_parent")
            setAttributeNS(ANDROID, "android:layout_marginStart", "84dp")
            setAttributeNS(ANDROID, "android:layout_marginEnd", "84dp")
        }
        listOf("time_label" to (12 to 20), "date_label" to (10 to 14)).forEach { (id, sizes) ->
            headerView(id).apply {
                setAttributeNS(ANDROID, "android:layout_width", "match_parent")
                setAttributeNS(ANDROID, "android:maxLines", "1")
                setAttributeNS(ANDROID, "android:ellipsize", "end")
                setAttributeNS(ANDROID, "android:autoSizeTextType", "uniform")
                setAttributeNS(ANDROID, "android:autoSizeMinTextSize", "${sizes.first}sp")
                setAttributeNS(ANDROID, "android:autoSizeMaxTextSize", "${sizes.second}sp")
                setAttributeNS(ANDROID, "android:autoSizeStepGranularity", "1sp")
            }
        }
        write(header, get("res/layout-en/view_pre_next_header.xml", copy = false))

        // Add an unbound row without changing existing data-binding IDs or tags.
        val settingsFile = get("res/layout/activity_setting.xml")
        val settings = parse(settingsFile)
        val scrolls = settings.getElementsByTagName("ScrollView")
        check(scrolls.length == 1) { "Unexpected settings layout" }
        val scroll = scrolls.item(0) as Element
        val content = (0 until scroll.childNodes.length).map { scroll.childNodes.item(it) }
            .filterIsInstance<Element>().single()
        check(content.tagName == "LinearLayout")
        val row = settings.createElement("TextView")
        mapOf(
            "tag" to "transit_language_picker", "layout_width" to "match_parent",
            "layout_height" to "wrap_content", "minHeight" to "56dp",
            "gravity" to "center_vertical", "paddingStart" to "16dp", "paddingEnd" to "16dp",
            "paddingTop" to "12dp", "paddingBottom" to "12dp", "textSize" to "16sp",
            "textColor" to "?android:attr/textColorPrimary",
            "background" to "?android:attr/selectableItemBackground", "clickable" to "true",
            "focusable" to "true", "text" to "Language / 言語"
        ).forEach { (name, value) -> row.setAttributeNS(ANDROID, "android:$name", value) }
        content.insertBefore(row, content.firstChild)
        write(settings, settingsFile)

        // Keep original ImageView types/IDs for data binding and sign-in state logic.
        // Only the English layout hides the baked Japanese artwork.
        val promoNodes = settings.getElementsByTagName("ImageView")
        val promo = (0 until promoNodes.length).map { promoNodes.item(it) as Element }.single {
            it.getAttributeNS(ANDROID, "id") == "@id/login_promo"
        }
        promo.setAttributeNS(ANDROID, "android:visibility", "gone")
        promo.setAttributeNS(ANDROID, "android:layout_height", "0dp")
        val panelDoc = object {}.javaClass.getResourceAsStream("/transit/login_panel_en.xml").use {
            checkNotNull(it) { "Missing English sign-in panel" }
            DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
                .newDocumentBuilder().parse(it)
        }
        // Same login-only parent as the original artwork, so signing in hides both.
        promo.parentNode.insertBefore(settings.importNode(panelDoc.documentElement, true), promo.nextSibling)
        write(settings, get("res/layout-en/activity_setting.xml", copy = false))
        listOf("transit_lang_delay", "transit_lang_pass", "transit_lang_stops").forEach { name ->
            val iconFile = get("res/drawable/$name.xml", copy = false)
            iconFile.parentFile.mkdirs()
            object {}.javaClass.getResourceAsStream("/transit/icons/$name.xml").use {
                checkNotNull(it) { "Missing sign-in icon: $name" }
                iconFile.outputStream().use { output -> it.copyTo(output) }
            }
        }

        val config = get("res/xml/transit_locales.xml", copy = false)
        config.parentFile.mkdirs()
        config.writeText("""
            <locale-config xmlns:android="http://schemas.android.com/apk/res/android">
                <locale android:name="ja"/><locale android:name="en"/>
            </locale-config>
        """.trimIndent())
        val manifestFile = get("AndroidManifest.xml")
        val manifest = parse(manifestFile)
        (manifest.getElementsByTagName("application").item(0) as Element)
            .setAttributeNS(ANDROID, "android:localeConfig", "@xml/transit_locales")
        val appNode = manifest.getElementsByTagName("application").item(0) as Element
        appNode.appendChild(manifest.createElement("activity").apply {
            setAttributeNS(ANDROID, "android:name", "local.transit.extension.RestartActivity")
            setAttributeNS(ANDROID, "android:exported", "false")
            setAttributeNS(ANDROID, "android:process", ":transit_restart")
            setAttributeNS(ANDROID, "android:taskAffinity", "jp.co.yahoo.android.apps.transit.transit_restart")
            setAttributeNS(ANDROID, "android:excludeFromRecents", "true")
            setAttributeNS(ANDROID, "android:configChanges", "locale|layoutDirection")
            setAttributeNS(ANDROID, "android:theme", "@android:style/Theme.Material.Light.NoActionBar")
        })
        write(manifest, manifestFile)

        val resourceClass = object {}.javaClass
        val arraysFile = get("res/values-en/arrays.xml", copy = false)
        resourceClass.getResourceAsStream("/transit/arrays_en.xml").use { stream ->
            checkNotNull(stream)
            arraysFile.parentFile.mkdirs()
            arraysFile.outputStream().use { stream.copyTo(it) }
        }
        val literalIndex = resourceClass.getResourceAsStream("/transit/literal_layouts_en.xml").use {
            checkNotNull(it)
            DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(it)
        }.getElementsByTagName("layout")
        for (i in 0 until literalIndex.length) {
            val entry = literalIndex.item(i) as Element
            val output = get(entry.getAttribute("target"), copy = false)
            val layoutDoc = parse(if (output.isFile) output else get(entry.getAttribute("source")))
            val elements = layoutDoc.getElementsByTagName("*")
            val rules = entry.getElementsByTagName("replacement")
            for (j in 0 until rules.length) {
                val rule = rules.item(j) as Element
                var replaced = 0
                for (k in 0 until elements.length) {
                    val el = elements.item(k) as Element
                    val attribute = rule.getAttribute("attribute")
                    if (el.getAttributeNS(ANDROID, attribute) == rule.getAttribute("source")) {
                        el.setAttributeNS(ANDROID, "android:$attribute", rule.textContent)
                        replaced++
                    }
                }
                check(replaced > 0) { "Literal source mismatch: ${entry.getAttribute("source")}" }
            }
            write(layoutDoc, output)
        }

        // Explicit aliases avoid cached or fixed-configuration Japanese image lookups.
        val graphicNames = resourceClass.getResourceAsStream("/transit/graphic-remap.txt")!!.bufferedReader().readLines().toSet()
        resourceClass.getResourceAsStream("/transit/preserved-index.txt")!!.bufferedReader().readLines().forEach { path ->
            val output = get("res/$path", copy = false)
            output.parentFile.mkdirs()
            resourceClass.getResourceAsStream("/transit/raster-artwork/$path")!!.use { input -> output.outputStream().use { input.copyTo(it) } }
        }
        val resourceRoot = get("res/values/strings.xml").parentFile.parentFile
        resourceRoot.listFiles()!!.filter { it.isDirectory && (it.name == "layout" || (it.name.startsWith("layout-") && !it.name.startsWith("layout-en"))) }.forEach { folder ->
            folder.listFiles()!!.filter { it.extension == "xml" }.forEach { source ->
                val qualifier = folder.name.replaceFirst("layout", "layout-en")
                val output = get("res/$qualifier/${source.name}", copy = false)
                val existing = if (output.isFile) output else source
                val before = existing.readText()
                val after = Regex("@drawable/([a-z0-9_]+)").replace(before) { match ->
                    if (match.groupValues[1] in graphicNames) "@drawable/transit_en_${match.groupValues[1]}" else match.value
                }
                if (after != before) { output.parentFile.mkdirs(); output.writeText(after) }
            }
        }
    }
}

val appLanguagePatch = bytecodePatch(
    name = "App language selector + English UI (experimental)",
    description = "English UI with preserved original icon artwork and localized help illustrations. Line/station names remain Japanese. Android 13+.",
    default = false
) {
    compatibleWith(Compatibility(
        packageName = "jp.co.yahoo.android.apps.transit", name = "Yahoo!乗換案内",
        targets = listOf(AppTarget(version = "8.5.5", versionCode = 478, isExperimental = true, minSdk = 33))
    ))
    dependsOn(languageResourcesPatch)
    extendWith("extensions/extension.mpe")
    execute {
        check(packageMetadata.packageName == "jp.co.yahoo.android.apps.transit" &&
            packageMetadata.versionName == "8.5.5" && packageMetadata.versionCode == "478")
        val activity = mutableClassDefBy("Ljp/co/yahoo/android/apps/transit/ui/activity/setting/SettingActivity;")
        val method = activity.methods.single {
            it.name == "onCreate" && it.parameterTypes == listOf("Landroid/os/Bundle;") && it.returnType == "V"
        }
        val instructions = checkNotNull(method.implementation).instructions
        val returns = instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
        check(returns.isNotEmpty())
        returns.asReversed().forEach { index ->
            method.addInstructions(index,
                "invoke-static/range {p0 .. p0}, Llocal/transit/extension/LanguageSettings;->install(Landroid/app/Activity;)V")
        }
        val materialTextClasses = mutableListOf<String>()
        classDefForEach { cls ->
            if (cls.type in setOf("Landroidx/compose/material/TextKt;", "Landroidx/compose/material3/TextKt;")) materialTextClasses += cls.type
        }
        check(materialTextClasses.isNotEmpty()) { "Compose Material Text entry points not found" }
        materialTextClasses.forEach { type ->
            mutableClassDefBy(type).methods.filter { it.name.startsWith("Text") &&
                it.parameterTypes.firstOrNull() == "Ljava/lang/String;" && it.implementation != null && (it.accessFlags and 8) != 0
            }.forEach { method ->
                method.addInstructions(0, "invoke-static/range {p0 .. p0}, Llocal/transit/extension/RuntimeText;->localizeUiText(Ljava/lang/String;)Ljava/lang/String;\nmove-result-object p0")
            }
        }
        val application = mutableClassDefBy("Ljp/co/yahoo/android/apps/transit/TransitApplication;")
        val startup = application.methods.single {
            it.name == "onCreate" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        checkNotNull(startup.implementation).instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.asReversed().forEach { index ->
                startup.addInstructions(index,
                    "invoke-static/range {p0 .. p0}, Llocal/transit/extension/RuntimeText;->register(Landroid/app/Application;)V")
            }

        // The isolated coordinator must not run Yahoo's main-process initialization.
        check(checkNotNull(startup.implementation).registerCount > 1)
        startup.addInstructions(0, """
            invoke-static {}, Llocal/transit/extension/RestartActivity;->isRestartProcess()Z
            move-result v0
            if-eqz v0, :transit_normal_startup
            return-void
            :transit_normal_startup
            nop
        """.trimIndent())

        val translatedDrawableIds = setOf(0x7f08007a,0x7f08007b,0x7f0800d7,0x7f0800d8,0x7f0800d9,0x7f0800da,0x7f0800db,0x7f0800dc,0x7f0800dd,0x7f0800de,0x7f0800df,0x7f0800e0,0x7f0800e1,0x7f0800e2,0x7f0800e3,0x7f0800e4,0x7f080134,0x7f080140,0x7f080142,0x7f080143,0x7f08019e,0x7f08019f,0x7f0801a5,0x7f0801a9,0x7f0801aa,0x7f0801ab,0x7f0801ac,0x7f0801ad,0x7f0801ae,0x7f0801af,0x7f0801b0,0x7f0801b1,0x7f0801b2,0x7f0801b3,0x7f0801b4,0x7f0801b5,0x7f0801b6,0x7f0801b7,0x7f0801b8,0x7f0801b9,0x7f0801ba,0x7f0801bd,0x7f0801be,0x7f0801cb,0x7f0801ce,0x7f0801cf,0x7f08028f,0x7f0802c8,0x7f0802ce,0x7f0802cf,0x7f0802d0,0x7f0802d1,0x7f0802d2,0x7f0802f4,0x7f080357,0x7f080392,0x7f080393,0x7f080394,0x7f080395,0x7f080396,0x7f080397,0x7f080398,0x7f080399,0x7f08039a,0x7f08039b,0x7f08039c,0x7f08039d,0x7f08039e,0x7f08039f,0x7f0803a0,0x7f0803a1,0x7f0803a2,0x7f0803a3,0x7f0803bf,0x7f0803c0,0x7f0803c1,0x7f0803c2,0x7f0803c3,0x7f0803c4,0x7f0803cd,0x7f080437,0x7f08043a,0x7f08043b,0x7f08043c,0x7f08044e,0x7f08052a,0x7f08052b,0x7f08052c,0x7f08052f,0x7f080530,0x7f080531,0x7f08054b,0x7f08054c,0x7f08054d,0x7f08054e,0x7f080550,0x7f080551,0x7f08056c,0x7f08056d,0x7f08056e,0x7f08056f,0x7f080570,0x7f080571,0x7f080572)
        val imageClasses = mutableListOf<String>()
        classDefForEach { cls ->
            if (cls.methods.any { m ->
                m.implementation?.instructions?.any { it is NarrowLiteralInstruction && it.narrowLiteral in translatedDrawableIds } == true
            }) imageClasses += cls.type
        }
        imageClasses.forEach { type ->
            mutableClassDefBy(type).methods.forEach methodLoop@ { m ->
                val instructions = m.implementation?.instructions ?: return@methodLoop
                instructions.withIndex().filter { it.value is NarrowLiteralInstruction && (it.value as NarrowLiteralInstruction).narrowLiteral in translatedDrawableIds }
                    .map { it.index to (it.value as OneRegisterInstruction).registerA }.asReversed().forEach { (index, register) ->
                        m.addInstructions(index + 1, "invoke-static/range {v$register .. v$register}, Llocal/transit/extension/GraphicsCompat;->localizedId(I)I\nmove-result v$register")
                    }
            }
        }

        // Original app code sometimes requests bitmaps directly for notification art.
        // Keep those consumers compatible with localized vector graphics.
        val bitmapClasses = mutableListOf<String>()
        classDefForEach { cls ->
            if (cls.methods.any { method ->
                method.implementation?.instructions?.any { instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == "Landroid/graphics/BitmapFactory;" && ref.name == "decodeResource" &&
                        ref.parameterTypes == listOf("Landroid/content/res/Resources;", "I")
                } == true
            }) bitmapClasses += cls.type
        }
        bitmapClasses.forEach { type ->
            mutableClassDefBy(type).methods.forEach methodLoop@ { method ->
                val ins = method.implementation?.instructions ?: return@methodLoop
                ins.withIndex().toList().forEach { (index, instruction) ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    if (ref?.definingClass == "Landroid/graphics/BitmapFactory;" && ref.name == "decodeResource" &&
                        ref.parameterTypes == listOf("Landroid/content/res/Resources;", "I")) {
                        val target = "Llocal/transit/extension/GraphicsCompat;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;"
                        val replacement = when (instruction) {
                            is RegisterRangeInstruction -> "invoke-static/range {v${instruction.startRegister} .. v${instruction.startRegister + 1}}, $target"
                            is FiveRegisterInstruction -> "invoke-static {v${instruction.registerC}, v${instruction.registerD}}, $target"
                            else -> error("Unexpected bitmap instruction encoding")
                        }
                        method.replaceInstruction(index, replacement)
                    }
                }
            }
        }
    }
}
