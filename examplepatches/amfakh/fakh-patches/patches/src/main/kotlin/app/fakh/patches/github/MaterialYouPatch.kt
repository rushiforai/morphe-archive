package app.fakh.patches.github

import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
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
private const val SETTINGS_ENTRY = "Lapp/fakh/extension/github/SettingsEntry;"
private const val SWITCH_PREFERENCE = "Landroidx/preference/SwitchPreferenceCompat;"
private const val SETTINGS_FRAGMENT = "Lcom/github/android/settings/SettingsFragment;"
private const val STYLED_CATEGORY = "Lcom/github/android/settings/preferences/StyledPreferenceCategory;"
private const val PREFERENCE_CATEGORY = "Landroidx/preference/PreferenceCategory;"
private const val PREFERENCE = "Landroidx/preference/Preference;"
private const val PREFERENCE_GROUP = "Landroidx/preference/PreferenceGroup;"

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
        writeColors("values-round-night-v31", DARK_ACCENTS + DARK_SURFACES_V31 + DARK_DIVIDERS)
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

/** The instructions of the method's body. */
private val Method.body: List<Instruction> get() = implementation!!.instructions.toList()

/** The method this instruction calls, or null. */
private val Instruction.method get() = (this as? ReferenceInstruction)?.reference as? MethodReference

/** The type this instruction creates or checks, or null. */
private val Instruction.typeReference get() = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

/** The field this instruction reads or writes, or null. */
private val Instruction.field get() = (this as? ReferenceInstruction)?.reference as? FieldReference

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
private fun BytecodePatchContext.appCompatActivity(): MutableClass {
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

/**
 * The preference APIs that R8 renamed, read off the Theme row and the category divider that SettingsFragment builds
 * in its onCreatePreferences: setKey, setTitle, the call every row gets after its title and summary, the click
 * listener and default value fields, the context field, the layout field and divider layout, and
 * PreferenceGroup.addPreference.
 */
private class PreferenceApi(
    val setKey: MethodReference,
    val setTitle: MethodReference,
    val finish: MethodReference,
    val listener: FieldReference,
    val defaultValue: FieldReference,
    val context: FieldReference,
    val layout: FieldReference,
    val dividerLayout: Int,
    val addPreference: MethodReference,
    /** Index of the call that adds the Theme row to the General category, and the preference screen's register. */
    val themeAddedAt: Int,
    val screenRegister: Int,
)

private fun preferenceApi(build: Method): PreferenceApi {
    val body = build.body
    val themeKey = body.indexOfFirst { ((it as? Instruction21c)?.reference as? StringReference)?.string == "key_dark_mode" }
    if (themeKey < 0) throw PatchException("Theme row not found")
    /** Index of the first instruction from [from] that matches, or a PatchException naming [what]. */
    fun find(from: Int, what: String, predicate: (Instruction) -> Boolean) =
        (from until body.size).firstOrNull { predicate(body[it]) } ?: throw PatchException("$what not found")

    val setKeyAt = find(themeKey, "setKey") {
        it.method?.let { m -> m.definingClass == PREFERENCE && m.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") } == true
    }
    val row = (body[setKeyAt] as FiveRegisterInstruction).registerC
    /** The first call from [from] on the Theme row to a Preference method with [parameters]. */
    fun rowCall(from: Int, what: String, parameters: List<String>) = find(from, what) {
        val method = it.method ?: return@find false
        method.definingClass == PREFERENCE && method.parameterTypes.map(CharSequence::toString) == parameters &&
            (it as FiveRegisterInstruction).registerC == row
    }
    val setTitleAt = rowCall(setKeyAt + 1, "setTitle", listOf("Ljava/lang/String;"))
    val setSummaryAt = rowCall(setTitleAt + 1, "setSummary", listOf("Ljava/lang/CharSequence;"))
    val finishAt = rowCall(setSummaryAt + 1, "Row finish call", emptyList())
    val listener = body[find(themeKey, "Click listener field") {
        it.opcode == Opcode.IPUT_OBJECT && it.field?.definingClass == PREFERENCE && it.field?.type != "Ljava/lang/Object;"
    }].field!!
    val defaultValue = body[find(themeKey, "Default value field") {
        it.opcode == Opcode.IPUT_OBJECT && it.field?.definingClass == PREFERENCE && it.field?.type == "Ljava/lang/Object;"
    }].field!!
    val context = body[find(0, "Context field") {
        it.opcode == Opcode.IGET_OBJECT && it.field?.definingClass == PREFERENCE && it.field?.type == "Landroid/content/Context;"
    }].field!!
    val addedAt = find(finishAt, "addPreference of the Theme row") {
        val method = it.method ?: return@find false
        method.definingClass == PREFERENCE_GROUP && (it as FiveRegisterInstruction).registerD == row
    }
    val category = (body[addedAt] as FiveRegisterInstruction).registerC
    val categoryAddedAt = (addedAt downTo 0).firstOrNull { index ->
        body[index].method?.definingClass == PREFERENCE_GROUP && (body[index] as FiveRegisterInstruction).registerD == category
    } ?: throw PatchException("addPreference of the General category not found")
    val layoutAt = find(0, "Divider layout") {
        it.opcode == Opcode.IPUT && it.field?.definingClass == PREFERENCE && it.field?.type == "I"
    }
    val dividerLayout = (body[layoutAt - 1] as? NarrowLiteralInstruction)?.narrowLiteral
        ?: throw PatchException("Divider layout id not found")
    return PreferenceApi(
        setKey = body[setKeyAt].method!!,
        setTitle = body[setTitleAt].method!!,
        finish = body[finishAt].method!!,
        listener = listener,
        defaultValue = defaultValue,
        context = context,
        layout = body[layoutAt].field!!,
        dividerLayout = dividerLayout,
        addPreference = body[addedAt].method!!,
        themeAddedAt = addedAt,
        screenRegister = (body[categoryAddedAt] as FiveRegisterInstruction).registerC,
    )
}

/** The checked switch track colors, light and dark, which the switch component hardcodes as ARGB longs. */
private val COLOR_LITERALS = setOf(0xFFB3D1F5L, 0xFF183564L)

/** Whether this loads one of [COLOR_LITERALS] into a wide register. */
private fun Instruction.isColorLiteral() =
    (opcode == Opcode.CONST_WIDE || opcode == Opcode.CONST_WIDE_32) && (this as WideLiteralInstruction).wideLiteral in COLOR_LITERALS

/** Smali reference of a method. */
private val MethodReference.smali
    get() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

/** Smali reference of a field. */
private val FieldReference.smali get() = "$definingClass->$name:$type"

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
    dependsOn(materialYouResourcePatch)
    extendWith("extensions/extension.mpe")

    execute {
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
        var literalCount = 0
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lapp/fakh/")) return@classDefForEach
            val methods = classDef.methods.filter { method ->
                method.implementation?.instructions?.any { it.isColorLiteral() } == true
            }
            if (methods.isEmpty()) return@classDefForEach
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

        // Settings: a Fakh Patches section with a switch per setting, right after General.
        val settings = mutableClassDefBy(SETTINGS_FRAGMENT)
        // onCreatePreferences, which builds the preference screen; other methods look the Theme row up by its key.
        val build = settings.methods.first { method ->
            val instructions = method.implementation?.instructions?.toList().orEmpty()
            instructions.any { ((it as? Instruction21c)?.reference as? StringReference)?.string == "key_dark_mode" } &&
                instructions.any { it.opcode == Opcode.NEW_INSTANCE && it.typeReference == "Landroidx/preference/PreferenceScreen;" }
        }
        val api = preferenceApi(build)

        /**
         * Smali that adds the switch for the setting [key] to the category in v3. It persists to GitHub's settings
         * file, where the extension reads it, and applies the change from its click listener.
         */
        fun row(key: String, title: String, default: Boolean) = """
            new-instance v1, $SWITCH_PREFERENCE
            const/4 v2, 0x0
            invoke-direct { v1, v0, v2 }, $SWITCH_PREFERENCE-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
            const-string v2, "$key"
            invoke-virtual { v1, v2 }, ${api.setKey.smali}
            const-string v2, "$title"
            invoke-virtual { v1, v2 }, ${api.setTitle.smali}
            invoke-virtual { v1 }, ${api.finish.smali}
            sget-object v2, Ljava/lang/Boolean;->${if (default) "TRUE" else "FALSE"}:Ljava/lang/Boolean;
            iput-object v2, v1, ${api.defaultValue.smali}
            const-string v2, "$key"
            new-instance v4, $SETTINGS_ENTRY
            invoke-direct { v4, v2 }, $SETTINGS_ENTRY-><init>(Ljava/lang/String;)V
            iput-object v4, v1, ${api.listener.smali}
            invoke-virtual { v3, v1 }, ${api.addPreference.smali}
        """

        settings.methods.add(
            ImmutableMethod(
                SETTINGS_FRAGMENT,
                "fakhAddPatchesSection",
                listOf(ImmutableMethodParameter(PREFERENCE_GROUP, null, null)),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(6),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        iget-object v0, p0, ${api.context.smali}
                        new-instance v1, $PREFERENCE_CATEGORY
                        const/4 v2, 0x0
                        invoke-direct { v1, v0, v2 }, $PREFERENCE_CATEGORY-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
                        const v2, ${api.dividerLayout}
                        iput v2, v1, ${api.layout.smali}
                        invoke-virtual { p0, v1 }, ${api.addPreference.smali}
                        new-instance v3, $STYLED_CATEGORY
                        invoke-direct { v3, v0 }, $STYLED_CATEGORY-><init>(Landroid/content/Context;)V
                        const-string v2, "Fakh Patches"
                        invoke-virtual { v3, v2 }, ${api.setTitle.smali}
                        invoke-virtual { v3 }, ${api.finish.smali}
                        invoke-virtual { p0, v3 }, ${api.addPreference.smali}
                        ${row("fakh_material_you", "Material You", true)}
                        ${row("fakh_amoled", "Pitch black in dark mode", false)}
                        return-void
                    """,
                )
            },
        )
        // The General category is already on the screen here, so the new section lands right after it.
        build.addInstructions(
            api.themeAddedAt + 1,
            "invoke-static/range { v${api.screenRegister} .. v${api.screenRegister} }, " +
                "$SETTINGS_FRAGMENT->fakhAddPatchesSection($PREFERENCE_GROUP)V",
        )

        // The switches' click listener implements the renamed listener interface. Preferences run it after the
        // switch has toggled and saved itself.
        val callback = classDefBy(api.listener.type).methods.single()
        if (callback.returnType != "V") throw PatchException("Unexpected click listener ${callback.returnType}")
        mutableClassDefBy(SETTINGS_ENTRY).apply {
            interfaces.add(api.listener.type)
            methods.add(
                ImmutableMethod(
                    type,
                    callback.name,
                    callback.parameters.map { ImmutableMethodParameter(it.type, null, null) },
                    callback.returnType,
                    AccessFlags.PUBLIC.value,
                    null,
                    null,
                    MutableMethodImplementation(4),
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            iget-object v0, p1, ${api.context.smali}
                            iget-object v1, p0, $SETTINGS_ENTRY->key:Ljava/lang/String;
                            invoke-static { v0, v1 }, $EXTENSION->toggled(Landroid/content/Context;Ljava/lang/String;)V
                            return-void
                        """,
                    )
                },
            )
        }
    }
}
