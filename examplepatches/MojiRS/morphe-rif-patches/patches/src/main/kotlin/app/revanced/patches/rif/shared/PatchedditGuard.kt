package app.revanced.patches.rif.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.w3c.dom.Element
import org.w3c.dom.Node
import java.util.logging.Logger

// Morphe only. Patcheddit 2.5.0 ships its own versions of five of our patches (same names). Where
// both bundles are selected, ours must step aside. dev/morphe-sync.py puts the calls below into those
// five patches (`skipForPatcheddit` first in every execute block, `switchOffForPatcheddit` as the
// patch's finalize block); the ReVanced tree has none of this.
//
// Why two layers: patches run sorted by name, and a tie (same name, two bundles) keeps the order the
// bundles were loaded in (Patcher.kt: `executablePatches.sortedBy { it.name }`, a stable sort).
//  1. Patcheddit's copy ran first: its hook is in the target classes now. `skipForPatcheddit` sees it
//     and our execute does nothing (our fingerprints would also miss: Patcheddit's `wrapMorpheHook`
//     moves the hooked body into `morpheOriginal_<name>_0`).
//  2. Ours ran first and hooked rif; Patcheddit's copy then wrapped the same code. Both would act at
//     runtime, so `switchOffForPatcheddit` (finalize, after every execute has run, so it sees
//     Patcheddit's hook whatever the order) makes our extension's entry points return at once.
// Without Patcheddit's copy (Patcheddit 2.4.0 and older) neither layer changes anything.

private val log = Logger.getLogger("rif patches")

private const val OURS = "Lapp/revanced/extension/rif"
private const val THEIRS_REDDIT = "Lapp/morphe/extension/redditisfun"
private const val THEIRS_SHARED = "Lapp/morphe/extension/shared/fixes"

/** One of our extension methods to turn into a no-op: [body] is smali that returns the pass-through value. */
internal class EntryPoint(val type: String, val name: String, val descriptor: String, val body: String)

/** A resource of Patcheddit's own copy: [text] occurs in an attribute value or leaf text of the XML at [path]. */
internal class ResourceMarker(val path: String, val text: String)

/**
 * @param targets rif classes (free and Platinum names) where Patcheddit's own copy puts its hook; its
 * extension class is referenced from there. Class names in the app: rif 5.6.22 is the only target.
 * @param theirs descriptor prefixes of Patcheddit's extension classes for the feature.
 * @param resourceMarkers where Patcheddit's own copy leaves a trace in resources, for our resource patches
 * (they have no access to classes).
 */
internal class PatchedditFeature(
    val patchName: String,
    val targets: List<String>,
    val theirs: List<String>,
    val entryPoints: List<EntryPoint>,
    val resourceMarkers: List<ResourceMarker> = emptyList(),
) {
    /** True when a method in a target class calls Patcheddit's extension class for this feature. */
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

private const val RETURN_VOID = "return-void"
private const val RETURN_FALSE = "const/4 v0, 0x0\nreturn v0"
private const val RETURN_P1 = "return-object p1"

internal object PatchedditFeatures {
    val EXPLAIN_REDDIT_BLOCKS = PatchedditFeature(
        "Explain Reddit blocks",
        listOf("Lh3/c;", "Li3/c;"),
        listOf("$THEIRS_REDDIT/feed/RedditBlocks;"),
        listOf(
            EntryPoint("$OURS/RedditBlocks;", "noteRequest", "(Z)V", RETURN_VOID),
            EntryPoint("$OURS/RedditBlocks;", "inspect", "(Ljava/lang/Object;Ljava/io/InputStream;)Ljava/io/InputStream;", RETURN_P1),
            EntryPoint("$OURS/RedditBlocks;", "handle", "(Ljava/lang/Object;Landroid/content/Context;)Z", RETURN_FALSE),
        ),
    )

    val POST_TO_PROFILE = PatchedditFeature(
        "Post to profile",
        listOf("Lcom/andrewshu/android/reddit/submit/m;", "Lcom/andrewshu/android/reddit/user/c\$c;"),
        listOf("$THEIRS_REDDIT/profile/ProfilePosting;"),
        listOf(
            EntryPoint("$OURS/PostToProfile;", "install", "(Landroid/view/View;Ljava/lang/Object;)V", RETURN_VOID),
            EntryPoint("$OURS/PostToProfile;", "accountChanged", "(Ljava/lang/Object;)V", RETURN_VOID),
            EntryPoint("$OURS/PostToProfile;", "profileOwn", "(Z)V", RETURN_VOID),
            EntryPoint("$OURS/PostToProfile;", "profileMenu", "(Landroid/view/Menu;Landroid/app/Activity;)V", RETURN_VOID),
            EntryPoint("$OURS/PostToProfile;", "profileMenuItem", "(Landroid/app/Activity;Landroid/view/MenuItem;)Z", RETURN_FALSE),
        ),
        listOf(ResourceMarker("res/layout/submit_fragment.xml", "patcheddit_my_profile")),
    )

    val FIX_HISTORY_IMPORT = PatchedditFeature(
        "Fix history import",
        listOf("Lcom/andrewshu/android/reddit/settings/export/c;"),
        listOf("$THEIRS_REDDIT/history/HistoryImport;"),
        listOf(
            EntryPoint("$OURS/HistoryImport;", "onImportEntry", "(Ljava/lang/String;Ljava/util/zip/ZipInputStream;)V", RETURN_VOID),
        ),
        listOf(ResourceMarker("res/values/strings.xml", "Imports any history in the backup")),
    )

    val FIX_BROKEN_MARKDOWN_LINKS = PatchedditFeature(
        "Fix broken markdown links",
        listOf("Lo5/z;", "Lp5/z;"),
        listOf("$THEIRS_SHARED/links/RelativeMarkdownLinks;"),
        listOf(
            EntryPoint("$OURS/BrokenLinks;", "repair", "(Landroid/text/Spannable;)V", RETURN_VOID),
        ),
    )

    val FIX_COMMENT_VIDEO_LINKS = PatchedditFeature(
        "Fix comment video links",
        listOf("Lj2/a\$b;", "Lk2/a\$b;"),
        listOf("$THEIRS_REDDIT/CommentVideoPatch;", "$THEIRS_SHARED/media/CommentVideoLinks;"),
        listOf(
            EntryPoint("$OURS/VideoLinks;", "orStreamFallback", "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", RETURN_P1),
        ),
    )
}

// Features whose execute block skipped in the current run (by patch name), so the finalize step leaves
// our extension alone: our hook isn't there. Keyed by the run's bytecode context, so another run in the
// same process starts clean.
private val skippedIn = HashMap<String, BytecodePatchContext>()

/** First line of the bytecode execute blocks: true (and one log line) when Patcheddit's own copy is already applied. */
internal fun BytecodePatchContext.skipForPatcheddit(feature: PatchedditFeature): Boolean {
    if (!with(feature) { patchedditHooked() }) return false
    skippedIn[feature.patchName] = this
    log.info("\"${feature.patchName}\" skipped: Patcheddit's own version is already applied")
    return true
}

/**
 * First line of the resource execute blocks of the patches above: true when Patcheddit's own copy has
 * already left its resources (it ran first). If ours ran first, our resources stay: they are inert (the
 * extension, switched off below, never shows them).
 */
internal fun ResourcePatchContext.skipResourcesForPatcheddit(feature: PatchedditFeature): Boolean {
    for (marker in feature.resourceMarkers) {
        var found = false
        document(marker.path).use { doc ->
            val all = doc.getElementsByTagName("*")
            for (i in 0 until all.length) {
                val element = all.item(i) as Element
                val attributes = element.attributes
                for (a in 0 until attributes.length) {
                    if (attributes.item(a).nodeValue.contains(marker.text)) found = true
                }
                val leaf = (0 until element.childNodes.length).none { element.childNodes.item(it).nodeType == Node.ELEMENT_NODE }
                if (leaf && element.textContent.contains(marker.text)) found = true
            }
        }
        if (found) return true
    }
    return false
}

/**
 * The patch's finalize block, after every patch has executed: if our hook went in and Patcheddit's copy
 * hooked the same feature too (it ran after ours), make our extension methods for it return at once.
 */
internal fun BytecodePatchContext.switchOffForPatcheddit(feature: PatchedditFeature) {
    if (skippedIn[feature.patchName] === this) return
    if (!with(feature) { patchedditHooked() }) return
    for (entry in feature.entryPoints) {
        val method = mutableClassDefBy(entry.type).methods.singleOrNull {
            it.name == entry.name && it.parameterTypes.joinToString("") + ")" + it.returnType == entry.descriptor.substring(1)
        } ?: throw PatchException("${entry.type}->${entry.name}${entry.descriptor} not found")
        method.addInstructions(0, entry.body)
    }
    log.info("\"${feature.patchName}\": Patcheddit's own version also applied; our hook calls switched off")
}
