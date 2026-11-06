// SPDX-License-Identifier: GPL-3.0-or-later
package app.morphe.extension.anki;

import android.app.*;
import android.content.*;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.os.Bundle;
import android.util.Base64;
import android.util.TypedValue;
import android.view.*;
import android.webkit.WebView;
import android.widget.TextView;
import java.io.*;
import java.util.*;

/** Runtime hooks use framework APIs only, avoiding obfuscated AnkiDroid internals. */
public final class AnkiTheme implements Application.ActivityLifecycleCallbacks {
    static final String FONT = "catppuccin_anki_font", SIZE = "catppuccin_anki_size";
    private static Application app;
    private static Typeface font;
    private static String fontKey = "";
    private static String encodedFont;
    private final Map<Activity, ViewTreeObserver.OnGlobalLayoutListener> listeners = new WeakHashMap<>();
    private final Map<Activity, String> signatures = new WeakHashMap<>();
    private final Map<TextView, Typeface> originalFonts = new WeakHashMap<>();
    private static final AnkiTheme INSTANCE = new AnkiTheme();
    static boolean dark = true;

    public static void install(Application application) {
        if (app != null) return;
        app = application;
        WidgetTheme.install(application);
        // Local test APKs must never discover the user's shared external collection.
        if (application.getPackageName().equals("com.ichi2.anki.catppuccin.test")) {
            File directory = new File(application.getFilesDir(), "patch-test-collection");
            directory.mkdirs();
            prefs(application).edit().putString("deckPath", directory.getAbsolutePath()).apply();
        }
        application.registerActivityLifecycleCallbacks(INSTANCE);
    }
    static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(context.getPackageName() + "_preferences", Context.MODE_PRIVATE);
    }
    static File custom(Context c) { return new File(c.getFilesDir(), "catppuccin-font.ttf"); }
    static String selection(Context c) { return prefs(c).getString(FONT, "default"); }
    static float scale(Context c) {
        int percent = prefs(c).getInt(SIZE, 100);
        return Arrays.asList(70,80,90,100,110,120,130,150).contains(percent) ? percent / 100f : 1f;
    }
    public static Context scaled(Context c) {
        float factor = scale(c);
        if (factor == 1f) return c;
        Configuration config = new Configuration(c.getResources().getConfiguration());
        config.fontScale *= factor;
        return c.createConfigurationContext(config);
    }
    static synchronized Typeface selectedFont(Context c) {
        String key = selection(c) + ":" + custom(c).lastModified();
        if (!key.equals(fontKey)) {
            fontKey = key; font = null; encodedFont = null;
            try {
                if (selection(c).equals("jetbrains")) font = Typeface.createFromAsset(c.getAssets(), "catppuccin/anki/JetBrainsMono-Regular.ttf");
                else if (selection(c).equals("custom")) font = Typeface.createFromFile(custom(c));
            } catch (RuntimeException e) { android.util.Log.e("AnkiCatppuccin", "Cannot load selected font", e); }
        }
        return font;
    }
    // Compose's Android font resolver passes through this cache-producing framework API.
    public static Typeface create(String family, int style) {
        Typeface chosen = app == null ? null : selectedFont(app);
        return chosen == null ? Typeface.create(family, style) : Typeface.create(chosen, style);
    }
    public static Typeface create(Typeface family, int style) {
        Typeface chosen = app == null ? null : selectedFont(app);
        return Typeface.create(chosen == null ? family : chosen, style);
    }
    public static Typeface defaultFont() {
        Typeface chosen = app == null ? null : selectedFont(app);
        return chosen == null ? Typeface.DEFAULT : chosen;
    }
    public static Typeface defaultBoldFont() {
        Typeface chosen = app == null ? null : selectedFont(app);
        return chosen == null ? Typeface.DEFAULT_BOLD : Typeface.create(chosen, Typeface.BOLD);
    }
    private void apply(View view) {
        if (view instanceof TextView) {
            TextView text = (TextView)view;
            Typeface chosen = selectedFont(view.getContext());
            if (chosen != null) {
                if (!originalFonts.containsKey(text)) originalFonts.put(text, text.getTypeface());
                int style = text.getTypeface() == null ? 0 : text.getTypeface().getStyle();
                Typeface styled = Typeface.create(chosen, style);
                if (!styled.equals(text.getTypeface())) text.setTypeface(styled);
            } else if (originalFonts.containsKey(text)) text.setTypeface(originalFonts.remove(text));
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup)view;
            for (int i=0;i<group.getChildCount();i++) apply(group.getChildAt(i));
        }
    }
    static String signature(Context c) { return selection(c)+":"+custom(c).lastModified()+":"+scale(c); }
    @Override public void onActivityResumed(Activity a) {
        String signature = signature(a);
        String previous = signatures.put(a, signature);
        if (previous != null && !previous.equals(signature)) { a.recreate(); return; }
        TypedValue value = new TypedValue();
        if (a.getTheme().resolveAttribute(android.R.attr.colorBackground,value,true)) {
            int color = value.resourceId != 0 ? a.getResources().getColor(value.resourceId,a.getTheme()) : value.data;
            dark = ((color >> 16) & 255) < 128;
        }
        View root = a.getWindow().getDecorView();
        apply(root);
        remove(a);
        ViewTreeObserver.OnGlobalLayoutListener listener = () -> apply(root);
        root.getViewTreeObserver().addOnGlobalLayoutListener(listener);
        listeners.put(a,listener);
    }
    private void remove(Activity a) {
        ViewTreeObserver.OnGlobalLayoutListener listener = listeners.remove(a);
        ViewTreeObserver observer = a.getWindow().getDecorView().getViewTreeObserver();
        if (listener != null && observer.isAlive()) observer.removeOnGlobalLayoutListener(listener);
    }
    @Override public void onActivityPaused(Activity a) { remove(a); }
    @Override public void onActivityDestroyed(Activity a) { remove(a); signatures.remove(a); }
    @Override public void onActivityCreated(Activity a, Bundle b) { signatures.put(a,signature(a)); }
    @Override public void onActivityStarted(Activity a) {}
    @Override public void onActivityStopped(Activity a) {}
    @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}

    static byte[] read(InputStream input) throws IOException {
        try (InputStream in = input; ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8192]; int count;
            while ((count = in.read(buffer)) != -1) {
                if (out.size() + count > 20 * 1024 * 1024) throw new IOException("Font exceeds 20 MiB");
                out.write(buffer, 0, count);
            }
            return out.toByteArray();
        }
    }
    static synchronized String fontData(Context c) throws IOException {
        if (selectedFont(c) == null) return "";
        if (encodedFont == null) {
            InputStream in = selection(c).equals("jetbrains") ? c.getAssets().open("catppuccin/anki/JetBrainsMono-Regular.ttf") : new FileInputStream(custom(c));
            encodedFont = Base64.encodeToString(read(in), Base64.NO_WRAP);
        }
        return encodedFont;
    }
    public static android.webkit.WebResourceResponse response(WebView view, android.webkit.WebResourceResponse response) {
        if(response == null || !"text/html".equals(response.getMimeType())) return response;
        try {
            String original = new String(read(response.getData()), "UTF-8");
            response.setData(new ByteArrayInputStream(html(view.getContext(), original).getBytes("UTF-8")));
            return response;
        } catch(IOException e) { android.util.Log.e("AnkiCatppuccin", "Cannot read page HTML", e); return response; }
    }
    public static void load(WebView view, String url, String data, String mime, String encoding, String history) {
        view.loadDataWithBaseURL(url, html(view.getContext(), data), mime, encoding, history);
    }
    public static String html(Context context, String html) {
        if (html == null || !html.contains("<html") || html.contains("id=\"catppuccin-anki\"")) return html;
        try {
            TypedValue value = new TypedValue();
            if(context.getTheme().resolveAttribute(android.R.attr.colorBackground,value,true)) {
                int color = value.resourceId != 0 ? context.getResources().getColor(value.resourceId,context.getTheme()) : value.data;
                dark = ((color >> 16) & 255) < 128;
            }
            String palette = new String(read(context.getAssets().open("catppuccin/anki/pages.css")), "UTF-8");
            String colors = dark ? "--canvas:#24273a;--fg:#cad3f5;--accent:#c6a0f6;--border:#494d64;--surface:#363a4f;" : "--canvas:#eff1f5;--fg:#4c4f69;--accent:#8839ef;--border:#bcc0cc;--surface:#e6e9ef;";
            String css = ":root{ "+colors+" }" + palette + new String(read(context.getAssets().open("catppuccin/anki/" + (dark ? "macchiato.css" : "latte.css"))), "UTF-8");
            String script = "";
            if (selectedFont(context) != null) {
                css += "@font-face{font-family:AnkiCatCustom;src:url(data:font/ttf;base64,"+fontData(context)+")}body,body *{font-family:AnkiCatCustom!important}";
                script = "<script>" + new String(read(context.getAssets().open("catppuccin/anki/font.js")),"UTF-8") + "</script>";
            }
            // Card preview already sets html zoom from the scaled Activity context.
            return html.replace("</head>", "<style id=\"catppuccin-anki\">"+css+"</style>"+script+"</head>");
        } catch (IOException e) { android.util.Log.e("AnkiCatppuccin", "Cannot theme card HTML", e); return html; }
    }
}
