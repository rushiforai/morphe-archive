package app.morphe.extension.chmate;

import android.app.Activity;

import android.content.Context;
import android.text.Editable;
import android.text.TextWatcher;
import android.widget.*;
import android.view.View;
import java.util.*;

/** Search native registrations; all writes are explicit and previewed. */
public final class NgManagement {
    private NgManagement() {}
    private static final String ALL = "すべての登録板";
    private static final String GLOBAL = "全板共通";

    public static void addSettingsButton(LinearLayout layout, Activity activity) {
        try {
            String version = activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0).versionName;
            if (!Arrays.asList("0.8.10.191 dev", "0.8.10.226 dev", "0.8.10.241", "0.8.10.242 dev").contains(version)) return;
        } catch (Exception error) { return; }
        Button button = new Button(activity);
        button.setText("登録NGの検索・板別表示・ﾜｯﾁｮｲ統合");
        button.setOnClickListener(v -> show(activity));
        layout.addView(button);
    }

    static String selectedScope(Spinner spinner) {
        String label = String.valueOf(spinner.getSelectedItem());
        return GLOBAL.equals(label) || ALL.equals(label) ? null : label;
    }

    private static Spinner spinner(Context context, List<String> choices) {
        Spinner spinner = new Spinner(context);
        ArrayAdapter<String> adapter = new ArrayAdapter<>(context, android.R.layout.simple_spinner_item, choices);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(adapter);
        return spinner;
    }

    public static void show(Activity activity) {
        try {
            String[] categories = {"NAME", "ID", "WORD", "THREAD", "BE", "IMAGE"};
            String[] labels = {"NGName", "NGID", "NGワード", "NGスレッド", "NG BE", "NG画像"};
            Map<String, NativeNgStore> stores = new LinkedHashMap<>();
            Map<String, List<NativeNgStore.Entry>> snapshots = new LinkedHashMap<>();
            List<String> boards = new ArrayList<>(Arrays.asList(ALL, GLOBAL));
            for (String kind : categories) {
                NativeNgStore store = new NativeNgStore(activity, kind);
                List<NativeNgStore.Entry> entries = store.entries();
                stores.put(kind, store);
                snapshots.put(kind, entries);
                for (NativeNgStore.Entry entry : entries)
                    for (String board : NgBoardScope.boards(entry.board)) if (!boards.contains(board)) boards.add(board);
            }
            LinearLayout content = new LinearLayout(activity);
            content.setOrientation(LinearLayout.VERTICAL);
            int padding = Math.round(16 * activity.getResources().getDisplayMetrics().density);
            content.setPadding(padding, 0, padding, 0);
            EditText search = new EditText(activity);
            search.setSingleLine();
            search.setHint("登録文字列を検索（部分一致）");
            content.addView(search);
            Spinner category = spinner(activity, Arrays.asList(labels));
            content.addView(category);
            Spinner scope = spinner(activity, boards);
            content.addView(scope);
            TextView count = new TextView(activity);
            content.addView(count);
            TextView scopeHelp = new TextView(activity);
            scopeHelp.setText("NG項目をタップすると対象板を変更できます（指定板以外すべても選択可能）。");
            content.addView(scopeHelp);
            Button consolidate = new Button(activity);
            consolidate.setText("表示中のNGNameを下4桁でまとめる");
            content.addView(consolidate);
            ListView list = new ListView(activity);
            content.addView(list, new LinearLayout.LayoutParams(-1,
                    Math.round(300 * activity.getResources().getDisplayMetrics().density)));
            List<NativeNgStore.Entry> visible = new ArrayList<>();
            Runnable refresh = () -> {
                String kind = categories[category.getSelectedItemPosition()];
                String board = selectedScope(scope);
                String query = search.getText().toString();
                visible.clear();
                List<String> rows = new ArrayList<>();
                for (NativeNgStore.Entry entry : snapshots.get(kind)) {
                    if (scope.getSelectedItemPosition() == 1 && entry.board != null) continue;
                    if (!NgNameConsolidation.matches(entry.pattern, null, query, null)
                            || board != null && !NgBoardScope.matches(entry.board, board)) continue;
                    visible.add(entry);
                    rows.add(entry.pattern + "\n" + NgBoardScope.label(entry.board)
                            + ((entry.flags & 8) != 0 ? " · 連鎖" : "")
                            + ((entry.flags & 1) != 0 ? " · 非表示" : "")
                            + ((entry.flags & 4) != 0 ? " · 無効" : ""));
                }
                count.setText(visible.size() + " / " + snapshots.get(kind).size() + "件");
                list.setAdapter(new ArrayAdapter<>(activity, android.R.layout.simple_list_item_1, rows));
                consolidate.setEnabled("NAME".equals(kind));
            };
            AdapterView.OnItemSelectedListener selection = new AdapterView.OnItemSelectedListener() {
                public void onItemSelected(AdapterView<?> p, View v, int position, long id) { refresh.run(); }
                public void onNothingSelected(AdapterView<?> p) {}
            };
            category.setOnItemSelectedListener(selection);
            scope.setOnItemSelectedListener(selection);
            search.addTextChangedListener(new TextWatcher() {
                public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
                public void onTextChanged(CharSequence s, int start, int before, int count) { refresh.run(); }
                public void afterTextChanged(Editable text) {}
            });
            HaiagaruDialog dialog = new HaiagaruDialog.Builder(activity).setTitle("登録NGの管理")
                    .setView(content).setNegativeButton("閉じる", null).create();
            list.setOnItemClickListener((parent, view, position, id) -> {
                NativeNgStore store = stores.get(categories[category.getSelectedItemPosition()]);
                editScope(activity, store, visible.get(position), () -> { dialog.dismiss(); show(activity); });
            });
            consolidate.setOnClickListener(v -> preview(activity, stores.get("NAME"), snapshots.get("NAME"),
                    new ArrayList<>(visible), () -> { dialog.dismiss(); show(activity); }));
            refresh.run();
            dialog.show();
        } catch (Exception error) { fail(activity, error); }
    }

    private static void editScope(Activity activity, NativeNgStore store, NativeNgStore.Entry entry, Runnable done) {
        NgBoardScopePicker picker = new NgBoardScopePicker(activity, null, entry.board);
        HaiagaruDialog dialog = new HaiagaruDialog.Builder(activity).setTitle("NGの対象板: " + entry.pattern)
                .setView(picker).setNegativeButton("キャンセル", null).setPositiveButton("保存", null).create();
        dialog.setOnShowListener(d -> dialog.getButton(HaiagaruDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            try {
                String scope = picker.value();
                if (store.entries().stream().noneMatch(entry::same))
                    throw new IllegalStateException("NGが変更されました。開き直してください");
                store.update(entry.nativeItem, store.item(entry.pattern, entry.flags, entry.timestamp, scope));
                dialog.dismiss(); done.run();
                Toast.makeText(activity, "対象板を変更しました。表示中のスレは開き直してください", Toast.LENGTH_LONG).show();
            } catch (Exception error) { fail(activity, error); }
        }));
        dialog.show();
    }

    private static void preview(Activity activity, NativeNgStore store, List<NativeNgStore.Entry> snapshot,
            List<NativeNgStore.Entry> visible, Runnable done) {
        Map<String, List<NativeNgStore.Entry>> grouped = new LinkedHashMap<>();
        for (NativeNgStore.Entry entry : visible) {
            String suffix = NgNameConsolidation.suffix(entry.pattern, entry.flags);
            if (suffix == null) continue;
            grouped.computeIfAbsent(NgNameConsolidation.key(suffix, entry.board, entry.flags), k -> new ArrayList<>()).add(entry);
        }
        List<List<NativeNgStore.Entry>> groups = new ArrayList<>();
        List<String> labels = new ArrayList<>();
        for (List<NativeNgStore.Entry> entries : grouped.values()) {
            if (entries.stream().map(e -> e.pattern).distinct().count() < 2) continue;
            NativeNgStore.Entry first = entries.get(0);
            groups.add(entries);
            StringBuilder label = new StringBuilder("-").append(NgNameConsolidation.suffix(first.pattern, first.flags))
                    .append(" · ").append(NgBoardScope.label(first.board));
            for (NativeNgStore.Entry entry : entries) label.append("\n").append(entry.pattern);
            labels.add(label.toString());
        }
        if (groups.isEmpty()) {
            Toast.makeText(activity, "同じ板・同じ設定で下4桁が共通するNGNameはありません", Toast.LENGTH_LONG).show();
            return;
        }
        boolean[] selected = new boolean[groups.size()];
        CheckBox remove = new CheckBox(activity);
        remove.setText("統合した元のNGNameを削除する（選択した対象のみ）");
        HaiagaruDialog dialog = new HaiagaruDialog.Builder(activity).setTitle("統合する下4桁を選択")
                .setCustomTitle(remove)
                .setMultiChoiceItems(labels.toArray(new String[0]), selected, (d, which, checked) -> selected[which] = checked)
                .setNegativeButton("キャンセル", null).setPositiveButton("適用", null).create();
        // HaiagaruDialog renders choice rows in Compose rather than displaying
        // its backing ListView. Put this option in the visible custom-title slot;
        // ListView footer/header views are never composed and cannot be toggled.
        dialog.setOnShowListener(d -> dialog.getButton(HaiagaruDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            try {
                List<Object> after = new ArrayList<>();
                for (NativeNgStore.Entry entry : snapshot) after.add(entry.nativeItem);
                int applied = 0;
                for (int i = 0; i < groups.size(); i++) {
                    if (!selected[i]) continue;
                    applied++;
                    List<NativeNgStore.Entry> group = groups.get(i);
                    NativeNgStore.Entry first = group.get(0);
                    String regex = WacchoiSuffixNg.expression(NgNameConsolidation.suffix(first.pattern, first.flags));
                    short flags = NgNameConsolidation.regexFlags(first.flags);
                    boolean exists = snapshot.stream().anyMatch(e -> regex.equals(e.pattern)
                            && Objects.equals(first.board, e.board) && flags == e.flags);
                    if (!exists) after.add(store.item(regex, flags, System.currentTimeMillis(), first.board));
                    if (remove.isChecked()) for (NativeNgStore.Entry entry : group) after.remove(entry.nativeItem);
                }
                if (applied == 0) { Toast.makeText(activity, "統合する項目を選択してください", Toast.LENGTH_SHORT).show(); return; }
                store.replace(snapshot, after);
                dialog.dismiss();
                Toast.makeText(activity, "NGNameを統合しました。表示中のスレは開き直してください", Toast.LENGTH_LONG).show();
                done.run();
            } catch (Exception error) { fail(activity, error); }
        }));
        dialog.show();
    }

    private static void fail(Context context, Exception error) {
        android.util.Log.w("Haiagaru", "NG management failed", error);
        Toast.makeText(context, "NG操作に失敗しました: " + error.getMessage(), Toast.LENGTH_LONG).show();
    }
}
