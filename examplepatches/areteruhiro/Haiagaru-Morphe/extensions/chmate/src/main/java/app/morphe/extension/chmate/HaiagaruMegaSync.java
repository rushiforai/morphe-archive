package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.text.InputType;
import android.view.ViewGroup;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ArrayAdapter;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONObject;
import org.json.JSONArray;

import java.io.IOException;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicBoolean;

/** MEGA backup controls. Login passwords are not persisted by this component. */
final class HaiagaruMegaSync {
    private static final String PREFS = "haiagaru.mega-sync.options";
    private static final String CATEGORIES = "categories";
    private static final String AUTO = "automatic";
    private static final String LAST = "lastBackup";
    private static final String LAST_REMOTE = "lastRemoteCreatedAt";
    private static final String SHOW_DIFF = "showDiff";
    private static final String MODE = "mode";
    private static final String INTERVAL_VALUE = "intervalValue";
    private static final String INTERVAL_UNIT = "intervalUnit";
    private static final int MODE_REMOTE_TO_LOCAL = 1;
    private static final int MODE_LOCAL_TO_REMOTE = 2;
    private static final int MODE_BIDIRECTIONAL = 3;
    private static final long MIN_INTERVAL = 5L * 60 * 1000;
    private static final int[] CATEGORY_BITS = {
            HaiagaruSyncSnapshot.BOOKMARKS, HaiagaruSyncSnapshot.NG,
            HaiagaruSyncSnapshot.SETTINGS, HaiagaruSyncSnapshot.POST_HISTORY,
            HaiagaruSyncSnapshot.KAKIKOMI, HaiagaruSyncSnapshot.COOKIES
    };
    private static final String[] CATEGORY_NAMES = {
            "お気に入り・閲覧履歴", "NGワード・NG IDなど", "ChMate・Haiagaruの設定",
            "書き込み履歴 (postDataList.json)", "書き込みメモ (kakikomi.txt)",
            "Cookie（ログイン状態を含む・初期OFF）"
    };
    private static final AtomicBoolean RUNNING = new AtomicBoolean(false);
    private static final AtomicBoolean REGISTERED = new AtomicBoolean(false);
    private static volatile Activity foreground;

    private HaiagaruMegaSync() {}

    static void addSettingsButton(LinearLayout parent, Activity activity) {
        Button button = new Button(activity);
        button.setText("MEGAにバックアップ・復元");
        button.setOnClickListener(view -> showDialog(activity));
        parent.addView(button);
        TextView help = new TextView(activity);
        help.setText("自分のMEGAアカウントに保存します。同期対象を選択できます。"
                + " 自動バックアップとCookie同期は初期状態でOFFです。"
                + " Cookieを選ぶとログイン状態がバックアップに含まれます。");
        help.setTextSize(13);
        parent.addView(help);
    }

    static void maybeBackupOnStartup(Context context) {
        // A process can also be started by a service. Register here, but never
        // transfer or restore until a real Activity is resumed.
        if (!(context instanceof Application) || !REGISTERED.compareAndSet(false, true)) return;
        ((Application) context).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            private boolean checked;
            @Override public void onActivityResumed(Activity activity) {
                foreground = activity;
                if (checked) return;
                checked = true;
                SharedPreferences prefs = options(activity);
                if (!prefs.getBoolean(AUTO, false) || !HaiagaruMegaSession.hasSession(activity)) return;
                long elapsed = System.currentTimeMillis() - prefs.getLong(LAST, 0);
                if (elapsed >= 0 && elapsed < intervalMillis(prefs)) return;
                int categories = prefs.getInt(CATEGORIES, HaiagaruSyncSnapshot.DEFAULT);
                if (categories != 0) startSync(activity, categories, false);
            }
            @Override public void onActivityPaused(Activity activity) { if (foreground == activity) foreground = null; }
            @Override public void onActivityCreated(Activity a, Bundle b) {}
            @Override public void onActivityStarted(Activity a) {}
            @Override public void onActivityStopped(Activity a) {}
            @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}
            @Override public void onActivityDestroyed(Activity a) { if (foreground == a) foreground = null; }
        });
    }

    private static void showDialog(Activity activity) {
        SharedPreferences options = options(activity);
        ScrollView scroll = new ScrollView(activity);
        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        int margin = (int) (18 * activity.getResources().getDisplayMetrics().density);
        content.setPadding(margin, margin, margin, margin);
        scroll.addView(content);

        TextView description = new TextView(activity);
        description.setText("同期する項目を選択してください。バックアップ時は選択項目のみ保存し、"
                + "復元時にはもう一度対象を選べます。Cookieにはログイン情報が含まれるため、"
                + "必要な場合のみ選択してください。MEGA上のバックアップにも保存されます。"
                + "対象はChMateのCookie用設定で、WebView内のCookieは含みません。");
        content.addView(description);

        CheckBox[] choices = new CheckBox[CATEGORY_BITS.length];
        int saved = options.getInt(CATEGORIES, HaiagaruSyncSnapshot.DEFAULT);
        for (int index = 0; index < choices.length; index++) {
            final int bit = CATEGORY_BITS[index];
            CheckBox choice = new CheckBox(activity);
            choice.setText(CATEGORY_NAMES[index]);
            choice.setChecked((saved & bit) != 0);
            choice.setOnCheckedChangeListener((button, checked) -> {
                int flags = options.getInt(CATEGORIES, HaiagaruSyncSnapshot.DEFAULT);
                options.edit().putInt(CATEGORIES, checked ? flags | bit : flags & ~bit).apply();
            });
            content.addView(choice);
            choices[index] = choice;
        }

        CheckBox automatic = new CheckBox(activity);
        automatic.setText("指定した間隔で自動同期（アプリ起動時に実行）");
        automatic.setChecked(options.getBoolean(AUTO, false));
        automatic.setOnCheckedChangeListener((button, checked) ->
                options.edit().putBoolean(AUTO, checked).apply());
        content.addView(automatic);

        CheckBox showDiff = new CheckBox(activity);
        showDiff.setText("復元前に変更内容を確認する");
        showDiff.setChecked(options.getBoolean(SHOW_DIFF, true));
        showDiff.setOnCheckedChangeListener((button, checked) ->
                options.edit().putBoolean(SHOW_DIFF, checked).apply());
        content.addView(showDiff);

        TextView modeTitle = new TextView(activity);
        modeTitle.setText("同期方式");
        modeTitle.setTextSize(16);
        content.addView(modeTitle);
        RadioGroup modes = new RadioGroup(activity);
        RadioButton remoteToLocal = radio(activity, "同期元: MEGA → この端末");
        RadioButton localToRemote = radio(activity, "同期元: この端末 → MEGA");
        RadioButton bothWays = radio(activity, "双方向: 不足分をお互いに追加");
        modes.addView(remoteToLocal);
        modes.addView(localToRemote);
        modes.addView(bothWays);
        int savedMode = options.getInt(MODE, MODE_BIDIRECTIONAL);
        modes.check(savedMode == MODE_REMOTE_TO_LOCAL ? remoteToLocal.getId()
                : savedMode == MODE_LOCAL_TO_REMOTE ? localToRemote.getId() : bothWays.getId());
        modes.setOnCheckedChangeListener((group, checkedId) -> options.edit().putInt(MODE,
                checkedId == remoteToLocal.getId() ? MODE_REMOTE_TO_LOCAL
                        : checkedId == localToRemote.getId() ? MODE_LOCAL_TO_REMOTE : MODE_BIDIRECTIONAL).apply());
        content.addView(modes);

        TextView intervalTitle = new TextView(activity);
        intervalTitle.setText("自動同期の間隔（最短5分）");
        intervalTitle.setTextSize(16);
        content.addView(intervalTitle);
        LinearLayout intervalRow = new LinearLayout(activity);
        intervalRow.setOrientation(LinearLayout.HORIZONTAL);
        EditText intervalValue = new EditText(activity);
        intervalValue.setInputType(InputType.TYPE_CLASS_NUMBER);
        intervalValue.setSingleLine(true);
        intervalValue.setText(String.valueOf(options.getInt(INTERVAL_VALUE, 1)));
        intervalRow.addView(intervalValue, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        Spinner intervalUnit = new Spinner(activity);
        String[] units = {"分ごと", "時間ごと", "日ごと"};
        intervalUnit.setAdapter(new ArrayAdapter<>(activity,
                android.R.layout.simple_spinner_dropdown_item, units));
        intervalUnit.setSelection(options.getInt(INTERVAL_UNIT, 2));
        intervalRow.addView(intervalUnit, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        content.addView(intervalRow);
        Button saveInterval = new Button(activity);
        saveInterval.setText("間隔を保存");
        saveInterval.setOnClickListener(view -> {
            try {
                int value = Math.max(1, Integer.parseInt(intervalValue.getText().toString().trim()));
                int unit = intervalUnit.getSelectedItemPosition();
                if (value > 3650) throw new NumberFormatException();
                long millis = toMillis(value, unit);
                if (millis < MIN_INTERVAL) throw new IllegalArgumentException("5分未満は指定できません");
                options.edit().putInt(INTERVAL_VALUE, value).putInt(INTERVAL_UNIT, unit).apply();
                message(activity, "自動同期の間隔を保存しました");
            } catch (IllegalArgumentException error) {
                message(activity, error.getMessage() == null ? "間隔の指定が不正です" : error.getMessage());
            }
        });
        content.addView(saveInterval);

        Button credentials = new Button(activity);
        credentials.setText(HaiagaruMegaSession.hasSession(activity)
                ? "MEGAの接続を管理" : "MEGAにログイン");
        credentials.setOnClickListener(view -> showLoginDialog(activity));
        content.addView(credentials);

        Button backup = new Button(activity);
        backup.setText("選択項目を今すぐバックアップ");
        backup.setOnClickListener(view -> {
            int flags = chosen(choices);
            if (flags == 0) {
                message(activity, "バックアップする項目を選択してください");
                return;
            }
            run(activity, "バックアップ中", () -> {
                String name = HaiagaruMegaClient.upload(activity.getApplicationContext(),
                        HaiagaruSyncSnapshot.capture(activity.getApplicationContext(), flags));
                options.edit().putLong(LAST, System.currentTimeMillis()).apply();
                return "MEGAのHaiagaruフォルダに保存しました: " + name;
            });
        });
        content.addView(backup);

        Button sync = new Button(activity);
        sync.setText("設定した方式で今すぐ同期");
        sync.setOnClickListener(view -> {
            int flags = chosen(choices);
            if (flags == 0) {
                message(activity, "同期する項目を選択してください");
                return;
            }
            startSync(activity, flags, false);
        });
        content.addView(sync);

        Button restore = new Button(activity);
        restore.setText("MEGAの最新バックアップを確認して復元");
        restore.setOnClickListener(view -> {
            startSync(activity, chosen(choices), true);
        });
        content.addView(restore);

        Button saveLocal = new Button(activity);
        saveLocal.setText("端末のファイルにバックアップ");
        saveLocal.setOnClickListener(view -> {
            int flags = chosen(choices);
            if (flags == 0) {
                message(activity, "バックアップする項目を選択してください");
                return;
            }
            Intent intent = new Intent(activity, HaiagaruLocalBackupActivity.class);
            intent.putExtra(HaiagaruLocalBackupActivity.EXTRA_MODE, HaiagaruLocalBackupActivity.MODE_SAVE);
            intent.putExtra(HaiagaruLocalBackupActivity.EXTRA_CATEGORIES, flags);
            activity.startActivity(intent);
        });
        content.addView(saveLocal);

        Button openLocal = new Button(activity);
        openLocal.setText("端末のバックアップファイルから復元");
        openLocal.setOnClickListener(view -> {
            Intent intent = new Intent(activity, HaiagaruLocalBackupActivity.class);
            intent.putExtra(HaiagaruLocalBackupActivity.EXTRA_MODE, HaiagaruLocalBackupActivity.MODE_OPEN);
            intent.putExtra(HaiagaruLocalBackupActivity.EXTRA_CATEGORIES, chosen(choices));
            activity.startActivity(intent);
        });
        content.addView(openLocal);

        TextView localNote = new TextView(activity);
        localNote.setText("端末のファイル操作はMEGAログイン不要です。Cookieを含めると、"
                + "ログイン情報が暗号化されていないJSONファイルに保存されます。"
                + "共有先と保管場所に注意してください。");
        localNote.setTextSize(13);
        content.addView(localNote);

        TextView note = new TextView(activity);
        note.setText("MEGA上に「Haiagaru」フォルダを作成します。復元は確認後に実行し、"
                + "復元前の端末データをアプリ内へ退避します。復元後はChMateを再起動してください。"
                + " 双方向同期は既存の項目を残して不足分だけ追加します。"
                + " 自動同期は起動して画面を表示した時だけ確認します。終了中・バックグラウンドでは予約実行しません。"
                + " この機能はAndroid 7以降が必要です。");
        note.setTextSize(13);
        content.addView(note);
        new AlertDialog.Builder(activity).setTitle("バックアップ・同期")
                .setView(scroll).setPositiveButton("閉じる", null).show();
    }

    private static RadioButton radio(Activity activity, String label) {
        RadioButton button = new RadioButton(activity);
        button.setId(View.generateViewId());
        button.setText(label);
        return button;
    }

    private static long toMillis(int value, int unit) {
        long multiplier = unit == 0 ? 60_000L : unit == 1 ? 3_600_000L : 86_400_000L;
        return Math.multiplyExact((long) value, multiplier);
    }

    private static long intervalMillis(SharedPreferences options) {
        try {
            int value = Math.max(1, options.getInt(INTERVAL_VALUE, 1));
            return Math.max(MIN_INTERVAL, toMillis(value, options.getInt(INTERVAL_UNIT, 2)));
        } catch (RuntimeException ignored) {
            return 86_400_000L;
        }
    }

    /**
     * Executes the selected direction. In two-way mode the remote snapshot is
     * merged into the device first, then the union is uploaded again. Thus a
     * newer device never loses a local-only bookmark, rule, post, or memo.
     */
    private static String runConfiguredSync(Context context, int categories, int mode)
            throws Exception {
        SharedPreferences options = options(context);
        if (mode == MODE_LOCAL_TO_REMOTE) {
            requireForeground();
            String name = HaiagaruMegaClient.upload(context,
                    HaiagaruSyncSnapshot.capture(context, categories));
            return "この端末のデータをMEGAへ保存しました: " + name;
        }

        HaiagaruMegaClient.MegaFile file = HaiagaruMegaClient.latest(context);
        JSONObject snapshot = HaiagaruSyncSnapshot.validate(
                HaiagaruMegaClient.download(context, file));
        long createdAt = snapshot.optLong("createdAt", 0L);
        if (mode == MODE_REMOTE_TO_LOCAL) {
            long applied = options.getLong(LAST_REMOTE, 0L);
            if (createdAt > 0 && createdAt <= applied) {
                return "MEGAに新しいバックアップはありません";
            }
            if (!approveChanges(context, snapshot, categories, false)) return "復元を保留しました";
            requireForeground();
            HaiagaruSyncSnapshot.restore(context, snapshot, categories);
            options.edit().putLong(LAST_REMOTE, createdAt).apply();
            return "MEGAの最新バックアップを復元しました。ChMateを再起動してください";
        }

        if (!approveChanges(context, snapshot, categories, true)) return "同期を保留しました";
        requireForeground();
        HaiagaruSyncSnapshot.mergeMissing(context, snapshot, categories);
        String name = HaiagaruMegaClient.upload(context,
                HaiagaruSyncSnapshot.capture(context, categories));
        options.edit().putLong(LAST_REMOTE, createdAt).apply();
        return "双方向同期が完了しました。不足分を統合してMEGAへ保存しました: " + name;
    }

    private static void requireForeground() throws IOException {
        Activity activity = foreground;
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            throw new IOException("画面が閉じられたため同期を保留しました。次回起動時に再確認してください");
        }
    }

    private static boolean approveChanges(Context context, JSONObject snapshot,
                                          int categories, boolean merge) throws Exception {
        requireForeground();
        if (!options(context).getBoolean(SHOW_DIFF, true)) return true;
        Activity activity = foreground;
        String summary = HaiagaruSyncSnapshot.describeChanges(context, snapshot, categories, merge);
        java.util.concurrent.CountDownLatch decision = new java.util.concurrent.CountDownLatch(1);
        AtomicBoolean approved = new AtomicBoolean();
        activity.runOnUiThread(() -> {
            if (foreground != activity || activity.isFinishing() || activity.isDestroyed()) {
                decision.countDown();
                return;
            }
            new AlertDialog.Builder(activity).setTitle("適用する変更を確認")
                    .setMessage(summary + (merge ? "\n既存の値は保持します。" : "\n選択した設定・履歴ファイルは復元元の値を使用します。"))
                    .setNegativeButton("今回は見送る", (d, w) -> decision.countDown())
                    .setPositiveButton("適用", (d, w) -> { approved.set(true); decision.countDown(); })
                    .setOnCancelListener(d -> decision.countDown())
                    .setOnDismissListener(d -> decision.countDown()).show();
        });
        while (!decision.await(1, java.util.concurrent.TimeUnit.SECONDS)) {
            if (foreground != activity) return false;
        }
        return approved.get() && foreground == activity;
    }

    private static void startSync(Activity activity, int categories, boolean preview) {
        if (categories == 0) {
            message(activity, "同期する項目を選択してください");
            return;
        }
        if (!RUNNING.compareAndSet(false, true)) {
            message(activity, "ほかの同期処理が進行中です");
            return;
        }
        SharedPreferences prefs = options(activity);
        message(activity, preview ? "MEGAのバックアップを確認中" : "同期中");
        new Thread(() -> {
            try {
                if (preview) {
                    HaiagaruMegaClient.MegaFile file = HaiagaruMegaClient.latest(activity);
                    JSONObject snapshot = HaiagaruSyncSnapshot.validate(
                            HaiagaruMegaClient.download(activity, file));
                    activity.runOnUiThread(() -> confirmRestore(activity, file, snapshot, categories));
                } else {
                    int mode = prefs.getInt(MODE, MODE_BIDIRECTIONAL);
                    String result;
                    try {
                        result = runConfiguredSync(activity.getApplicationContext(), categories, mode);
                    } catch (IOException missingRemote) {
                        if (mode != MODE_BIDIRECTIONAL
                                || !String.valueOf(missingRemote.getMessage()).contains("バックアップがありません")) {
                            throw missingRemote;
                        }
                        String name = HaiagaruMegaClient.upload(activity,
                                HaiagaruSyncSnapshot.capture(activity, categories));
                        result = "MEGAに初回バックアップを保存しました: " + name;
                    }
                    prefs.edit().putLong(LAST, System.currentTimeMillis()).apply();
                    final String completed = result;
                    activity.runOnUiThread(() -> message(activity, completed));
                }
            } catch (Exception error) {
                activity.runOnUiThread(() -> showError(activity, error));
            } finally {
                RUNNING.set(false);
            }
        }, preview ? "Haiagaru-MEGA-preview" : "Haiagaru-MEGA-operation").start();
    }

    private static void showLoginDialog(Activity activity) {
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        int margin = (int) (20 * activity.getResources().getDisplayMetrics().density);
        layout.setPadding(margin, margin, margin, margin);
        TextView warning = new TextView(activity);
        warning.setText("MEGAアカウントでログインします。パスワードと2段階認証コードは保存しません。"
                + "ログイン後のセッションはAndroid Keystoreで暗号化してこの端末に保存します。");
        layout.addView(warning);
        EditText email = field(activity, layout, "メールアドレス", false);
        EditText password = field(activity, layout, "パスワード", true);
        EditText mfa = field(activity, layout, "2段階認証コード（設定している場合）", false);
        AlertDialog dialog = new AlertDialog.Builder(activity)
                .setTitle("MEGAにログイン")
                .setView(layout)
                .setNegativeButton("キャンセル", null)
                .setNeutralButton("この端末の接続を解除", (ignored, which) ->
                        new AlertDialog.Builder(activity)
                                .setMessage("この端末に保存したMEGAセッションを削除しますか？")
                                .setNegativeButton("キャンセル", null)
                                .setPositiveButton("削除", (confirmation, selected) -> {
                                    HaiagaruMegaSession.removeSession(activity);
                                    options(activity).edit().putBoolean(AUTO, false).apply();
                                    message(activity, "この端末の接続を解除しました");
                                }).show())
                .setPositiveButton("ログイン", null).create();
        dialog.setOnShowListener(ignored -> dialog.getButton(AlertDialog.BUTTON_POSITIVE)
                .setOnClickListener(view -> {
                    String address = email.getText().toString().trim();
                    String secret = password.getText().toString();
                    String code = mfa.getText().toString().trim();
                    password.setText("");
                    if (address.isEmpty() || secret.isEmpty()) {
                        message(activity, "メールアドレスとパスワードを入力してください");
                        return;
                    }
                    dialog.dismiss();
                    run(activity, "MEGAに接続中", () -> {
                        HaiagaruMegaClient.login(activity.getApplicationContext(),
                                address, secret, code);
                        return "MEGAに接続しました";
                    });
                }));
        dialog.show();
    }

    private static EditText field(Activity activity, LinearLayout layout,
                                  String hint, boolean secret) {
        EditText field = new EditText(activity);
        field.setHint(hint);
        field.setSingleLine(true);
        if (secret) field.setInputType(InputType.TYPE_CLASS_TEXT
                | InputType.TYPE_TEXT_VARIATION_PASSWORD);
        layout.addView(field, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return field;
    }

    private static void confirmRestore(Activity activity, HaiagaruMegaClient.MegaFile file,
                                       JSONObject snapshot, int currentChoice) {
        int available = snapshot.optInt("categories", 0) & HaiagaruSyncSnapshot.ALL;
        if (available == 0) {
            showError(activity, new IOException("復元できる項目がありません"));
            return;
        }
        String[] labels = new String[CATEGORY_BITS.length];
        boolean[] selected = new boolean[CATEGORY_BITS.length];
        for (int index = 0; index < CATEGORY_BITS.length; index++) {
            boolean present = (available & CATEGORY_BITS[index]) != 0;
            labels[index] = CATEGORY_NAMES[index] + (present ? "" : "（バックアップに含まれません）");
            selected[index] = present && (currentChoice & CATEGORY_BITS[index]) != 0;
        }
        String message = file.name + "\n作成: " + file.createdTime
                + "\n\n既存の履歴・NGは残して追加します。設定・書き込み履歴・メモは"
                + "復元対象の値で上書きします。復元前のコピーを端末内に保存します。";
        if ((available & HaiagaruSyncSnapshot.COOKIES) != 0) {
            message += "\nCookieを選ぶとログイン情報も復元されます。別端末では再ログインが必要な場合があります。";
        }
        if (options(activity).getBoolean(SHOW_DIFF, true)) {
            message += "\n\n変更内容（選択した項目）\n" + buildChangeSummary(activity, snapshot, available);
        }
        new AlertDialog.Builder(activity).setTitle("復元内容を確認")
                .setMessage(message)
                .setMultiChoiceItems(labels, selected, (dialog, index, checked) ->
                        selected[index] = checked && (available & CATEGORY_BITS[index]) != 0)
                .setNegativeButton("キャンセル", null)
                .setPositiveButton("復元", (dialog, which) -> {
                    int flags = 0;
                    for (int index = 0; index < selected.length; index++) {
                        if (selected[index]) flags |= CATEGORY_BITS[index];
                    }
                    if (flags == 0) {
                        message(activity, "復元する項目を選択してください");
                        return;
                    }
                    final int restoreFlags = flags;
                    run(activity, "復元中", () -> {
                        if (!approveChanges(activity, snapshot, restoreFlags, false)) return "復元を保留しました";
                        requireForeground();
                        HaiagaruSyncSnapshot.restore(activity.getApplicationContext(),
                                snapshot, restoreFlags);
                        return "復元しました。ChMateを再起動してください";
                    });
                }).show();
    }

    private static String buildChangeSummary(Context context, JSONObject snapshot, int available) {
        StringBuilder summary = new StringBuilder();
        if ((available & HaiagaruSyncSnapshot.BOOKMARKS) != 0) {
            JSONArray rows = snapshot.optJSONArray("bookmarks");
            summary.append("・お気に入り・閲覧履歴: ")
                    .append(rows == null ? 0 : rows.length()).append("件の追加候補\n");
        }
        if ((available & HaiagaruSyncSnapshot.NG) != 0) {
            JSONObject files = snapshot.optJSONObject("ng");
            summary.append("・NG設定: ").append(files == null ? 0 : files.length())
                    .append("ファイルを確認\n");
        }
        if ((available & HaiagaruSyncSnapshot.SETTINGS) != 0) {
            JSONObject files = snapshot.optJSONObject("settings");
            int values = 0;
            if (files != null) {
                for (Iterator<String> names = files.keys(); names.hasNext();) {
                    JSONObject object = files.optJSONObject(names.next());
                    if (object != null) values += object.length();
                }
            }
            summary.append("・ChMate・Haiagaru設定: ").append(values).append("項目を確認\n");
        }
        if ((available & HaiagaruSyncSnapshot.POST_HISTORY) != 0) {
            summary.append("・書き込み履歴: 追加候補を確認\n");
        }
        if ((available & HaiagaruSyncSnapshot.KAKIKOMI) != 0) {
            summary.append("・書き込みメモ: 追加候補を確認\n");
        }
        if ((available & HaiagaruSyncSnapshot.COOKIES) != 0) {
            JSONObject stores = snapshot.optJSONObject("cookies");
            summary.append("・Cookie: ").append(stores == null ? 0 : stores.length())
                    .append("保存領域を確認（ログイン情報を含む）\n");
        }
        return summary.length() == 0 ? "変更候補はありません" : summary.toString().trim();
    }

    private static int chosen(CheckBox[] choices) {
        int flags = 0;
        for (int index = 0; index < choices.length; index++) {
            if (choices[index].isChecked()) flags |= CATEGORY_BITS[index];
        }
        return flags;
    }

    private static void run(Activity activity, String status, Work work) {
        if (!RUNNING.compareAndSet(false, true)) {
            message(activity, "ほかの同期処理が進行中です");
            return;
        }
        message(activity, status);
        new Thread(() -> {
            try {
                String result = work.perform();
                activity.runOnUiThread(() -> message(activity, result));
            } catch (Exception error) {
                activity.runOnUiThread(() -> showError(activity, error));
            } finally {
                RUNNING.set(false);
            }
        }, "Haiagaru-MEGA-operation").start();
    }

    private static SharedPreferences options(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static void showError(Activity activity, Exception error) {
        // Never print an exception containing session keys or snapshot contents.
        String detail = error instanceof IOException ? error.getMessage()
                : error.getClass().getSimpleName();
        new AlertDialog.Builder(activity).setTitle("同期できませんでした")
                .setMessage(detail == null ? "通信または保存を確認してください" : detail)
                .setPositiveButton("OK", null).show();
    }

    private static void message(Activity activity, String text) {
        Toast.makeText(activity, text, Toast.LENGTH_LONG).show();
    }

    private interface Work {
        String perform() throws Exception;
    }
}
