/*
 * h19e8p Patches
 * Copyright (C) 2026 h19e8p
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version. See the LICENSE file.
 */

package app.morphe.extension.h19e8p.flags;

import android.app.AlertDialog;
import android.content.Intent;
import android.graphics.Typeface;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.morphe.extension.h19e8p.AppRestart;
import app.morphe.extension.h19e8p.Screen;
import app.morphe.extension.h19e8p.Text;

/**
 * 要素ピッカーの候補、または読み取りの記録の一覧を出し、選んだフラグを piko のフラグの一覧に
 * 追加する画面。
 *
 * <p>タップで1件、長押しで選ぶ状態になり、複数をまとめて ON または OFF で追加できる。
 */
public final class FlagResultsActivity extends Screen {
    static final String EXTRA_MODE = "mode";
    static final String MODE_PICKER = "picker";
    static final String MODE_RECORDER = "recorder";

    private static final int MAX_CANDIDATES = 60;

    private final List<String> flags = new ArrayList<>();
    private final Set<String> selected = new LinkedHashSet<>();
    /** 記録の一覧では、記録した時の値。候補の一覧では空。 */
    private Map<String, Boolean> recordedValues = Collections.emptyMap();
    private Map<String, Boolean> pikoFlags = Collections.emptyMap();
    private boolean selecting;
    private boolean pikoAvailable;

    private ListView listView;
    private Adapter adapter;
    private LinearLayout selectionBar;
    private TextView selectionCount;

    private boolean picker() {
        return MODE_PICKER.equals(getIntent().getStringExtra(EXTRA_MODE));
    }

    @Override
    protected String screenTitle() {
        return picker() ? Text.of("要素とフラグ候補", "Element and flag candidates")
                : Text.of("記録されたフラグ", "Recorded flags");
    }

    @Override
    protected View createContent() {
        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);

        listView = new ListView(this);
        listView.setDivider(null);
        content.addView(listView, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        selectionBar = buildSelectionBar();
        selectionBar.setVisibility(View.GONE);
        content.addView(selectionBar);
        return content;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        pikoAvailable = PikoFlags.available();
        loadFlags();
        listView.addHeaderView(picker() ? pickerHeader() : recorderHeader(), null, false);
        adapter = new Adapter();
        listView.setAdapter(adapter);
        listView.setOnItemClickListener((parent, view, position, id) -> {
            String flag = flagAt(position);
            if (flag == null) return;
            if (selecting) {
                toggle(flag);
            } else {
                askAdd(Collections.singletonList(flag));
            }
        });
        listView.setOnItemLongClickListener((parent, view, position, id) -> {
            String flag = flagAt(position);
            if (flag == null || !pikoAvailable) return false;
            if (!selecting) setSelecting(true);
            toggle(flag);
            return true;
        });
    }

    @Override
    protected void onResume() {
        super.onResume();
        refreshPiko();
    }

    @Override
    @SuppressWarnings("deprecation")
    public void onBackPressed() {
        if (selecting) {
            setSelecting(false);
            return;
        }
        super.onBackPressed();
    }

    private void loadFlags() {
        flags.clear();
        if (picker()) {
            Set<String> known = new LinkedHashSet<>(FlagReads.known());
            if (pikoAvailable) known.addAll(PikoFlags.searchList(this));
            Intent intent = getIntent();
            Set<String> tokens = FlagCandidateFinder.tokensFor(intent.getStringExtra(ElementPicker.EXTRA_CLASS),
                    intent.getStringExtra(ElementPicker.EXTRA_ID_NAME),
                    intent.getStringArrayExtra(ElementPicker.EXTRA_ANCESTORS));
            for (FlagCandidateFinder.Candidate candidate : FlagCandidateFinder.rank(tokens, known, MAX_CANDIDATES)) {
                flags.add(candidate.flag);
            }
        } else {
            recordedValues = FlagReads.recorded();
            flags.addAll(recordedValues.keySet());
        }
    }

    private void refreshPiko() {
        pikoFlags = pikoAvailable ? PikoFlags.read(this) : Collections.emptyMap();
        if (adapter != null) adapter.notifyDataSetChanged();
    }

    private String flagAt(int position) {
        int index = position - listView.getHeaderViewsCount();
        return index >= 0 && index < flags.size() ? flags.get(index) : null;
    }

    // 見出しの部分。

    private View pickerHeader() {
        Intent intent = getIntent();
        LinearLayout box = headerBox();
        box.addView(sectionTitle(Text.of("選択した要素", "Selected element")));
        box.addView(field("class", intent.getStringExtra(ElementPicker.EXTRA_CLASS)));
        String id = intent.getStringExtra(ElementPicker.EXTRA_ID_NAME);
        if (id != null) box.addView(field("id", id));
        String text = intent.getStringExtra(ElementPicker.EXTRA_TEXT);
        if (text != null) box.addView(field("text", text));
        String[] ancestors = intent.getStringArrayExtra(ElementPicker.EXTRA_ANCESTORS);
        if (ancestors != null && ancestors.length > 0) {
            StringBuilder chain = new StringBuilder();
            for (String ancestor : ancestors) chain.append(ancestor).append('\n');
            box.addView(field("parents", chain.toString().trim()));
        }
        Set<String> tokens = FlagCandidateFinder.tokensFor(intent.getStringExtra(ElementPicker.EXTRA_CLASS), id, ancestors);
        if (!tokens.isEmpty()) box.addView(field("keywords", String.join(", ", tokens)));
        box.addView(sectionTitle(Text.of("フラグ候補", "Flag candidates")));
        if (flags.isEmpty()) {
            box.addView(body(Text.of(
                    "候補が見つかりません。フラグは X が一度読んだ時点で分かるので、アプリを少し操作してから試してください。",
                    "No candidates found. Flags are only known once X has read them, so browse the app a little and try again.")));
        } else {
            box.addView(body(Text.of(
                    "名前の一致による候補です。X がこの要素を作るのに実際に使ったフラグとは限りません。",
                    "Matched by name only. These are suggestions to try, not the flags X actually used for this element.")));
        }
        addUsage(box);
        return box;
    }

    private View recorderHeader() {
        LinearLayout box = headerBox();
        TextView count = text(flags.size() + Text.of(" 件のフラグが読まれました", " flags were read"), 16, primary());
        count.setTypeface(Typeface.DEFAULT_BOLD);
        box.addView(count);
        box.addView(body(flags.isEmpty()
                ? Text.of("記録中に何も読まれませんでした。起動時に読み終えている可能性があるので、X を再起動してから記録すると拾えることがあります。",
                "Nothing was read while recording. X may have read these at startup, so restarting X before recording can help.")
                : Text.of("記録中に読まれたフラグを、X が最初に読んだ順に並べています。値は読まれた時の値です。観測した結果で、そのフラグが表示を決めている証拠ではありません。",
                "These were read while recording, in the order X first read them, with the value X got. This is an observation, not proof that a flag controls what you saw.")));
        addUsage(box);
        return box;
    }

    private void addUsage(LinearLayout box) {
        if (flags.isEmpty()) return;
        box.addView(body(pikoAvailable
                ? Text.of("タップで1件、長押しで複数を選んで、piko のフラグの一覧に ON か OFF で追加します。X を再起動すると反映されます。",
                "Tap one, or long-press to select several, and add them to piko's flag list as ON or OFF. They take effect after X restarts.")
                : Text.of("piko の「Hook feature flag」が当たっていないので、追加はできません。",
                "piko's \"Hook feature flag\" is not applied, so flags cannot be added.")));
    }

    private LinearLayout headerBox() {
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(16), dp(12), dp(16), dp(8));
        return box;
    }

    private TextView sectionTitle(String title) {
        TextView view = text(title, 14, accent());
        view.setPadding(0, dp(12), 0, dp(4));
        return view;
    }

    private TextView field(String label, String value) {
        TextView view = text(label + ": " + (value == null ? "-" : value), 13, primary());
        view.setTypeface(Typeface.MONOSPACE);
        view.setTextIsSelectable(true);
        view.setPadding(0, dp(2), 0, dp(2));
        return view;
    }

    private TextView body(String value) {
        TextView view = text(value, 13, secondary());
        view.setPadding(0, dp(6), 0, dp(4));
        return view;
    }

    // 選ぶ状態。

    private LinearLayout buildSelectionBar() {
        LinearLayout bar = new LinearLayout(this);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPadding(dp(8), dp(4), dp(8), dp(4));
        bar.setBackgroundColor(selectedBackground());

        selectionCount = text("", 14, primary());
        selectionCount.setPadding(dp(8), 0, dp(8), 0);
        bar.addView(selectionCount, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        bar.addView(barButton(Text.of("全選択", "All"), () -> {
            if (selected.size() == flags.size()) {
                selected.clear();
            } else {
                selected.addAll(flags);
            }
            updateSelection();
        }));
        bar.addView(barButton(Text.of("ONで追加", "Add ON"), () -> add(new ArrayList<>(selected), true)));
        bar.addView(barButton(Text.of("OFFで追加", "Add OFF"), () -> add(new ArrayList<>(selected), false)));
        bar.addView(barButton("✕", () -> setSelecting(false)));
        return bar;
    }

    private TextView barButton(String label, Runnable action) {
        TextView view = text(label, 14, accent());
        view.setTypeface(Typeface.DEFAULT_BOLD);
        view.setPadding(dp(10), dp(12), dp(10), dp(12));
        view.setBackgroundResource(selectable());
        view.setOnClickListener(v -> action.run());
        return view;
    }

    private void setSelecting(boolean on) {
        selecting = on;
        if (!on) selected.clear();
        selectionBar.setVisibility(on ? View.VISIBLE : View.GONE);
        updateSelection();
    }

    private void toggle(String flag) {
        if (!selected.remove(flag)) selected.add(flag);
        updateSelection();
    }

    private void updateSelection() {
        selectionCount.setText(selected.size() + Text.of(" 件選択", " selected"));
        adapter.notifyDataSetChanged();
    }

    // 追加。

    private void askAdd(List<String> names) {
        if (!pikoAvailable) {
            Toast.makeText(this, Text.of("piko の「Hook feature flag」が当たっていないので追加できません",
                    "piko's \"Hook feature flag\" is not applied, so flags cannot be added"), Toast.LENGTH_SHORT).show();
            return;
        }
        AlertDialog dialog = dialog()
                .setTitle(Text.of("フラグを追加", "Add flag"))
                .setMessage(names.size() == 1 ? names.get(0) : names.size() + Text.of(" 件", " flags"))
                .setPositiveButton(Text.of("ONで追加", "Add ON"), (d, w) -> add(names, true))
                .setNeutralButton(Text.of("OFFで追加", "Add OFF"), (d, w) -> add(names, false))
                .setNegativeButton(Text.of("キャンセル", "Cancel"), null)
                .create();
        dialog.show();
        styleButtons(dialog);
    }

    private void add(List<String> names, boolean value) {
        if (names.isEmpty()) return;
        if (!pikoAvailable) {
            askAdd(names);
            return;
        }
        int[] result = PikoFlags.put(this, names, value);
        if (selecting) setSelecting(false);
        refreshPiko();
        String what = Text.of(result[0] + " 件を追加、" + result[1] + " 件の値を変更しました。",
                "Added " + result[0] + ", changed " + result[1] + ". ");
        AlertDialog dialog = dialog()
                .setMessage(what + Text.of("X を再起動すると反映されます。今すぐ再起動しますか？",
                        "They take effect after X restarts. Restart now?"))
                .setPositiveButton(Text.of("再起動", "Restart"), (d, w) -> restartApp())
                .setNegativeButton(Text.of("あとで", "Later"), null)
                .create();
        dialog.show();
        styleButtons(dialog);
    }

    /** X を起動し直す。piko はフラグの一覧を起動時に読むため。 */
    private void restartApp() {
        AppRestart.restart(this);
    }

    // 一覧の行。

    private final class Adapter extends BaseAdapter {
        @Override
        public int getCount() {
            return flags.size();
        }

        @Override
        public Object getItem(int position) {
            return flags.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            Row row = convertView instanceof LinearLayout && convertView.getTag() instanceof Row
                    ? (Row) convertView.getTag() : new Row();
            String flag = flags.get(position);
            row.name.setText(flag);
            row.state.setText(stateOf(flag));
            boolean isSelected = selected.contains(flag);
            row.check.setVisibility(selecting ? View.VISIBLE : View.GONE);
            row.check.setChecked(isSelected);
            row.view.setBackgroundColor(isSelected ? selectedBackground() : background());
            return row.view;
        }
    }

    private String stateOf(String flag) {
        Boolean now = recordedValues.containsKey(flag) ? recordedValues.get(flag) : FlagReads.valueOf(flag);
        StringBuilder out = new StringBuilder(Text.of("値: ", "Value: "));
        out.append(now == null ? Text.of("不明", "unknown") : now ? "ON" : "OFF");
        Boolean piko = pikoFlags.get(flag);
        if (piko != null) {
            out.append(Text.of("  ·  piko の一覧: ", "  ·  piko list: ")).append(piko ? "ON" : "OFF");
        }
        return out.toString();
    }

    private final class Row {
        final LinearLayout view;
        final TextView name;
        final TextView state;
        final CheckBox check;

        Row() {
            view = new LinearLayout(FlagResultsActivity.this);
            view.setOrientation(LinearLayout.HORIZONTAL);
            view.setGravity(Gravity.CENTER_VERTICAL);
            view.setPadding(dp(16), dp(10), dp(16), dp(10));
            check = new CheckBox(FlagResultsActivity.this);
            check.setClickable(false);
            check.setFocusable(false);
            view.addView(check);
            LinearLayout texts = new LinearLayout(FlagResultsActivity.this);
            texts.setOrientation(LinearLayout.VERTICAL);
            name = text("", 14, primary());
            name.setTypeface(Typeface.MONOSPACE);
            state = text("", 12, secondary());
            texts.addView(name);
            texts.addView(state);
            view.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            view.setTag(this);
        }
    }
}
