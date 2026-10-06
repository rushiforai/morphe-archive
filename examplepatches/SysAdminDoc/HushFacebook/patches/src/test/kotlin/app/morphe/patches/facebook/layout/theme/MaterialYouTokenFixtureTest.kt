/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.Fixtures
import app.morphe.RepoFiles
import app.morphe.patches.facebook.layout.theme.tokenAttributes as patchTokenAttributes
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.reandroid.arsc.chunk.TableBlock
import com.reandroid.arsc.model.ResourceEntry
import com.reandroid.arsc.value.Entry
import com.reandroid.arsc.value.ResConfig
import com.reandroid.arsc.value.ResTableMapEntry
import com.reandroid.arsc.value.ValueItem
import com.reandroid.arsc.value.ValueType
import java.io.File
import java.io.StringWriter
import java.util.zip.ZipFile
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * The colours the Material You theme recolours, held to the Facebook builds it declares.
 *
 * <p>MaterialYouTheme.FDS_DARK lists FDS colour tokens with the colour Facebook's dark theme gives
 * each, and the theme recolours a token only when it arrives with exactly that colour. This reads
 * both fixtures: the token enum `FDSColors` resolves (its names and theme attributes, from its
 * static initializer) and the FDS styles in the resource table that set those attributes. Every
 * listed colour has to be one the dark or darker style gives that token, and none may be one any
 * light style gives it, or light mode would change. FDS_SHARED lists the blues a token has in both
 * themes, which wait for Facebook's dark mode answer instead, so each of those has to be the light
 * and the dark style's colour alike. SURFACES, which route three and route four recolour with no
 * token to go on, may be no light style's colour for any token at all.
 *
 * <p>The AMOLED theme's token rule is held to the same styles: each background token it names gets
 * a dark grey it changes.
 */
class MaterialYouTokenFixtureTest {
    private companion object {
        /**
         * The FDS tokens 577 and 580 resolve and read as `TypedValue.data`: straight from a literal, off a
         * token constant, or through a helper handed the attribute or a token constant as a parameter.
         */
        val DATA_READ_TOKENS = setOf("ACCENT", "DISABLED_TEXT", "DIVIDER", "NAV_BAR_BACKGROUND", "PLACEHOLDER_IMAGE",
            "PRIMARY_TEXT", "PRIMARY_TEXT_ON_MEDIA", "SURFACE_BACKGROUND", "WASH")

        /**
         * The tokens 577 and 580 resolve in a method that reads `TypedValue.type` for only some of its
         * calls, or reads neither field and hands the value on. Each was looked at: PRIMARY_TEXT and
         * SURFACE_BACKGROUND are in [DATA_READ_TOKENS] anyway, and SHADOW_TEXT_AND_ICON_ON_MEDIA goes
         * through a helper that returns the TypedValue to a caller reading its `resourceId`.
         */
        val UNCHECKED_TOKENS = setOf("PRIMARY_TEXT", "SHADOW_TEXT_AND_ICON_ON_MEDIA", "SURFACE_BACKGROUND")

        /**
         * The calls whose attribute the scan can't follow, by build. React Native's
         * PlatformColor (`A02`, called from FabricUIManager.getColor) looks an attribute up by the name
         * the JavaScript gives it, and Mapbox's ColorUtils looks up colorAccent, colorPrimary and
         * colorPrimaryDark, which aren't FDS tokens. The JavaScript ships compressed, so PlatformColor's
         * names were logged on 580 instead (2026-09-30): Marketplace home, a listing, search and its
         * results asked it for none, since React Native's colours there arrive as ints.
         *
         * The rest are in methods that check `type` for only some calls or hand the TypedValue on, and
         * none is an FDS token (looked at on 580, 2026-09-30): `A2O.A0Q` and `FVu.A00` read only
         * `resourceId`; `fA7.Eu1` passes attributes it keeps in fields to `gi9.A00`, which reads a
         * dimension; `g4w.A05`, `g7C`'s constructor and `g7C.A0Z` read `gAp.errorColorAttr`, a text
         * input's border states, whose four attributes (0x7f040456, 0x7f040459, 0x7f040448, 0x7f040458)
         * the token enum doesn't hold; and `fFB.D8G`'s text colours come from builder fields that
         * `g60.A0V`, `g65.A01` and `hk8.invoke` only ever set to 0x7f040458, its third call an image
         * resource through `giD.A01`. 577 has the same code under other names (8Qk, iv6, PHA, PJ4,
         * QPv, QS3), and `kWD.A1B` is Mapbox's and MapLibre's ColorUtils lookup by name, kept in one
         * helper there. 581 has the same 18 calls under other names (looked at 2026-10-02): `Cuj.A02`,
         * `FMh.A00`, `c0D.A0K`, `emC.EwX` (whose six calls ask `gZV.A00`, a dimension read like
         * `gi9.A00`), `epS.DA9`, `fjh.A04`, `fmc`'s constructor and `fmc.A0f`, and Mapbox's three.
         */
        val UNRESOLVED = mapOf(
            "577.0.0.50.72" to setOf(
                "LX/8Qk;->A0Q(Ljava/lang/Integer;)V@16",
                "LX/CHJ;->A02(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Integer;@88",
                "LX/PHA;->Eqj(LX/RDk;)V@135",
                "LX/PHA;->Eqj(LX/RDk;)V@146",
                "LX/PHA;->Eqj(LX/RDk;)V@47",
                "LX/PHA;->Eqj(LX/RDk;)V@57",
                "LX/PHA;->Eqj(LX/RDk;)V@67",
                "LX/PHA;->Eqj(LX/RDk;)V@71",
                "LX/PJ4;->D7V(LX/hQW;I)V@168",
                "LX/PJ4;->D7V(LX/hQW;I)V@224",
                "LX/PJ4;->D7V(LX/hQW;I)V@32",
                "LX/QPv;->A04(LX/QPv;LX/QUd;)V@9",
                "LX/QS3;-><init>(Landroid/content/Context;)V@114",
                "LX/QS3;->A0f()V@35",
                "LX/iv6;->A00(Landroid/content/Context;Lcom/facebook/react/bridge/ReadableMap;)Landroid/graphics/drawable/Drawable;@20",
                "LX/kWD;->A1B(Landroid/content/Context;Landroid/content/res/Resources\$Theme;Landroid/content/res/Resources;Landroid/util/TypedValue;Ljava/lang/String;)V@6",
            ),
            "580.0.0.51.74" to setOf(
                "LX/A2O;->A0Q(Ljava/lang/Integer;)V@16",
                "LX/FVu;->A00(Landroid/content/Context;Lcom/facebook/react/bridge/ReadableMap;)Landroid/graphics/drawable/Drawable;@20",
                "LX/fA7;->Eu1(LX/grb;)V@131",
                "LX/fA7;->Eu1(LX/grb;)V@142",
                "LX/fA7;->Eu1(LX/grb;)V@43",
                "LX/fA7;->Eu1(LX/grb;)V@53",
                "LX/fA7;->Eu1(LX/grb;)V@63",
                "LX/fA7;->Eu1(LX/grb;)V@67",
                "LX/fFB;->D8G(LX/ewK;I)V@170",
                "LX/fFB;->D8G(LX/ewK;I)V@226",
                "LX/fFB;->D8G(LX/ewK;I)V@33",
                "LX/g4w;->A05(LX/g4w;LX/gAp;)V@11",
                "LX/g7C;-><init>(Landroid/content/Context;)V@114",
                "LX/g7C;->A0Z()V@36",
                "LX/Cyv;->A02(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Integer;@88",
                "Lcom/mapbox/mapboxsdk/utils/ColorUtils;->getAccentColor(Landroid/content/Context;)I@13",
                "Lcom/mapbox/mapboxsdk/utils/ColorUtils;->getPrimaryColor(Landroid/content/Context;)I@13",
                "Lcom/mapbox/mapboxsdk/utils/ColorUtils;->getPrimaryDarkColor(Landroid/content/Context;)I@13",
            ),
            "581.0.0.45.58" to setOf(
                "LX/Cuj;->A02(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Integer;@88",
                "LX/FMh;->A00(Landroid/content/Context;Lcom/facebook/react/bridge/ReadableMap;)Landroid/graphics/drawable/Drawable;@20",
                "LX/c0D;->A0K(Ljava/lang/Integer;)V@16",
                "LX/emC;->EwX(LX/gmM;)V@151",
                "LX/emC;->EwX(LX/gmM;)V@165",
                "LX/emC;->EwX(LX/gmM;)V@50",
                "LX/emC;->EwX(LX/gmM;)V@63",
                "LX/emC;->EwX(LX/gmM;)V@75",
                "LX/emC;->EwX(LX/gmM;)V@78",
                "LX/epS;->DA9(LX/l99;I)V@168",
                "LX/epS;->DA9(LX/l99;I)V@224",
                "LX/epS;->DA9(LX/l99;I)V@32",
                "LX/fjh;->A04(LX/fjh;LX/fs6;)V@9",
                "LX/fmc;-><init>(Landroid/content/Context;)V@111",
                "LX/fmc;->A0f()V@35",
                "Lcom/mapbox/mapboxsdk/utils/ColorUtils;->getAccentColor(Landroid/content/Context;)I@13",
                "Lcom/mapbox/mapboxsdk/utils/ColorUtils;->getPrimaryColor(Landroid/content/Context;)I@13",
                "Lcom/mapbox/mapboxsdk/utils/ColorUtils;->getPrimaryDarkColor(Landroid/content/Context;)I@13",
            ),
        )
    }

    private val theme = File(RepoFiles.root,
        "extensions/facebook/src/main/java/app/morphe/extension/facebook/theme/MaterialYouTheme.java").readText()

    private val amoled = File(RepoFiles.root,
        "extensions/facebook/src/main/java/app/morphe/extension/facebook/theme/AmoledTheme.java").readText()

    /**
     * Token name to the colours the theme recolours, from one of the Java tables. Six hex digits are
     * opaque and eight carry their alpha, as MaterialYouTheme.parseTokens reads them.
     */
    private fun listedTokens(constant: String = "FDS_DARK"): Map<String, Set<Int>> {
        val start = theme.indexOf("static final String $constant =")
        check(start >= 0) { "MaterialYouTheme declares no $constant" }
        val end = theme.indexOf("\";", start)
        val table = Regex(""""([^"]*)"""").findAll(theme.substring(start, end + 1)).joinToString("") { it.groupValues[1] }
        return table.split(";").associate { entry ->
            val (name, values) = entry.split("=")
            name to values.split(",").map { if (it.length == 8) it.toLong(16).toInt() else it.toInt(16) or -0x1000000 }.toSet()
        }
    }

    private fun listedSurfaces(): Set<Int> =
        Regex("""static final String SURFACES = "([0-9A-F ]+)";""").find(theme)!!.groupValues[1]
            .split(" ").map { it.toInt(16) or -0x1000000 }.toSet()

    @Test
    fun `every recoloured token and surface is dark-only in each declared build`() {
        val listed = listedTokens()
        assertTrue("the table lists almost nothing", listed.size > 50)
        val surfaces = listedSurfaces()
        var builds = 0
        for (target in AppCompatibilities.facebook().single().targets) {
            val version = checkNotNull(target.version)
            for (fixture in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                withBaseApk(fixture) { apk -> checkBuild(fixture.name, apk, listed, surfaces) }
                builds++
            }
        }
        assertEquals("one fixture for each declared build", declaredBuilds(), builds)
    }

    private fun checkBuild(build: String, apk: File, listed: Map<String, Set<Int>>, surfaces: Set<Int>) {
        val attributes = tokenAttributes(apk)
        assertTrue("$build: the token enum has too few constants", attributes.size > 300)
        val styles = fdsStyles(apk, attributes.values.toSet())

        // The light theme sets every token and has no parent; dark is its child that sets them all
        // again, and darker is dark's child.
        val light = styles.values.single { it.parent == 0 && it.sets > 300 }
        val dark = styles.values.single { it.parent == light.id && it.sets > 300 }
        val darker = styles.values.single { it.parent == dark.id }
        val lightSide = styles.values.filter { it.id != dark.id && it.id != darker.id }

        for ((name, colours) in listed) {
            val attribute = attributes[name] ?: error("$build: no FDS token $name")
            val darkColours = setOfNotNull(dark.values[attribute], darker.values[attribute])
            assertTrue("$build: $name is listed with ${hex(colours)}, dark gives ${hex(darkColours)}",
                darkColours.containsAll(colours))
            for (style in lightSide) {
                val lightColour = style.values[attribute] ?: continue
                assertTrue("$build: style ${Integer.toHexString(style.id)} gives $name the listed ${hex(setOf(lightColour))}",
                    lightColour !in colours)
            }
        }

        val lightColours = lightSide.flatMap { it.values.values }.toSet()
        for (surface in surfaces) {
            assertTrue("$build: ${hex(setOf(surface))} is a light style's colour", surface !in lightColours)
        }
    }

    /**
     * Issue #37: FDS_SHARED lists the blues Facebook gives a token in both themes, which only
     * Facebook's dark mode answer can tell apart. Each listed colour has to be the one the light
     * style gives that token and the one the dark style gives it too, and no colour of a token may
     * be in both tables, or a shared blue would skip that answer.
     */
    @Test
    fun `every shared blue is the token's colour in both themes in each declared build`() {
        val shared = listedTokens("FDS_SHARED")
        assertTrue("the shared table lists almost nothing", shared.size >= 10)
        val dark = listedTokens()
        for ((name, colours) in shared) {
            val twice = colours intersect dark[name].orEmpty()
            assertTrue("$name lists ${hex(twice)} in both tables", twice.isEmpty())
        }
        var builds = 0
        for (target in AppCompatibilities.facebook().single().targets) {
            val version = checkNotNull(target.version)
            for (fixture in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                withBaseApk(fixture) { apk ->
                    val attributes = tokenAttributes(apk)
                    val styles = fdsStyles(apk, attributes.values.toSet())
                    val light = styles.values.single { it.parent == 0 && it.sets > 300 }
                    val darkStyle = styles.values.single { it.parent == light.id && it.sets > 300 }
                    for ((name, colours) in shared) {
                        val attribute = attributes[name] ?: error("${fixture.name}: no FDS token $name")
                        for (colour in colours) {
                            assertEquals("${fixture.name}: $name in the light style", colour, light.values[attribute])
                            assertEquals("${fixture.name}: $name in the dark style", colour, darkStyle.values[attribute])
                        }
                    }
                }
                builds++
            }
        }
        assertEquals("one fixture for each declared build", declaredBuilds(), builds)
    }

    /**
     * Issue #37: SERVER_BLUES, which routes two and four recolour with no token to go on, are
     * Facebook's own palette and nobody else's: each is a colour one of the FDS styles gives some
     * token, at some alpha.
     */
    @Test
    fun `every server blue is a colour Facebook's styles give a token in each declared build`() {
        val blues = Regex("""static final String SERVER_BLUES = "([0-9A-F ]+)";""").find(theme)!!.groupValues[1]
            .split(" ").map { it.toInt(16) }
        assertTrue("SERVER_BLUES lists almost nothing", blues.size >= 5)
        var builds = 0
        for (target in AppCompatibilities.facebook().single().targets) {
            val version = checkNotNull(target.version)
            for (fixture in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                withBaseApk(fixture) { apk ->
                    val attributes = tokenAttributes(apk)
                    val rgb = fdsStyles(apk, attributes.values.toSet()).values
                        .flatMap { it.values.values }.map { it and 0xFFFFFF }.toSet()
                    for (blue in blues) {
                        assertTrue("${fixture.name}: ${"%06X".format(blue)} is no FDS style's colour", blue in rgb)
                    }
                }
                builds++
            }
        }
        assertEquals("one fixture for each declared build", declaredBuilds(), builds)
    }

    /** AmoledTheme's BACKGROUND_TOKENS, the Mig names in it included. */
    private fun amoledBackgrounds(): Set<String> {
        val start = amoled.indexOf("BACKGROUND_TOKENS =")
        val end = amoled.indexOf(")));", start)
        return Regex(""""([A-Z_]+)"""").findAll(amoled.substring(start, end)).map { it.groupValues[1] }.toSet()
    }

    private fun amoledChannel(name: String): Int =
        Regex("""static final int $name = 0x([0-9A-F]+);""").find(amoled)?.groupValues?.get(1)?.toInt(16)
            ?: error("AmoledTheme declares no $name")

    /**
     * Issue #27: under AMOLED, Facebook's cards stayed #333334 on the black page. Each background
     * token AMOLED names that the dark or darker style gives a dark grey (an opaque grey below mid
     * grey) has to be one AMOLED changes: black up to MAX_CHANNEL, near black up to
     * MAX_RAISED_CHANNEL. CARD_BACKGROUND has to be above the black band, or the raised band would
     * go untested.
     */
    @Test
    fun `every dark background AMOLED names is a grey it darkens in each declared build`() {
        val backgrounds = amoledBackgrounds()
        assertTrue("BACKGROUND_TOKENS lists almost nothing", backgrounds.size > 20)
        val black = amoledChannel("MAX_CHANNEL")
        val raised = amoledChannel("MAX_RAISED_CHANNEL")
        var builds = 0
        for (target in AppCompatibilities.facebook().single().targets) {
            val version = checkNotNull(target.version)
            for (fixture in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                withBaseApk(fixture) { apk ->
                    val attributes = tokenAttributes(apk)
                    val styles = fdsStyles(apk, attributes.values.toSet())
                    val light = styles.values.single { it.parent == 0 && it.sets > 300 }
                    val dark = styles.values.single { it.parent == light.id && it.sets > 300 }
                    val darker = styles.values.single { it.parent == dark.id }

                    val raisedTokens = mutableSetOf<String>()
                    for (name in backgrounds) {
                        val attribute = attributes[name] ?: continue
                        for (style in listOf(dark, darker)) {
                            val colour = style.values[attribute] ?: continue
                            val channels = listOf(colour shr 16 and 0xFF, colour shr 8 and 0xFF, colour and 0xFF)
                            if (colour ushr 24 != 0xFF || channels.max() - channels.min() > 8 || channels.max() >= 0x80) continue
                            assertTrue("${fixture.name}: $name is ${hex(setOf(colour))} in style ${Integer.toHexString(style.id)}, " +
                                "above the greys AMOLED darkens (0x${Integer.toHexString(raised)})", channels.max() <= raised)
                            if (channels.max() > black) raisedTokens += name
                        }
                    }
                    assertTrue("${fixture.name}: CARD_BACKGROUND is no longer above the black band, found $raisedTokens",
                        "CARD_BACKGROUND" in raisedTokens)
                }
                builds++
            }
        }
        assertEquals("one fixture for each declared build", declaredBuilds(), builds)
    }

    /**
     * The night copies of the FDS styles (MaterialYouStyles.kt), which Find friends on an empty Pages
     * feed takes its blue from, on each declared build's own styles and colours written out as the
     * resource decoder names them. The patch has to read the token attributes this test reads, copy
     * only the dark style's family, leave the default styles as they are, and point an item at the
     * palette only for a token and colour FDS_DARK or FDS_SHARED lists. PRIMARY_BUTTON_BACKGROUND in
     * the dark style has to be one of them.
     *
     * <p>Some of Facebook's code resolves a token's attribute and reads `TypedValue.data` as its colour,
     * which a colour state list doesn't give. The patch finds those tokens in each build's dex, the
     * same [DATA_READ_TOKENS] in both, and each item it changes for one of them has to be a plain
     * colour, while every other item keeps its state list. What the scan can't settle is pinned as
     * well ([UNCHECKED_TOKENS], [UNRESOLVED]), so a new build's changes there get looked at.
     */
    @Test
    fun `every night style item the patch changes is a listed token and colour in each declared build`() {
        val dark = listedTokens()
        val shared = listedTokens("FDS_SHARED")
        val listed = (dark.keys + shared.keys).associateWith { dark[it].orEmpty() + shared[it].orEmpty() }
        var builds = 0
        for (target in AppCompatibilities.facebook().single().targets) {
            val version = checkNotNull(target.version)
            for (fixture in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                withBaseApk(fixture) { apk -> checkNightStyles(fixture.name, version, apk, listed) }
                builds++
            }
        }
        assertEquals("one fixture for each declared build", declaredBuilds(), builds)
    }

    private fun checkNightStyles(build: String, version: String, apk: File, listed: Map<String, Set<Int>>) {
        val attributes = tokenAttributes(apk)
        val (initializer, tokenType) = tokenInitializer(apk)
        assertEquals("$build: the patch reads other token attributes", attributes, patchTokenAttributes(initializer, tokenType))
        val tokens = attributes.entries.associate { (token, attribute) -> "attr_0x%08x".format(attribute) to token }
        val scan = scannedTokens(apk, initializer, tokenType)
        val plain = scan.tokens
        assertEquals("$build: the tokens read as TypedValue data", DATA_READ_TOKENS, plain)
        assertEquals("$build: the tokens resolved where the read isn't checked", UNCHECKED_TOKENS, scan.unchecked.keys)
        assertEquals("$build: the data reads the scan can't follow", UNRESOLVED[version], scan.unresolved)

        val styles = fdsStyles(apk, attributes.values.toSet())
        val light = styles.values.single { it.parent == 0 && it.sets > 300 }
        val darkStyle = styles.values.single { it.parent == light.id && it.sets > 300 }
        val decoded = decode(apk)

        var restyled = 0
        val darkTokens = mutableSetOf<String>()
        val plainTones = mutableSetOf<String>()
        for ((type, file) in decoded.styleFiles) {
            val family = darkFdsStyles(file, tokens)
            if (family.isEmpty()) continue
            assertEquals("$build: the family starts at another style", "${type}_0x%08x".format(darkStyle.id),
                family.first().getAttribute("name"))
            val names = family.map { it.getAttribute("name") }.toSet()
            assertTrue("$build: the light style is in the family", "${type}_0x%08x".format(light.id) !in names)

            val before = file.text()
            val night = emptyResources()
            val stateLists = mutableMapOf<String, String>()
            restyled += writeNightStyles(family, decoded.colours, decoded.nightColours, tokens, night, emptyResources(),
                emptyResources(), stateLists, plain)
            assertEquals("$build: the default $type file changed", before, file.text())

            for (copy in night.documentElement.elements()) {
                val name = copy.getAttribute("name")
                assertTrue("$build: $name is no dark style", name in names)
                for (item in copy.elements()) {
                    if (!item.textContent.startsWith("@color/hushfacebook_you_")) continue
                    val attribute = item.getAttribute("name")
                    val token = tokens[attribute] ?: error("$build: $name changes $attribute, no FDS token")
                    val colour = decoded.styleColours.getValue(name)[attribute]
                    assertTrue("$build: $name changes $token, ${colour?.let { hex(setOf(it)) }}, which no table lists",
                        colour != null && colour in listed[token].orEmpty())
                    val stateList = item.textContent.removePrefix("@color/") in stateLists
                    assertEquals("$build: $name gives $token ${item.textContent}, a state list is $stateList", token !in plain, stateList)
                    if (token in plain) plainTones += "$token ${item.textContent}"
                    if (name == family.first().getAttribute("name")) darkTokens += token
                }
            }
        }
        assertTrue("$build: no night style item takes the palette", restyled > 0)
        assertTrue("$build: the dark style keeps its PRIMARY_BUTTON_BACKGROUND, found $darkTokens",
            "PRIMARY_BUTTON_BACKGROUND" in darkTokens)
        assertTrue("$build: PRIMARY_TEXT takes no system tone, found $plainTones",
            "PRIMARY_TEXT @color/hushfacebook_you_neutral_95" in plainTones)
    }

    /** What the patch's scan for tokens read through `TypedValue.data` finds over every class in [apk]. */
    private fun scannedTokens(apk: File, initializer: Method, tokenType: String): DataReadScan {
        val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
        val forEachClass: ((ClassDef) -> Unit) -> Unit = { visit ->
            for (name in container.dexEntryNames) container.getEntry(name)!!.dexFile.classes.forEach(visit)
        }
        var tokenClass: ClassDef? = null
        forEachClass { if (it.type == tokenType && tokenClass == null) tokenClass = it }
        return dataReadTokens(forEachClass, tokenConstants(initializer, tokenType), tokenAttributeField(checkNotNull(tokenClass)))
    }

    /**
     * One build's default colours and style files, as the resource decoder writes them for names
     * Facebook strips: `color_0x7f0601d5`, `attr_0x7f0405bd`, `style.2_0x7f200229`. Style items keep
     * a colour or a colour reference and write anything else as `@null`, which no route reads.
     */
    private class Decoded(
        val colours: Map<String, String>,
        val nightColours: Set<String>,
        val styleFiles: Map<String, Document>,
        val styleColours: Map<String, Map<String, Int>>,
    )

    private fun decode(apk: File): Decoded {
        val table = ZipFile(apk).use { zip -> zip.getInputStream(zip.getEntry(TableBlock.FILE_NAME)).use { TableBlock.load(it) } }
        val byId = mutableMapOf<Int, ResourceEntry>()
        for (block in table.listPackages()) {
            for (pair in block.listSpecTypePairs()) {
                for (resource in pair.resources) if (resource != null && !resource.isEmpty) byId[resource.resourceId] = resource
            }
        }
        fun name(resource: ResourceEntry) = "${resource.type}_0x%08x".format(resource.resourceId)
        fun text(item: ValueItem): String = when (item.valueType) {
            ValueType.COLOR_ARGB8, ValueType.COLOR_RGB8, ValueType.COLOR_ARGB4, ValueType.COLOR_RGB4 -> "#%08x".format(item.data)
            ValueType.REFERENCE, ValueType.DYNAMIC_REFERENCE ->
                byId[item.data]?.takeIf { it.type == "color" }?.let { "@color/${name(it)}" } ?: "@null"
            else -> "@null"
        }

        val colours = mutableMapOf<String, String>()
        val nightColours = mutableSetOf<String>()
        val styleFiles = mutableMapOf<String, Document>()
        val styleColours = mutableMapOf<String, Map<String, Int>>()
        for (resource in byId.values.sortedBy { it.resourceId }) {
            val entries = resource.iterator().asSequence().filterNotNull().filter { !it.isNull }.toList()
            if (resource.type == "color") {
                if (entries.any { it.resConfig.uiModeNight == ResConfig.UiModeNight.NIGHT }) nightColours += name(resource)
                entries.firstOrNull { it.resConfig.isDefault && !it.isComplex }?.let { colours[name(resource)] = text(it.resValue) }
            } else if (resource.type.startsWith("style")) {
                val bag = entries.firstOrNull { it.resConfig.isDefault && it.isComplex }?.tableEntry as? ResTableMapEntry ?: continue
                val file = styleFiles.getOrPut(resource.type) { emptyResources() }
                val style = file.createElement(resource.type)
                style.setAttribute("name", name(resource))
                if (bag.parentId != 0) {
                    style.setAttribute("parent", byId[bag.parentId]?.let { "@${it.type}/${name(it)}" } ?: "@android:style/Theme")
                }
                val values = mutableMapOf<String, Int>()
                for (item in bag) {
                    val attribute = "attr_0x%08x".format(item.nameId)
                    style.appendChild(file.createElement("item").also {
                        it.setAttribute("name", attribute)
                        it.textContent = text(item)
                    })
                    colour(item, byId, 0)?.let { values[attribute] = it }
                }
                file.documentElement.appendChild(style)
                styleColours[name(resource)] = values
            }
        }
        return Decoded(colours, nightColours, styleFiles, styleColours)
    }

    private fun emptyResources(): Document =
        DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument().also { it.appendChild(it.createElement("resources")) }

    private fun Element.elements(): List<Element> = (0 until childNodes.length).mapNotNull { childNodes.item(it) as? Element }

    private fun Document.text(): String = StringWriter().also {
        TransformerFactory.newInstance().newTransformer().transform(DOMSource(this), StreamResult(it))
    }.toString()

    private class Style(val id: Int, val parent: Int, val sets: Int, val values: Map<Int, Int>)

    /** Every style that sets 20 or more FDS attributes, with each one's colour where it resolves to one. */
    private fun fdsStyles(apk: File, fdsAttributes: Set<Int>): Map<Int, Style> {
        val table = ZipFile(apk).use { zip -> zip.getInputStream(zip.getEntry(TableBlock.FILE_NAME)).use { TableBlock.load(it) } }
        val byId = mutableMapOf<Int, ResourceEntry>()
        for (block in table.listPackages()) {
            for (pair in block.listSpecTypePairs()) {
                for (resource in pair.resources) if (resource != null && !resource.isEmpty) byId[resource.resourceId] = resource
            }
        }
        val styles = mutableMapOf<Int, Style>()
        for (resource in byId.values) {
            if (!resource.type.startsWith("style")) continue
            for (entry in resource.iterator()) {
                if (entry == null || entry.isNull || !entry.isComplex) continue
                val bag = entry.tableEntry as ResTableMapEntry
                val values = mutableMapOf<Int, Int>()
                var set = 0
                for (item in bag) {
                    if (item.nameId !in fdsAttributes) continue
                    set++
                    colour(item, byId, 0)?.let { values[item.nameId] = it }
                }
                if (set >= 20) styles[resource.resourceId] = Style(resource.resourceId, bag.parentId, set, values)
            }
        }
        return styles
    }

    /** A colour value, following references to colour resources in their default configuration. */
    private fun colour(item: ValueItem, byId: Map<Int, ResourceEntry>, depth: Int): Int? = when (item.valueType) {
        ValueType.COLOR_ARGB8, ValueType.COLOR_RGB8, ValueType.COLOR_ARGB4, ValueType.COLOR_RGB4 -> item.data
        ValueType.REFERENCE, ValueType.DYNAMIC_REFERENCE -> {
            val target = byId[item.data]
            val entry: Entry? = target?.let { resource ->
                resource.iterator().asSequence().firstOrNull { it != null && !it.isNull && it.resConfig.isDefault }
            }
            if (entry == null || entry.isComplex || depth > 4) null else colour(entry.resValue, byId, depth + 1)
        }
        else -> null
    }

    /** The static initializer of the token enum FDSColors resolves, and the enum's type. */
    private fun tokenInitializer(apk: File): Pair<Method, String> {
        val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
        val classes = mutableMapOf<String, ClassDef>()
        for (name in container.dexEntryNames) {
            for (classDef in container.getEntry(name)!!.dexFile.classes) classes.putIfAbsent(classDef.type, classDef)
        }
        val source = classes.getValue(FDS_COLORS).methods.single { method ->
            AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Ljava/lang/Integer;" &&
                method.parameterTypes.size == 3 && method.parameterTypes[0].toString() == "Landroid/content/Context;"
        }
        val tokenType = source.parameterTypes[1].toString()
        return classes.getValue(tokenType).methods.single { it.name == "<clinit>" } to tokenType
    }

    /** Each constant of the token enum FDSColors resolves, by name, with the theme attribute it passes. */
    private fun tokenAttributes(apk: File): Map<String, Int> {
        val (initializer, tokenType) = tokenInitializer(apk)

        // Follows constants and moves through registers to each constructor call, which takes the
        // name, the ordinal, the theme attribute, a fallback colour and a colour resource.
        val registers = mutableMapOf<Int, Any?>()
        val tokens = mutableMapOf<String, Int>()
        for (instruction in initializer.implementation!!.instructions) {
            val opcode = instruction.opcode
            when {
                instruction is NarrowLiteralInstruction && instruction is OneRegisterInstruction &&
                    opcode in setOf(Opcode.CONST, Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST_HIGH16) ->
                    registers[instruction.registerA] = instruction.narrowLiteral
                opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO ->
                    registers[(instruction as OneRegisterInstruction).registerA] =
                        ((instruction as ReferenceInstruction).reference as StringReference).string
                opcode in setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16, Opcode.MOVE_OBJECT,
                    Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16) ->
                    registers[(instruction as TwoRegisterInstruction).registerA] = registers[instruction.registerB]
                (opcode == Opcode.INVOKE_DIRECT || opcode == Opcode.INVOKE_DIRECT_RANGE) &&
                    ((instruction as ReferenceInstruction).reference as? MethodReference)
                        ?.let { it.name == "<init>" && it.definingClass == tokenType } == true -> {
                    val arguments = when (instruction) {
                        is RegisterRangeInstruction -> (0 until instruction.registerCount).map { instruction.startRegister + it }
                        is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD,
                            instruction.registerE, instruction.registerF, instruction.registerG).take(instruction.registerCount)
                        else -> error("unexpected call form $opcode")
                    }
                    val name = registers[arguments[1]] as? String ?: error("a token constructed without a name")
                    tokens[name] = registers[arguments[3]] as? Int ?: error("$name has no theme attribute")
                }
                instruction is OneRegisterInstruction && opcode != Opcode.SPUT_OBJECT -> registers.remove(instruction.registerA)
            }
        }
        return tokens
    }

    private fun withBaseApk(fixture: File, check: (File) -> Unit) = ZipFile(fixture).use { zip ->
        val base = checkNotNull(zip.getEntry("base.apk")) { "${fixture.name} holds no base.apk" }
        val copy = File.createTempFile("fixture-base", ".apk")
        try {
            zip.getInputStream(base).use { input -> copy.outputStream().use { input.copyTo(it) } }
            check(copy)
        } finally {
            copy.delete()
        }
    }

    private fun hex(colours: Set<Int>) = colours.joinToString(",") { "#%08X".format(it) }

    /** Every build the bundle pins, one per ABI of each declared version, each a fixture of its own. */
    private fun declaredBuilds() = AppCompatibilities.facebook().single().targets.sumOf { it.versionCodes.orEmpty().size }
}
