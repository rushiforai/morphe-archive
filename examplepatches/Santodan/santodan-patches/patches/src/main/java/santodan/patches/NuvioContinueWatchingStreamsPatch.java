package santodan.patches;
import app.morphe.patcher.patch.BytecodePatch;

public final class NuvioContinueWatchingStreamsPatch {
    public static BytecodePatch getNuvioContinueWatchingStreamsPatch() {
        return NuvioStreamPreloadPatch.create("NuvioTV - Preload streams in Continue Watching",
            "Adds an opt-in Streams setting to search sources in the background for visible Continue Watching episodes and movies, reusing Nuvio's native search cache.", false);
    }
}
