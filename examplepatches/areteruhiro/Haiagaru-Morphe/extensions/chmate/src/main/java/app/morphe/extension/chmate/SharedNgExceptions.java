package app.morphe.extension.chmate;

import android.app.Activity;
import android.text.Editable;
import android.text.TextWatcher;
import android.widget.*;
import java.util.*;

/** Search affects the visible rows, never the pending exception selections. */
final class SharedNgExceptions extends LinearLayout {
    private final List<SharedNgRules.Rule> rules;
    private final Set<String> disabled;
    private final List<Integer> visible = new ArrayList<>();
    private final List<String> labels = new ArrayList<>(), searchable = new ArrayList<>();
    private final ArrayAdapter<String> adapter;
    private final ListView list;
    private final TextView count;

    SharedNgExceptions(Activity activity, List<SharedNgRules.Rule> source, Set<String> excluded) {
        super(activity);
        setOrientation(VERTICAL);
        rules = new ArrayList<>(source);
        disabled = new HashSet<>(excluded);
        for (SharedNgRules.Rule rule : rules) {
            String label = SharedNgRules.boardLabel(rule.board) + " / " + rule.kind + " / " + rule.value
                    + " / " + rule.votes + "票" + (rule.revoked ? "（配信停止）" : "");
            labels.add(label);
            searchable.add(normalize(label + " " + kindLabel(rule.kind)));
        }
        EditText search = new EditText(activity);
        search.setSingleLine(true);
        search.setHint("条件・掲示板・種類で検索");
        search.setContentDescription("共有NG条件の検索");
        addView(search);
        count = new TextView(activity); addView(count);
        list = new ListView(activity);
        list.setChoiceMode(ListView.CHOICE_MODE_MULTIPLE);
        adapter = new ArrayAdapter<>(activity, android.R.layout.simple_list_item_multiple_choice, new ArrayList<>());
        adapter.setNotifyOnChange(false);
        list.setAdapter(adapter); addView(list);
        list.setOnItemClickListener((parent, view, position, id) -> {
            String key = rules.get(visible.get(position)).id;
            if (list.isItemChecked(position)) disabled.add(key); else disabled.remove(key);
        });
        search.addTextChangedListener(new TextWatcher() {
            public void beforeTextChanged(CharSequence s, int start, int length, int after) {}
            public void onTextChanged(CharSequence s, int start, int before, int length) { filter(s.toString()); }
            public void afterTextChanged(Editable value) {}
        });
        filter("");
    }

    private static String normalize(String text) { return SharedNgRules.text(text).toLowerCase(Locale.ROOT); }
    private static String kindLabel(String kind) {
        switch (kind) {
            case "keyword": return "NGワード word";
            case "name": return "NGName 名前";
            case "wacchoi": return "ワッチョイ 全文";
            case "prefix": return "ワッチョイ 上4桁";
            case "suffix": return "ワッチョイ 下4桁";
            case "reporter": return "記者ID";
            case "trip": return "トリップ";
            default: return kind;
        }
    }

    void filter(String query) {
        String normalized = normalize(query);
        visible.clear(); adapter.clear(); list.clearChoices();
        for (int i = 0; i < rules.size(); i++) {
            if (!normalized.isEmpty() && !searchable.get(i).contains(normalized)) continue;
            visible.add(i); adapter.add(labels.get(i));
        }
        for (int i = 0; i < visible.size(); i++) list.setItemChecked(i, disabled.contains(rules.get(visible.get(i)).id));
        count.setText(visible.size() + "件 / 全" + rules.size() + "件" + (visible.isEmpty() ? "（該当なし）" : ""));
        adapter.notifyDataSetChanged();
    }

    Set<String> selection() { return new HashSet<>(disabled); }

    static void show(Activity activity, List<SharedNgRules.Rule> source) {
        SharedNgExceptions content = new SharedNgExceptions(activity, source,
                SharedNg.prefs().getStringSet("exceptions", Collections.emptySet()));
        new HaiagaruDialog.Builder(activity).setTitle("チェックした条件を適用しない")
                .setView(content).setPositiveButton("保存", (dialog, which) -> {
                    SharedNg.prefs().edit().putStringSet("exceptions", content.selection()).apply();
                    SharedNg.reload();
                }).setNegativeButton("戻る", null).show();
    }
}
