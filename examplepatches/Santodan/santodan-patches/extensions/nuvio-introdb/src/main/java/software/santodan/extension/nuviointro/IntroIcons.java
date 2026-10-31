package software.santodan.extension.nuviointro;

import software.santodan.nuvio.NuvioNative;

/** Filmstrip + play/stop/check glyphs distinguish capture start, capture end and review. */
final class IntroIcons {
    private static final Object[] cached = new Object[3];
    static synchronized Object icon(ClassLoader loader, int stage) throws Exception {
        if (cached[stage] != null) return cached[stage];
        Object vector = loader.loadClass(NuvioNative.VECTOR_BUILDER_NAME).getDeclaredConstructor(String.class, float.class, float.class, float.class,
            float.class, long.class, int.class, boolean.class, int.class)
            .newInstance("IntroDB.Segment." + stage, 24f, 24f, 24f, 24f, 0L, 0, false, 96);
        Object path = loader.loadClass("io.sentry.d2").getDeclaredConstructor(int.class).newInstance(1);
        // Perforated frame, built as filled polygons with gaps rather than packed colors or paths.
        polygon(path, 2,3, 22,3, 22,5, 2,5);
        polygon(path, 2,19, 22,19, 22,21, 2,21);
        for (int y = 5; y < 19; y += 4) {
            polygon(path, 2,y, 5,y, 5,y+2, 2,y+2);
            polygon(path, 19,y, 22,y, 22,y+2, 19,y+2);
        }
        polygon(path, 5,5, 6,5, 6,19, 5,19);
        polygon(path, 18,5, 19,5, 19,19, 18,19);
        if (stage == 0) polygon(path, 9,7, 16,12, 9,17);
        else if (stage == 1) polygon(path, 9,8, 16,8, 16,16, 9,16);
        else polygon(path, 7,12, 9,10, 11,12, 15,8, 17,10, 11,16);
        Object brush = loader.loadClass("e2.a1").getDeclaredConstructor(long.class).newInstance((Long)IntroUi.constant(loader, NuvioNative.COLOR_NAME, "b"));
        IntroUi.method(loader.loadClass(NuvioNative.VECTOR_BUILDER_NAME), "a", 4).invoke(null, vector, IntroUi.field(path, "b"), 0, brush);
        cached[stage] = IntroUi.method(loader.loadClass(NuvioNative.VECTOR_BUILDER_NAME), "b", 0).invoke(vector);
        return cached[stage];
    }
    private static void polygon(Object path, float... points) throws Exception {
        IntroUi.method(path.getClass(), "o", 2).invoke(path, points[0], points[1]);
        for (int i = 2; i < points.length; i += 2) IntroUi.method(path.getClass(), "m", 2).invoke(path, points[i], points[i+1]);
        IntroUi.method(path.getClass(), "e", 0).invoke(path);
    }
}
