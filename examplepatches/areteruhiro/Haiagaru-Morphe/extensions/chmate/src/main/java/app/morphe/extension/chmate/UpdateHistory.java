package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.graphics.Typeface;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.text.style.RelativeSizeSpan;
import android.text.style.StyleSpan;
import android.text.style.URLSpan;
import android.text.method.LinkMovementMethod;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Release notes generated from CHANGELOG.md as part of every release build. */
final class UpdateHistory {
    static void show(Activity activity) {
        Context context = SettingsTabUi.context(activity);
        LinearLayout content = new LinearLayout(context);
        content.setOrientation(LinearLayout.VERTICAL);
        int padding = Math.round(16 * context.getResources().getDisplayMetrics().density);
        content.setPadding(padding, padding, padding, padding);

        TextView version = new TextView(context);
        version.setText("Haiagaru " + BuildConfig.HAIAGARU_VERSION);
        version.setTextSize(18);
        version.setTypeface(null, Typeface.BOLD);
        content.addView(version);

        TextView settingsHeading = new TextView(context);
        settingsHeading.setText("機能のオン・オフ");
        styleHeading(settingsHeading, context);
        content.addView(settingsHeading);
        addFeatureSettings(content, activity);

        TextView historyHeading = new TextView(context);
        historyHeading.setText("リリース履歴");
        styleHeading(historyHeading, context);
        content.addView(historyHeading);
        TextView history = new TextView(context);
        history.setText(formatHistory(context, readBundledHistory(context)));
        history.setTextIsSelectable(true);
        history.setTextSize(14);
        history.setLineSpacing(Math.round(2 * context.getResources().getDisplayMetrics().density), 1f);
        history.setMovementMethod(LinkMovementMethod.getInstance());
        content.addView(history);

        Button releases = new Button(context);
        releases.setText("GitHubで更新履歴を開く");
        releases.setOnClickListener(view -> activity.startActivity(new Intent(Intent.ACTION_VIEW,
                Uri.parse("https://github.com/areteruhiro/Haiagaru-Morphe/releases"))));
        content.addView(releases);

        ScrollView scroll = new ScrollView(context);
        scroll.setFillViewport(true);
        scroll.addView(content);
        new HaiagaruDialog.Builder(activity).setTitle("更新履歴")
                .setView(scroll).setPositiveButton("閉じる", null).show();
    }

    private static void styleHeading(TextView heading, Context context) {
        heading.setTextSize(17);
        heading.setTypeface(null, Typeface.BOLD);
        heading.setPadding(0, Math.round(16 * context.getResources().getDisplayMetrics().density), 0,
                Math.round(6 * context.getResources().getDisplayMetrics().density));
    }

    /** Render the release-note Markdown structure without depending on remote content. */
    static CharSequence formatHistory(Context context, String markdown) {
        SpannableStringBuilder output = new SpannableStringBuilder();
        int density = Math.round(context.getResources().getDisplayMetrics().density);
        for (String raw : markdown.split("\\r?\\n")) {
            String line = raw.trim();
            if (line.isEmpty()) {
                if (output.length() > 0 && output.charAt(output.length() - 1) != '\n') output.append('\n');
                continue;
            }
            int start = output.length();
            int heading = 0;
            while (heading < line.length() && line.charAt(heading) == '#') heading++;
            if (heading > 0 && heading < line.length() && line.charAt(heading) == ' ') {
                line = line.substring(heading).trim();
                start = output.length();
                output.append(line).append('\n');
                int end = output.length() - 1;
                output.setSpan(new StyleSpan(Typeface.BOLD), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                output.setSpan(new RelativeSizeSpan(heading == 1 ? 1.35f : 1.12f), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                output.setSpan(new ForegroundColorSpan(heading == 1 ? 0xff263b65 : 0xff405577), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            } else {
                boolean bullet = line.startsWith("* ") || line.startsWith("- ");
                if (bullet) output.append("• ");
                SpannableStringBuilder body = formatInline(bullet ? line.substring(2) : line);
                int bodyStart = output.length();
                output.append(body);
                for (Object span : body.getSpans(0, body.length(), Object.class)) {
                    int from = body.getSpanStart(span), to = body.getSpanEnd(span);
                    output.setSpan(span, bodyStart + from, bodyStart + to, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                }
                output.append('\n');
                int end = output.length() - 1;
                if (bullet) output.setSpan(new android.text.style.LeadingMarginSpan.Standard(0, 2 * density), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            }
        }
        while (output.length() > 0 && output.charAt(output.length() - 1) == '\n') output.delete(output.length() - 1, output.length());
        return output;
    }

    private static SpannableStringBuilder formatInline(String line) {
        SpannableStringBuilder result = new SpannableStringBuilder();
        Matcher inline = Pattern.compile("\\*\\*(.+?)\\*\\*|\\[([^\\]]+)\\]\\((https?://[^)]+)\\)|`([^`]+)`").matcher(line);
        int cursor = 0;
        while (inline.find()) {
            result.append(line, cursor, inline.start());
            int start = result.length();
            if (inline.group(1) != null) {
                result.append(inline.group(1));
                result.setSpan(new StyleSpan(Typeface.BOLD), start, result.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            } else if (inline.group(2) != null) {
                result.append(inline.group(2));
                result.setSpan(new URLSpan(inline.group(3)), start, result.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            } else result.append(inline.group(4));
            cursor = inline.end();
        }
        result.append(line, cursor, line.length());
        return result;
    }

    private static void addFeatureSettings(LinearLayout content, Activity activity) {
        SharedPreferences main = SettingsProfiles.prefs(activity);
        section(content, activity, "アプリ・通信");
        toggle(content, activity, FeatureSwitches.prefs(activity), "設定文字列をタップして設定を開く",
                "settingsOptionLinksEnabled", true, null);
        toggle(content, activity, main, "外部板をサイト別にまとめる",
                ExternalBoardGroups.KEY, false, null);
        SiteBoardGateway gateway = SiteBoardGateway.get(activity);
        for (String kind : SiteBoardMenuProtocol.KINDS) {
            LiveSettings.Toggle site = new LiveSettings.Toggle(activity);
            site.setText(SiteBoardMenuProtocol.title(kind) + "の閲覧・板一覧");
            site.setChecked(gateway.siteEnabled(kind));
            site.setOnCheckedChangeListener((view, on) ->
                    gateway.prefs.edit().putBoolean(SiteBoardGateway.siteFlag(kind), on).apply());
            content.addView(site);
        }

        section(content, activity, "表示・検索");
        toggle(content, activity, FeatureSwitches.prefs(activity), "記者ID・スレ名の期間指定検索",
                "reporterSearchEnabled", true, null);
        toggle(content, activity, FeatureSwitches.prefs(activity), "エッヂ・kenmo.orgの記者IDをレスメニューに表示",
                EdgeReporterOptions.MENU, true, null);
        toggle(content, activity, FeatureSwitches.prefs(activity), "エッヂ・kenmo.orgの記者IDをスレ一覧に表示",
                EdgeReporterOptions.BOARD, true, null);

        section(content, activity, "画像・動画");
        toggle(content, activity, ThreadListThumbnailSettings.prefs(activity),
                "スレ一覧に画像・動画サムネイルを表示", ThreadListThumbnailSettings.ENABLE,
                false, ThreadListThumbnail::refresh);
        toggle(content, activity, FeatureSwitches.prefs(activity), "動画からサムネイルを生成",
                "videoFrameThumbnailsEnabled", true, null);
        toggle(content, activity, FeatureSwitches.prefs(activity), "専用動画ビューアの横画面で没入表示",
                "videoLandscapeImmersive", true, null);

        section(content, activity, "NG・文字列置換");
        toggle(content, activity, RegisteredImageNg.prefs(activity),
                "登録画像に一致するレスをあぼーん", RegisteredImageNg.ENABLE, false,
                RegisteredImageNg::settingsChanged);
        toggle(content, activity, main, "コピペ省略されたレスを透明あぼーん",
                ChainAboneVisibility.COPY_PASTE_KEY, false, null);
        toggle(content, activity, StringReplacement.prefs(activity),
                "ReplaceTxtによる文字列置換（正規表現対応）", "enabled", false,
                () -> StringReplacement.setEnabled(activity,
                        StringReplacement.prefs(activity).getBoolean("enabled", false)));

        section(content, activity, "履歴・投稿");
        toggle(content, activity, RefreshTargets.prefs(activity),
                "履歴ポップアップの対象タブ", RefreshTargetHistory.VISIBLE_KEY, false, null);
        toggle(content, activity, RefreshTargets.prefs(activity),
                "投稿後の自動監視", "watchAfterPosting", false, null);
        toggle(content, activity, main, "既読スレ削除を更新ボタン長押しで開く",
                DeleteReadThreads.LONG_PRESS_KEY, true, null);
        addIpNetwork(content, activity, main, "IP表示スレへの投稿前確認（Wi-Fi）", 1);
        addIpNetwork(content, activity, main, "IP表示スレへの投稿前確認（モバイル回線）", 2);

        Button images = new Button(activity);
        images.setText("登録画像・判定レベル・一致枚数を設定");
        images.setOnClickListener(view -> activity.startActivity(
                new Intent(activity, RegisteredImageNgSettingsActivity.class)));
        content.addView(images);
    }

    private static void section(LinearLayout content, Activity activity, String title) {
        TextView heading = new TextView(activity);
        heading.setText(title);
        heading.setTextSize(14);
        heading.setTypeface(null, Typeface.BOLD);
        heading.setPadding(0, Math.round(12 * activity.getResources().getDisplayMetrics().density), 0,
                Math.round(3 * activity.getResources().getDisplayMetrics().density));
        content.addView(heading);
    }

    private static void toggle(LinearLayout content, Activity activity, SharedPreferences prefs,
                               String label, String key, boolean initial, Runnable effect) {
        LiveSettings.Toggle toggle = new LiveSettings.Toggle(activity);
        toggle.setText(label);
        toggle.setChecked(prefs.getBoolean(key, initial));
        toggle.setOnCheckedChangeListener((view, on) -> {
            prefs.edit().putBoolean(key, on).apply();
            if (effect != null) effect.run();
            if (prefs == SettingsProfiles.prefs(activity)) SettingsEffects.changed(activity, key, on);
        });
        content.addView(toggle);
    }

    private static void addIpNetwork(LinearLayout content, Activity activity, SharedPreferences prefs,
                                     String label, int bit) {
        LiveSettings.Toggle toggle = new LiveSettings.Toggle(activity);
        toggle.setText(label);
        toggle.setChecked((prefs.getInt(PostingIpWarning.KEY, 0) & bit) != 0);
        toggle.setOnCheckedChangeListener((view, on) -> {
            int flags = prefs.getInt(PostingIpWarning.KEY, 0);
            prefs.edit().putInt(PostingIpWarning.KEY, on ? flags | bit : flags & ~bit).apply();
        });
        content.addView(toggle);
    }

    static String readBundledHistory(Context context) {
        try {
            int id = context.getResources().getIdentifier(
                    "haiagaru_update_history", "raw", "app.morphe.extension.chmate");
            if (id == 0) throw new IllegalStateException("更新履歴リソースがありません");
            try (InputStream input = context.getResources().openRawResource(id);
                 ByteArrayOutputStream output = new ByteArrayOutputStream()) {
                byte[] buffer = new byte[4096];
                for (int read; (read = input.read(buffer)) >= 0; ) output.write(buffer, 0, read);
                return output.toString(StandardCharsets.UTF_8.name()).trim();
            }
        } catch (Exception error) {
            return "更新履歴を読み込めませんでした。GitHubの更新履歴を確認してください。";
        }
    }

    private UpdateHistory() {}
}
