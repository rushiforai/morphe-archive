package app.sqzass.patches.all.spoofing

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.sqzass.patches.shared.collectElements
import app.sqzass.patches.shared.constStringLoad
import app.sqzass.patches.shared.findConstArgInvokes
import app.sqzass.patches.shared.forceInvokeResult
import app.sqzass.patches.shared.methodReferenceOf
import app.sqzass.patches.shared.patchMatchingMethods
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import java.util.logging.Logger

private val logger = Logger.getLogger("AmoledDarkThemePatch")

// Preference keys commonly used to gate an AMOLED/pure-black theme.
private val AMOLED_KEYS = setOf(
    "amoled", "amoled_dark", "amoled_mode", "amoled_theme",
    "pure_black", "true_black", "black_theme", "oled_dark",
)

private val COLOR_VALUE = Regex("#[0-9a-fA-F]{6,8}")

// Options are declared at file scope so the named resource patch can register them
// for the Manager while the unnamed internal bytecode patch reads the same instances.
private val forceAmoledPrefsOption = booleanOption(
    key = "forceAmoledPrefs",
    default = true,
    title = "Force AMOLED Preference",
    description = "Force known AMOLED/pure-black theme preference keys to report enabled.",
)
private val extraKeysOption = stringOption(
    key = "extraAmoledKeys",
    default = "",
    title = "Extra Preference Keys",
    description = "Comma-separated additional preference keys to force enabled.",
)
private val recolorOption = booleanOption(
    key = "recolorToBlack",
    default = false,
    title = "Recolor To Pure Black",
    description = "Replace matching color values in res/values XML files with pure black.",
)
private val recolorFromOption = stringOption(
    key = "recolorFrom",
    default = "#212121",
    title = "Source Color",
    description = "Color value to replace, as RRGGBB or AARRGGBB with a leading hash.",
    validator = { value -> value.isNullOrBlank() || COLOR_VALUE.matches(value) },
)
private val recolorToOption = stringOption(
    key = "recolorTo",
    default = "#000000",
    title = "Target Color",
    description = "Replacement color value, as RRGGBB or AARRGGBB with a leading hash.",
    validator = { value -> value.isNullOrBlank() || COLOR_VALUE.matches(value) },
)

private fun activeAmoledKeys(): Set<String> {
    val extra = extraKeysOption.value.orEmpty()
        .split(',')
        .map { it.trim() }
        .filter { it.isNotEmpty() }
    return AMOLED_KEYS + extra
}

private fun isThemePrefRead(instruction: Instruction): Boolean {
    val reference = methodReferenceOf(instruction) ?: return false
    return reference.definingClass == "Landroid/content/SharedPreferences;" &&
        reference.name == "getBoolean" &&
        reference.returnType == "Z"
}

// Internal patch that is not shown in Morphe Manager or the CLI patch list,
// but is required for the preference-forcing half of the AMOLED patch.
// ponytail: DataStore and custom preference wrappers are not covered;
// upgrade path is matching androidx DataStore read paths.
@Suppress("unused")
private val amoledDarkThemeInternalPatch = bytecodePatch {
    execute {
        if (forceAmoledPrefsOption.value != true) {
            logger.info("AMOLED preference forcing is off.")
            return@execute
        }

        val keys = activeAmoledKeys()
        val patched = patchMatchingMethods(
            isCandidate = { method ->
                method.implementation?.instructions?.let { raw ->
                    findConstArgInvokes(
                        raw.toList(),
                        { keys.contains(constStringLoad(it)) },
                        ::isThemePrefRead,
                    ).isNotEmpty()
                } == true
            },
        ) { instructions ->
            var count = 0
            val forced = findConstArgInvokes(
                instructions,
                { keys.contains(constStringLoad(it)) },
                ::isThemePrefRead,
            )
            for (index in forced) {
                if (forceInvokeResult(instructions, index) { register -> "const/4 v$register, 0x1" }) count++
            }
            count
        }

        logger.info("Forced AMOLED theme preference at $patched read sites.")
    }
}

@Suppress("unused")
val amoledDarkThemePatch = resourcePatch(
    name = "AMOLED dark theme force",
    description = "Forces AMOLED theme preference keys to their enabled state and can recolor dark theme values to pure black.",
    default = false,
) {
    category("Interface")

    forceAmoledPrefsOption()
    extraKeysOption()
    recolorOption()
    recolorFromOption()
    recolorToOption()

    dependsOn(amoledDarkThemeInternalPatch)

    execute {
        if (recolorOption.value != true) {
            logger.info("Color recoloring is off.")
            return@execute
        }

        val from = recolorFromOption.value?.trim().orEmpty()
        val to = recolorToOption.value?.trim().orEmpty()
        if (from.isEmpty() || to.isEmpty()) {
            logger.info("Recolor source or target color not set.")
            return@execute
        }

        // Every values resource file, including qualifier variants such as -night.
        // ponytail: exact value match only; theme-attribute indirection and
        // <item type="color"> definitions are not rewritten.
        var recolored = 0
        val resDir = get("res")
        val xmlFiles = if (resDir.exists()) {
            resDir.walkTopDown().filter { file ->
                file.isFile && file.name.endsWith(".xml") &&
                    !file.name.endsWith("public.xml") &&
                    file.parentFile.name.startsWith("values")
            }.toList()
        } else {
            emptyList()
        }
        for (file in xmlFiles) {
            val relativePath = "res/" + file.relativeTo(resDir).path.replace('\\', '/')
            document(relativePath).use { document ->
                val colors = collectElements(document, listOf("color")) { element ->
                    element.textContent.trim().equals(from, ignoreCase = true)
                }
                for (element in colors) {
                    element.textContent = to
                    recolored++
                }
            }
        }

        logger.info("Recolored $recolored color values from $from to $to.")
    }
}