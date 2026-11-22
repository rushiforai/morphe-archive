/*
 * h19e8p Patches
 * Copyright (C) 2026 h19e8p
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version. See the LICENSE file.
 */

package app.morphe.extension.h19e8p;

import android.app.AlertDialog;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.autoexpand.AutoExpandCursor;
import app.morphe.extension.h19e8p.flags.ElementPicker;
import app.morphe.extension.h19e8p.flags.FlagReads;
import app.morphe.extension.h19e8p.flags.FlagRecorder;
import app.morphe.extension.h19e8p.flags.PikoFlags;

/**
 * X の「設定とプライバシー」から開く、h19e8p Patches の設定画面。
 *
 * <p>X 側のコードを書き換えないので、piko など、ほかのパッチと同じ箇所を取り合わない。
 * 項目は、当てたパッチの分だけ出す。
 */
public final class SettingsActivity extends Screen {

    /** 設定画面の1行。スイッチなら key は Prefs に保存する名前、操作なら action を動かす。 */
    private static final class Entry {
        final String key;
        final String title;
        final String summary;
        final boolean defaultValue;
        final Runnable action;

        Entry(String key, String title, String summary, boolean defaultValue) {
            this.key = key;
            this.title = title;
            this.summary = summary;
            this.defaultValue = defaultValue;
            this.action = null;
        }

        Entry(String title, String summary, Runnable action) {
            this.key = null;
            this.title = title;
            this.summary = summary;
            this.defaultValue = false;
            this.action = action;
        }

        /** 見せるだけの行 (押しても何もしない)。 */
        static Entry info(String title, String summary) {
            return new Entry(title, summary, NOTHING);
        }
    }

    private static final Runnable NOTHING = () -> {
    };

    private static final class Section {
        final String title;
        final List<Entry> entries = new ArrayList<>();

        Section(String title) {
            this.title = title;
        }
    }

    private LinearLayout list;

    @Override
    protected String screenTitle() {
        return "h19e8p Patches";
    }

    @Override
    protected View createContent() {
        ScrollView scroll = new ScrollView(this);
        list = new LinearLayout(this);
        list.setOrientation(LinearLayout.VERTICAL);
        list.setPadding(0, dp(8), 0, dp(24));
        scroll.addView(list);
        return scroll;
    }

    @Override
    protected void onResume() {
        super.onResume();
        build();
    }

    private List<Section> sections() {
        List<Section> sections = new ArrayList<>();
        if (AutoExpandCursor.isApplied()) {
            Section section = new Section(Text.of("ポストをさらに表示", "Show more posts"));
            section.entries.add(new Entry(AutoExpandCursor.PREF_BACKGROUND_FETCH,
                    Text.of("画面に出る前に裏で読み込む", "Load in the background before it appears"),
                    Text.of("タイムラインを開いた時に、ボタンの先のポストを裏で読み込みます。オフにすると、ボタンが画面に来た時の自動タップだけで読み込みます。",
                            "Loads the posts behind the button in the background when a timeline opens. When off, posts are loaded only by tapping the button automatically."),
                    AutoExpandCursor.DEFAULT_BACKGROUND_FETCH));
            section.entries.add(new Entry(AutoExpandCursor.PREF_HIDE_GAPS,
                    Text.of("「ポストをさらに表示」を隠す", "Hide \"Show more posts\""),
                    Text.of("読み込みが始まったボタンと、読み込み済みと記録したボタンを非表示にします。",
                            "Hides the button once loading has started, and buttons recorded as already loaded."),
                    AutoExpandCursor.DEFAULT_HIDE_GAPS));
            section.entries.add(new Entry(AutoExpandCursor.PREF_SHOW_TOASTS,
                    Text.of("動作時にトーストを表示する", "Show toasts"),
                    Text.of("裏で読み込んだ時や、ボタンを隠した時・自動でタップした時に、短いメッセージを出します。",
                            "Shows a short message when posts are loaded, a button is hidden, or a button is tapped automatically."),
                    AutoExpandCursor.DEFAULT_SHOW_TOASTS));
            section.entries.add(new Entry(AutoExpandCursor.PREF_LOG_TO_FILE,
                    Text.of("診断ログを記録する", "Record a diagnostic log"),
                    Text.of("ボタンの処理の内容を Download/AutoExpand/AutoExpand-Log.txt に英語で追記します。",
                            "Adds what is done with each button to Download/AutoExpand/AutoExpand-Log.txt, in English."),
                    AutoExpandCursor.DEFAULT_LOG_TO_FILE));
            sections.add(section);
        }
        if (FlagReads.isApplied()) {
            Section section = new Section(Text.of("フラグを探す", "Find feature flags"));
            section.entries.add(new Entry(
                    ElementPicker.isArmed() ? Text.of("要素から探す (使用中)", "Find from an element (in use)")
                            : Text.of("要素から探す", "Find from an element"),
                    Text.of("X の画面の部品を選ぶと、関係しそうなフラグの候補を出します。押すと X に戻ります。調べたい画面を開いてから「選択」を押してください。",
                            "Pick a part of an X screen to list flags that may relate to it. Tapping this returns to X; open the screen, then tap Pick."),
                    this::startPicker));
            section.entries.add(new Entry(
                    FlagRecorder.isActive() ? Text.of("フラグの読み取りを記録 (記録中)", "Record flag reads (recording)")
                            : Text.of("フラグの読み取りを記録", "Record flag reads"),
                    Text.of("画面を開いた時に X が読んだフラグを記録します。Compose 製の画面でも使えます。押すと X に戻ります。",
                            "Records which flags X reads while you open a screen. Works on Compose screens too. Tapping this returns to X."),
                    this::startRecorder));
            sections.add(section);
        }

        Section storage = new Section(Text.of("ストレージ", "Storage"));
        storage.entries.add(new Entry(Text.of("すべてのストレージを削除", "Clear all storage"),
                Text.of("キャッシュした画像や動画、通信のデータ、ウェブのデータを消します。ログインや設定、下書きは消えません。消した後に X を再起動します。",
                        "Removes cached media, network data and web data. Your login, settings and drafts stay. X restarts afterwards."),
                this::confirmClearStorage));
        sections.add(storage);

        // 情報: 版と、当てたパッチ (piko の「パッチ情報」と同じ考え方)。
        Section about = new Section(Text.of("情報", "About"));
        about.entries.add(Entry.info(Text.of("アプリのバージョン", "App version"), PatchStatus.appVersion(this)));
        about.entries.add(Entry.info("h19e8p Patches", PatchStatus.version()));
        sections.add(about);
        Section applied = new Section(Text.of("適用されたパッチ", "Applied patches"));
        for (PatchStatus.Item item : PatchStatus.items()) {
            applied.entries.add(Entry.info((item.applied ? "✓  " : "—  ") + item.name,
                    item.applied ? Text.of("適用済み", "Applied") : Text.of("未適用", "Not applied")));
        }
        sections.add(applied);
        return sections;
    }

    private void confirmClearStorage() {
        // キャッシュは数万ファイルになることがあるので、大きさは裏で数え、数え終わったら書き換える。
        AlertDialog dialog = dialog()
                .setTitle(Text.of("すべてのストレージを削除しますか？", "Clear all storage?"))
                .setMessage(Text.of("大きさを計算しています…", "Calculating the size…"))
                .setPositiveButton(Text.of("削除", "Clear"), (d, w) -> {
                    Toast.makeText(this, Text.of("削除しています…", "Clearing…"), Toast.LENGTH_SHORT).show();
                    new Thread(() -> {
                        StorageCleaner.clear(getApplicationContext());
                        runOnUiThread(() -> AppRestart.restart(this));
                    }).start();
                })
                .setNegativeButton(Text.of("キャンセル", "Cancel"), null)
                .create();
        dialog.show();
        styleButtons(dialog);
        new Thread(() -> {
            long size = StorageCleaner.size(getApplicationContext());
            runOnUiThread(() -> {
                if (!dialog.isShowing()) return;
                dialog.setMessage(Text.of(StorageCleaner.format(size) + " を消して、X を再起動します。",
                        "Removes " + StorageCleaner.format(size) + " and restarts X."));
            });
        }).start();
    }

    private void build() {
        list.removeAllViews();
        List<Section> sections = sections();
        for (Section section : sections) {
            list.addView(header(section.title));
            for (Entry entry : section.entries) list.addView(row(entry));
        }
        if (FlagReads.isApplied() && !PikoFlags.available()) {
            list.addView(note(Text.of(
                    "見つけたフラグは piko のフラグの一覧に追加します。piko の「Hook feature flag」が当たっていないので、今は探すだけで、追加はできません。",
                    "Found flags are added to piko's flag list. piko's \"Hook feature flag\" is not applied, so flags can be found but not added.")));
        }
        // 「初期値に戻す」で戻るのはスイッチだけで、スイッチがあるのは「ポストをさらに表示」だけ。
        if (!AutoExpandCursor.isApplied()) return;
        TextView note = note(Text.of(
                "一部の項目は X を再起動すると反映されます。",
                "Some settings take effect after X is restarted."));
        note.setPadding(dp(16), dp(20), dp(16), dp(8));
        list.addView(note);
        TextView reset = text(Text.of("初期値に戻す", "Restore defaults"), 16, accent());
        reset.setPadding(dp(16), dp(14), dp(16), dp(14));
        reset.setBackgroundResource(selectable());
        reset.setOnClickListener(v -> confirmReset());
        list.addView(reset);
    }

    private void startPicker() {
        FlagRecorder.cancel();
        if (!ElementPicker.arm()) {
            Toast.makeText(this, Text.of("起動できませんでした", "Could not start"), Toast.LENGTH_SHORT).show();
            return;
        }
        Toast.makeText(this, Text.of("調べたい画面を開いてから「選択」を押してください",
                "Open the screen you want, then tap Pick"), Toast.LENGTH_LONG).show();
        finish();
    }

    private void startRecorder() {
        ElementPicker.disarm();
        if (!FlagRecorder.start()) {
            Toast.makeText(this, Text.of("起動できませんでした", "Could not start"), Toast.LENGTH_SHORT).show();
            return;
        }
        Toast.makeText(this, Text.of("記録を始めました。「リセット」してから調べたい画面を開き、「表示」を押してください",
                "Recording. Reset, open the screen you want, then tap Show"), Toast.LENGTH_LONG).show();
        finish();
    }

    private void confirmReset() {
        AlertDialog dialog = dialog()
                .setMessage(Text.of("ここで変えた値をすべて消し、初期値に戻しますか？",
                        "Remove every value changed here and go back to the defaults?"))
                .setPositiveButton(Text.of("戻す", "Restore"), (d, w) -> {
                    Prefs.clear();
                    build();
                })
                .setNegativeButton(Text.of("キャンセル", "Cancel"), null)
                .create();
        dialog.show();
        styleButtons(dialog);
    }

    private View row(Entry entry) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(16), dp(12), dp(16), dp(12));
        row.setBackgroundResource(selectable());

        LinearLayout texts = new LinearLayout(this);
        texts.setOrientation(LinearLayout.VERTICAL);
        texts.addView(text(entry.title, 16, primary()));
        TextView summary = text(entry.summary, 13, secondary());
        summary.setPadding(0, dp(2), 0, 0);
        texts.addView(summary);
        row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        if (entry.action == NOTHING) {
            row.setBackground(null);
            return row;
        }
        if (entry.action != null) {
            row.setOnClickListener(v -> entry.action.run());
            return row;
        }
        Switch toggle = new Switch(this);
        toggle.setChecked(Prefs.bool(entry.key, entry.defaultValue));
        toggle.setOnCheckedChangeListener((button, checked) -> Prefs.setBool(entry.key, checked));
        toggle.setPadding(dp(12), 0, 0, 0);
        int[][] states = {{android.R.attr.state_checked}, {}};
        toggle.setThumbTintList(new ColorStateList(states,
                new int[]{accent(), dark ? Color.rgb(0xB9, 0xCA, 0xD3) : Color.WHITE}));
        toggle.setTrackTintList(new ColorStateList(states,
                new int[]{Color.argb(0x80, 0x1D, 0x9B, 0xF0), secondary()}));
        row.addView(toggle);
        row.setOnClickListener(v -> toggle.toggle());
        return row;
    }
}
