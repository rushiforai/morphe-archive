package dev.dva11.gboard

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.*
import app.morphe.patcher.methodCall

private const val PACKAGE_NAME = "com.google.android.inputmethod.latin"
private const val DEFAULT_THEME_NAME = "Midnight Red"
private const val DEFAULT_BACKGROUND = "#000000"
private const val DEFAULT_PRIMARY = "#FF0000"
private const val DEFAULT_SECONDARY = "#2A0A0A"
private const val DEFAULT_TERTIARY = "#1F0B0B"

private val compatibility = Compatibility(
    name = "Gboard",
    packageName = PACKAGE_NAME,
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x4285F4,
    // No targets: Morphe reports this patch as compatible with Any Gboard version.
)

private val themeNameOption = stringOption(
    key = "Theme name",
    default = DEFAULT_THEME_NAME,
)
private val backgroundOption = stringOption(
    key = "Background",
    default = DEFAULT_BACKGROUND,
)
private val primaryOption = stringOption(
    key = "Primary / action",
    default = DEFAULT_PRIMARY,
)
private val secondaryOption = stringOption(
    key = "Secondary / normal keys",
    default = DEFAULT_SECONDARY,
)
private val tertiaryOption = stringOption(
    key = "Tertiary / modifier keys",
    default = DEFAULT_TERTIARY,
)
private data class ThemeSpec(
    val name: String,
    val background: String,
    val primary: String,
    val secondary: String,
    val tertiary: String,
)

private fun normalizeSpec(
    name: String,
    background: String,
    primary: String,
    secondary: String,
    tertiary: String,
): ThemeSpec = ThemeSpec(
    name = name.trim().ifBlank { DEFAULT_THEME_NAME },
    background = background.trim().ifBlank { DEFAULT_BACKGROUND },
    primary = primary.trim().ifBlank { DEFAULT_PRIMARY },
    secondary = secondary.trim().ifBlank { DEFAULT_SECONDARY },
    tertiary = tertiary.trim().ifBlank { DEFAULT_TERTIARY },
)

private fun parseColor(spec: String): Int? {
    val s = spec.trim()
    val hex = s.removePrefix("#")
    require(hex.length == 6 || hex.length == 8) {
        "Invalid color '$spec'. Use #RRGGBB or #AARRGGBB."
    }
    val value = hex.toLongOrNull(16)
        ?: error("Invalid hexadecimal color '$spec'.")
    return if (hex.length == 6) {
        (0xFF000000L or value).toInt()
    } else {
        value.toInt()
    }
}

private fun blend(color: Int, other: Int, amount: Float): Int {
    fun c(v: Int, shift: Int) = (v ushr shift) and 0xFF
    fun mix(a: Int, b: Int): Int =
        (a + ((b - a) * amount)).toInt().coerceIn(0, 255)

    val r = mix(c(color, 16), c(other, 16))
    val g = mix(c(color, 8), c(other, 8))
    val b = mix(c(color, 0), c(other, 0))
    return (0xFF shl 24) or (r shl 16) or (g shl 8) or b
}

private fun varint(value: Long): ByteArray {
    var v = value
    val out = ArrayList<Byte>(5)
    while (v and -0x80L != 0L) {
        out += ((v.toInt() and 0x7F) or 0x80).toByte()
        v = v ushr 7
    }
    out += v.toByte()
    return out.toByteArray()
}

private fun fieldBytes(field: Int, payload: ByteArray): ByteArray =
    varint((field shl 3).toLong() or 2L) + varint(payload.size.toLong()) + payload

private fun fieldString(field: Int, value: String): ByteArray =
    fieldBytes(field, value.toByteArray(Charsets.UTF_8))

private fun fieldVarint(field: Int, value: Long): ByteArray =
    varint((field shl 3).toLong()) + varint(value)

private fun styleEntry(key: String, argb: Int): ByteArray {
    val color = fieldVarint(1, argb.toLong() and 0xFFFFFFFFL)
    val entry = fieldString(1, key) + fieldBytes(2, color)
    return fieldBytes(2, entry)
}

private fun styleSheet(spec: ThemeSpec): ByteArray {
    val out = ArrayList<Byte>()
    fun put(bytes: ByteArray) = bytes.forEach(out::add)

    parseColor(spec.background)?.let { color ->
        put(styleEntry("default_keyboard_background_secondary_color", color))
        put(styleEntry("default_keyboard_background_primary_color", color))
    }

    parseColor(spec.primary)?.let { color ->
        put(styleEntry(
            "default_generic_accent_color_pressed",
            blend(color, 0xFF000000.toInt(), 0.16f)
        ))
        put(styleEntry("default_generic_accent_color", color))
        put(styleEntry("color_bottom_indicator_active", color))
    }

    parseColor(spec.secondary)?.let { color ->
        put(styleEntry(
            "default_bordered_key_color_pressed",
            blend(color, 0xFFFFFFFF.toInt(), 0.65f)
        ))
        put(styleEntry("default_bordered_key_color", color))
    }

    parseColor(spec.tertiary)?.let { color ->
        put(styleEntry(
            "default_bordered_key_dark_color_pressed",
            blend(color, 0xFFFFFFFF.toInt(), 0.65f)
        ))
        put(styleEntry("default_bordered_key_dark_color", color))
        put(styleEntry("color_generic_extension_background_activated", color))
    }

    return out.toByteArray()
}

private fun metadata(sheetPath: String, borderPath: String): ByteArray {
    val out = ArrayList<Byte>()
    fun put(bytes: ByteArray) = bytes.forEach(out::add)

    for (name in listOf(
        "style_sheet_color_common.binarypb",
        "style_sheet_color_label_white.binarypb",
        "style_sheet_color_expression_dark.binarypb",
        "style_sheet_color_rules.binarypb",
        "style_sheet_dynamic_color_rules.binarypb",
        "style_sheet_dynamic_color_dark.binarypb",
        sheetPath,
    )) {
        put(fieldString(2, name))
    }

    val borders = ArrayList<Byte>()
    fun putBorder(bytes: ByteArray) = bytes.forEach(borders::add)
    putBorder(fieldVarint(1, 1))
    for (name in listOf(
        "style_sheet_color_rules_border.binarypb",
        "style_sheet_dynamic_color_rules_border.binarypb",
        "style_sheet_dynamic_color_dark_border.binarypb",
        borderPath,
    )) {
        putBorder(fieldString(2, name))
    }
    put(fieldBytes(3, borders.toByteArray()))

    val compat = fieldVarint(1, 25) +
        fieldString(2, "style_sheet_dynamic_compatible_themes_color_rules.binarypb")
    put(fieldBytes(14, compat))
    return out.toByteArray()
}

private data class ThemeAsset(
    val spec: ThemeSpec,
    val slug: String,
    val metadataPath: String,
    val stylePath: String,
    val borderPath: String,
)

private fun assetFor(spec: ThemeSpec): ThemeAsset {
    val slug = "mrd_midnight_red_1"
    return ThemeAsset(
        spec = spec,
        slug = slug,
        metadataPath = "assets/theme/theme_package_metadata_${slug}.binarypb",
        stylePath = "assets/theme/style_sheet_${slug}.binarypb",
        borderPath = "assets/theme/style_sheet_${slug}_border.binarypb",
    )
}

private fun escapeSmaliString(value: String): String =
    value.replace("\\", "\\\\").replace("\"", "\\\"")

private fun injection(asset: ThemeAsset): String {
    val metadataAsset = "assets:theme_package_metadata_${asset.slug}.binarypb"
    val registration = """
        const-string v10, "${metadataAsset}"
        const/4 v11, 0x1
        new-instance v12, Lqyk;
        invoke-direct {v12, v10, v11}, Lqyk;-><init>(Ljava/lang/String;Z)V
        invoke-static {v9, v12}, Lqzd;->a(Landroid/content/Context;Lqyk;)Lqye;
        move-result-object v11
        invoke-interface {v11}, Lqye;->c()Lrdd;
        move-result-object v11
        const-string v10, "${escapeSmaliString(asset.spec.name)}"
        invoke-static {v9, v12}, Ljyj;->e(Landroid/content/Context;Lqyk;)Ljyj;
        move-result-object v11
        new-instance v12, Ljxq;
        invoke-direct {v12, v10, v11}, Ljxq;-><init>(Ljava/lang/String;Ljyj;)V
        invoke-interface {v5, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z
        """.trimIndent()

    return """
        # Obtain the application Context via ActivityThread.currentApplication().
        # This avoids Class.getMethod("getContext") which throws NoSuchMethodException
        # when ThemeListingFragment's getContext() is non-public in the obfuscated
        # class hierarchy. ActivityThread is always available on the main thread and
        # requires no reflection walking, labels, or try-catch blocks.
        invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;
        move-result-object v9
        $registration
    """.trimIndent()
}

private val midnightRedResources = rawResourcePatch(
    name = "Gboard AMOLED Theme Resources",
    description = "Generates independent Gboard AMOLED theme assets from the configured theme options.",
    default = false,
) {
    compatibleWith(compatibility)

    val themeName by themeNameOption()
    val background by backgroundOption()
    val primary by primaryOption()
    val secondary by secondaryOption()
    val tertiary by tertiaryOption()

    execute {
        val spec = normalizeSpec(
            themeName ?: DEFAULT_THEME_NAME,
            background ?: DEFAULT_BACKGROUND,
            primary ?: DEFAULT_PRIMARY,
            secondary ?: DEFAULT_SECONDARY,
            tertiary ?: DEFAULT_TERTIARY,
        )
        val asset = assetFor(spec)

        get(asset.stylePath).writeBytes(styleSheet(asset.spec))
        get(asset.borderPath).writeBytes(ByteArray(0))
        get(asset.metadataPath).writeBytes(
            metadata(
                asset.stylePath.substringAfterLast('/'),
                asset.borderPath.substringAfterLast('/'),
            )
        )
    }
}

val midnightRedTheme = bytecodePatch(
    name = "Gboard AMOLED Theme Studio",
    description = "Adds a configurable standalone AMOLED Gboard theme. Midnight Red is the default palette.",
    default = false,
) {
    compatibleWith(compatibility)
    dependsOn(midnightRedResources)

    val themeName by themeNameOption()
    val background by backgroundOption()
    val primary by primaryOption()
    val secondary by secondaryOption()
    val tertiary by tertiaryOption()

    execute {
        val spec = normalizeSpec(
            themeName ?: DEFAULT_THEME_NAME,
            background ?: DEFAULT_BACKGROUND,
            primary ?: DEFAULT_PRIMARY,
            secondary ?: DEFAULT_SECONDARY,
            tertiary ?: DEFAULT_TERTIARY,
        )
        val asset = assetFor(spec)

        val themeListing = Fingerprint(
            definingClass = "Lcom/google/android/apps/inputmethod/libs/theme/listing/ThemeListingFragment;",
            name = "f",
            parameters = listOf("Landroid/os/Bundle;"),
            returnType = "V",
            // The adapter consumes v5 immediately after this constructor call.
            // Register the theme before that happens; appending at method exit
            // mutates a list the displayed adapter has already copied.
            filters = listOf(
                methodCall(
                    definingClass = "Ljxu;",
                    name = "<init>",
                    returnType = "V",
                ),
            ),
        )

        val adapterAnchor = themeListing.instructionMatches.lastOrNull()
            ?: error("Theme listing adapter construction anchor not found")

        // The list is fully built at this point, but has not yet been handed to
        // its adapter. This makes the new item visible on the initial render.
        themeListing.method.addInstructions(
            adapterAnchor.index,
            injection(asset),
        )
    }
}
