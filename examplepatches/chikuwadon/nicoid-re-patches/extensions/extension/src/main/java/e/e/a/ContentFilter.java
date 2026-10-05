package e.e.a;

import android.content.Context;
import android.preference.EditTextPreference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.preference.PreferenceCategory;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.content.res.ColorStateList;
import android.util.TypedValue;
import java.util.ArrayList;
import java.lang.reflect.Method;
import org.json.JSONObject;

public final class ContentFilter {
    private ContentFilter() { }
    private static final String KEY = "nicoid_content_keywords";
    private static final String CHANNELS = "nicoid_content_channels";
    private static String t(String text) { return UiStrings.translate(text); }
    public static void settings(PreferenceActivity activity) {
        if (activity.findPreference(KEY) != null) return;
        PreferenceCategory screen = new PreferenceCategory(activity);
        screen.setKey("nicoid_content_filter"); screen.setTitle(t("コンテンツフィルタ"));
        PreferenceGroup root = activity.getPreferenceScreen();
        // Preserve existing sections while placing this category directly after comments.
        int after = root.getPreferenceCount();
        ArrayList<Preference> sections = new ArrayList<>();
        for (int n = 0; n < root.getPreferenceCount(); n++) {
            Preference section = root.getPreference(n); sections.add(section);
            if ("comment".equals(section.getKey())) after = n + 1;
        }
        for (int n = 0; n < sections.size(); n++) sections.get(n).setOrder(n * 2);
        screen.setOrder(after * 2 - 1); root.addPreference(screen);
        entry(activity, screen, KEY, "キーワードフィルタ", "動画タイトルに含まれるキーワードをカンマまたは改行で区切って入力してください。次の一覧読み込みから非表示になります。");
        entry(activity, screen, CHANNELS, "チャンネルフィルタ", "非表示にする投稿者・チャンネル名をカンマまたは改行で区切って入力してください。名前の部分一致で判定します。次の一覧読み込みから反映されます。");
    }
    private static void entry(PreferenceActivity activity, PreferenceGroup screen, String key, String title, String summary) {
        EditTextPreference words = new EditTextPreference(activity);
        words.setKey(key); words.setTitle(t(title)); words.setDialogTitle(t(title));
        words.setSummary(t(summary));
        words.getEditText().setSingleLine(false);
        words.getEditText().setInputType(android.text.InputType.TYPE_CLASS_TEXT | android.text.InputType.TYPE_TEXT_FLAG_MULTI_LINE);
        TypedValue color = new TypedValue();
        words.getEditText().getContext().getTheme().resolveAttribute(0x7f03005e, color, true);
        int accent = color.resourceId == 0 ? color.data : activity.getResources().getColorStateList(color.resourceId).getDefaultColor();
        words.getEditText().setBackgroundTintList(ColorStateList.valueOf(accent));
        screen.addPreference(words);
    }
    public static final class Rules {
        final String keywords, channels;
        final String[] words, names;
        Rules(String keywords, String channels) {
            this.keywords = keywords; this.channels = channels;
            words = ContentFilterRules.keywords(keywords); names = ContentFilterRules.keywords(channels);
        }
        public boolean blocked(String title, String channel) {
            return ContentFilterRules.blocked(title, words) || ContentFilterRules.blocked(channel, names);
        }
        boolean empty() { return words.length == 0 && names.length == 0; }
    }
    private static volatile Rules compiled;
    public static Rules rules(Context context) {
        android.content.SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);
        String words = prefs.getString(KEY, ""), names = prefs.getString(CHANNELS, "");
        Rules prior = compiled;
        if (prior != null && prior.keywords.equals(words) && prior.channels.equals(names)) return prior;
        Rules next = new Rules(words, names); compiled = next; return next;
    }
    public static boolean blocked(Context context, String title) { return blocked(context, title, null); }
    public static boolean blocked(Context context, String title, String channel) { return rules(context).blocked(title, channel); }
    private static volatile Method rowValue;
    private static volatile java.lang.reflect.Field rowOwner;
    /** Same owner-name sources used by normal video rows, including channel videos. */
    public static String owner(JSONObject row) {
        if (row == null) return "";
        PaidVideos.remember(row);
        for (String key : new String[]{"owner", "user", "channel"}) {
            JSONObject source = row.optJSONObject(key);
            if (source == null) continue;
            for (String name : new String[]{"nickname", "name"}) {
                String value = source.optString(name, "");
                if (!value.isEmpty()) return value;
            }
            String nested = owner(source);
            if (!nested.isEmpty()) return nested;
        }
        String value = row.optString("ownerName", "");
        return value.isEmpty() ? row.optString("uploaderName", "") : value;
    }
    public static void rememberHistory(JSONObject record) {
        try {
            JSONObject watch = (JSONObject) Class.forName("e.e.a.ModernPlayback").getField("latestWatch").get(null);
            JSONObject video = watch == null ? null : watch.optJSONObject("video");
            if (video != null && HistoryRules.same(record.optString("videourl"), video.optString("id"))) {
                record.put("isPaymentRequired", PaidVideos.watchRequired(watch));
                PaidVideos.remember(record);
                String name = owner(watch);
                if (!name.isEmpty()) record.put("ownerName", name);
            }
        } catch (ReflectiveOperationException | org.json.JSONException ignored) { }
    }
    public static void restoreHistory(Object row, JSONObject record) {
        PaidVideos.remember(record);
        try { row.getClass().getField("y").set(row, owner(record)); }
        catch (ReflectiveOperationException error) { throw new IllegalStateException("Unsupported history row", error); }
    }
    /** The adapter and fragment share this list, preserving click and selection indices. */
    public static void filter(Object adapter) {
        try {
            Class<?> type = adapter.getClass();
            Context context = (Context) type.getField("d").get(adapter);
            Rules rules = rules(context);
            if (rules.empty()) return;
            ArrayList<?> rows = (ArrayList<?>) type.getField("b").get(adapter);
            Method value = rowValue; java.lang.reflect.Field owner = rowOwner;
            if (value == null || owner == null) {
                Class<?> rowType = Class.forName("e.e.a.x1");
                value = rowType.getMethod("a", String.class); owner = rowType.getField("y");
                rowValue = value; rowOwner = owner;
            }
            for (int n = rows.size() - 1; n >= 0; n--) {
                Object row = rows.get(n);
                Object title = value.invoke(row, "title");
                Object url = value.invoke(row, "videourl");
                Object channel = owner.get(row);
                if (url != null && (url.toString().contains("/watch/") || url.toString().contains("/shorts/")) &&
                    rules.blocked(title == null ? null : title.toString(), channel == null ? null : channel.toString())) rows.remove(n);
            }
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Unsupported video list", error);
        }
    }
}
