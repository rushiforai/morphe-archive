import android.webkit.WebView;

import java.io.IOException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

/**
 * Calls every page patch method of the extension with a recording WebView and writes each injected
 * script to the output folder, named after the method. Methods with a String option get a sample value.
 *
 * Usage: java GenerateScripts <output dir>
 */
public final class GenerateScripts {

    private static final String[] CLASSES = {
            "app.jofslash.extension.quora.HideContentPatch",
            "app.jofslash.extension.quora.ReadingPatch",
            "app.jofslash.extension.quora.RemoveAdsPatch",
    };

    public static void main(String[] args) throws Exception {
        Path out = Path.of(args[0]);
        Files.createDirectories(out);
        int count = 0;
        for (String name : CLASSES) {
            for (Method m : Class.forName(name).getDeclaredMethods()) {
                if (!Modifier.isPublic(m.getModifiers()) || !Modifier.isStatic(m.getModifiers())) continue;
                Class<?>[] p = m.getParameterTypes();
                if (p.length == 0 || p[0] != WebView.class) continue;
                WebView webView = new WebView();
                if (p.length == 1) {
                    m.invoke(null, webView);
                } else if (p.length == 2 && p[1] == String.class) {
                    m.invoke(null, webView, sample(m.getName()));
                } else {
                    continue;
                }
                count += write(out, m.getName(), webView.scripts);
            }
        }
        if (count == 0) throw new IllegalStateException("No page scripts were generated");
        System.out.println("Generated " + count + " scripts");
    }

    private static String sample(String method) {
        switch (method) {
            case "filterKeywords":
                return "crypto, \"quoted\" word, Elon Musk, c++";
            case "blockAuthors":
                return "Jane Doe, Cats of Quora";
            case "answerFont":
                return "serif";
            default:
                return "";
        }
    }

    private static int write(Path out, String method, List<String> scripts) throws IOException {
        for (int i = 0; i < scripts.size(); i++) {
            Files.writeString(out.resolve(method + "-" + i + ".js"), scripts.get(i));
        }
        return scripts.size();
    }
}
