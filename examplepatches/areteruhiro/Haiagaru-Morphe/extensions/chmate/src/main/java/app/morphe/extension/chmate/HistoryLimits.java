package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.text.InputType;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import java.util.ArrayList;

/** Separate display, automatic deletion and search-history limits. Never deletes DAT directly. */
public final class HistoryLimits {
    private static final String PREFS = "io.github.areteruhiro.chmate.haiagaru.ui-config";
    private static volatile Context context;
    private static volatile Integer cachedDefaultDisplay;
    private HistoryLimits() { }
    static void initialize(Context value) {
        context = value.getApplicationContext();
        BrowsingHistory.initialize(value);
    }
    private static SharedPreferences prefs() { return context.getSharedPreferences(PREFS, 0); }
    private static SharedPreferences nativePrefs() { return PreferenceManager.getDefaultSharedPreferences(context); }
    private static int defaultDisplay() {
        try {
            String version = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
            return version != null && version.contains("242") ? 50 : 0;
        }
        catch (Exception ignored) { return 50; }
    }
    public static boolean unlimitedThreadHistory() {
        return context != null && prefs().getBoolean("unlimitedThreadHistory", false);
    }
    public static int getRecentThreadDisplayCount() {
        if (context == null) return 50;
        SharedPreferences settings = prefs();
        boolean optimize = settings.getBoolean(ExpertSettings.HISTORY_LIMIT, true);
        int value;
        if (optimize && settings.contains("recentThreadDisplayCount")) {
            value = settings.getInt("recentThreadDisplayCount", 50);
        } else if (optimize) {
            Integer fallback = cachedDefaultDisplay;
            if (fallback == null) {
                fallback = defaultDisplay();
                cachedDefaultDisplay = fallback;
            }
            value = fallback;
        } else {
            value = settings.getInt("recentThreadDisplayCount", defaultDisplay());
        }
        return value <= 0 ? Integer.MAX_VALUE : Math.min(value, 10000);
    }
    public static long getRecentThreadDisplayCountLong() { return getRecentThreadDisplayCount(); }
    public static ArrayList<?> limitRecentThreadRows(ArrayList<?> rows) {
        int limit = getRecentThreadDisplayCount();
        return rows == null || rows.size() <= limit ? rows : new ArrayList<>(rows.subList(0, limit));
    }
    /** Return false only before initialization, so the original writer remains the fallback. */
    public static boolean recordSearchHistory(String query) {
        if (context == null) return false;
        SharedPreferences nativePrefs = nativePrefs();
        if (!nativePrefs.getBoolean("saveSearchHistory", true) || query == null || query.trim().isEmpty()) return true;
        int limit = prefs().getInt("searchHistoryCount", 50);
        if (limit <= 0) limit = Integer.MAX_VALUE;
        ArrayList<String> rows = new ArrayList<>();
        rows.add(query);
        for (String previous : nativePrefs.getString("searchRecent", "").split("\n")) {
            if (rows.size() >= limit) break;
            if (previous.trim().isEmpty() || query.equalsIgnoreCase(previous)) continue;
            rows.add(previous);
        }
        StringBuilder value = new StringBuilder();
        for (String row : rows) value.append(row).append('\n');
        nativePrefs.edit().putString("searchRecent", value.toString()).apply();
        return true;
    }
    static Settings addSettings(LinearLayout layout, Activity activity) {
        initialize(activity);
        return new Settings(layout, activity);
    }
    static final class Settings {
        final Activity activity;
        final Switch unlimited, grouped;
        final EditText retained, displayed, searches, historyDays;
        final boolean oldGrouped;
        final int oldHistoryDays;
        final boolean oldUnlimited;
        final int oldRetained, oldDisplayed, oldSearches;
        Settings(LinearLayout layout, Activity activity) {
            this.activity = activity;
            oldUnlimited = unlimitedThreadHistory();
            oldRetained = nativePrefs().getInt("autoDelete", 300);
            oldDisplayed = prefs().getInt("recentThreadDisplayCount", defaultDisplay());
            oldSearches = prefs().getInt("searchHistoryCount", 50);
            oldGrouped = BrowsingHistory.enabled();
            oldHistoryDays = BrowsingHistory.days();
            grouped = new Switch(activity);
            grouped.setText("閲覧履歴を板ごとにまとめる（通常画面のみ）");
            grouped.setChecked(oldGrouped);
            layout.addView(grouped);
            historyDays = field(layout, "まとめる閲覧履歴の対象（何日前から／0で全期間）", oldHistoryDays);
            historyDays.setEnabled(oldGrouped);
            grouped.setOnCheckedChangeListener((button, checked) -> historyDays.setEnabled(checked));
            TextView groupingDescription = new TextView(activity);
            groupingDescription.setText("標準は2日前の午前0時から今日まで。1〜36500日前、0で全期間。"
                    + "最近閲覧した板から、板内は閲覧が新しい順に表示し、板名・日付の区切りは追加しません。"
                    + "最近見たスレのポップアップやお気に入りは変更せず、古い履歴も削除しません。"
                    + "オフにすると従来の表示に戻ります。");
            groupingDescription.setTextSize(13);
            layout.addView(groupingDescription);
            unlimited = new Switch(activity);
            unlimited.setText("閲覧スレ履歴を無制限に保存（自動削除しない）");
            unlimited.setChecked(oldUnlimited);
            layout.addView(unlimited);
            retained = field(layout, "閲覧スレ履歴の保存数（1〜10000）", Math.max(1, Math.min(oldRetained, 10000)));
            retained.setEnabled(!oldUnlimited);
            unlimited.setOnCheckedChangeListener((button, checked) -> retained.setEnabled(!checked));
            displayed = field(layout, "最近見たスレの表示数（0で無制限）", oldDisplayed);
            searches = field(layout, "検索履歴の保存数（0で無制限）", oldSearches);
            TextView description = new TextView(activity);
            description.setText("閲覧スレ履歴の無制限は、古い履歴・DATの件数による自動削除を止めます。"
                    + "手動削除は維持します。有限の保存数はChMate標準の自動整理タイミングで適用されます。"
                    + "検索履歴はChMateの「検索履歴を保存」をオフにすると保存しません。"
                    + "板の履歴には元々件数制限がありません。無制限では容量・読み込み負荷が増える場合があります。"
                    + "変更は自動で保存され、次に一覧を開くと反映されます。削除済みの履歴は復元できません。");
            description.setTextSize(13);
            layout.addView(description);
        }
        private EditText field(LinearLayout layout, String label, int value) {
            TextView title = new TextView(activity); title.setText(label); layout.addView(title);
            EditText field = new EditText(activity); field.setInputType(InputType.TYPE_CLASS_NUMBER);
            field.setText(Integer.toString(value)); layout.addView(field); return field;
        }
        private int number(EditText field) {
            try { return Integer.parseInt(field.getText().toString().trim()); }
            catch (RuntimeException ignored) { return -1; }
        }
        void enableImmediateSaving() {
            Runnable saveValid=()->{if(valid())save();};
            grouped.setOnCheckedChangeListener((v,on)->{historyDays.setEnabled(on);saveValid.run();});
            unlimited.setOnCheckedChangeListener((v,on)->{retained.setEnabled(!on);saveValid.run();});
            for(EditText field:new EditText[]{retained,displayed,searches,historyDays})
                LiveSettings.watch(field,()->{if(valid()){field.setError(null);save();}else field.setError("表示された範囲の数値を入力してください");});
        }
        private boolean valid() {
            return (unlimited.isChecked()||number(retained)>=1&&number(retained)<=10000)
                    &&number(displayed)>=0&&number(displayed)<=10000&&number(searches)>=0&&number(searches)<=10000
                    &&(!grouped.isChecked()||number(historyDays)>=0&&number(historyDays)<=36500);
        }
        boolean validate() {
            int retention = number(retained), display = number(displayed), search = number(searches);
            boolean valid = (unlimited.isChecked() || retention >= 1 && retention <= 10000)
                    && display >= 0 && display <= 10000 && search >= 0 && search <= 10000
                    && (!grouped.isChecked() || number(historyDays) >= 0 && number(historyDays) <= 36500);
            if (!valid) Toast.makeText(activity, "履歴件数は表示された範囲の数値で入力してください。設定は保存されませんでした。", Toast.LENGTH_LONG).show();
            return valid;
        }
        boolean save() {
            int retention = unlimited.isChecked() ? nativePrefs().getInt("autoDelete",300) : number(retained);
            int display = number(displayed), search = number(searches);
            prefs().edit().putBoolean("unlimitedThreadHistory", unlimited.isChecked())
                    .putBoolean("groupBrowsingHistoryByBoard", grouped.isChecked())
                    .putInt("browsingHistoryDays", grouped.isChecked() ? number(historyDays) : prefs().getInt("browsingHistoryDays",2))
                    .putInt("recentThreadDisplayCount", display).putInt("searchHistoryCount", search).apply();
            if (retention != nativePrefs().getInt("autoDelete",300)) nativePrefs().edit().putInt("autoDelete", retention).apply();
            return oldUnlimited != unlimited.isChecked() || oldRetained != retention
                    || oldDisplayed != display || oldSearches != search || oldGrouped != grouped.isChecked()
                    || grouped.isChecked() && oldHistoryDays != number(historyDays);
        }
    }
}
