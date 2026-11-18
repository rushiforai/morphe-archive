package ca.mikem.morphe;

import app.morphe.patcher.patch.PatchKt;
import app.morphe.patcher.patch.RawResourcePatch;
import app.morphe.patcher.patch.RawResourcePatchBuilder;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/**
 * A manually selected no-op for Morphe's existing bundle merge/sign workflow.
 *
 * The builder deliberately registers no execution/finalization code, dependencies,
 * options, compatibility restrictions, or extensions. RawResourcePatch supplies
 * an empty execution block and requests no bytecode processing or decoded
 * resources. Morphe itself remains responsible for merging, signing and installing.
 */
public final class MergeXapkOnlyPatch {
    private MergeXapkOnlyPatch() {}

    public static final RawResourcePatch MERGE_XAPK_ONLY = PatchKt.rawResourcePatch(
        "Merge XAPK only",
        "Makes no app-code or resource edits. Morphe merges APK components and "
            + "signs the result with your key. The original signature is not "
            + "preserved. Separate OBB/game data is not installed.",
        false,
        new Function1<RawResourcePatchBuilder, Unit>() {
            @Override
            public Unit invoke(RawResourcePatchBuilder builder) {
                // Keep the patcher's default empty execute/finalize blocks.
                return Unit.INSTANCE;
            }
        }
    );
}
