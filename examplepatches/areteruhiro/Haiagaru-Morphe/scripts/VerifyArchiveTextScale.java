import java.nio.file.*;
import javax.tools.ToolProvider;

/** Executes the native archive screen's actual size calculations without Android. */
public class VerifyArchiveTextScale {
    public static void main(String[] args) throws Exception {
        String source = Files.readString(Path.of("extensions/chmate/src/main/java/app/morphe/extension/chmate/EddiArchiveSearchUi.java"));
        String math = source.substring(source.indexOf("    static int clampTextScale"),
                source.indexOf("    private TextView resultText"));
        Path temp = Files.createTempDirectory("haiagaru-archive-text-");
        try {
            Path file = temp.resolve("ArchiveScale.java");
            Files.writeString(file, "public class ArchiveScale {" + math + "}");
            if (ToolProvider.getSystemJavaCompiler().run(null, null, null,
                    "-d", temp.toString(), file.toString()) != 0) throw new AssertionError("compile");
            try (var loader = new java.net.URLClassLoader(new java.net.URL[]{temp.toUri().toURL()})) {
                Class<?> type = loader.loadClass("ArchiveScale");
                var clamp = type.getDeclaredMethod("clampTextScale", int.class);
                var size = type.getDeclaredMethod("scaledTextSize", float.class, int.class);
                clamp.setAccessible(true); size.setAccessible(true);
                for (int value : new int[]{Integer.MIN_VALUE, -1, 0, 69, 70, 80, 100, 120, 150, 151, Integer.MAX_VALUE}) {
                    int expected = Math.max(70, Math.min(150, value));
                    if ((int) clamp.invoke(null, value) != expected) throw new AssertionError("clamp " + value);
                    for (float base : new float[]{12, 14, 16, 18, 21}) {
                        float actual = (float) size.invoke(null, base, value);
                        if (Math.abs(actual - base * expected / 100f) > .001f)
                            throw new AssertionError("scale " + value);
                    }
                }
                if (!source.contains("controlTextSizes.remove(view)")
                        || !source.contains("resultTextSizes.clear()"))
                    throw new AssertionError("result views must not accumulate or inherit control scale");
                String save = source.substring(source.indexOf("    private void saveAppearance"), source.indexOf("    private LinearLayout row"));
                if (save.contains("search(") || save.contains("recreate(") || save.contains("keyword.setText"))
                    throw new AssertionError("appearance changes must not reload results or reset query");
                String compose = Files.readString(Path.of("extensions/chmate/src/main/kotlin/app/morphe/extension/chmate/ModelUi.kt"));
                for (String bridge : new String[]{"LocalDensity provides controlsDensity", "LocalDensity provides resultsDensity",
                        "view.getTag(EddiArchiveSearchUi.CONTROL_SCALE_TAG)", "view.getTag(EddiArchiveSearchUi.RESULT_SCALE_TAG)"})
                    if (!compose.contains(bridge)) throw new AssertionError("Compose scale bridge missing: " + bridge);
                if (!source.contains("root.setTag(CONTROL_SCALE_TAG, controlScale)") || !source.contains("root.setTag(RESULT_SCALE_TAG, resultScale)"))
                    throw new AssertionError("controller must notify the Compose presentation");
                System.out.println("PASS: 66 archive text-scale calculations, independent result scale, no appearance-triggered search/reset");
            }
        } finally {
            try (var paths = Files.walk(temp)) {
                for (Path path : paths.sorted(java.util.Comparator.reverseOrder()).toList()) Files.delete(path);
            }
        }
    }
}
