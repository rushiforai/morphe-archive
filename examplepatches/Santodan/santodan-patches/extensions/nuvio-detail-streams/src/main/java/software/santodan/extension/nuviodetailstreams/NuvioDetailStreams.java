package software.santodan.extension.nuviodetailstreams;

/** Presence of this bridge exposes only this independently selected patch's setting. */
public final class NuvioDetailStreams {
    public static void renderSettings(Object composer) throws Exception {
        Class.forName("software.santodan.extension.nuviostreams.NuvioStreamPreload")
            .getMethod("renderSettings", Object.class, String.class)
            .invoke(null, composer, "details");
    }
}
