package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.text.Html;
import android.util.Log;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.*;

/** Built-in NG independent of programmable rules. Never modifies DAT or saved NG items. */
public final class HiddenIdNg {
    private static final String PREFS = "haiagaru.hidden-id-ng";
    private static Context context;
    private static volatile boolean enabled;
    private static final Map<Object, Set<Integer>> MATCHES = Collections.synchronizedMap(new WeakHashMap<>());
    // Use response identity, not mutable ArrayList.hashCode(), and do not retain the key in the value.
    private static final Map<Object, String> ORIGINS = Collections.synchronizedMap(new WeakHashMap<>());
    private static final ThreadLocal<Object> PENDING = new ThreadLocal<>();
    private HiddenIdNg() { }

    public static void initialize(Context source) {
        context = source.getApplicationContext();
        if (context == null) context = source;
        enabled = context.getSharedPreferences(PREFS, 0).getBoolean("enabled", false);
    }

    public static void addSettingsButton(LinearLayout parent, Activity activity) {
        Button button = new Button(activity);
        button.setText("5chのIDなしレスを非表示");
        button.setOnClickListener(view -> {
            LinearLayout panel = new LinearLayout(activity);
            panel.setOrientation(LinearLayout.VERTICAL);
            int padding = (int) (20 * activity.getResources().getDisplayMetrics().density);
            panel.setPadding(padding, padding, padding, padding);
            CheckBox toggle = new CheckBox(activity);
            toggle.setText("IDのあるスレ内のIDなしレスを非表示にする");
            toggle.setChecked(enabled);
            panel.addView(toggle);
            TextView help = new TextView(activity);
            help.setText("5chのみ対象（初期オフ）。!id:none／!id:ignore等でIDを表示しないレスを、あぼーん表示を残さず隠します。\n\n"
                    + "意図的なID非表示かは断定できないため、取得済みレスに通常のIDがあるスレだけが対象です。全レスIDなしのスレ、削除済み・システム投稿は対象外です。\n\n"
                    + "保存後はスレを閉じて開き直してください。オフにするとこの機能による非表示を解除します（既存のNG設定は維持）。");
            panel.addView(help);
            new HaiagaruDialog.Builder(activity).setTitle("5chのIDなしレスを非表示").setView(panel)
                    .setNegativeButton("キャンセル", null).setPositiveButton("保存", (dialog, which) -> {
                        enabled = toggle.isChecked();
                        context.getSharedPreferences(PREFS, 0).edit().putBoolean("enabled", enabled).apply();
                        MATCHES.clear();
                    }).show();
        });
        parent.addView(button);
    }

    private static Object field(Object value, String name) throws ReflectiveOperationException {
        return ResponseArchiveEntry.field(value, name);
    }
    @SuppressWarnings("deprecation")
    private static String text(Object value) { return value == null ? "" : Html.fromHtml(value.toString()).toString(); }
    private static List<?> base(Object value) throws ReflectiveOperationException {
        if (!(value instanceof List)) return Collections.emptyList();
        Object original;
        try { original = field(value, "mBase"); } catch (NoSuchFieldException ignored) { original = null; }
        return original instanceof List ? (List<?>) original : (List<?>) value;
    }
    private static String[] profile(Object row) {
        switch (row.getClass().getName()) {
            case "o.processAdDisplayErrorPostbackForUserError": return new String[]{"o", "h", "n", "q"};
            case "o.BouncyCastleSocketAdapterCompanion": return new String[]{"l", "j", "m", "t"};
            case "o.KeJ11": return new String[]{"o", "g", "n", "p"};
            default: throw new IllegalArgumentException("Unsupported ID model");
        }
    }
    private static Set<Integer> matches(List<?> rows, String url) throws ReflectiveOperationException {
        if (!enabled || !HiddenIdRules.fiveCh(url)) return Collections.emptySet();
        boolean hasIds = false;
        Set<Integer> candidates = new HashSet<>();
        for (Object row : rows) {
            if (row == null) continue;
            String[] p = profile(row);
            String id = text(field(row, p[1]));
            hasIds |= HiddenIdRules.regularId(id);
            int number = ((Number) field(row, p[0])).intValue();
            if (HiddenIdRules.candidate(number, id, text(field(row, p[2])), text(field(row, p[3])))) candidates.add(number);
        }
        return hasIds ? candidates : Collections.emptySet();
    }

    /** One scan per legacy adapter rebuild, including native-NG-disabled mode. */
    public static void prepare(Object owner) {
        MATCHES.put(owner, Collections.emptySet());
        if (!enabled) return;
        try {
            boolean legacy = owner.getClass().getName().equals("o.m9ExternalSyntheticLambda1");
            Object board = field(field(owner, legacy ? "M" : "E"), legacy ? "f" : "j");
            List<?> rows = base(field(owner, legacy ? "K" : "J"));
            if (rows.isEmpty()) return;
            String url = ResponseArchiveEntry.snapshot(rows.get(0), board, "").url;
            MATCHES.put(owner, matches(rows, url));
        } catch (ReflectiveOperationException | RuntimeException error) { report(error); }
    }

    public static int merge(Object owner, Object row, int original) {
        if (!enabled || row == null) return original;
        try {
            // A toggle clears the cache; prepare lazily if this adapter predates the toggle.
            if (!MATCHES.containsKey(owner)) prepare(owner);
            Set<Integer> matches = MATCHES.get(owner);
            int number = ((Number) field(row, profile(row)[0])).intValue();
            return matches != null && matches.contains(number) ? original | HiddenIdRules.HIDDEN_ID_FLAGS : original;
        } catch (ReflectiveOperationException | RuntimeException error) { report(error); return original; }
    }

    /** 242 DAT-result constructor provides the exact list + thread URL, never a last-opened-board guess. */
    public static void bind242(Object result) {
        HiddenNgUnread.bind242(result);
        try {
            List<?> rows = base(field(result, "a"));
            if (rows.isEmpty()) return;
            ORIGINS.remove(rows.get(0));
            String url = ResponseArchiveEntry.snapshot(rows.get(0), field(result, "d"), "").url;
            ORIGINS.put(rows.get(0), url);
        } catch (ReflectiveOperationException | RuntimeException error) { report(error); }
    }
    public static void pending(Object list) { PENDING.set(list); }

    /** Return an overlay, never persist our bits in ChMate's original/shared NG map. */
    public static Map modernFlags(Map flags) {
        Object pending = PENDING.get(); PENDING.remove();
        if (!enabled || flags == null) return HiddenNgUnread.modern(pending,flags);
        try {
            List<?> original = base(pending);
            if (original.isEmpty()) return flags;
            Set<Integer> matches = matches(original, ORIGINS.get(original.get(0)));
            if (matches.isEmpty()) return HiddenNgUnread.modern(pending,flags);
            Map<Object, Object> copy = new LinkedHashMap<>(flags);
            for (Integer number : matches) {
                Object previous = copy.get(number);
                int value = previous instanceof Number ? ((Number) previous).intValue() : 0;
                copy.put(number, value | HiddenIdRules.HIDDEN_ID_FLAGS);
            }
            return HiddenNgUnread.modern(pending,copy);
        } catch (ReflectiveOperationException | RuntimeException error) { report(error); return flags; }
    }
    private static void report(Exception error) {
        Log.w("HaiagaruHiddenId", "ID visibility check skipped: " + error.getClass().getSimpleName());
    }
}
