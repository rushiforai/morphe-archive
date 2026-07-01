package app.ynotzort.patches.targo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal

// Resource id of the "Wichtiger Hinweis" block-dialog title in TargoBank V12.68.1.
// It is the ONLY app-wide reference to this id, so it is a unique, name-independent
// anchor. If a future build shifts resource ids, resolve it by name instead
// (see MORPHE_PATCH_REFERENCE.md §8 Hardening).
internal const val IMPORTANT_NOTICE_TITLE_ID = 0x7f130575

// Matches o.OF$AUx.aux(Lo/aQq;)Lo/bFm; — the method that builds the "rooted device"
// block dialog. In a single method it both loads the title resource above AND calls
// the verdict object's three boolean getters (o.aNj.con()/Aux()/AuX()). We anchor on
// the resource literal and discover the getters from the bytecode at patch time, so
// obfuscated class/method renames between releases do not break the patch.
//
// Fingerprints declared as objects (not the deprecated fingerprint{} DSL) so a failed
// match names this fingerprint in the stack trace.
internal object RootDialogBuilderFingerprint : Fingerprint(
    // aux(Lo/aQq;)Lo/bFm; — one obfuscated object parameter, obfuscated object return.
    // Bare "L" matches any object type (obfuscated names change between releases).
    parameters = listOf("L"),
    returnType = "L",
    filters = listOf(
        literal(IMPORTANT_NOTICE_TITLE_ID),
    ),
)
