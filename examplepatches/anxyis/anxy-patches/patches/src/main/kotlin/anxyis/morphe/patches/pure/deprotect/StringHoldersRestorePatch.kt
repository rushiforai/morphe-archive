package anxyis.morphe.patches.pure.deprotect

import app.morphe.patcher.patch.bytecodePatch
import anxyis.morphe.patches.pure.shared.ALIGHT_5270
import anxyis.morphe.patches.pure.shared.bakeStringClinit
import anxyis.morphe.patches.pure.shared.bundledText

/**
 * R8 string-holder restoration (the "clinit noise" that is NOT noise).
 *
 * FACT: stock 5.0.270 ships 32 classes with `public static String` fields
 * and NO <clinit> (R8 string consolidation: StartupLauncher.restoreString()
 * populated cS.Zv.SzFNXybiSxdx-adjacent holders at runtime from the VM).
 * With the VM dead, those fields stay null -> NPEs across the app.
 * Tanryu bakes a static <clinit> per class assigning all 1,463 strings
 * (verified: field counts match stock declarations exactly).
 *
 * We do the same from the bundled TSV (pure-bundle/depairip_strings.tsv,
 * extracted from the Tanryu-side tree by tools/extract_strings.py):
 *   @Ltype;  lines, then  field<TAB>value  lines
 * (tabs/newlines inside values are \-escaped at extraction).
 *
 * 32 classes / 1,463 pairs asserted at runtime (count mismatch = wrong base
 * or truncated bundle -> fail fast).
 */
@Suppress("unused")
val stringHoldersRestorePatch = bytecodePatch(
    name = "App text fix",
    description = "Restores app text needed to keep everything working.",
) {
    compatibleWith(ALIGHT_5270)
    execute {
        val raw = bundledText("pure-bundle/depairip_strings.tsv")
        var type: String? = null
        var pairs = mutableListOf<Pair<String, String>>()
        var classes = 0
        var strings = 0
        fun flush() {
            val t = type ?: return
            bakeStringClinit(t, pairs)
            classes++
            strings += pairs.size
            pairs = mutableListOf()
        }
        for (line in raw.lineSequence()) {
            if (line.isBlank()) continue
            if (line.startsWith("@")) {
                flush()
                type = line.substring(1)
            } else {
                val tab = line.indexOf('\t')
                val field = line.substring(0, tab)
                val value = line.substring(tab + 1)
                    .replace("\\t", "\t").replace("\\n", "\n")
                pairs.add(field to value)
            }
        }
        flush()
        if (classes != 32 || strings != 1463) {
            throw app.morphe.patcher.patch.PatchException(
                "Pure: string restore got $classes classes / $strings strings, expected 32/1463",
            )
        }
    }
}
