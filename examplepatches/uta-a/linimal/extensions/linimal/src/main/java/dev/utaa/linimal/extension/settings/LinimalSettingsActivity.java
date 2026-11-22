package dev.utaa.linimal.extension.settings;

import android.annotation.TargetApi;
import android.app.ActionBar;
import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Insets;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.text.format.Formatter;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.view.Window;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;
import android.widget.CompoundButton;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import dev.utaa.linimal.extension.config.LinimalConfig;
import dev.utaa.linimal.extension.config.LinimalConfigBootstrap;
import dev.utaa.linimal.extension.config.LinimalConfigHealth;
import dev.utaa.linimal.extension.config.ReadReceiptMode;
import dev.utaa.linimal.extension.config.LinimalFeature;
import dev.utaa.linimal.extension.features.font.CustomFontFiles;
import dev.utaa.linimal.extension.features.font.CustomFontHooks;
import dev.utaa.linimal.extension.settings.ui.BackArrowDrawable;
import dev.utaa.linimal.extension.settings.ui.ChevronDrawable;
import dev.utaa.linimal.extension.settings.ui.LinimalPalette;
import dev.utaa.linimal.extension.status.PatchStatus;
import dev.utaa.linimal.extension.status.PatchStatusReadResult;
import dev.utaa.linimal.extension.status.PatchStatusReport;
import dev.utaa.linimal.extension.i18n.LinimalText;

/** LINE の設定画面に合わせた見た目で、Linimal の設定と適用状況を表示します。 */
public final class LinimalSettingsActivity extends Activity {
    private static final String STATE_PAGE_PATH = "linimal.settings.page_path";
    private static final String KEEP_UNREAD_AFTER_SEND_TITLE = "送信後も既読をつけない";
    private static final String KEEP_UNREAD_AFTER_SEND_SUMMARY =
            "既読をつけずに開いたトークで、メッセージを送っても既読をつけません。"
                    + "\n注意：返信しても相手には未読のまま表示され、誤解やトラブルにつながることがあります。未読バッジも残ります。";

    static final String RESTART_PENDING_SUMMARY = "アプリを再起動すると反映されます。";
    private static final String CUSTOM_FONT_FILE_TITLE = "フォントファイルを選択";
    private static final int REQUEST_PICK_CUSTOM_FONT = 0x4c46;

    /** 描画済みの Switch だけを持ち、画面再構築時に必ず破棄します。 */
    private final List<FeatureRow> featureRows = new ArrayList<>();
    /** この Activity 内のページ状態はこの navigation だけで管理します。 */
    private final SettingsNavigation navigation = new SettingsNavigation();

    private LinimalPalette palette;
    /** API 33 以上で登録した OnBackInvokedCallback。API 32 では null のままです。 */
    private Object systemBackCallback;
    private PatchStatusReadResult patchStatusResult;
    private PatchStatus readReceiptPatchStatus;
    private TextView readReceiptSummary;
    private Switch readReceiptToggle;
    private boolean keepUnreadAfterSendPatchAvailable;
    private TextView keepUnreadAfterSendSummary;
    private Switch keepUnreadAfterSendToggle;
    private PatchStatus customFontPatchStatus;
    private LinearLayout customFontFileRow;
    private TextView customFontFileSummary;
    /** 取り込みは別スレッドで行うため、画面を描き直しても状態を保ちます。 */
    private boolean customFontImporting;

    private static final class FeatureRow {
        private final FeatureCatalog.Entry entry;
        private final PatchStatus patchStatus;
        private final TextView summary;
        private final Switch toggle;

        FeatureRow(
                FeatureCatalog.Entry entry,
                PatchStatus patchStatus,
                TextView summary,
                Switch toggle) {
            this.entry = entry;
            this.patchStatus = patchStatus;
            this.summary = summary;
            this.toggle = toggle;
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        LinimalConfigBootstrap.initialize(this);
        palette = LinimalPalette.of(this);
        hideSystemActionBar();
        applySystemBars();
        registerSystemBackCallback();

        // patch status は LinimalConfig が初期化時に読んだ結果を共有し、hook の判定と表示を一致させます。
        patchStatusResult = LinimalConfig.get().getPatchStatusResult();
        if (savedInstanceState != null) {
            navigation.restore(savedInstanceState.getStringArray(STATE_PAGE_PATH));
        }
        renderCurrentPage();
    }

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        outState.putStringArray(STATE_PAGE_PATH, navigation.serialize());
        super.onSaveInstanceState(outState);
    }

    @Override
    protected void onDestroy() {
        unregisterSystemBackCallback();
        super.onDestroy();
    }

    /**
     * predictive back が無効な経路（API 32、または OnBackInvokedCallback 未使用時）のバックです。
     * API 33 以上で {@link #systemBackCallback} が登録されている場合、こちらは呼ばれません。
     */
    @Override
    public void onBackPressed() {
        navigateBack();
    }

    /**
     * LINE 本体は targetSdk 36 のため、API 33 以上では onBackPressed() ではなく
     * OnBackInvokedDispatcher へバックが配送されます。super.onCreate() が登録する既定の
     * コールバックより後に登録することで、同じ優先度の中でこちらが先に呼ばれます。
     */
    private void registerSystemBackCallback() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) {
            return;
        }
        systemBackCallback = SystemBack.register(this);
    }

    private void unregisterSystemBackCallback() {
        if (systemBackCallback == null) {
            return;
        }
        SystemBack.unregister(this, systemBackCallback);
        systemBackCallback = null;
    }

    /** API 33 以上でだけ読み込まれるよう、predictive back の API をこのクラスに閉じ込めます。 */
    @TargetApi(Build.VERSION_CODES.TIRAMISU)
    private static final class SystemBack {
        private SystemBack() {
        }

        static Object register(LinimalSettingsActivity activity) {
            OnBackInvokedCallback callback = new OnBackInvokedCallback() {
                @Override
                public void onBackInvoked() {
                    activity.navigateBack();
                }
            };
            activity.getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                    OnBackInvokedDispatcher.PRIORITY_DEFAULT, callback);
            return callback;
        }

        static void unregister(LinimalSettingsActivity activity, Object callback) {
            activity.getOnBackInvokedDispatcher()
                    .unregisterOnBackInvokedCallback((OnBackInvokedCallback) callback);
        }
    }

    private void navigateBack() {
        if (navigation.pop() == SettingsNavigation.PopResult.FINISH_ACTIVITY) {
            finish();
            return;
        }
        renderCurrentPage();
    }

    private void openPage(SettingsPage page) {
        // 同じページの重複 push や子ページからの深い push は navigation が拒否します。
        if (navigation.push(page)) {
            renderCurrentPage();
        }
    }

    /** ページ遷移時は View を作り直し、古い View への参照を残しません。 */
    private void renderCurrentPage() {
        clearRenderedReferences();

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(palette.background);
        applyWindowInsets(root);
        root.addView(createHeader(), new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(56)));

        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(0, 0, 0, dp(24));

        SettingsPage page = navigation.getCurrentPage();
        if (page == SettingsPage.ROOT) {
            addRootPage(content);
        } else {
            addFeaturePage(content, page);
        }

        ScrollView scrollView = new ScrollView(this);
        scrollView.setFillViewport(true);
        scrollView.setVerticalScrollBarEnabled(false);
        scrollView.addView(content, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        root.addView(scrollView, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        setContentView(root);

        // Config health は画面を描画するたびに取得し、書き込み失敗後も状態を更新します。
        renderRuntimeConfig();
    }

    private void clearRenderedReferences() {
        featureRows.clear();
        readReceiptPatchStatus = null;
        readReceiptSummary = null;
        readReceiptToggle = null;
        keepUnreadAfterSendPatchAvailable = false;
        keepUnreadAfterSendSummary = null;
        keepUnreadAfterSendToggle = null;
        customFontPatchStatus = null;
        customFontFileRow = null;
        customFontFileSummary = null;
    }

    private void addRootPage(LinearLayout parent) {
        addCategoryRow(parent, SettingsPage.ADS,
                LinimalText.t("広告"), LinimalText.t("広告と Premium の案内を非表示にします。"));
        addCategoryRow(parent, SettingsPage.AGENT_I,
                LinimalText.t("AI 機能"), LinimalText.t("Agent i と LINE AI の入口を非表示にします。"));
        addCategoryRow(parent, SettingsPage.HIDE,
                LinimalText.t("表示項目"), LinimalText.t("タブやメニューの項目を非表示にします。"));
        addCategoryRow(parent, SettingsPage.READ_RECEIPT,
                LinimalText.t("プライバシー"), LinimalText.t("既読をつけずにトークを読めます。"));
        addCategoryRow(parent, SettingsPage.READ_RECEIPT_READERS,
                LinimalText.t("既読者"), LinimalText.t("グループで誰が読んだかを表示します。"));
        addCategoryRow(parent, SettingsPage.TALK,
                LinimalText.t("トーク"), LinimalText.t("プレビューとリンクの開き方を設定します。"));
        addCategoryRow(parent, SettingsPage.THEME,
                LinimalText.t("外観"), LinimalText.t("配色とフォントを設定します。"));
        addCategoryRow(parent, SettingsPage.NOTIFICATIONS,
                LinimalText.t("通知とログイン"), LinimalText.t("通知と Google ログインを設定します。"));
    }

    private void addFeaturePage(LinearLayout parent, SettingsPage page) {
        if (patchStatusResult == null || !patchStatusResult.isAvailable()) {
            // status がないときは誤操作を防ぐため、Switch 自体を表示しません。
            addUnavailableFeatureMessage(parent, LinimalText.t("パッチ情報を読み取れないため、機能の設定を変更できません。"));
            return;
        }

        PatchStatusReport report = patchStatusResult.getReport();
        List<FeatureCatalog.Group> groups = FeatureCatalog.installedGroupsForPage(
                page, report.getFeatureIds());
        boolean hasEntry = false;
        for (FeatureCatalog.Group group : groups) {
            // 表示できる項目が残った小見出しだけ Group になるため、見出しだけが残ることはありません。
            if (group.getSection() != null) {
                addSectionHeader(parent, group.getSection().getTitle());
            }
            for (FeatureCatalog.Entry entry : group.getEntries()) {
                addFeatureRow(parent, entry, report.getFeatureStatus(entry.getFeatureId()));
                hasEntry = true;
            }
        }

        if (page == SettingsPage.READ_RECEIPT) {
            hasEntry |= addKeepUnreadAfterSendRow(parent, report);
            hasEntry |= addReadReceiptRow(parent, report);
        }
        if (page == SettingsPage.THEME) {
            hasEntry |= addCustomFontFileRow(parent, report);
        }

        if (!hasEntry) {
            addUnavailableFeatureMessage(parent, LinimalText.t("このページで利用できる機能はありません。"));
        }
    }

    private void addCategoryRow(
            LinearLayout parent, SettingsPage page, String titleText, String summaryText) {
        LinearLayout row = createInteractiveRow(parent);
        row.setContentDescription(LinimalText.joinSentences(titleText, summaryText));
        row.setOnClickListener(view -> openPage(page));

        LinearLayout labels = createLabels(titleText, summaryText);
        LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        labelParams.gravity = Gravity.CENTER_VERTICAL;
        row.addView(labels, labelParams);

        ImageView chevron = new ImageView(this);
        chevron.setImageDrawable(new ChevronDrawable(palette.secondaryText, density()));
        chevron.setScaleType(ImageView.ScaleType.CENTER);
        chevron.setContentDescription(LinimalText.t("詳細を開く"));
        chevron.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
        LinearLayout.LayoutParams chevronParams = new LinearLayout.LayoutParams(dp(32), dp(48));
        chevronParams.gravity = Gravity.CENTER_VERTICAL;
        chevronParams.leftMargin = dp(8);
        row.addView(chevron, chevronParams);
    }

    /** 既読なし閲覧の共通オプション。メニュー・通知のどちらかが適用済みなら変更できます。 */
    private boolean addKeepUnreadAfterSendRow(LinearLayout parent, PatchStatusReport report) {
        PatchStatus manual = report.getFeatureStatus(LinimalFeature.READ_WITHOUT_RECEIPT.getFeatureId());
        PatchStatus notification = report.getFeatureStatus(
                LinimalFeature.NOTIFICATION_READ_WITHOUT_RECEIPT.getFeatureId());
        if (manual == null && notification == null) {
            return false;
        }
        keepUnreadAfterSendPatchAvailable = manual == PatchStatus.OK || notification == PatchStatus.OK;
        LinearLayout row = createInteractiveRow(parent);
        LinearLayout labels = createLabels(LinimalText.t(KEEP_UNREAD_AFTER_SEND_TITLE),
                LinimalText.t(KEEP_UNREAD_AFTER_SEND_SUMMARY));
        keepUnreadAfterSendSummary = (TextView) labels.getChildAt(1);
        LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        labelParams.gravity = Gravity.CENTER_VERTICAL;
        row.addView(labels, labelParams);
        keepUnreadAfterSendToggle = createSwitch(LinimalText.t(KEEP_UNREAD_AFTER_SEND_TITLE));
        addToggle(row, keepUnreadAfterSendToggle);
        row.setOnClickListener(view -> {
            if (keepUnreadAfterSendToggle.isEnabled()) {
                keepUnreadAfterSendToggle.toggle();
            }
        });
        return true;
    }

    /** 「手持ちのフォントを使う」で使うファイルを選ぶ行。押すと端末のファイル選択を開きます。 */
    private boolean addCustomFontFileRow(LinearLayout parent, PatchStatusReport report) {
        customFontPatchStatus = report.getFeatureStatus(LinimalFeature.CUSTOM_FONT.getFeatureId());
        if (customFontPatchStatus == null) {
            return false;
        }
        LinearLayout row = createInteractiveRow(parent);
        LinearLayout labels = createLabels(LinimalText.t(CUSTOM_FONT_FILE_TITLE), "");
        customFontFileSummary = (TextView) labels.getChildAt(1);
        LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        labelParams.gravity = Gravity.CENTER_VERTICAL;
        row.addView(labels, labelParams);
        row.setOnClickListener(view -> {
            if (row.isEnabled()) {
                pickCustomFont();
            }
        });
        customFontFileRow = row;
        return true;
    }

    private void pickCustomFont() {
        // フォントの MIME type はファイル管理アプリごとに違うため、種類では絞らず、取り込むときに中身を確かめます。
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("*/*");
        try {
            startActivityForResult(intent, REQUEST_PICK_CUSTOM_FONT);
        } catch (ActivityNotFoundException | SecurityException exception) {
            Toast.makeText(this, LinimalText.t("ファイルを選ぶ画面を開けませんでした。"), Toast.LENGTH_LONG).show();
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != REQUEST_PICK_CUSTOM_FONT || resultCode != RESULT_OK || data == null) {
            return;
        }
        Uri uri = data.getData();
        if (uri == null || customFontImporting) {
            return;
        }
        customFontImporting = true;
        renderRuntimeConfig();
        Context application = getApplicationContext();
        new Thread(() -> {
            CustomFontFiles.ImportResult result;
            try {
                result = CustomFontFiles.importFont(application, uri);
            } catch (RuntimeException exception) {
                result = CustomFontFiles.ImportResult.READ_FAILED;
            }
            CustomFontFiles.ImportResult finished = result;
            runOnUiThread(() -> onCustomFontImported(finished));
        }, "linimal-custom-font-import").start();
    }

    private void onCustomFontImported(CustomFontFiles.ImportResult result) {
        customFontImporting = false;
        if (isFinishing() || isDestroyed()) {
            return;
        }
        Toast.makeText(this, LinimalText.t(importMessage(result)), Toast.LENGTH_LONG).show();
        renderRuntimeConfig();
        LinimalConfig config = LinimalConfig.get();
        if (result == CustomFontFiles.ImportResult.OK
                && config.getRuntimeHealth() == LinimalConfigHealth.OK
                && config.isCustomFontEnabled()) {
            AppRestarter.confirm(this);
        }
    }

    private static String importMessage(CustomFontFiles.ImportResult result) {
        switch (result) {
            case OK:
                return "フォントを取り込みました。";
            case TOO_LARGE:
                return "ファイルが大きすぎます。64 MB までのファイルを選んでください。";
            case NOT_A_FONT:
                return "フォントファイルとして読み込めませんでした。TrueType か OpenType のファイルを選んでください。";
            case READ_FAILED:
            default:
                return "ファイルを読み込めませんでした。";
        }
    }

    private boolean addReadReceiptRow(LinearLayout parent, PatchStatusReport report) {
        readReceiptPatchStatus = report.getFeatureStatus(ReadReceiptMode.FEATURE_ID);
        if (readReceiptPatchStatus == null) {
            return false;
        }

        LinearLayout row = createInteractiveRow(parent);
        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);

        TextView title = createText(LinimalText.t("自動で既読をつけない"), 16, palette.primaryText);
        labels.addView(title, wrap());

        readReceiptSummary = createText("", 13, palette.secondaryText);
        readReceiptSummary.setPadding(0, dp(2), 0, 0);
        labels.addView(readReceiptSummary, wrap());

        LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        labelParams.gravity = Gravity.CENTER_VERTICAL;
        row.addView(labels, labelParams);

        readReceiptToggle = createSwitch(LinimalText.t("自動で既読をつけない"));
        addToggle(row, readReceiptToggle);
        row.setOnClickListener(view -> {
            if (readReceiptToggle.isEnabled()) {
                readReceiptToggle.toggle();
            }
        });
        return true;
    }

    /** 行と区別できるよう、小見出しは小さめの文字と控えめな色で上に余白を取って描画します。 */
    private void addSectionHeader(LinearLayout parent, String titleText) {
        TextView header = createText(titleText, 13, palette.secondaryText);
        header.setPadding(dp(20), dp(20), dp(20), dp(4));
        parent.addView(header, matchWidth());
    }

    private void addFeatureRow(LinearLayout parent, FeatureCatalog.Entry entry, PatchStatus patchStatus) {
        LinearLayout row = createInteractiveRow(parent);
        LinearLayout labels = createLabels(entry.getTitle(), "");
        TextView summary = (TextView) labels.getChildAt(1);

        LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        labelParams.gravity = Gravity.CENTER_VERTICAL;
        row.addView(labels, labelParams);

        Switch toggle = createSwitch(entry.getTitle());
        addToggle(row, toggle);

        FeatureRow featureRow = new FeatureRow(entry, patchStatus, summary, toggle);
        featureRows.add(featureRow);
        row.setOnClickListener(view -> {
            if (toggle.isEnabled()) {
                toggle.toggle();
            }
        });
    }

    private LinearLayout createLabels(String titleText, String summaryText) {
        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.addView(createText(titleText, 16, palette.primaryText), wrap());

        TextView summary = createText(summaryText, 13, palette.secondaryText);
        summary.setPadding(0, dp(2), 0, 0);
        labels.addView(summary, wrap());
        return labels;
    }

    private TextView createText(String text, int textSizeSp, int color) {
        TextView view = new TextView(this);
        view.setText(text);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, textSizeSp);
        view.setTextColor(color);
        return view;
    }

    private LinearLayout createInteractiveRow(LinearLayout parent) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(56));
        row.setPadding(dp(20), dp(8), dp(12), dp(8));
        row.setBackground(rowRipple());
        row.setClickable(true);
        parent.addView(row, matchWidth());
        return row;
    }

    private void addToggle(LinearLayout row, Switch toggle) {
        LinearLayout.LayoutParams switchParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        switchParams.gravity = Gravity.CENTER_VERTICAL;
        switchParams.leftMargin = dp(12);
        row.addView(toggle, switchParams);
    }

    private Switch createSwitch(String contentDescription) {
        Switch toggle = new Switch(this);
        toggle.setContentDescription(contentDescription);
        return toggle;
    }

    private void addUnavailableFeatureMessage(LinearLayout parent, String text) {
        TextView message = createText(text, 13, palette.statusError);
        message.setPadding(dp(20), dp(16), dp(20), dp(12));
        parent.addView(message, matchWidth());
    }

    private void renderRuntimeConfig() {
        LinimalConfig config = LinimalConfig.get();
        LinimalConfigHealth health = config.getRuntimeHealth();
        for (FeatureRow row : featureRows) {
            boolean available = row.patchStatus == PatchStatus.OK && health == LinimalConfigHealth.OK;
            // 制約元の機能が ON の間は操作だけを止め、保存値はそのまま表示します。
            LinimalFeature blocker = row.entry.getBlockedBy();
            boolean blocked = available && blocker != null
                    && row.entry.isBlocked(health == LinimalConfigHealth.OK, config.isSuppressionEnabled(blocker));
            String summary = row.entry.getSummary();
            if (config.isRestartPending(row.entry.getFeature())) {
                summary = summary + "\n" + LinimalText.t(RESTART_PENDING_SUMMARY);
            }
            if (blocked) {
                summary = summary + "\n" + row.entry.getBlockedSummary();
            }
            row.summary.setText(available ? summary : unavailableSummary(row.patchStatus, health));
            row.summary.setTextColor(available ? palette.secondaryText : palette.statusError);

            // 再描画で意図しない保存が起きないよう、listener を外してから状態を反映します。
            row.toggle.setOnCheckedChangeListener(null);
            row.toggle.setEnabled(available && !blocked);
            row.toggle.setChecked(available && config.isSuppressionEnabled(row.entry.getFeature()));
            applySwitchColors(row.toggle, available && !blocked);
            row.toggle.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                @Override
                public void onCheckedChanged(CompoundButton button, boolean checked) {
                    LinimalConfig.get().setSuppressionEnabled(row.entry.getFeature(), checked);
                    // 保存に失敗すると fail-open に戻るため、状態を読み直して表示します。
                    renderRuntimeConfig();
                    if (LinimalConfig.get().getRuntimeHealth() == LinimalConfigHealth.OK
                            && LinimalConfig.get().isRestartPending(row.entry.getFeature())) {
                        AppRestarter.confirm(LinimalSettingsActivity.this);
                    }
                }
            });
        }
        renderKeepUnreadAfterSendConfig(config, health);
        renderReadReceiptConfig(config, health);
        renderCustomFontFileConfig(health);
    }

    private void renderCustomFontFileConfig(LinimalConfigHealth health) {
        if (customFontFileRow == null || customFontFileSummary == null) {
            return;
        }
        boolean available = customFontPatchStatus == PatchStatus.OK && health == LinimalConfigHealth.OK;
        customFontFileRow.setEnabled(available && !customFontImporting);
        customFontFileSummary.setTextColor(available ? palette.secondaryText : palette.statusError);
        if (!available) {
            customFontFileSummary.setText(unavailableSummary(customFontPatchStatus, health));
            return;
        }
        if (customFontImporting) {
            customFontFileSummary.setText(LinimalText.t("取り込んでいます…"));
            return;
        }
        if (!CustomFontFiles.hasFont(this)) {
            customFontFileSummary.setText(LinimalText.t(
                    "未選択です。TrueType（.ttf）か OpenType（.otf）を選べます。"));
            return;
        }
        File file = CustomFontFiles.fontFile(this);
        String name = CustomFontFiles.displayName(this);
        String summary = LinimalText.format("取り込み済み：%s（%s）",
                name != null ? name : LinimalText.t("名前のないファイル"),
                Formatter.formatShortFileSize(this, file.length()));
        if (CustomFontHooks.isStoppedAfterUnstableLaunches(this)) {
            summary = summary + "\n" + LinimalText.t(
                    "LINE の起動が続けて止まったため、取り込んだフォントを使うのを止めています。ファイルを選び直すと再開します。");
            customFontFileSummary.setTextColor(palette.statusError);
        }
        customFontFileSummary.setText(summary);
    }

    private void renderKeepUnreadAfterSendConfig(LinimalConfig config, LinimalConfigHealth health) {
        if (keepUnreadAfterSendToggle == null || keepUnreadAfterSendSummary == null) {
            return;
        }
        boolean available = keepUnreadAfterSendPatchAvailable && health == LinimalConfigHealth.OK;
        keepUnreadAfterSendSummary.setText(available ? LinimalText.t(KEEP_UNREAD_AFTER_SEND_SUMMARY)
                : LinimalText.t(KEEP_UNREAD_AFTER_SEND_SUMMARY) + "\n"
                        + LinimalText.t("既読なし閲覧のパッチまたは設定を確認できないため、変更できません。"));
        keepUnreadAfterSendSummary.setTextColor(available ? palette.secondaryText : palette.statusError);
        keepUnreadAfterSendToggle.setOnCheckedChangeListener(null);
        keepUnreadAfterSendToggle.setEnabled(available);
        keepUnreadAfterSendToggle.setChecked(available && config.isKeepUnreadAfterSendEnabled());
        applySwitchColors(keepUnreadAfterSendToggle, available);
        keepUnreadAfterSendToggle.setOnCheckedChangeListener((button, checked) -> {
            LinimalConfig.get().setKeepUnreadAfterSendEnabled(checked);
            renderRuntimeConfig();
        });
    }

    private void renderReadReceiptConfig(LinimalConfig config, LinimalConfigHealth health) {
        if (readReceiptToggle == null || readReceiptSummary == null) {
            return;
        }

        boolean available = readReceiptPatchStatus == PatchStatus.OK
                && health == LinimalConfigHealth.OK;
        readReceiptSummary.setText(available
                ? LinimalText.t("1対1・グループ・ルームで、開いても既読をつけません。LINE の手動既読の操作をしたときだけ送ります。オープンチャット、Service Chat、AI Character は対象外です。")
                : unavailableSummary(readReceiptPatchStatus, health));
        readReceiptSummary.setTextColor(available ? palette.secondaryText : palette.statusError);

        readReceiptToggle.setOnCheckedChangeListener(null);
        readReceiptToggle.setEnabled(available);
        readReceiptToggle.setChecked(available && config.getReadReceiptMode() == ReadReceiptMode.MANUAL);
        applySwitchColors(readReceiptToggle, available);
        readReceiptToggle.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton button, boolean checked) {
                LinimalConfig.get().setReadReceiptMode(
                        checked ? ReadReceiptMode.MANUAL : ReadReceiptMode.NORMAL);
                renderRuntimeConfig();
            }
        });
    }

    private String unavailableSummary(PatchStatus patchStatus, LinimalConfigHealth health) {
        if (health != LinimalConfigHealth.OK) {
            return LinimalText.t("設定を利用できないため、この機能は現在利用できません。");
        }
        if (patchStatus == null) {
            return LinimalText.t("パッチの適用状況を確認できないため、この機能は現在利用できません。");
        }
        if (patchStatus == PatchStatus.DISABLED) {
            return LinimalText.t("この build では用意されていないため、この機能は利用できません。");
        }
        return LinimalText.t("パッチが完全に適用されていないため、この機能は現在利用できません。");
    }

    private View createHeader() {
        FrameLayout header = new FrameLayout(this);
        header.setBackgroundColor(palette.background);

        ImageView back = new ImageView(this);
        back.setImageDrawable(new BackArrowDrawable(palette.primaryText, density()));
        back.setScaleType(ImageView.ScaleType.CENTER);
        back.setBackground(borderlessRipple());
        back.setContentDescription(LinimalText.t("戻る"));
        back.setOnClickListener(view -> navigateBack());
        header.addView(back, new FrameLayout.LayoutParams(
                dp(48), dp(48), Gravity.START | Gravity.CENTER_VERTICAL));

        TextView title = createText(titleFor(navigation.getCurrentPage()), 19, palette.primaryText);
        title.setSingleLine(true);
        FrameLayout.LayoutParams titleParams = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.START | Gravity.CENTER_VERTICAL);
        titleParams.leftMargin = dp(52);
        header.addView(title, titleParams);

        return header;
    }

    private String titleFor(SettingsPage page) {
        switch (page) {
            case ADS:
                return LinimalText.t("広告");
            case AGENT_I:
                return LinimalText.t("AI 機能");
            case HIDE:
                return LinimalText.t("表示項目");
            case READ_RECEIPT:
                return LinimalText.t("プライバシー");
            case READ_RECEIPT_READERS:
                return LinimalText.t("既読者");
            case TALK:
                return LinimalText.t("トーク");
            case THEME:
                return LinimalText.t("外観");
            case NOTIFICATIONS:
                return LinimalText.t("通知とログイン");
            case ROOT:
            default:
                return "Linimal";
        }
    }

    /**
     * ヘッダーはこの Activity が自前で描画するため、システムの ActionBar は表示しません。
     * manifest のテーマ（ActionBar なし）が効かない環境向けの保険です。
     */
    private void hideSystemActionBar() {
        ActionBar actionBar = getActionBar();
        if (actionBar != null) {
            actionBar.hide();
        }
    }

    /**
     * ActionBar のないテーマでは system bar 領域が content と重なるため、root へ inset を padding として入れます。
     * 背景色は root が塗るので、status bar と navigation bar の領域も設定画面と同じ色で埋まります。
     */
    private void applyWindowInsets(View root) {
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            Insets bars = insets.getInsets(
                    WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
            view.setPadding(bars.left, bars.top, bars.right, bars.bottom);
            return insets;
        });
        root.requestApplyInsets();
    }

    private void applySystemBars() {
        Window window = getWindow();
        if (window == null) {
            return;
        }
        // テーマの背景色は端末のダークモードに追従しないため、Window 背景も palette で塗ります。
        window.setBackgroundDrawable(new ColorDrawable(palette.background));
        window.setStatusBarColor(palette.background);
        window.setNavigationBarColor(palette.background);
        View decorView = window.getDecorView();
        int flags = decorView.getSystemUiVisibility();
        if (palette.dark) {
            flags &= ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
            flags &= ~View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
        } else {
            flags |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
            flags |= View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
        }
        decorView.setSystemUiVisibility(flags);
    }

    private void applySwitchColors(Switch toggle, boolean enabled) {
        int checkedColor = enabled ? palette.accent : palette.disabledText;
        ColorStateList thumb = new ColorStateList(
                new int[][] {new int[] {android.R.attr.state_checked}, new int[0]},
                new int[] {checkedColor, palette.dark ? 0xFF8A8A8A : 0xFFFFFFFF});
        ColorStateList track = new ColorStateList(
                new int[][] {new int[] {android.R.attr.state_checked}, new int[0]},
                new int[] {checkedColor, palette.switchTrackOff});
        Drawable thumbDrawable = toggle.getThumbDrawable();
        if (thumbDrawable != null) {
            thumbDrawable.setTintList(thumb);
        }
        Drawable trackDrawable = toggle.getTrackDrawable();
        if (trackDrawable != null) {
            trackDrawable.setTintList(track);
        }
    }

    private Drawable rowRipple() {
        // mask を渡して行の範囲内に収めます（selectableItemBackground 相当）。
        return createRipple(new ColorDrawable(0xFFFFFFFF));
    }

    private Drawable borderlessRipple() {
        // mask なしの ripple は範囲外へ広がります（selectableItemBackgroundBorderless 相当）。
        return createRipple(null);
    }

    /**
     * ripple 色はテーマではなく palette から決めます。ActionBar なしのプラットフォームテーマは
     * 端末のダークモードに追従しないため、テーマ由来の色ではタッチ反応が見えなくなるためです。
     */
    private Drawable createRipple(Drawable mask) {
        int rippleColor = palette.dark ? 0x33FFFFFF : 0x1F000000;
        return new RippleDrawable(ColorStateList.valueOf(rippleColor), null, mask);
    }

    private LinearLayout.LayoutParams matchWidth() {
        return new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private LinearLayout.LayoutParams wrap() {
        return new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private float density() {
        return getResources().getDisplayMetrics().density;
    }

    private int dp(int value) {
        return Math.round(value * density());
    }
}
