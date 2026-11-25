package dev.jason.gboardpatches.extension.customtheme;

import android.content.Context;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Immutable reviewed catalog embedded by the Custom Theme patch. */
public final class GboardCustomThemeCatalog {
    private static final String CATALOG_ASSET = "gboard-custom-themes/catalog.json";
    private GboardCustomThemeCatalog() { }

    public static List<Pack> load(Context context) throws Exception {
        JSONObject root;
        try (InputStream input = context.getAssets().open(CATALOG_ASSET)) {
            root = new JSONObject(readUtf8(input));
        }
        if (root.getInt("schemaVersion") != 1) throw new IllegalStateException("Unsupported catalog schema");
        JSONArray packsJson = root.getJSONArray("packs");
        List<Pack> packs = new ArrayList<Pack>(packsJson.length());
        for (int p = 0; p < packsJson.length(); p++) {
            JSONObject packJson = packsJson.getJSONObject(p);
            JSONArray themesJson = packJson.getJSONArray("themes");
            List<Theme> themes = new ArrayList<Theme>(themesJson.length());
            for (int t = 0; t < themesJson.length(); t++) {
                JSONObject theme = themesJson.getJSONObject(t);
                String preview = theme.isNull("preview") ? "" : theme.optString("preview", "");
                themes.add(new Theme(theme.getString("name"), theme.getString("entry"),
                        preview, theme.optBoolean("preferKeyBorder", false)));
            }
            packs.add(new Pack(packJson.getString("name"), packJson.optString("author", ""),
                    packJson.getString("url"), packJson.getString("sha256").toLowerCase(java.util.Locale.US),
                    packJson.getLong("bytes"), themes));
        }
        return Collections.unmodifiableList(packs);
    }

    private static String readUtf8(InputStream input) throws Exception {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[16384];
        int read;
        while ((read = input.read(buffer)) >= 0) if (read > 0) output.write(buffer, 0, read);
        return output.toString(StandardCharsets.UTF_8.name());
    }

    public static final class Pack {
        public final String name, author, url, sha256;
        public final long bytes;
        public final List<Theme> themes;
        Pack(String name, String author, String url, String sha256, long bytes, List<Theme> themes) {
            this.name = name; this.author = author; this.url = url; this.sha256 = sha256; this.bytes = bytes;
            this.themes = Collections.unmodifiableList(new ArrayList<Theme>(themes));
        }
    }
    public static final class Theme {
        public final String name, entry, previewAsset;
        public final boolean preferKeyBorder;
        Theme(String name, String entry, String previewAsset, boolean preferKeyBorder) {
            this.name = name; this.entry = entry; this.previewAsset = previewAsset; this.preferKeyBorder = preferKeyBorder;
        }
    }
}
