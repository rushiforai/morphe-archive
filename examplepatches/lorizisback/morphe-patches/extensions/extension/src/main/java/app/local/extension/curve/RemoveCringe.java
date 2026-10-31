package app.local.extension.curve;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Build;
import android.widget.TextView;
import androidx.fragment.app.Fragment;
import org.json.JSONObject;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/** Rewrites only curated resource IDs and exact Launchpad feature titles. */
public final class RemoveCringe {
    private static final String PACKAGE = "com.imaginecurve.curve.prd";
    private static volatile JSONObject catalog;
    private static final Map<Integer, String> ids = new HashMap<>();
    private RemoveCringe() {}

    // Morphe changes this method only when Remove Cringe is selected.
    public static boolean isIncluded() { return false; }

    private static synchronized JSONObject load(Resources resources) {
        if (catalog != null) return catalog;
        try (InputStream stream = resources.getAssets().open("morphe_remove_cringe.json")) {
            java.io.ByteArrayOutputStream bytes = new java.io.ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            for (int count; (count = stream.read(buffer)) != -1;) bytes.write(buffer, 0, count);
            JSONObject parsed = new JSONObject(new String(bytes.toByteArray(), StandardCharsets.UTF_8));
            Iterator<String> names = parsed.getJSONObject("strings").getJSONObject("en").keys();
            while (names.hasNext()) {
                String name = names.next();
                int id = resources.getIdentifier(name, "string", PACKAGE);
                if (id != 0) ids.put(id, name);
            }
            catalog = parsed;
            return parsed;
        } catch (Exception error) {
            throw new IllegalStateException("Remove Cringe catalog could not be loaded", error);
        }
    }

    private static JSONObject strings(Resources resources) {
        JSONObject languages = load(resources).optJSONObject("strings");
        int count = Build.VERSION.SDK_INT >= 24 ? resources.getConfiguration().getLocales().size() : 1;
        for (int i = 0; i < count; i++) {
            String language = Build.VERSION.SDK_INT >= 24
                ? resources.getConfiguration().getLocales().get(i).getLanguage()
                : resources.getConfiguration().locale.getLanguage();
            if (language.equals("no")) language = "nb";
            JSONObject strings = languages.optJSONObject(language);
            if (strings != null) return strings;
        }
        return languages.optJSONObject("en");
    }

    private static String replacement(Resources resources, int id) {
        if (id == 0 || !isIncluded() || !PatchSettings.isCringeRemoved()) return null;
        // Google Play services also reads remote resources through the same Android APIs.
        try {
            if (!PACKAGE.equals(resources.getResourcePackageName(id))) return null;
        } catch (Resources.NotFoundException missing) {
            return null;
        }
        JSONObject strings = strings(resources);
        String name = ids.get(id);
        return name == null ? null : strings.optString(name, null);
    }

    static String menuLabel(Resources resources, String key, String original) {
        return isIncluded() && PatchSettings.isCringeRemoved() ? strings(resources).optString(key, original) : original;
    }

    static String summary(Resources resources) { return strings(resources).optString("morphe_cringe_summary"); }

    public static String getString(Resources resources, int id) {
        String text = replacement(resources, id);
        return text == null ? resources.getString(id) : text;
    }

    public static String getString(Resources resources, int id, Object[] arguments) {
        String text = replacement(resources, id);
        return text == null ? resources.getString(id, arguments)
            : String.format(resources.getConfiguration().locale, text, arguments);
    }

    public static CharSequence getText(Resources resources, int id) {
        String text = replacement(resources, id);
        return text == null ? resources.getText(id) : text;
    }

    public static String getString(Context context, int id) { return getString(context.getResources(), id); }
    public static String getString(Context context, int id, Object[] arguments) { return getString(context.getResources(), id, arguments); }
    public static CharSequence getText(Context context, int id) { return getText(context.getResources(), id); }
    public static String getString(Fragment fragment, int id) { return getString(fragment.getResources(), id); }
    public static String getString(Fragment fragment, int id, Object[] arguments) { return getString(fragment.getResources(), id, arguments); }
    public static CharSequence getText(Fragment fragment, int id) { return getText(fragment.getResources(), id); }

    public static String getString(TypedArray array, int index) {
        String text = replacement(array.getResources(), array.getResourceId(index, 0));
        return text == null ? array.getString(index) : text;
    }
    public static CharSequence getText(TypedArray array, int index) {
        String text = replacement(array.getResources(), array.getResourceId(index, 0));
        return text == null ? array.getText(index) : text;
    }
    public static void setText(TextView view, int id) {
        String text = replacement(view.getResources(), id);
        if (text == null) view.setText(id); else view.setText(text);
    }
    public static void setText(TextView view, int id, TextView.BufferType type) {
        String text = replacement(view.getResources(), id);
        if (text == null) view.setText(id, type); else view.setText(text, type);
    }

    public static String title(String original) {
        if (!isIncluded() || !PatchSettings.isCringeRemoved()) return original;
        Resources resources = PatchSettings.resources();
        JSONObject data = load(resources).optJSONObject("titles");
        Iterator<String> languages = data.keys();
        while (languages.hasNext()) {
            String key = data.optJSONObject(languages.next()).optString(original, null);
            if (key != null) return strings(resources).optString(key, original);
        }
        return original;
    }
}
