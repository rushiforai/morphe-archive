package app.morphe.extension.chmate;

import android.app.Activity;
import android.text.Editable;
import android.text.TextWatcher;
import android.widget.*;
import java.util.*;

/** Search affects the visible rows, never the pending exception selections. */
final class SharedNgExceptions extends LinearLayout {
    static final String VIEW_TAG = "haiagaru.shared-ng-exceptions";
    private final List<SharedNgRules.Rule> rules;
    private final Set<String> disabled;
    private final List<Integer> visible = new ArrayList<>();
    private final List<String> labels = new ArrayList<>(), searchable = new ArrayList<>();
    private final ArrayAdapter<String> adapter;
    private final ListView list;
    private final TextView count;
    private String query="";
    private static final String EDIT_HINT="条件の長押しで端末内編集。チェックした条件は適用しません。";

    SharedNgExceptions(Activity activity, List<SharedNgRules.Rule> source, Set<String> excluded) {
        super(activity);
        setTag(VIEW_TAG);
        setOrientation(VERTICAL);
        rules = new ArrayList<>();for(SharedNgRules.Rule rule:source)rules.add(rule.locallyEdited?SharedNg.originalRule(rule):rule);
        disabled = new HashSet<>(excluded);
        refreshLabels();
        EditText search = new EditText(activity);
        search.setSingleLine(true);
        search.setHint("条件・掲示板・種類で検索");
        search.setContentDescription("共有NG条件の検索");
        addView(search);
        count = new TextView(activity); addView(count);
        list = new ChoiceList(activity);
        list.setOnItemLongClickListener((parent,view,position,id)->{
            if(position<0||position>=visible.size())return false;
            SharedNgLocalEdits.show(activity,rules.get(visible.get(position)),()->{refreshLabels();filter(query);});return true;
        });
        list.setChoiceMode(ListView.CHOICE_MODE_MULTIPLE);
        adapter = new ArrayAdapter<String>(activity, android.R.layout.simple_list_item_multiple_choice, new ArrayList<>()) {
            @Override public android.view.View getView(int position, android.view.View recycled, android.view.ViewGroup parent) {
                CheckedTextView row = (CheckedTextView) super.getView(position, recycled, parent);
                row.setChecked(list.isItemChecked(position));
                return row;
            }
        };
        adapter.setNotifyOnChange(false);
        list.setAdapter(adapter);
        int height = Math.round(Math.max(120, Math.min(320, activity.getResources().getConfiguration().screenHeightDp / 3))
                * activity.getResources().getDisplayMetrics().density);
        addView(list, new LayoutParams(LayoutParams.MATCH_PARENT, height));
        Button edit=new Button(activity);edit.setText("条件をこの端末で編集");addView(edit);
        edit.setOnClickListener(v->{
            if(visible.isEmpty())return;
            if(visible.size()==1){SharedNgLocalEdits.show(activity,rules.get(visible.get(0)),()->{refreshLabels();filter(query);});return;}
            String[] choices=new String[visible.size()];for(int i=0;i<choices.length;i++)choices[i]=labels.get(visible.get(i));
            new HaiagaruDialog.Builder(activity).setTitle("編集する共有NG条件").setItems(choices,(d,n)->SharedNgLocalEdits.show(activity,rules.get(visible.get(n)),()->{refreshLabels();filter(query);})).setNegativeButton("戻る",null).show();
        });
        Button reporters=new Button(activity);reporters.setText(SharedNgReporterBlocks.ACTION);addView(reporters);
        reporters.setOnClickListener(v->{
            if(visible.isEmpty())return;
            if(visible.size()==1){SharedNgReporterBlocks.forRule(activity,rules.get(visible.get(0)));return;}
            String[] choices=new String[visible.size()];for(int i=0;i<choices.length;i++)choices[i]=labels.get(visible.get(i));
            new HaiagaruDialog.Builder(activity).setTitle("レポーターを確認する条件").setItems(choices,(d,n)->SharedNgReporterBlocks.forRule(activity,rules.get(visible.get(n)))).setNegativeButton("戻る",null).show();
        });
        search.addTextChangedListener(new TextWatcher() {
            public void beforeTextChanged(CharSequence s, int start, int length, int after) {}
            public void onTextChanged(CharSequence s, int start, int before, int length) { filter(s.toString()); }
            public void afterTextChanged(Editable value) {}
        });
        filter("");
    }

    private void refreshLabels(){
        labels.clear();searchable.clear();
        for (SharedNgRules.Rule rule : SharedNgLocalEdits.apply(rules,SharedNgLocalEdits.snapshot())) {
            String label = SharedNgRules.boardLabel(rule.board) + " / " + rule.kind + " / " + rule.value
                    + " / " + rule.votes + "票" + (rule.revoked ? "（配信停止）" : "")
                    + (rule.overbroadKeyword ? "（広すぎる正規表現：自動適用対象外）" : "")
                    + (rule.locallyEdited ? "（端末内で編集済み）" : "");
            labels.add(label);
            searchable.add(normalize(label + " " + kindLabel(rule.kind)));
        }
    }

    /** Keep selection by rule ID across native row recycling and search rebuilds. */
    private final class ChoiceList extends ListView {
        ChoiceList(Activity activity) { super(activity); }

        @Override public void clearChoices() {
            super.clearChoices();
            for (int i = 0; i < visible.size(); i++)
                super.setItemChecked(i, disabled.contains(rules.get(visible.get(i)).id));
        }

        @Override public boolean isItemChecked(int position) {
            return position >= 0 && position < visible.size()
                    && disabled.contains(rules.get(visible.get(position)).id);
        }

        @Override public boolean performItemClick(android.view.View view, int position, long id) {
            if (!isEnabled() || position < 0 || position >= visible.size()
                    || !adapter.isEnabled(position)) return false;
            String key = rules.get(visible.get(position)).id;
            boolean checked = !disabled.contains(key);
            if (checked) disabled.add(key); else disabled.remove(key);
            setItemChecked(position, checked);
            adapter.notifyDataSetChanged();
            sendAccessibilityEvent(android.view.accessibility.AccessibilityEvent.TYPE_VIEW_CLICKED);
            return true;
        }
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
        this.query=query;
        String normalized = normalize(query);
        visible.clear(); adapter.clear(); list.clearChoices();
        for (int i = 0; i < rules.size(); i++) {
            if (!normalized.isEmpty() && !searchable.get(i).contains(normalized)) continue;
            visible.add(i); adapter.add(labels.get(i));
        }
        for (int i = 0; i < visible.size(); i++) list.setItemChecked(i, disabled.contains(rules.get(visible.get(i)).id));
        count.setText(visible.size() + "件 / 全" + rules.size() + "件" + (visible.isEmpty() ? "（該当なし）" : "")+"\n"+EDIT_HINT);
        adapter.notifyDataSetChanged();
    }

    Set<String> selection() { return new HashSet<>(disabled); }

    /** Keep the editor and its checked rows on the same native input/state path. */
    static void showDialog(Activity activity, String title, String message, SharedNgExceptions content, Runnable save) {
        android.app.AlertDialog dialog = new android.app.AlertDialog.Builder(activity).setTitle(title)
                .setMessage(message).setView(content)
                .setPositiveButton("保存", (ignored, which) -> save.run())
                .setNegativeButton("キャンセル", null).create();
        if (dialog.getWindow() != null) dialog.getWindow().setSoftInputMode(
                android.view.WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE
                        | android.view.WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
        dialog.show();
    }

    static void show(Activity activity, List<SharedNgRules.Rule> source) {
        SharedNgExceptions content = new SharedNgExceptions(activity, source,
                SharedNg.prefs().getStringSet("exceptions", Collections.emptySet()));
        showDialog(activity, "チェックした条件を適用しない", null, content, () -> {
                    SharedNg.prefs().edit().putStringSet("exceptions", content.selection()).apply();
                    SharedNg.reload();
                });
    }
}
