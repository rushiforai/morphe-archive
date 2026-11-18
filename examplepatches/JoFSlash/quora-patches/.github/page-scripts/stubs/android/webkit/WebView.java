package android.webkit;

import java.util.ArrayList;
import java.util.List;

/** Test stand-in that records every script a page patch injects. */
public class WebView extends android.view.View {
    public final List<String> scripts = new ArrayList<>();

    public void evaluateJavascript(String script, ValueCallback<String> callback) {
        scripts.add(script);
    }

    public void reload() {
    }
}
