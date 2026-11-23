package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.SharedPreferences;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.NumberPicker;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;

/** Filters the normal board display bucket using the advertised total response count. */
final class ShortThreadFilter {
    static final String ENABLED = "hideShortBoardThreads";
    static final String LIMIT = "shortBoardThreadLimit";
    static final int MAX = 10000;

    static List<?> display(List<?> input, SharedPreferences prefs) {
        if (input == null || prefs == null || !prefs.getBoolean(ENABLED, false)) return input;
        int limit = Math.max(1, Math.min(MAX, prefs.getInt(LIMIT, 1)));
        ArrayList<Object> visible = new ArrayList<>(input.size());
        for (Object row : input) {
            int count = count(row);
            if (count <= 0 || count > limit) visible.add(row);
        }
        return visible.size() == input.size() ? input : visible;
    }

    private static int count(Object row) {
        if (row == null) return -1;
        String field;
        switch (row.getClass().getName()) {
            case "o.MaxAdViewImplExternalSyntheticLambda2": field = "d"; break;
            case "o.verifyHostname": field = "c"; break;
            case "o.zzauw": field = "a"; break;
            default: return -1;
        }
        try { return NativeFields.find(row.getClass(), field).getInt(row); }
        catch (ReflectiveOperationException ignored) { return -1; }
    }

    static void settings(LinearLayout layout, Activity activity, SharedPreferences prefs) {
        LiveSettings.Toggle toggle = new LiveSettings.Toggle(activity);
        toggle.setText("レス数が少ないスレを板の一覧から隠す");
        toggle.setChecked(prefs.getBoolean(ENABLED, false));
        layout.addView(toggle);
        Button cutoff = new Button(activity);
        Runnable label = () -> cutoff.setText("非表示にする最大レス数：" + prefs.getInt(LIMIT, 1));
        label.run();
        cutoff.setOnClickListener(view -> {
            NumberPicker picker = new NumberPicker(activity);
            picker.setMinValue(1); picker.setMaxValue(MAX);
            picker.setValue(Math.max(1, Math.min(MAX, prefs.getInt(LIMIT, 1))));
            new HaiagaruDialog.Builder(activity).setTitle("非表示にする最大レス数").setView(picker)
                    .setNegativeButton("キャンセル", null).setPositiveButton("保存", (dialog, which) -> {
                        picker.clearFocus();
                        prefs.edit().putInt(LIMIT, picker.getValue()).apply();
                        label.run();
                    }).show();
        });
        layout.addView(cutoff);
        TextView explanation = new TextView(activity);
        explanation.setText("板のスレ一覧で、総レス数が指定値以下のスレを隠します。1は最初の投稿しかないスレです。板の一覧を開き直すか更新すると反映します。初期OFFです。");
        layout.addView(explanation);
        new LiveSettings(prefs, () -> {}).toggle(toggle, ENABLED);
    }

    private ShortThreadFilter() {}
}
