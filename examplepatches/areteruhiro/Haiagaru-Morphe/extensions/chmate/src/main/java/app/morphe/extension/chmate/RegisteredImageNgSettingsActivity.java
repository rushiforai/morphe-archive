package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.text.InputType;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.LinkedHashSet;

/** Local-only reference image management and user-selected NG sensitivity. */
public final class RegisteredImageNgSettingsActivity extends Activity {
    private static final int PICK_IMAGES = 413;
    private static final int PICK_FOLDER = 414;
    private static final String PENDING_IMPORT = "pendingImport";
    private static final String[] LEVELS = {
            "レベル1：厳密（同一画像・軽い再圧縮）",
            "レベル2：標準（同じ画像のリサイズ・画質変更）",
            "レベル3：広め（加工や画質差を積極判定）",
            "レベル4：類似優先（別画像も一致する可能性あり）"
    };
    private LinearLayout layout;
    private TextView countText, levelText, status, folderText;
    private int pendingImport, previewRequest;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        if (state != null) pendingImport = state.getInt(PENDING_IMPORT);
        ScrollView scroll = new ScrollView(this);
        layout = new LinearLayout(this);
        layout.setOrientation(LinearLayout.VERTICAL);
        int pad = Math.round(getResources().getDisplayMetrics().density * 16);
        layout.setPadding(pad, pad, pad, pad);
        scroll.setOnApplyWindowInsetsListener((view, insets) -> {
            layout.setPadding(pad + insets.getSystemWindowInsetLeft(),
                    pad + insets.getSystemWindowInsetTop(),
                    pad + insets.getSystemWindowInsetRight(),
                    pad + insets.getSystemWindowInsetBottom());
            return insets;
        });
        scroll.addView(layout);
        setContentView(scroll);
        scroll.requestApplyInsets();
        TextView heading = new TextView(this);
        heading.setText("登録画像によるあぼーん");
        heading.setTextSize(20);
        layout.addView(heading);
        setTitle("登録画像によるあぼーん");
        SharedPreferences settings = RegisteredImageNg.prefs(this);

        Switch enabled = new Switch(this);
        enabled.setText("登録画像に一致するレスをあぼーん");
        enabled.setChecked(settings.getBoolean(RegisteredImageNg.ENABLE, false));
        layout.addView(enabled);
        enabled.setOnCheckedChangeListener((button, value) -> {
            settings.edit().putBoolean(RegisteredImageNg.ENABLE, value).apply();
            RegisteredImageNg.settingsChanged();
        });

        countText = new TextView(this);
        countText.setText("一致枚数：" + RegisteredImageNg.count(this) + "枚以上");
        layout.addView(countText);
        SeekBar count = new SeekBar(this);
        count.setMax(9);
        count.setProgress(RegisteredImageNg.count(this) - 1);
        count.setContentDescription("あぼーんにする一致画像の枚数（1〜10）");
        layout.addView(count);
        count.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                countText.setText("一致枚数：" + (progress + 1) + "枚以上");
            }
            @Override public void onStartTrackingTouch(SeekBar bar) { }
            @Override public void onStopTrackingTouch(SeekBar bar) {
                settings.edit().putInt(RegisteredImageNg.COUNT, bar.getProgress() + 1).apply();
                RegisteredImageNg.settingsChanged();
            }
        });

        levelText = new TextView(this);
        layout.addView(levelText);
        Button choose = new Button(this);
        choose.setText("画像の判定レベルを選択");
        layout.addView(choose);
        choose.setOnClickListener(view -> new AlertDialog.Builder(this)
                .setTitle("画像一致の判定レベル")
                .setSingleChoiceItems(LEVELS, RegisteredImageNg.level(this), (dialog, which) -> {
                    settings.edit().putInt(RegisteredImageNg.LEVEL, which).apply();
                    RegisteredImageNg.settingsChanged();
                    updateLabels();
                    dialog.dismiss();
                })
                .setNegativeButton("閉じる", null)
                .show());

        TextView explanation = new TextView(this);
        explanation.setText("初期状態はOFF、判定は標準・2枚以上です。1レス内で異なる登録画像に一致した枚数を数えます。同じ画像の再投稿や同一画像を複数回貼った場合は1枚です。レベル4は視覚的な類似だけでも対象にするため、別画像の誤判定が増えます。判定と画像取得はバックグラウンドで行い、スレを開き直すと結果を反映します。画像取得にはChMateのキャッシュ・VPN設定を使用します。");
        layout.addView(explanation);

        folderText = new TextView(this);
        layout.addView(folderText);
        Button folder = new Button(this);
        folder.setText("SAFで保存先の親フォルダを選択・変更");
        layout.addView(folder);
        folder.setOnClickListener(view -> pickFolder(0));
        TextView folderHelp = new TextView(this);
        folderHelp.setText("URL登録は保存先の選択なしでアプリ内に保存できます。選択したフォルダ内に「" + RegisteredImageSafStore.DIRECTORY_NAME
                + "」を作成します。選んだ画像をここにコピーし、このフォルダ内の画像を判定します。"
                + "ファイル管理アプリから直接入れた画像も「再スキャン」で反映されます。最大"
                + RegisteredImageNg.MAX_REFERENCE_IMAGES + "枚まで判定します。"
                + "保存先を変更すると以前の登録画像を新しいフォルダへコピーします。");
        layout.addView(folderHelp);

        Button pick = new Button(this);
        pick.setText("端末の画像から登録（複数選択可）");
        layout.addView(pick);
        pick.setOnClickListener(view -> {
            if (RegisteredImageNg.hasSafFolder(this)) pickImages();
            else pickFolder(1);
        });

        Button url = new Button(this);
        url.setText("画像URLから登録");
        layout.addView(url);
        url.setOnClickListener(view -> showUrlInput());

        Button refresh = new Button(this);
        refresh.setText("専用フォルダ内の画像を再スキャン");
        layout.addView(refresh);
        refresh.setOnClickListener(view -> RegisteredImageNg.refresh(this::complete));

        status = new TextView(this);
        layout.addView(status);
        updateLabels();
        RegisteredImageNg.refresh(this::complete);
    }

    private void pickFolder(int next) {
        pendingImport = next;
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE);
        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION
                | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION);
        startActivityForResult(intent, PICK_FOLDER);
    }

    private void pickImages() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("image/*");
        intent.putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true);
        startActivityForResult(intent, PICK_IMAGES);
    }

    private void showUrlInput() {
        EditText input = new EditText(this);
        input.setHint("https://i.imgur.com/xxx.jpeg\n1行につき1URL");
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE);
        input.setMinLines(4);
        new AlertDialog.Builder(this).setTitle("画像URLを登録（最大80枚）")
                .setView(input).setPositiveButton("登録", (dialog, button) -> {
                    LinkedHashSet<String> urls = new LinkedHashSet<>();
                    for (String line : input.getText().toString().split("[\\s]+")) {
                        String trimmed = line.trim(); if (!trimmed.isEmpty()) urls.add(trimmed);
                    }
                    if (!urls.isEmpty()) RegisteredImageNg.importUrls(new ArrayList<>(urls), this::complete);
                }).setNegativeButton("キャンセル", null).show();
    }

    private void updateLabels() {
        levelText.setText("判定レベル：" + LEVELS[RegisteredImageNg.level(this)]);
        if (folderText != null) folderText.setText("登録先: " + RegisteredImageNg.folderDescription(this));
        if (status != null) status.setText("登録画像 " + RegisteredImageNg.registeredCount() + "枚／" + RegisteredImageNg.status());
    }
    private void showRegistered() {
        if (layout == null) return;
        final int request = ++previewRequest;
        RegisteredImageNg.loadPreviews((images, error) -> runOnUiThread(() -> {
            if (isFinishing() || isDestroyed() || request != previewRequest) return;
            for (int i = layout.getChildCount() - 1; i >= 0; i--)
                if ("registered-preview".equals(layout.getChildAt(i).getTag())) layout.removeViewAt(i);
            if (error != null) {
                Toast.makeText(this, "一覧を読めません: " + error, Toast.LENGTH_LONG).show();
            }
            for (int i = 0; i < images.size(); i++) {
                RegisteredImageNg.Preview image = images.get(i);
                LinearLayout row = new LinearLayout(this);
                row.setTag("registered-preview");
                row.setOrientation(LinearLayout.HORIZONTAL);
                ImageView preview = new ImageView(this);
                int width = Math.round(getResources().getDisplayMetrics().density * 72);
                preview.setImageBitmap(image.thumbnail);
                row.addView(preview, new LinearLayout.LayoutParams(width, width));
                Button remove = new Button(this);
                remove.setText("画像 " + (i + 1) + "（" + image.entry.name + "）を削除");
                row.addView(remove, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
                remove.setOnClickListener(view -> new AlertDialog.Builder(this)
                        .setMessage("この登録画像を削除しますか？")
                        .setPositiveButton("削除", (dialog, which) -> RegisteredImageNg.remove(image.entry, this::complete))
                        .setNegativeButton("キャンセル", null).show());
                layout.addView(row);
            }
        }));
    }
    private void complete(String message) {
        runOnUiThread(() -> {
            if (isFinishing() || isDestroyed()) return;
            Toast.makeText(this, message, Toast.LENGTH_LONG).show();
            updateLabels(); showRegistered();
        });
    }
    @Override protected void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        state.putInt(PENDING_IMPORT, pendingImport);
    }

    @Override protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == PICK_FOLDER) {
            int next = pendingImport;
            pendingImport = 0;
            if (resultCode == RESULT_OK && data != null && data.getData() != null) {
                RegisteredImageNg.selectFolder(data.getData(), data.getFlags(), (ok, message) ->
                        runOnUiThread(() -> {
                            if (isFinishing() || isDestroyed()) return;
                            Toast.makeText(this, message, Toast.LENGTH_LONG).show();
                            updateLabels(); showRegistered();
                            if (ok && next == 1) pickImages();
                            else if (ok && next == 2) showUrlInput();
                        }));
            }
            return;
        }
        if (requestCode != PICK_IMAGES || resultCode != RESULT_OK || data == null) return;
        LinkedHashSet<Uri> images = new LinkedHashSet<>();
        if (data.getData() != null) images.add(data.getData());
        ClipData clip = data.getClipData();
        if (clip != null) {
            for (int i = 0; i < clip.getItemCount(); i++) {
                Uri image = clip.getItemAt(i).getUri();
                if (image != null) images.add(image);
            }
        }
        if (!images.isEmpty()) RegisteredImageNg.importFiles(new ArrayList<>(images), this::complete);
    }
}
