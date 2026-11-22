package app.revanced.patches.rif.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.w3c.dom.Element
import java.util.logging.Logger

// Morphe only. Patcheddit 2.5.0's "Inline media" shows the same images, albums, GIFs and videos in comments and text
// posts as our "Inline comment images", but not tables. Where both are applied, ours keeps inline tables only.
// dev/morphe-sync.py (INLINE_MEDIA_HANDOFF) puts the two finalize calls below into InlineCommentImagesPatch.kt; the
// ReVanced tree has none of this. All of Patcheddit's names that this bundle keys on are in this file.
//
// Decided when patching, in finalize blocks (after every patch has executed): patches run sorted by name, and ours
// ("Inline c...") runs before theirs ("Inline m..."), so their hook isn't there yet during our execute.
//  1. `inlineMediaForPatcheddit` (the bytecode patch's finalize) looks for their hook and, if it's there, makes our
//     extension's Settings.inlineTablesOnly() return true: no images or videos of ours, and table touches are recorded
//     through a touch delegate so their touch listener stays (InlineImages.attach).
//  2. `hideInlineMediaSettingsForPatcheddit` (the finalize of its settings resource patch, a dependency, which therefore
//     executed earlier and finalizes later: finalize blocks run in reverse execution order) removes the image and video
//     settings from our screen and logs the line dev/validate-morphe.sh checks.
// Not decided at runtime: Patcheddit's own switch for its Inline media doesn't bring ours back (maintainer, 2026-11-21).
// Without their Inline media (Patcheddit 2.4.0, or theirs deselected) nothing changes.

private val log = Logger.getLogger("rif patches")

private const val OURS = "Lapp/revanced/extension/rif"
private const val THEIRS_REDDIT = "Lapp/morphe/extension/redditisfun"

/** One of our extension methods to rewrite: [body] is smali put at the top of it. */
internal class EntryPoint(val type: String, val name: String, val descriptor: String, val body: String)

/**
 * @param targets rif classes (free and Platinum names) where Patcheddit puts its hook; its extension method is called
 * from there. Class names in the app: rif 5.6.22 is the only target.
 * @param theirs descriptor prefixes of the Patcheddit extension references its hook makes.
 */
internal class PatchedditFeature(
    val patchName: String,
    val targets: List<String>,
    val theirs: List<String>,
    val entryPoints: List<EntryPoint>,
) {
    /** True when a method in a target class calls Patcheddit's extension for this feature. */
    fun BytecodePatchContext.patchedditHooked(): Boolean {
        for (type in targets) {
            val classDef = classDefByOrNull(type) ?: continue
            for (method in classDef.methods) {
                val code = method.implementation ?: continue
                for (insn in code.instructions) {
                    val ref = (insn as? ReferenceInstruction)?.reference?.toString() ?: continue
                    if (theirs.any { ref.startsWith(it) }) return true
                }
            }
        }
        return false
    }
}

internal object PatchedditFeatures {
    // Their "Inline media" replaces the body setText in these binders (free / Platinum: thread list e5.g/f5.g,
    // comments-page post e5.u/f5.u, comment card n2.c/o2.c, comment n2.o/o2.o) with a call to its InlineMedia.setText.
    // The entry point is our flag, turned on.
    val INLINE_MEDIA = PatchedditFeature(
        "Inline comment images",
        listOf("Le5/g;", "Le5/u;", "Ln2/c;", "Ln2/o;", "Lf5/g;", "Lf5/u;", "Lo2/c;", "Lo2/o;"),
        listOf("$THEIRS_REDDIT/media/InlineMedia;->setText("),
        listOf(EntryPoint("$OURS/Settings;", "inlineTablesOnly", "()Z", "const/4 v0, 0x1\nreturn v0")),
    )
}

/** Puts each entry point's [EntryPoint.body] at the top of its method in our extension. */
private fun BytecodePatchContext.rewriteEntryPoints(feature: PatchedditFeature) {
    for (entry in feature.entryPoints) {
        val method = mutableClassDefBy(entry.type).methods.singleOrNull {
            it.name == entry.name && it.parameterTypes.joinToString("") + ")" + it.returnType == entry.descriptor.substring(1)
        } ?: throw PatchException("${entry.type}->${entry.name}${entry.descriptor} not found")
        method.addInstructions(0, entry.body)
    }
}

// What this run's bytecode finalize decided (true = tables only), for the settings resource patch's finalize, which runs
// right after it. Set on every run; cleared once read.
private var inlineTablesOnlyDecision: Boolean? = null

/** Finalize block of "Inline comment images": with Patcheddit's Inline media applied too, ours keeps tables only. */
internal fun BytecodePatchContext.inlineMediaForPatcheddit() {
    val feature = PatchedditFeatures.INLINE_MEDIA
    val theirs = with(feature) { patchedditHooked() }
    inlineTablesOnlyDecision = theirs
    if (theirs) rewriteEntryPoints(feature)
}

// Settings of Inline comment images that stay in tables-only mode; all others in its category are images and videos.
private val TABLE_SETTINGS = setOf("INLINE_TABLES")

/**
 * Finalize block of Inline comment images' settings resource patch: in tables-only mode, removes the image and video
 * settings from our screen and names the category after what's left. Logs the one line validate-morphe.sh checks.
 */
internal fun ResourcePatchContext.hideInlineMediaSettingsForPatcheddit() {
    val tablesOnly = inlineTablesOnlyDecision
    inlineTablesOnlyDecision = null
    if (tablesOnly != true) return
    document("res/xml/revanced_preferences.xml").use { doc ->
        val all = doc.getElementsByTagName("*")
        val tables = (0 until all.length).map { all.item(it) as Element }
            .singleOrNull { it.getAttribute("android:key") == "INLINE_TABLES" }
            ?: throw PatchException("Inline comment images: the INLINE_TABLES setting was not found")
        val category = tables.parentNode as Element
        val children = (0 until category.childNodes.length).map { category.childNodes.item(it) }
        for (child in children) {
            if (child is Element && child.getAttribute("android:key") !in TABLE_SETTINGS) category.removeChild(child)
        }
        category.setAttribute("app:title", "Tables")
    }
    log.info("\"${PatchedditFeatures.INLINE_MEDIA.patchName}\": Patcheddit's Inline media also applied; ours keeps inline tables only")
}
