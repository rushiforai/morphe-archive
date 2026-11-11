package app.fakh.patches.github

import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.literal
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element

private const val EXTENSION = "Lapp/fakh/extension/github/MaterialYou;"

/**
 * Primer blues of the View palettes (blue_*, links, the accent button) to the accent tone of the same lightness,
 * light and dark theme. Aliases such as systemBlue and colorAccent follow them.
 */
private val LIGHT_ACCENTS = mapOf(
    "blue_000" to "system_accent1_10",
    "blue_100" to "system_accent1_50",
    "blue_200" to "system_accent1_100",
    "blue_300" to "system_accent1_300",
    "blue_400" to "system_accent1_400",
    "blue_500" to "system_accent1_600",
    "blue_600" to "system_accent1_600",
    "blue_700" to "system_accent1_700",
    "blue_800" to "system_accent1_800",
    "blue_900" to "system_accent1_800",
    "link" to "system_accent1_600",
    "backgroundAccentEmphasis" to "system_accent1_600",
)

/** [LIGHT_ACCENTS] for dark mode, where GitHub's blues are a step lighter. */
private val DARK_ACCENTS = mapOf(
    "blue_000" to "system_accent1_10",
    "blue_100" to "system_accent1_50",
    "blue_200" to "system_accent1_100",
    "blue_300" to "system_accent1_200",
    "blue_400" to "system_accent1_400",
    "blue_500" to "system_accent1_500",
    "blue_600" to "system_accent1_600",
    "blue_700" to "system_accent1_700",
    "blue_800" to "system_accent1_800",
    "blue_900" to "system_accent1_800",
    "link" to "system_accent1_200",
)

/**
 * Light backgrounds as Material 3 surface roles: the gray canvas behind cards, the white cards, bars and plain
 * pages (the toolbar and list rows are aliases of backgroundSecondary), sheets, inset fields, and borders.
 */
private val LIGHT_SURFACES_V34 = mapOf(
    "backgroundPrimary" to "system_surface_container_low_light",
    "backgroundElevatedPrimary" to "system_surface_container_low_light",
    "appBackground" to "system_surface_light",
    "backgroundSecondary" to "system_surface_light",
    "backgroundTertiary" to "system_surface_light",
    "backgroundElevatedSecondary" to "system_surface_container_high_light",
    "backgroundElevatedTertiary" to "system_surface_container_high_light",
    "backgroundInset" to "system_surface_container_highest_light",
    "borderPrimary" to "system_surface_container_highest_light",
    "borderOpaque" to "system_surface_container_highest_light",
)

/** [LIGHT_SURFACES_V34] as the neutral tones closest to them, for Android 12 and 13. */
private val LIGHT_SURFACES_V31 = mapOf(
    "backgroundPrimary" to "system_neutral2_100",
    "backgroundElevatedPrimary" to "system_neutral2_100",
    "appBackground" to "system_neutral2_50",
    "backgroundSecondary" to "system_neutral2_50",
    "backgroundTertiary" to "system_neutral2_50",
    "backgroundElevatedSecondary" to "system_neutral2_100",
    "backgroundElevatedTertiary" to "system_neutral2_100",
    "backgroundInset" to "system_neutral2_100",
    "borderPrimary" to "system_neutral2_200",
    "borderOpaque" to "system_neutral2_200",
)

/**
 * Dark backgrounds as Material 3 surface roles: the canvas, the cards and bars on it a step lighter, the raised
 * surfaces of sheets, menus and dialogs, inset fields, and borders. The divider is an alias of the card in dark
 * mode; it gets the border role here so AMOLED black does not hide it.
 */
private val DARK_SURFACES_V34 = mapOf(
    "appBackground" to "system_surface_dark",
    "backgroundPrimary" to "system_surface_dark",
    "backgroundSecondary" to "system_surface_container_dark",
    "backgroundTertiary" to "system_surface_container_high_dark",
    "backgroundElevatedPrimary" to "system_surface_container_high_dark",
    "backgroundElevatedSecondary" to "system_surface_container_high_dark",
    "backgroundElevatedTertiary" to "system_surface_container_high_dark",
    "backgroundInset" to "system_surface_container_high_dark",
    "borderPrimary" to "system_surface_container_highest_dark",
    "borderOpaque" to "system_surface_container_highest_dark",
)

/** [DARK_SURFACES_V34] as the neutral tones closest to them, for Android 12 and 13. */
private val DARK_SURFACES_V31 = mapOf(
    "appBackground" to "system_neutral1_1000",
    "backgroundPrimary" to "system_neutral1_1000",
    "backgroundSecondary" to "system_neutral1_900",
    "backgroundTertiary" to "system_neutral2_800",
    "backgroundElevatedPrimary" to "system_neutral2_800",
    "backgroundElevatedSecondary" to "system_neutral2_800",
    "backgroundElevatedTertiary" to "system_neutral2_800",
    "backgroundInset" to "system_neutral2_800",
    "borderPrimary" to "system_neutral2_700",
    "borderOpaque" to "system_neutral2_700",
)

/**
 * Neutral diff lines keep GitHub's grays, set as values since GitHub aliases them to the page backgrounds: a tinted
 * neutral line next to a red deletion is hard to tell apart.
 */
private val LIGHT_DIFF = mapOf("lineBackgroundGray" to "#ffffffff", "lineNumberBackgroundGray" to "#ffeff0f5")

/** [LIGHT_DIFF] for dark mode: the round qualifier outranks night, so the dark grays have to be set here too. */
private val DARK_DIFF = mapOf("lineBackgroundGray" to "#ff17181c", "lineNumberBackgroundGray" to "#ff1f1f24")

/**
 * Dividers between list rows, a translucent gray in GitHub's palette. A resource can't add alpha to a system
 * color, so they become the opaque neutral tone of the same lightness: neutral1, the least tinted palette.
 */
private val LIGHT_DIVIDERS = mapOf("border" to "system_neutral1_200")

/** [LIGHT_DIVIDERS] for dark mode, where the translucent light gray sits on a dark surface. */
private val DARK_DIVIDERS = mapOf("border" to "system_neutral1_800")

/**
 * The dark canvas and cards that AMOLED black turns black. They live under the notlong qualifier, which the
 * extension forces on only while the setting is on; it outranks round, night and the API level, so it wins over
 * the Material You surfaces on every Android version.
 */
private val AMOLED_SURFACES = listOf("appBackground", "backgroundPrimary", "backgroundSecondary")

/**
 * The Material You colors live under the round qualifier, which the extension forces on only while the setting is
 * on, so GitHub's own colors come back when it is off.
 */
private val materialYouResourcePatch = resourcePatch {
    execute {
        writeColors("values-round-v31", LIGHT_ACCENTS + LIGHT_SURFACES_V31 + LIGHT_DIVIDERS + LIGHT_DIFF)
        writeColors("values-round-v34", LIGHT_SURFACES_V34)
        writeColors("values-round-night-v31", DARK_ACCENTS + DARK_SURFACES_V31 + DARK_DIVIDERS + DARK_DIFF)
        writeColors("values-round-night-v34", DARK_SURFACES_V34)
        writeColors("values-notlong-night-v31", AMOLED_SURFACES.associateWith { "black" })
    }
}

/**
 * Sets [colors] (resource name to framework color, or a #AARRGGBB value) in the directory's colors.xml, creating it when GitHub has
 * none. Entries are merged into the existing file, so its other colors stay and no name is defined twice.
 */
private fun ResourcePatchContext.writeColors(directory: String, colors: Map<String, String>) {
    val file = get("res").resolve(directory).resolve("colors.xml")
    if (!file.exists()) {
        file.parentFile.mkdirs()
        file.writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<resources>\n</resources>\n")
    }
    document("res/$directory/colors.xml").use { document ->
        val resources = document.documentElement
        val nodes = resources.getElementsByTagName("color")
        val existing = (0 until nodes.length).map { nodes.item(it) as Element }.associateBy { it.getAttribute("name") }
        for ((name, system) in colors) {
            val color = existing[name] ?: document.createElement("color").also {
                it.setAttribute("name", name)
                resources.appendChild(it)
            }
            color.textContent = if (system.startsWith("#")) system else "@android:color/$system"
        }
    }
}


/**
 * GitHub's Compose color schemes (Primer colors and app colors), which hold 80 and more colors and are built in
 * the static initializers of their holder classes: holder to its scheme fields, light scheme first.
 */
private fun BytecodePatchContext.composeSchemeHolders(): Map<MutableClass, List<String>> {
    val schemes = mutableSetOf<String>()
    classDefForEach { classDef ->
        if (classDef.methods.any { method -> method.name == "<init>" && method.parameterTypes.count { it.toString() == "J" } >= 80 }) {
            schemes += classDef.type
        }
    }
    if (schemes.size != 2) throw PatchException("Expected 2 Compose color schemes, found $schemes")

    val holders = mutableMapOf<MutableClass, List<String>>()
    classDefForEach { classDef ->
        val fields = classDef.staticFields.filter { it.type in schemes }
        if (fields.isEmpty() || classDef.methods.none { it.name == "<clinit>" }) return@classDefForEach
        // R8 names the light scheme field before the dark one (a, b), as the app's theme selection reads them.
        if (fields.size != 2) throw PatchException("${classDef.type} holds ${fields.size} schemes")
        holders[mutableClassDefBy(classDef)] = fields.map { it.name }.sorted()
    }
    if (holders.size != 2) throw PatchException("Expected 2 Compose scheme holders, found ${holders.size}")
    return holders
}

/**
 * GitHub's Compose palettes: the classes whose static colors the scheme holders read while building the schemes.
 * Components such as switch tracks read them directly too.
 */
private fun BytecodePatchContext.composePalettes(holders: Collection<MutableClass>): List<MutableClass> {
    val holderTypes = holders.map { it.type }.toSet()
    val palettes = holders.flatMap { holder ->
        holder.methods.first { it.name == "<clinit>" }.body
            .filter { it.opcode == Opcode.SGET_WIDE }
            .mapNotNull { it.field?.definingClass }
    }.toSet() - holderTypes
    if (palettes.isEmpty()) throw PatchException("No Compose palettes found")
    return palettes.map { mutableClassDefBy(it) }
}

/** AppCompatActivity, which R8 renamed: the class overriding both attachBaseContext and getMenuInflater. */
internal fun BytecodePatchContext.appCompatActivity(): MutableClass {
    var found: MutableClass? = null
    classDefForEach { classDef ->
        if (classDef.methods.none { it.name == "attachBaseContext" } ||
            classDef.methods.none { it.name == "getMenuInflater" } ||
            classDef.methods.none { it.name == "closeOptionsMenu" }
        ) return@classDefForEach
        if (found != null) throw PatchException("More than one AppCompatActivity candidate")
        found = mutableClassDefBy(classDef)
    }
    return found ?: throw PatchException("AppCompatActivity not found")
}


/** The checked switch track colors, light and dark, which the switch component hardcodes as ARGB longs. */
private val COLOR_LITERALS = setOf(0xFFB3D1F5L, 0xFF183564L)

/** Whether this loads one of [COLOR_LITERALS] into a wide register. */
private fun Instruction.isColorLiteral() =
    (opcode == Opcode.CONST_WIDE || opcode == Opcode.CONST_WIDE_32) && (this as WideLiteralInstruction).wideLiteral in COLOR_LITERALS


@Suppress("unused")
val materialYouPatch = bytecodePatch(
    name = "Material You",
    description = "Uses your wallpaper's colors (Android 12+): the accent color instead of GitHub blue and tinted " +
        "surfaces in light and dark mode. Adds a Fakh Patches section to Settings with a Material You switch and an " +
        "AMOLED black switch for a pure black dark mode.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Theme")
    dependsOn(materialYouResourcePatch, githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // The extension's accent follows the wallpaper only where this patch is in.
        mutableClassDefBy(EXTENSION).methods.first { it.name == "isMaterialYouIncluded" }.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
        // Compose: rewrite the light and dark scheme together once their holder has built them, before the theme
        // or anything derived reads them.
        val holders = composeSchemeHolders()
        holders.forEach { (holder, fields) ->
            val initializer = holder.methods.first { it.name == "<clinit>" }
            if (initializer.implementation!!.registerCount < 2) throw PatchException("${holder.type} has too few registers")
            val schemeType = holder.staticFields.first { it.name == fields[0] }.type
            val smali = """
                sget-object v0, ${holder.type}->${fields[0]}:$schemeType
                sget-object v1, ${holder.type}->${fields[1]}:$schemeType
                invoke-static { v0, v1 }, $EXTENSION->schemes(Ljava/lang/Object;Ljava/lang/Object;)V
            """
            initializer.body.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .reversed()
                .forEach { (index, _) -> initializer.addInstructions(index, smali) }
        }

        // Compose palettes: their blues become the accent before the schemes and components copy them.
        composePalettes(holders.keys).forEach { palette ->
            val initializer = palette.methods.first { it.name == "<clinit>" }
            if (initializer.implementation!!.registerCount < 2) throw PatchException("${palette.type} has too few registers")
            val smali = palette.staticFields.filter { it.type == "J" }.joinToString("\n") { field ->
                """
                    sget-wide v0, ${palette.type}->${field.name}:J
                    invoke-static/range { v0 .. v1 }, $EXTENSION->paletteColor(J)J
                    move-result-wide v0
                    sput-wide v0, ${palette.type}->${field.name}:J
                """
            }
            initializer.body.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .reversed()
                .forEach { (index, _) -> initializer.addInstructions(index, smali) }
        }

        // Blue color literals in code (switch tracks), passed as plain ARGB longs instead of read from a palette.
        // The patcher's literal index finds the classes that hold them, a scan of every method takes half a second.
        var literalCount = 0
        COLOR_LITERALS.flatMap { Fingerprint(filters = listOf(literal(it))).matchAllOrNull().orEmpty() }
            .map { it.originalClassDef }.distinctBy { it.type }.forEach { classDef ->
            if (classDef.type.startsWith("Lapp/fakh/")) return@forEach
            val methods = classDef.methods.filter { method ->
                method.implementation?.instructions?.any { it.isColorLiteral() } == true
            }
            if (methods.isEmpty()) return@forEach
            val mutable = mutableClassDefBy(classDef)
            methods.forEach { method ->
                val target = mutable.methods.first {
                    it.name == method.name && it.returnType == method.returnType &&
                        it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
                }
                target.body.withIndex().filter { it.value.isColorLiteral() }.reversed().forEach { (index, instruction) ->
                    val register = (instruction as OneRegisterInstruction).registerA
                    target.addInstructions(
                        index + 1,
                        """
                            invoke-static/range { v$register .. v${register + 1} }, $EXTENSION->colorLiteral(J)J
                            move-result-wide v$register
                        """,
                    )
                    literalCount++
                }
            }
        }
        if (literalCount == 0) throw PatchException("No switch track color literals found")

        // Views: every screen's activity picks the Material You and AMOLED colors through its base context.
        appCompatActivity().methods.first { it.name == "attachBaseContext" }.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $EXTENSION->wrap(Landroid/content/Context;)Landroid/content/Context;
                move-result-object p1
            """,
        )

        addSwitch("fakh_material_you", "Material You", true)
        addSwitch("fakh_amoled", "Pitch black", false)
    }
}
