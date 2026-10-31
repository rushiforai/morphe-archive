package santodan.patches;

import app.morphe.patcher.patch.BytecodePatchContext;

final class Pillo627Progress {
    static void apply(BytecodePatchContext context) {
        Pillo627Contracts.progress(Pillo627.classes(context));
        Pillo627.redirect(Pillo627.method(context, Pillo627.PROGRESS_SCREEN, Pillo627.PROGRESS_CONTENT),
            "Lz0/l;", "c", Pillo627.PROGRESS, "progress");
    }
}
