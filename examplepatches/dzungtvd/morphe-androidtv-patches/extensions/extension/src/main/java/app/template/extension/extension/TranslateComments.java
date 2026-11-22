package app.template.extension.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.os.Handler;
import android.os.Looper;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.text.style.RelativeSizeSpan;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Translates comments and captions through TikTok's signed translation endpoint. */
@SuppressWarnings("unused")
public final class TranslateComments {

    private static final String TAG = "TikTokTVTranslate";

    static final String PREFS = "TikTokTVTranslation";
    static final String PREF_ALWAYS = "always";
    static final String PREF_TARGET = "target";
    static final String PREF_CAPTION = "caption";
    static final String PREF_DONT = "dont";

    /** A translated string and the source language the service reported for it. */
    private static final class Translation {
        final String text;
        final String srcLang;

        Translation(String text, String srcLang) {
            this.text = text;
            this.srcLang = srcLang;
        }
    }

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService HTTP = Executors.newSingleThreadExecutor();

    /** cid -> translation, and aweme id -> caption translation. */
    private static final Map<String, Translation> CACHE = new ConcurrentHashMap<>();
    private static final Map<String, Translation> CAPTIONS = new ConcurrentHashMap<>();

    /** cid -> the language the comment wire declared for it (text_language). */
    private static final Map<String, String> LANG = new ConcurrentHashMap<>();

    /** The live comment views, so an answer can paint the row it belongs to. */
    private static final Map<String, WeakReference<TextView>> CID_VIEW = new ConcurrentHashMap<>();
    private static final Map<TextView, String> VIEW_CID =
            Collections.synchronizedMap(new WeakHashMap<TextView, String>());
    private static final Map<String, WeakReference<Object>> COMMENTS = new ConcurrentHashMap<>();

    /** Comments waiting for the next batch. */
    private static final Map<String, Object> PENDING = new LinkedHashMap<>();
    private static boolean flushScheduled;

    /** The caption currently on screen, and the view that shows it. */
    private static WeakReference<View> captionRoot = new WeakReference<>(null);
    private static String captionId;
    private static String captionText;
    private static String captionLang;

    private TranslateComments() {
    }

    // ---- preferences -------------------------------------------------------------------------

    public static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    public static boolean isAlways(Context context) {
        return context != null && prefs(context).getBoolean(PREF_ALWAYS, false);
    }

    public static boolean isCaption(Context context) {
        return context != null && prefs(context).getBoolean(PREF_CAPTION, false);
    }

    public static String target(Context context) {
        if (context == null) return "";
        String saved = prefs(context).getString(PREF_TARGET, "");
        return saved == null || saved.isEmpty() ? Locale.getDefault().getLanguage() : saved;
    }

    public static Set<String> dont(Context context) {
        if (context == null) return Collections.emptySet();
        try {
            Set<String> saved = prefs(context).getStringSet(PREF_DONT, Collections.emptySet());
            return saved == null ? Collections.<String>emptySet() : saved;
        } catch (Throwable failure) {
            return Collections.emptySet();
        }
    }

    public static void setDont(Context context, Set<String> codes) {
        if (context == null) return;
        prefs(context).edit().putStringSet(PREF_DONT, codes).apply();
    }

    public static boolean isDont(Context context, String code) {
        String base = base(code);
        if (base.isEmpty()) return false;
        for (String entry : dont(context)) {
            if (base(entry).equalsIgnoreCase(base)) return true;
        }
        return false;
    }

    /** The language name a viewer reads in the UI language, e.g. "Spanish". */
    public static String languageName(String code) {
        String base = base(code);
        if (!known(base)) return "";

        try {
            String name = Locale.forLanguageTag(base).getDisplayLanguage(Locale.getDefault());
            if (name != null && !name.isEmpty() && !name.equalsIgnoreCase(base)) {
                return Character.toUpperCase(name.charAt(0)) + name.substring(1);
            }
        } catch (Throwable ignored) {
            // fall through to the server table
        }

        String server = Subtitles.serverName(base);
        if (server != null && !server.isEmpty()) return server;
        return Character.toUpperCase(base.charAt(0)) + base.substring(1);
    }

    /** ISO 639-1/2 tag normalisation: "es-ES" -> "es", "vie-VN" -> "vi". */
    static String base(String code) {
        if (code == null) return "";
        String value = code.trim().replace('_', '-');
        int dash = value.indexOf('-');
        if (dash > 0) value = value.substring(0, dash);
        if (value.length() == 3) {
            for (String iso : Locale.getISOLanguages()) {
                try {
                    if (new Locale(iso).getISO3Language().equalsIgnoreCase(value)) return iso;
                } catch (Throwable ignored) {
                    // some ISO entries have no 3-letter form
                }
            }
        }
        return value.toLowerCase(Locale.ROOT);
    }

    // ---- raw comment bodies ------------------------------------------------------------------

    /** Called from ImageStore.scan for every intercepted response. */
    public static void scan(Object response) {
        try {
            Object url = response.getClass().getMethod("a").invoke(response);
            if (!(url instanceof String)) return;
            String path = (String) url;
            if (!path.contains("/comment/")) return;

            Object body = response.getClass().getMethod("e").invoke(response);
            Object bytes = body.getClass().getMethod("getBytes").invoke(body);
            if (!(bytes instanceof byte[])) return;
            String json = new String((byte[]) bytes, "UTF-8");
            if (!json.contains("\"comments\"")) return;
            scanBody(json);
        } catch (Throwable failure) {
            Log.i(TAG, "scan " + failure);
        }
    }

    /** Parse a comment or reply body and remember each comment's declared language. */
    public static void scanBody(String json) {
        if (json == null || json.isEmpty()) return;
        try {
            JSONObject root = new JSONObject(json);
            JSONArray comments = root.optJSONArray("comments");
            if (comments == null) return;

            int found = 0;
            for (int i = 0; i < comments.length(); i++) {
                JSONObject comment = comments.optJSONObject(i);
                if (comment == null) continue;
                String cid = comment.optString("cid", "");
                if (cid.isEmpty()) continue;
                String lang = comment.optString("text_language",
                        comment.optString("text_lang",
                                comment.optString("comment_language", "")));
                if (lang.isEmpty()) continue;
                LANG.put(cid, base(lang));
                found++;
            }
            if (found > 0) {
                Log.i(TAG, "comment languages " + found + " of " + comments.length());
            }
        } catch (Throwable failure) {
            Log.i(TAG, "scan body " + failure);
        }
    }

    // ---- comment rows ------------------------------------------------------------------------

    /** End of CommentViewHolderV2.bind(Comment). The stock holder has already set the original text. */
    public static void bindComment(Object holder, Object comment) {
        if (holder == null || comment == null) return;
        try {
            Object itemView = get(holder, "itemView");
            if (itemView instanceof View) {
                ((View) itemView).post(() -> applyComment(holder, comment));
            }
        } catch (Throwable failure) {
            Log.i(TAG, "bind " + failure);
        }
    }

    private static void applyComment(Object holder, Object comment) {
        try {
            Object binding = get(holder, "b");
            Object content = get(binding, "d");
            if (!(content instanceof TextView)) return;
            TextView text = (TextView) content;

            String cid = string(call0(comment, "getCid"));
            String original = string(call0(comment, "getText"));
            if (cid.isEmpty() || original.isEmpty()) return;

            COMMENTS.put(cid, new WeakReference<>(comment));
            CID_VIEW.put(cid, new WeakReference<>(text));
            VIEW_CID.put(text, cid);

            Context context = text.getContext();
            if (!isAlways(context)) {
                restore(text, original, 10);
                return;
            }

            Translation cached = CACHE.get(cid);
            if (cached != null) {
                render(text, original, cached);
                return;
            }

            String src = sourceLanguage(cid, original);
            String target = target(context);
            if (target.isEmpty() || base(src).equalsIgnoreCase(base(target)) || isDont(context, src)) {
                restore(text, original, 10);
                return;
            }

            restore(text, original, 10);
            queue(cid, comment);
        } catch (Throwable failure) {
            Log.i(TAG, "apply " + failure);
        }
    }

    private static void queue(String cid, Object comment) {
        synchronized (PENDING) {
            PENDING.put(cid, comment);
            if (flushScheduled) return;
            flushScheduled = true;
        }
        MAIN.postDelayed(TranslateComments::flush, 180);
    }

    private static void flush() {
        List<Map.Entry<String, Object>> batch;
        synchronized (PENDING) {
            batch = new ArrayList<>(PENDING.entrySet());
            PENDING.clear();
            flushScheduled = false;
        }
        if (batch.isEmpty()) return;

        Context context = null;
        JSONArray info = new JSONArray();
        List<String> order = new ArrayList<>();
        for (Map.Entry<String, Object> entry : batch) {
            String cid = entry.getKey();
            Object comment = entry.getValue();
            if (comment == null) continue;

            String text = string(call0(comment, "getText"));
            if (text.isEmpty()) continue;

            try {
                JSONObject item = new JSONObject();
                item.put("src_content", text);
                info.put(item);
                order.add(cid);

                WeakReference<TextView> view = CID_VIEW.get(cid);
                if (context == null && view != null && view.get() != null) {
                    context = view.get().getContext();
                }
            } catch (Throwable failure) {
                Log.i(TAG, "queue item " + failure);
            }
        }
        if (info.length() == 0) return;

        final Context app = context;
        final String target = target(app);
        final JSONArray payload = info;
        final List<String> ids = order;
        final int count = info.length();
        if (target.isEmpty()) return;

        HTTP.execute(() -> {
            String body = request(target, payload.toString());
            List<Translation> parsed = parse(body);
            if (parsed == null) return;

            MAIN.post(() -> {
                int painted = 0;
                for (int i = 0; i < Math.min(parsed.size(), count); i++) {
                    Translation translation = parsed.get(i);
                    if (translation == null) continue;
                    String cid = ids.get(i);
                    CACHE.put(cid, translation);
                    if (paintComment(cid, translation)) painted++;
                }
                // A reply pane rebinds its rows while the answer is in flight, so the view that
                // queued a comment may already show another one. Re-apply only what is already
                // cached; queueing here would loop forever on a row whose view moved.
                repaintCached();
                Log.i(TAG, "translated " + painted + " of " + count + " comments into " + target);
            });
        });
    }

    private static boolean paintComment(String cid, Translation translation) {
        WeakReference<TextView> reference = CID_VIEW.get(cid);
        TextView view = reference == null ? null : reference.get();
        if (view == null || !cid.equals(VIEW_CID.get(view))) return false;

        WeakReference<Object> commentRef = COMMENTS.get(cid);
        Object comment = commentRef == null ? null : commentRef.get();
        String original = comment == null ? "" : string(call0(comment, "getText"));
        if (original.isEmpty()) return false;

        if (translation.srcLang == null || translation.srcLang.isEmpty()) {
            String known = sourceLanguage(cid, original);
            if (!known.isEmpty()) translation = new Translation(translation.text, known);
        }
        render(view, original, translation);
        return true;
    }

    /** Re-apply cached translations to the bound rows without starting new requests. */
    private static void repaintCached() {
        for (Map.Entry<String, WeakReference<TextView>> entry : CID_VIEW.entrySet()) {
            String cid = entry.getKey();
            TextView view = entry.getValue() == null ? null : entry.getValue().get();
            if (view == null || !cid.equals(VIEW_CID.get(view))) continue;

            Translation cached = CACHE.get(cid);
            if (cached == null) continue;

            WeakReference<Object> commentRef = COMMENTS.get(cid);
            Object comment = commentRef == null ? null : commentRef.get();
            String original = comment == null ? "" : string(call0(comment, "getText"));
            if (!original.isEmpty()) render(view, original, cached);
        }
    }

    /** Called by the panel after a preference changes so the visible rows catch up. */
    public static void refresh() {
        for (Map.Entry<String, WeakReference<TextView>> entry : CID_VIEW.entrySet()) {
            String cid = entry.getKey();
            TextView view = entry.getValue() == null ? null : entry.getValue().get();
            if (view == null || !cid.equals(VIEW_CID.get(view))) continue;

            WeakReference<Object> commentRef = COMMENTS.get(cid);
            Object comment = commentRef == null ? null : commentRef.get();
            if (comment == null) continue;

            String original = string(call0(comment, "getText"));
            Context context = view.getContext();
            if (!isAlways(context)) {
                restore(view, original, 10);
                continue;
            }

            Translation cached = CACHE.get(cid);
            if (cached != null) {
                render(view, original, cached);
            } else {
                restore(view, original, 10);
                String src = sourceLanguage(cid, original);
                if (!isDont(context, src)
                        && !base(src).equalsIgnoreCase(base(target(context)))) {
                    queue(cid, comment);
                }
            }
        }
    }

    private static void render(TextView view, String original, Translation translation) {
        if (translation == null || translation.text == null || translation.text.isEmpty()
                || translation.text.equals(original)) {
            restore(view, original, 10);
            return;
        }

        String from = languageName(translation.srcLang);
        String line = from.isEmpty() ? "Translated" : "Translated from " + from;
        String body = translation.text + "\n" + line;
        SpannableString text = new SpannableString(body);
        int start = body.length() - line.length();
        text.setSpan(new RelativeSizeSpan(0.82f), start, body.length(),
                Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        text.setSpan(new ForegroundColorSpan(0xFF9AA3AE), start, body.length(),
                Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        text.setSpan(new android.text.style.StyleSpan(Typeface.NORMAL), start, body.length(),
                Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);

        view.setText(text);
        view.setMaxLines(12);
    }

    private static void restore(TextView view, String original, int maxLines) {
        if (original == null) original = "";
        CharSequence current = view.getText();
        if (!(current instanceof Spanned) || !original.contentEquals(current)) {
            view.setText(original);
        }
        view.setMaxLines(maxLines);
    }

    private static String sourceLanguage(String cid, String text) {
        String declared = LANG.get(cid);
        if (known(declared)) return declared;

        Translation cached = CACHE.get(cid);
        if (cached != null && known(cached.srcLang)) return cached.srcLang;

        // The wire says "unknown" for many comments. The script of the text itself is a better
        // attribution than a blank line, and the post's own language is the last fallback.
        String detected = detect(text);
        if (known(detected)) return detected;
        return known(captionLang) ? captionLang : "";
    }

    /** A language code that can be named: not empty and not the wire's "unknown"/"und"/"auto". */
    private static boolean known(String code) {
        String base = base(code);
        return !base.isEmpty() && !"unknown".equals(base) && !"und".equals(base)
                && !"auto".equals(base);
    }

    /** A deliberately small script detector for the attribution line. */
    static String detect(String text) {
        if (text == null || text.isEmpty()) return "";

        final String vietnamese = "ăâđêôơưĂÂĐÊÔƠƯáàảãạấầẩẫậắằẳẵặéèẻẽẹếềểễệíìỉĩịóòỏõọốồổỗộớờởỡợúùủũụứừửữựýỳỷỹỵ";
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (vietnamese.indexOf(c) >= 0) return "vi";
            if (c >= 0xAC00 && c <= 0xD7AF) return "ko";
            if (c >= 0x3040 && c <= 0x30FF) return "ja";
            if (c >= 0x4E00 && c <= 0x9FFF) return "zh";
            if (c >= 0x0E00 && c <= 0x0E7F) return "th";
            if (c >= 0x0600 && c <= 0x06FF) return "ar";
            if (c >= 0x0400 && c <= 0x04FF) return "ru";
        }

        String lower = " " + text.toLowerCase(Locale.ROOT) + " ";
        for (String word : new String[]{" the ", " and ", " you ", " is ", " to ", " of ",
                " my ", " this ", " that ", " for ", " with "}) {
            if (lower.contains(word)) return "en";
        }
        return "";
    }

    // ---- caption -----------------------------------------------------------------------------

    /** Index 0 of {@code BaseVideoFragment.playVideo(Aweme)}. */
    public static void onPlay(Object fragment, Object aweme) {
        if (aweme == null) return;
        try {
            String id = string(call0(aweme, "getAwemeId"));
            String desc = string(call0(aweme, "getDesc"));
            String lang = string(call0(aweme, "getDescLanguage"));
            if (id.isEmpty()) id = string(call0(aweme, "getAid"));

            captionId = id;
            captionText = desc;
            captionLang = lang;

            Object view = call0(fragment, "getView");
            if (view instanceof View) {
                View root = (View) view;
                captionRoot = new WeakReference<>(root);
                root.post(() -> applyCaption(root));
            }
        } catch (Throwable failure) {
            Log.i(TAG, "onPlay " + failure);
        }
    }

    private static void applyCaption(View root) {
        if (root == null || captionText == null) return;
        try {
            int id = Subtitles.idOf(root, "video_desc_content");
            View found = id == 0 ? null : root.findViewById(id);
            if (!(found instanceof TextView)) return;
            TextView caption = (TextView) found;

            Context context = caption.getContext();
            if (!isCaption(context)) {
                restoreCaption(caption);
                return;
            }

            String target = target(context);
            if (target.isEmpty() || captionText.isEmpty()
                    || base(captionLang).equalsIgnoreCase(base(target))
                    || isDont(context, captionLang)) {
                restoreCaption(caption);
                return;
            }

            Translation cached = CAPTIONS.get(captionId);
            if (cached != null) {
                renderCaption(caption, cached);
                return;
            }

            restoreCaption(caption);
            final String idValue = captionId;
            final String text = captionText;
            final String lang = captionLang;

            HTTP.execute(() -> {
                JSONArray payload = new JSONArray();
                try {
                    JSONObject item = new JSONObject();
                    item.put("src_content", text);
                    payload.put(item);
                } catch (Throwable failure) {
                    Log.i(TAG, "caption payload " + failure);
                    return;
                }

                String body = request(target, payload.toString());
                List<Translation> parsed = parse(body);
                if (parsed == null || parsed.isEmpty() || parsed.get(0) == null) return;
                Translation translation = parsed.get(0);
                CAPTIONS.put(idValue, translation);
                MAIN.post(() -> {
                    if (idValue.equals(captionId)) {
                        View live = captionRoot.get();
                        if (live != null) applyCaption(live);
                    }
                });
                Log.i(TAG, "caption translated " + lang + " -> " + target
                        + " (" + translation.text.length() + " chars)");
            });
        } catch (Throwable failure) {
            Log.i(TAG, "caption " + failure);
        }
    }

    /** Called by the panel when the caption switch or target changes. */
    public static void refreshCaption() {
        View root = captionRoot.get();
        if (root != null) {
            applyCaption(root);
        }
    }

    private static void renderCaption(TextView caption, Translation translation) {
        if (translation == null || translation.text == null || translation.text.isEmpty()
                || translation.text.equals(captionText)) {
            restoreCaption(caption);
            return;
        }

        String source = translation.srcLang;
        if (!known(source)) source = captionLang;
        if (!known(source)) source = detect(captionText);
        String from = languageName(source);
        String line = from.isEmpty() ? "Translated" : "Translated from " + from;
        String body = line + "\n" + translation.text;
        SpannableString text = new SpannableString(body);
        text.setSpan(new RelativeSizeSpan(0.82f), 0, line.length(),
                Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        text.setSpan(new ForegroundColorSpan(0xFF9AA3AE), 0, line.length(),
                Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        caption.setText(text);
        caption.setMaxLines(6);
    }

    private static void restoreCaption(TextView caption) {
        if (captionText == null) return;
        CharSequence current = caption.getText();
        if (!(current instanceof Spanned) || !captionText.contentEquals(current)) {
            caption.setText(captionText);
        }
        caption.setMaxLines(4);
    }

    // ---- request -----------------------------------------------------------------------------

    private static String request(String target, String info) {
        String origin = Subtitles.origin();
        if (origin == null) {
            Log.i(TAG, "translation skipped: no api origin yet");
            return null;
        }
        try {
            Class<?> factoryClass = Class.forName(
                    "com.bytedance.ies.ugc.aweme.network.RetrofitFactory");
            Object factory = factoryClass.getMethod("createIRetrofitFactorybyMonsterPlugin")
                    .invoke(null);
            Object retrofit = factory.getClass().getMethod("create", String.class)
                    .invoke(factory, origin);
            Object api = retrofit.getClass().getMethod("a", Class.class)
                    .invoke(retrofit, TranslationApi.class);

            Object call = api.getClass().getMethod("translate",
                            String.class, String.class, int.class)
                    .invoke(api, target, info, 1);
            Object response = call.getClass().getMethod("execute").invoke(call);
            if (response == null) {
                Log.i(TAG, "translation response null");
                return null;
            }

            Object success = response.getClass().getMethod("e").invoke(response);
            Object code = response.getClass().getMethod("c").invoke(response);
            Object body = response.getClass().getMethod("f").invoke(response);
            if (!Boolean.TRUE.equals(success)) {
                Log.i(TAG, "translation http " + code + " for " + info.length() + "B of info");
            }
            if (!(body instanceof String)) {
                Log.i(TAG, "translation body not a string");
                return null;
            }
            return (String) body;
        } catch (Throwable failure) {
            Throwable cause = failure.getCause() == null ? failure : failure.getCause();
            Log.i(TAG, "translation request " + cause);
            Log.i(TAG, "translation request trace " + Log.getStackTraceString(cause));
            return null;
        }
    }

    private static List<Translation> parse(String body) {
        if (body == null || body.isEmpty()) return null;
        try {
            JSONObject root = new JSONObject(body);
            JSONArray list = root.optJSONArray("translated_content_list");
            if (list == null) {
                Log.i(TAG, "translation response keys " + root.keys().next()
                        + " len=" + body.length());
                return null;
            }

            List<Translation> out = new ArrayList<>();
            for (int i = 0; i < list.length(); i++) {
                JSONObject item = list.optJSONObject(i);
                if (item == null) {
                    out.add(null);
                    continue;
                }
                String text = item.optString("translated_content",
                        item.optString("translatedContent", ""));
                String src = item.optString("src_lang", item.optString("srcLang", ""));
                out.add(text.isEmpty() ? null : new Translation(text, src));
            }
            Log.i(TAG, "translation answer " + out.size() + " items, " + body.length() + "B");
            return out;
        } catch (Throwable failure) {
            Log.i(TAG, "translation parse " + failure + " head="
                    + body.substring(0, Math.min(120, body.length())));
            return null;
        }
    }

    // ---- reflection --------------------------------------------------------------------------

    private static String string(Object value) {
        return value == null ? "" : String.valueOf(value);
    }

    private static Object get(Object target, String name) throws Exception {
        Class<?> type = target.getClass();
        while (type != null) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(target);
            } catch (NoSuchFieldException missing) {
                type = type.getSuperclass();
            }
        }
        throw new NoSuchFieldException(name);
    }

    private static Object call0(Object target, String name) {
        try {
            return target.getClass().getMethod(name).invoke(target);
        } catch (Throwable failure) {
            return null;
        }
    }
}
