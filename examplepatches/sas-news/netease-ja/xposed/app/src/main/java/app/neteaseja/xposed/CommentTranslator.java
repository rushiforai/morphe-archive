package app.neteaseja.xposed;

import android.app.Activity;
import android.content.SharedPreferences;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.TextView;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Personal-use comment translator.
 *
 * Adds a small floating "訳" button to the comment screen. Tapping it
 * translates visible Chinese comments in place (tap again to restore the
 * originals). Also auto-translates once shortly after the screen opens.
 *
 * Backend: free anonymous machine-translation API (no key). Comment text is
 * sent to that third-party service, cached on-device, and never logged.
 * Framework classes only, so the extension stays tiny.
 */
@SuppressWarnings("unused")
public final class CommentTranslator {
    private static final String BTN_TAG = "neteaseja_translate_btn";
    private static final String PREFS = "neteaseja_mt_cache";
    private static final int MAX_Q = 450;
    private static final int MAX_TARGETS = 60;
    /** Manual tap translates short texts too; auto mode only long bodies. */
    private static final int MIN_LEN_TAP = 6;
    private static final int MIN_LEN_AUTO = 12;

    /** Original comment text per view (view tags only offer one slot). */
    private static final java.util.WeakHashMap<TextView, String> ORIG =
            new java.util.WeakHashMap<>();

    private static final Map<String, String> CACHE =
            new LinkedHashMap<String, String>(256, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, String> e) {
                    return size() > 800;
                }
            };

    private static boolean showingTranslation = false;
    private static boolean prefsLoaded = false;

    private CommentTranslator() {
    }

    public static void attach(Activity activity) {
        if (activity == null) return;
        final View decor = activity.getWindow().getDecorView();
        if (!(decor instanceof ViewGroup)) return;
        if (decor.findViewWithTag(BTN_TAG) != null) return;

        final Button btn = new Button(activity);
        btn.setTag(BTN_TAG);
        btn.setText("訳");
        btn.setTextSize(13);
        btn.setAlpha(0.85f);
        final float density = activity.getResources().getDisplayMetrics().density;
        final FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.WRAP_CONTENT,
                FrameLayout.LayoutParams.WRAP_CONTENT,
                Gravity.END | Gravity.BOTTOM);
        final int m = (int) (16 * density);
        lp.setMargins(m, m, m, m * 5);

        decor.post(() -> {
            ((ViewGroup) decor).addView(btn, lp);
            btn.setOnClickListener(v -> toggle(activity, false));
            // Auto-translate once, shortly after the screen opens.
            decor.postDelayed(() -> {
                if (!showingTranslation) toggle(activity, true);
            }, 1200);
        });
    }

    private static void toggle(Activity activity, boolean autoOnly) {
        loadPrefs(activity);
        showingTranslation = !showingTranslation;
        View root = activity.getWindow().getDecorView();
        if (!(root instanceof ViewGroup)) return;
        List<TextView> targets = new ArrayList<>();
        collect((ViewGroup) root, targets, autoOnly ? MIN_LEN_AUTO : MIN_LEN_TAP);

        if (showingTranslation) {
            for (TextView tv : targets) {
                final String orig = tv.getText().toString();
                ORIG.put(tv, orig);
                final String cached;
                synchronized (CACHE) {
                    cached = CACHE.get(orig);
                }
                if (cached != null) {
                    tv.setText(cached);
                } else {
                    fetchAsync(activity, orig, translated -> {
                        if (translated == null) return;
                        tv.post(() -> {
                            if (showingTranslation && orig.equals(ORIG.get(tv))) {
                                tv.setText(translated);
                            }
                        });
                    });
                }
            }
        } else {
            for (TextView tv : targets) {
                String o = ORIG.get(tv);
                if (o != null) tv.setText(o);
            }
        }
    }

    private static void collect(ViewGroup parent, List<TextView> out, int minLen) {
        if (out.size() >= MAX_TARGETS) return;
        for (int i = 0; i < parent.getChildCount(); i++) {
            View v = parent.getChildAt(i);
            if (v == null || !v.isShown()) continue;
            if (BTN_TAG.equals(v.getTag())) continue;
            if (v instanceof EditText) continue;
            if (v instanceof TextView) {
                String t = ((TextView) v).getText().toString();
                if (t.length() >= minLen && containsCjk(t)) out.add((TextView) v);
            } else if (v instanceof ViewGroup) {
                collect((ViewGroup) v, out, minLen);
            }
            if (out.size() >= MAX_TARGETS) return;
        }
    }

    private static boolean containsCjk(String s) {
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if ((c >= 0x4E00 && c <= 0x9FFF) || (c >= 0x3400 && c <= 0x4DBF)) return true;
        }
        return false;
    }

    private interface Callback {
        void onResult(String translated);
    }

    private static void fetchAsync(Activity activity, String text, Callback cb) {
        final String q = text.length() > MAX_Q ? text.substring(0, MAX_Q) : text;
        new Thread(() -> {
            String out = fetch(q);
            if (out != null) {
                synchronized (CACHE) {
                    CACHE.put(text, out);
                }
                savePrefsAsync(activity);
            }
            cb.onResult(out);
        }).start();
    }

    private static String fetch(String q) {
        HttpURLConnection conn = null;
        try {
            String url = "https://api.mymemory.translated.net/get?q="
                    + URLEncoder.encode(q, "UTF-8") + "&langpair=zh-CN|ja";
            conn = (HttpURLConnection) new URL(url).openConnection();
            conn.setConnectTimeout(8000);
            conn.setReadTimeout(8000);
            conn.setRequestProperty("Accept", "application/json");
            if (conn.getResponseCode() != 200) return null;
            BufferedReader br = new BufferedReader(
                    new InputStreamReader(conn.getInputStream(), "UTF-8"));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) sb.append(line);
            br.close();
            JSONObject root = new JSONObject(sb.toString());
            if (root.optInt("responseStatus", 0) != 200) return null;
            String t = root.optJSONObject("responseData").optString("translatedText", "");
            t = unescape(t).trim();
            if (t.isEmpty() || t.equals(q)) return null;
            if (t.contains("QUERY LENGTH LIMIT") || t.contains("INVALID")) return null;
            return t;
        } catch (Exception e) {
            return null;
        } finally {
            if (conn != null) conn.disconnect();
        }
    }

    private static String unescape(String s) {
        return s.replace("&quot;", "\"").replace("&#39;", "'")
                .replace("&apos;", "'").replace("&lt;", "<")
                .replace("&gt;", ">").replace("&amp;", "&");
    }

    private synchronized static void loadPrefs(Activity activity) {
        if (prefsLoaded) return;
        prefsLoaded = true;
        try {
            SharedPreferences p = activity.getSharedPreferences(PREFS, 0);
            for (Map.Entry<String, ?> e : p.getAll().entrySet()) {
                if (e.getValue() instanceof String) CACHE.put(e.getKey(), (String) e.getValue());
            }
        } catch (Exception ignored) {
        }
    }

    private static void savePrefsAsync(Activity activity) {
        new Thread(() -> {
            try {
                SharedPreferences.Editor ed =
                        activity.getSharedPreferences(PREFS, 0).edit();
                ed.clear();
                int n = 0;
                synchronized (CACHE) {
                    for (Map.Entry<String, String> e : CACHE.entrySet()) {
                        if (n++ > 400) break;
                        ed.putString(e.getKey(), e.getValue());
                    }
                }
                ed.apply();
            } catch (Exception ignored) {
            }
        }).start();
    }
}
