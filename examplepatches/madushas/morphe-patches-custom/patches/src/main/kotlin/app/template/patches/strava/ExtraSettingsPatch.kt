package app.template.patches.strava

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants.STRAVA_COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction51l
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import java.io.File
import org.w3c.dom.Element

// ─────────────────────────────────────────────────────────────────────────────
// Extra Settings screen (P3, phase 1).
//
// Adds an "Extra Settings" row at the top of Strava's Settings page and a new
// native-themed activity. Phase 1 settings:
//   - Theme mode (writes the app's own pref.appearance.value + applies it
//     globally via UiModeManager — the same call Strava's AppearanceActivity
//     flow ends in) — RUNTIME, verified on device.
//   - About / patch info.
//
// Accent color: BUILD-TIME option (stringOption below). Rationale: theme-attr
// colors (colorAccent/colorControlActivated/colorPrimary — switches, radios,
// progress bars) resolve through framework TypedArray, unreachable from
// app-dex hooks; and the morphe pipeline's ARSC encoder cannot register NEW
// resource entries (new overlay styles/colors abort the build), only modify
// existing ones. So the accent is applied by rewriting the existing #fc5200
// brand family in the resource table at patch time — full coverage (theme
// attrs, resource lookups, drawables). Runtime remap funnels were tried and
// removed: they only cover direct Context.getColor call sites, which the
// theme-attr majority bypasses. Share PNGs stay brand-colored either way
// (Compose scheme constants, see recon/share-image-colors.md).
//
// Version-churn notes (for the 487.x audit):
//   - SettingsFragment class name is stable (non-obfuscated).
//   - Accent rewrite matches by VALUE (#fc5200 substring, case-insensitive)
//     in res/values/colors.xml + res/values-night/colors.xml — name changes
//     don't matter; loud-fails if zero entries found.
//
// Kotlin top-level val init order: manifest sub-patch BEFORE the main patch.
// ─────────────────────────────────────────────────────────────────────────────

// Accent presets: label → internal value. Static presets rewrite the brand
// family hexes (base tables + v31 overlays so every consumer — including
// Compose screens that qualify other tables — picks them up). "Material You"
// points the same entries at the bundled Material Components dynamic palette
// (m3_sys_color_dynamic_*), which Android 12+ resolves to the wallpaper.
private val ACCENT_PRESETS = linkedMapOf(
    "Strava orange" to "FC5200",
    "Material You (Android 12+)" to "MATERIAL_YOU",
    "Blue" to "2F80ED",
    "Green" to "27AE60",
    "Purple" to "9B51E0",
    "Pink" to "E91E63",
    "Teal" to "00897B",
    "Red" to "D32F2F",
    "Mono" to "607D8B",
)

/**
 * Resolved accent preset label, published by the resource patch's execute and
 * consumed by the bytecode patch (`extraSettingsPatch` dependsOn it, so this is
 * always set first). Null only if the resource patch did not run.
 */
private var morpheAccentSelection: String? = null

// Resolved share-overlay unlock switch (build-time option, resource patch).
private var morpheUnlockShareOverlays: Boolean = false

// DEBUG-only: export + unlock the SuperUserTools console (read by the
// bytecode patch from the suConsoleExport option).
internal var morpheSuConsole: Boolean = false


// Registered resource patch (so its stringOption appears in the options
// file / CLI). Carries the activity registration + the accent table rewrite.
internal val extraSettingsResourcePatch = resourcePatch(
    name = "Extra settings resources",
    description = "Registers the Extra Settings activity and applies the accent color.",
    default = true,
) {
    compatibleWith(STRAVA_COMPATIBILITY)

    val accent by stringOption(
        key = "stravaAccent",
        title = "Accent color",
        description = "Replaces the Strava orange brand color family app-wide.",
        default = "Strava orange",
        values = ACCENT_PRESETS.mapValues { it.key },
    )

    val suConsole by stringOption(
        key = "suConsoleExport",
        title = "Export SuperUser debug console",
        description = "Exports Strava's hidden SuperUserToolsActivity for adb access "
            + "(feature-switch console, modular-UI tools, network settings). "
            + "DEBUG-ONLY: any on-device app could then launch it. Off by default.",
        default = "false",
        values = mapOf("true" to "true", "false" to "false"),
    )

    val unlockShare by stringOption(
        key = "unlockShareOverlays",
        title = "Unlock share overlay designs",
        description = "Removes the subscriber lock from the sticker/share overlay carousel (all client-rendered designs become selectable).",
        default = "true",
        values = mapOf("true" to "true", "false" to "false"),
    )

    execute {
        // ── Register the activity ──────────────────────────────────────────
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as Element

            val activity = doc.createElement("activity")
            activity.setAttribute(
                "android:name",
                "app.template.extension.extension.StravaExtraSettingsActivity",
            )
            activity.setAttribute("android:label", "Extra Settings")
            activity.setAttribute("android:exported", "false")
            application.appendChild(activity)

            // Startup provider: installs the recording-screen touch shield.
            val provider = doc.createElement("provider")
            provider.setAttribute(
                "android:name",
                "app.template.extension.extension.StravaLockInitProvider",
            )
            provider.setAttribute(
                "android:authorities",
                "com.strava.morphe.lock",
            )
            provider.setAttribute("android:exported", "false")
            provider.setAttribute("android:initOrder", "200")
            application.appendChild(provider)

            // Optionally export Strava's own SuperUserToolsActivity
            // (feature-switch console) for adb access — a DEBUG tool. Off
            // by default: exported + finish-check removed is a security
            // surface any on-device app could poke.
            if (suConsole == "true") {
                val nodes = application.getElementsByTagName("activity")
                for (i in 0 until nodes.length) {
                    val el = nodes.item(i) as Element
                    if (el.getAttribute("android:name") ==
                        "com.strava.view.superuser.SuperUserToolsActivity"
                    ) {
                        el.setAttribute("android:exported", "true")
                        println("Extra settings: SuperUserToolsActivity exported for adb")
                        break
                    }
                }
            }
        }

        // ── Accent ─────────────────────────────────────────────────────────
        val chosen = ACCENT_PRESETS.entries.firstOrNull { accent == it.key }
            ?: throw PatchException(
                "Unknown accent '$accent' — expected one of ${ACCENT_PRESETS.keys}.",
            )
        val materialYou = chosen.value == "MATERIAL_YOU"
        // Hand the resolved selection to the bytecode patch (which dependsOn
        // this one, so it runs after) for the ARGB literal swap.
        morpheAccentSelection = chosen.key
        morpheUnlockShareOverlays = unlockShare == "true"
        morpheSuConsole = suConsole == "true"
        val newRgb = chosen.value.uppercase().takeIf { it != "MATERIAL_YOU" }
        val brandRgb = "FC5200"

        // Load both color tables: name → raw value.
        fun loadTable(path: String): MutableMap<String, String> {
            val map = mutableMapOf<String, String>()
            document(path).use { doc ->
                val colors = doc.getElementsByTagName("color")
                for (i in 0 until colors.length) {
                    val node = colors.item(i) as? Element ?: continue
                    map[node.getAttribute("name")] = node.textContent.trim()
                }
            }
            return map
        }
        val lightTable = loadTable("res/values/colors.xml")
        val nightTable = loadTable("res/values-night/colors.xml")

        // Resolve one @color/ reference (max depth 2).
        fun resolve(table: Map<String, String>, value: String, depth: Int = 0): String =
            if (value.startsWith("@color/") && depth < 2) {
                resolve(table, table[value.removePrefix("@color/")] ?: value, depth + 1)
            } else {
                value
            }

        // Brand family = every entry whose RESOLVED value carries the brand
        // orange, plus the extended (darker) orange shades.
        val brandNames = sortedSetOf<String>()
        for ((name, _) in lightTable) {
            if (resolve(lightTable, lightTable[name] ?: "").contains(brandRgb, ignoreCase = true)) {
                brandNames.add(name)
            }
        }
        for ((name, _) in nightTable) {
            if (resolve(nightTable, nightTable[name] ?: "").contains(brandRgb, ignoreCase = true)) {
                brandNames.add(name)
            }
        }
        brandNames.add("extended_orange_o1")
        brandNames.add("extended_orange_o2")

        if (brandNames.size < 10) {
            throw PatchException(
                "Accent rewrite found only ${brandNames.size} brand entries — color naming changed, re-audit.",
            )
        }

        // Overlay writer: append-or-replace <color> entries in a v31 table.
        // `dir` is the decoded-res-relative path, e.g. "res/values-v31".
        fun writeOverlay(dir: String, entries: Map<String, String>) {
            val target = File(get("res"), dir.removePrefix("res/")).apply { mkdirs() }
            val xml = File(target, "colors.xml")
            if (!xml.exists()) {
                xml.writeText("""<?xml version="1.0" encoding="utf-8"?>${System.lineSeparator()}<resources />""")
            }
            document("$dir/colors.xml").use { doc ->
                val resources = doc.documentElement
                val existing = mutableMapOf<String, Element>()
                val nodes = doc.getElementsByTagName("color")
                for (i in 0 until nodes.length) {
                    val node = nodes.item(i) as? Element ?: continue
                    existing[node.getAttribute("name")] = node
                }
                for ((name, value) in entries) {
                    val node = existing[name]
                    if (node != null) {
                        node.textContent = value
                    } else {
                        val color = doc.createElement("color")
                        color.setAttribute("name", name)
                        color.textContent = value
                        resources.appendChild(color)
                    }
                }
            }
        }

        // ── Drawable hex sweep: any vector/drawable XML carrying the brand
        // hex now references @color/global_brand (which this patch points at
        // the accent / Material You palette). Covers streak flame, map pins,
        // badges — the hardcoded-drawable orange stragglers.
        var drawablesChanged = 0
        val resDirectory = get("res")
        resDirectory.walkTopDown()
            .filter {
                it.isFile && it.name.endsWith(".xml") &&
                    it.relativeTo(resDirectory).path.startsWith("drawable")
            }
            .forEach { file ->
                val source = file.readText()
                if (!source.contains("fc5200", ignoreCase = true)) return@forEach
                // Quoted attribute values keep their quotes; bare values (theme
                // <item> text) get a plain reference.
                val updated = source
                    .replace(Regex("\"#(?:ff)?fc5200\"", RegexOption.IGNORE_CASE), "\"@color/global_brand\"")
                    .replace(Regex("#(?:ff)?fc5200", RegexOption.IGNORE_CASE), "@color/global_brand")
                file.writeText(updated)
                drawablesChanged++
            }
        println("Extra settings: drawable hex sweep — $drawablesChanged files -> @color/global_brand")

        if (materialYou) {
            // Material You: point the brand family at the bundled dynamic
            // palette; Android 12+ resolves it to the wallpaper. Below A12,
            // the untouched base tables keep the stock orange.
            fun toneFor(resolved: String, dark: Boolean): String {
                val sys = if (dark) "dark" else "light"
                val lower = resolved.lowercase()
                return when {
                    "extended_orange_o1" in lower -> "@color/material_dynamic_primary30"
                    "extended_orange_o2" in lower -> "@color/material_dynamic_primary50"
                    lower.startsWith("#") && lower.length == 9 -> { // #AARRGGBB
                        when (lower.substring(1, 3).toInt(16)) {
                            in 0x00..0x2F -> "@color/material_dynamic_primary95"
                            in 0x30..0x54 -> "@color/material_dynamic_primary90"
                            in 0x55..0x70 -> "@color/material_dynamic_primary80"
                            else -> "@color/m3_sys_color_dynamic_${sys}_primary"
                        }
                    }
                    else -> "@color/m3_sys_color_dynamic_${sys}_primary"
                }
            }

            val lightEntries = mutableMapOf<String, String>()
            val darkEntries = mutableMapOf<String, String>()
            for (name in brandNames) {
                val lightRaw = lightTable[name] ?: continue
                val darkRaw = nightTable[name] ?: lightRaw
                lightEntries[name] = toneFor(resolve(lightTable, lightRaw), dark = false)
                darkEntries[name] = toneFor(resolve(nightTable, darkRaw), dark = true)
            }
            writeOverlay("res/values-v31", lightEntries)
            writeOverlay("res/values-night-v31", darkEntries)
            println(
                "Extra settings: accent = Material You, " +
                    "${lightEntries.size} light + ${darkEntries.size} dark dynamic overrides",
            )
        } else {
            // Static preset: rewrite the base tables AND write v31 overlays
            // (literal hexes) so consumers that qualify other tables flip too.
            val rgb = newRgb ?: throw PatchException("Accent preset has no RGB value.")
            fun retabled(original: String): String {
                val body = original.removePrefix("#")
                return if (body.length == 8) {
                    "#" + body.substring(0, 2) + rgb
                } else {
                    "#" + rgb
                }
            }

            fun darken(hex: String, factor: Double): String {
                val body = hex.removePrefix("#").takeLast(6)
                val r = (body.substring(0, 2).toInt(16) * factor).toInt().coerceIn(0, 255)
                val g = (body.substring(2, 4).toInt(16) * factor).toInt().coerceIn(0, 255)
                val b = (body.substring(4, 6).toInt(16) * factor).toInt().coerceIn(0, 255)
                return "#%02x%02x%02x".format(r, g, b)
            }

            var changed = 0
            for (path in listOf("res/values/colors.xml", "res/values-night/colors.xml")) {
                document(path).use { doc ->
                    val colors = doc.getElementsByTagName("color")
                    for (i in 0 until colors.length) {
                        val node = colors.item(i) as? Element ?: continue
                        val resolved = resolve(
                            if (path.endsWith("night/colors.xml")) nightTable else lightTable,
                            node.textContent.trim(),
                        )
                        if (!resolved.contains(brandRgb, ignoreCase = true)) continue
                        node.textContent = retabled(node.textContent.trim())
                        changed++
                    }
                }
            }
            if (changed == 0) {
                throw PatchException(
                    "Accent rewrite found no #$brandRgb family entries — color values changed, re-audit.",
                )
            }

            val accentHex = "#$rgb"
            val o1 = darken(accentHex, 0.42)
            val o2 = darken(accentHex, 0.74)
            val lightOverlay = mutableMapOf<String, String>()
            val darkOverlay = mutableMapOf<String, String>()
            for (name in brandNames) {
                val lightRaw = lightTable[name] ?: continue
                val darkRaw = nightTable[name] ?: lightRaw
                val lightResolved = resolve(lightTable, lightRaw)
                val darkResolved = resolve(nightTable, darkRaw)
                lightOverlay[name] = when {
                    lightResolved.contains("extended_orange_o1") -> o1
                    lightResolved.contains("extended_orange_o2") -> o2
                    else -> retabled(lightRaw)
                }
                darkOverlay[name] = when {
                    darkResolved.contains("extended_orange_o1") -> o1
                    darkResolved.contains("extended_orange_o2") -> o2
                    else -> retabled(darkRaw)
                }
            }
            lightOverlay["extended_orange_o1"] = o1
            lightOverlay["extended_orange_o2"] = o2
            darkOverlay["extended_orange_o1"] = darken(o1, 0.9)
            darkOverlay["extended_orange_o2"] = darken(o2, 0.9)
            writeOverlay("res/values-v31", lightOverlay)
            writeOverlay("res/values-night-v31", darkOverlay)
            println(
                "Extra settings: accent = ${chosen.key}, rewrote $changed base entries + " +
                    "${lightOverlay.size} v31 overrides",
            )
        }
    }
}

@Suppress("unused")
val extraSettingsPatch = bytecodePatch(
    name = "Extra settings screen",
    description = "Adds an 'Extra Settings' entry at the top of Settings with theme mode " +
        "switching and patch info. Accent color is a build-time option.",
    default = true,
) {
    compatibleWith(STRAVA_COMPATIBILITY)

    dependsOn(extraSettingsResourcePatch)

    extendWith("extensions/extension.mpe")

    execute {
        // Local helper: in-place const-wide ARGB literal swap (shape-identical,
        // ART-safe). Returns the number of sites rewritten.
        fun swapBrandLiterals(replacements: Map<Long, Long>): Int {
            var literalSites = 0
            classDefForEach { classDef ->
                val mutable = mutableClassDefByOrNull(classDef.type) ?: return@classDefForEach
                for (method in mutable.methods) {
                    val impl = method.implementation ?: continue
                    impl.instructions.forEachIndexed { idx, instr ->
                        if (instr !is BuilderInstruction51l) return@forEachIndexed
                        val newValue = replacements[instr.wideLiteral] ?: return@forEachIndexed
                        impl.replaceInstruction(
                            idx,
                            BuilderInstruction51l(
                                com.android.tools.smali.dexlib2.Opcode.CONST_WIDE,
                                instr.registerA,
                                newValue,
                            ),
                        )
                        literalSites++
                    }
                }
            }
            if (literalSites == 0) {
                throw PatchException(
                    "Brand literal swap found no matching const-wide values — re-audit.",
                )
            }
            return literalSites
        }

        // Share overlay unlock (build-time option; .locals 1 in isLocked
        // leaves no registers for a runtime prefs gate — see note #8).
        // SharingCarouselItem$Local.isLocked()Z drives the "locked" state
        // of the sticker/share overlay carousel; always-false = all client
        // rendered overlays (incl. the subscriber-locked ones) unlock.
        if (morpheUnlockShareOverlays) {
            Fingerprint(
                definingClass = "Lcom/strava/sharing/domain/models/SharingCarouselItem\$Local;",
                name = "isLocked",
                returnType = "Z",
                accessFlags = listOf(AccessFlags.PUBLIC),
            ).method.apply {
                clearBody()
                addInstructions(0, "const/4 v0, 0x0\nreturn v0")
            }
            println("Extra settings: share overlay lock disabled (all designs unlocked)")
        }

        // SettingsFragment.onCreateView → rename + wrapper (header row above
        // the Compose list). See the header notes for why this is View-based.
        val fragmentType = "Lcom/strava/settings/view/settings/SettingsFragment;"
        val fragment = mutableClassDefBy(fragmentType)
        val original = fragment.methods.firstOrNull {
            it.name == "onCreateView" &&
                it.returnType == "Landroid/view/View;" &&
                it.parameters.size == 3 &&
                it.parameters[0].type == "Landroid/view/LayoutInflater;" &&
                it.parameters[1].type == "Landroid/view/ViewGroup;" &&
                it.parameters[2].type == "Landroid/os/Bundle;"
        } ?: throw PatchException(
            "SettingsFragment.onCreateView not found — Settings assembly changed, re-audit.",
        )

        val renamed = ImmutableMethod(
            fragmentType,
            "morpheOnCreateView",
            original.parameters,
            original.returnType,
            original.accessFlags,
            original.annotations,
            null,
            MutableMethodImplementation(original.implementation!!),
        ).toMutable()

        fragment.methods.remove(original)
        fragment.methods.add(renamed)

        val wrapper = ImmutableMethod(
            fragmentType,
            "onCreateView",
            original.parameters,
            original.returnType,
            original.accessFlags,
            null,
            null,
            MutableMethodImplementation(8),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    invoke-virtual {p0, p1, p2, p3}, $fragmentType->morpheOnCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
                    move-result-object v0
                    invoke-static {v0}, Lapp/template/extension/extension/StravaExtraHelper;->wrapSettingsView(Landroid/view/View;)Landroid/view/View;
                    move-result-object v0
                    return-object v0
                """.trimIndent(),
            )
        }
        fragment.methods.add(wrapper)

        println("Extra settings: SettingsFragment.onCreateView wrapped")

        // ── Brand literal swap (const-wide only — no new symbols) ──────────
        // The Compose colour-token classes (m0p light scheme, qac dark scheme,
        // mac/k0p palettes, do60, …) bake the brand orange into ARGB literals.
        // Resources can never reach them, so the scheme/scheme-derived chrome
        // (tab icon, streak flame, FABs, share-scheme colours) stayed orange.
        // Swapping the literal VALUE in place is byte-identical in shape
        // (const-wide → const-wide, same register) so there is nothing for
        // ART to resolve — unlike the helper-call approach that failed
        // (see SESSION-LOG P3). Only 3 literals are touched; every other
        // palette entry (whites, borders, data-viz series) is left alone.
        val chosenAccent = ACCENT_PRESETS.entries.firstOrNull { it.key == morpheAccentSelection }
        val chosenValue = chosenAccent?.value
        if (chosenValue == "MATERIAL_YOU") {
            // Neutral de-brand: the resource layer carries the wallpaper
            // palette, but the baked ARGB literals (tab icon, streak flame,
            // share overlays) can't be dynamic — swap them to a neutral
            // gray so nothing stays Strava orange in Material You mode.
            swapBrandLiterals(
                    mapOf(
                        0xFFFC5200L to 0xFF8E8E93L, // brand orange → neutral
                        0xFF973100L to 0xFF6D6D72L, // dark shade → neutral dark
                        0xFFC94100L to 0xFFAEAEB2L, // light shade → neutral light
                    ),
                )
        } else if (chosenValue != null) {
            fun lit(rgb: String): Long = 0xFF000000L or rgb.uppercase().toLong(16)

            fun shade(rgb: Long, factor: Double): Long {
                val r = (((rgb shr 16) and 0xFF) * factor).toInt().coerceIn(0, 255)
                val g = (((rgb shr 8) and 0xFF) * factor).toInt().coerceIn(0, 255)
                val b = ((rgb and 0xFF) * factor).toInt().coerceIn(0, 255)
                return 0xFF000000L or (r.toLong() shl 16) or (g.toLong() shl 8) or b.toLong()
            }

            val brand = lit(chosenValue)
            val sites = swapBrandLiterals(
                mapOf(
                    0xFFFC5200L to brand, // brand orange
                    0xFF973100L to shade(brand, 0.42), // extended_orange_o1
                    0xFFC94100L to shade(brand, 0.74), // extended_orange_o2
                ),
            )
            println(
                "Extra settings: accent = ${chosenAccent.key}, swapped $sites brand " +
                    "ARGB literals (0x${brand.toString(16)})",
            )
        }
    }
}
