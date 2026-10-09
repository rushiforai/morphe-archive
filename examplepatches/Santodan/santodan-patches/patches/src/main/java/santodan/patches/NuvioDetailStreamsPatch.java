package santodan.patches;
import app.morphe.patcher.patch.BytecodePatch;

public final class NuvioDetailStreamsPatch {
    public static BytecodePatch getNuvioDetailStreamsPatch() {
        return NuvioStreamPreloadPatch.create("NuvioTV - Preload streams on detail page",
            "Adds an opt-in Streams setting to search sources for the detail page's Play or Resume episode or movie, reusing Nuvio's native search cache.", true);
    }
}
