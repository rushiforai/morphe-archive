package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.graphics.Typeface;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.RelativeSizeSpan;
import android.text.style.StyleSpan;
import android.text.style.URLSpan;
import android.text.method.LinkMovementMethod;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Switch;
import android.widget.CheckBox;
import android.view.View;
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
        Button allFeatures = new Button(context);
        allFeatures.setText("追加された機能をすべて見る");
        content.addView(allFeatures);

        TextView historyHeading = new TextView(context);
        historyHeading.setText("リリース履歴");
        styleHeading(historyHeading, context);
        content.addView(historyHeading);
        TextView status = new TextView(context);
        status.setText("アプリに同梱された更新履歴を表示しています。バージョンをタップすると詳細を開閉できます。");
        content.addView(status);
        CheckBox development = new CheckBox(context);
        development.setText("開発版（dev）の履歴も表示する");
        content.addView(development);
        LinearLayout history = new LinearLayout(context);
        history.setOrientation(LinearLayout.VERTICAL);
        content.addView(history);
        String[] source = {readBundledHistory(context)};
        allFeatures.setOnClickListener(view -> showAllFeatures(activity,source[0]));
        Runnable render = () -> renderReleases(history, activity, source[0], development.isChecked());
        development.setOnCheckedChangeListener((button,on) -> render.run());
        render.run();

        Button fetch = new Button(context);
        fetch.setText("GitHubから最新の更新履歴を取得");
        fetch.setOnClickListener(view -> {
            fetch.setEnabled(false);status.setText("GitHubから更新履歴を取得しています…");
            new Thread(() -> {
                try {
                    String latest = fetchHistory();
                    if (ReleaseHistoryText.parse(latest).isEmpty()) throw new java.io.IOException("更新履歴の形式を読み取れません");
                    activity.runOnUiThread(() -> {
                        if(activity.isFinishing()||activity.isDestroyed())return;
                        source[0]=latest;render.run();fetch.setEnabled(true);
                        status.setText("GitHubの最新の更新履歴です。新しいバージョンから表示しています。");
                    });
                } catch(Exception error) {
                    activity.runOnUiThread(() -> {
                        if(activity.isFinishing()||activity.isDestroyed())return;
                        fetch.setEnabled(true);status.setText("GitHubから取得できませんでした。表示中の更新履歴はそのまま利用できます。");
                    });
                }
            },"Haiagaru-release-history").start();
        });
        content.addView(fetch);

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

    static void showAllFeatures(Activity activity) {
        showAllFeatures(activity,readBundledHistory(SettingsTabUi.context(activity)));
    }

    private static void showAllFeatures(Activity activity,String source) {
        Context context=SettingsTabUi.context(activity);
        LinearLayout body=new LinearLayout(context);body.setOrientation(LinearLayout.VERTICAL);
        int pad=Math.round(16*context.getResources().getDisplayMetrics().density);body.setPadding(pad,pad,pad,pad);
        TextView help=new TextView(context);help.setText("追加された機能を目的別にまとめています。スイッチは変更すると自動保存され、通常の設定画面にも反映されます。詳しい説明は下にあります。");body.addView(help);
        for(String category:new String[]{"アプリ・通信","表示・検索","画像・動画","NG・文字列置換","履歴・投稿"}) {
            section(body,activity,category);
            for(ReleaseFeatureOptions.Option option:ReleaseFeatureOptions.Option.values()) {
                if(!category.equals(option.category()))continue;
                addFeatureSetting(body,activity,option);
                TextView explanation=new TextView(context);explanation.setText(option.description());explanation.setTextSize(13);
                explanation.setPadding(0,0,0,pad/2);body.addView(explanation);
            }
        }
        section(body,activity,"追加機能の詳しい説明（1.24.1以降）");
        TextView descriptions=new TextView(context);descriptions.setText(formatHistory(context,ReleaseHistoryText.addedFeatures(source)));
        descriptions.setTextSize(14);descriptions.setTextIsSelectable(true);descriptions.setMovementMethod(LinkMovementMethod.getInstance());body.addView(descriptions);
        ScrollView scroll=new ScrollView(context);scroll.addView(body);
        new HaiagaruDialog.Builder(activity).setTitle("追加機能一覧").setView(scroll).setPositiveButton("閉じる",null).show();
    }

    private static void renderReleases(LinearLayout content, Activity activity, String source, boolean includeDevelopment) {
        Context context = SettingsTabUi.context(activity);
        content.removeAllViews();boolean first=true;
        java.util.List<ReleaseHistoryText.Release> visible = new java.util.ArrayList<>();
        for (ReleaseHistoryText.Release release : ReleaseHistoryText.parse(source))
            if (!release.development || includeDevelopment) visible.add(release);
        for(ReleaseHistoryText.Release release:visible) {
            Button heading=new Button(context);
            heading.setAllCaps(false);
            String title=release.version+"  ·  "+release.date+(release.development?"  開発版":"  安定版");
            TextView details=new TextView(context);
            details.setText(formatHistory(context,ReleaseHistoryText.displayNotes(release)));
            details.setTextSize(14);details.setTextIsSelectable(true);
            details.setLineSpacing(3*context.getResources().getDisplayMetrics().density,1f);
            details.setMovementMethod(LinkMovementMethod.getInstance());
            details.setPadding(0,8,0,24);
            LinearLayout body = new LinearLayout(context);
            body.setOrientation(LinearLayout.VERTICAL);
            java.util.List<ReleaseFeatureOptions.Option> options = ReleaseFeatureOptions.forRelease(release, visible);
            if (!options.isEmpty()) {
                section(body, activity, "機能の設定");
                for (ReleaseFeatureOptions.Option option : options) addFeatureSetting(body, activity, option);
            }
            section(body, activity, "更新内容");
            body.addView(details);
            body.setVisibility(first?View.VISIBLE:View.GONE);
            heading.setText((first?"▼ ":"▶ ")+title);
            heading.setOnClickListener(view -> {
                boolean show=body.getVisibility()!=View.VISIBLE;
                body.setVisibility(show?View.VISIBLE:View.GONE);heading.setText((show?"▼ ":"▶ ")+title);
            });
            content.addView(heading);content.addView(body);first=false;
        }
        if(first){TextView empty=new TextView(context);empty.setText("表示できる安定版の履歴がありません。開発版を表示するか、GitHubから取得してください。");content.addView(empty);}
    }

    private static String fetchHistory() throws java.io.IOException {
        java.net.HttpURLConnection connection=(java.net.HttpURLConnection)new java.net.URL(
                "https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/master/CHANGELOG.md").openConnection();
        connection.setConnectTimeout(8000);connection.setReadTimeout(15000);connection.setInstanceFollowRedirects(false);
        try {
            if(connection.getResponseCode()!=200)throw new java.io.IOException("GitHubの応答を取得できません");
            try(InputStream input=connection.getInputStream();ByteArrayOutputStream output=new ByteArrayOutputStream()) {
                byte[] buffer=new byte[8192];int count;
                while((count=input.read(buffer))!=-1){if(output.size()+count>4*1024*1024)throw new java.io.IOException("更新履歴が取得上限を超えました");output.write(buffer,0,count);}
                return output.toString(StandardCharsets.UTF_8.name());
            }
        } finally {connection.disconnect();}
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
                int length=output.length();
                if (length > 0 && (length < 2 || output.charAt(length - 2) != '\n')) output.append('\n');
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
            } else {
                boolean bullet = line.startsWith("* ") || line.startsWith("- ");
                if (bullet) output.append("• ");
                SpannableStringBuilder body = formatInline(bullet ? line.substring(2) : line);
                output.append(body);
                output.append('\n');
                int end = output.length() - 1;
                if (bullet) output.setSpan(new android.text.style.LeadingMarginSpan.Standard(0, 16 * density), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
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

    private static void addFeatureSetting(LinearLayout content, Activity activity, ReleaseFeatureOptions.Option option) {
        SharedPreferences main = SettingsProfiles.prefs(activity);
        switch (option) {
            case FUTABA_OFFICIAL_POSTING:
                toggle(content,activity,SettingsProfiles.prefs(activity),"ふたば img／may の公式投稿ページを開く",
                        FutabaPostingPopup.OFFICIAL,true,null); break;
            case FUTABA_DIRECT_POSTING:
                toggle(content,activity,SettingsProfiles.prefs(activity),"ふたば img／may の書き込み専用ビューアを直接開く",
                        FutabaPostingPopup.DIRECT,true,null); break;
            case WACCHOI_COPY_UPPER:
            case WACCHOI_COPY_LOWER:
                boolean upper=option==ReleaseFeatureOptions.Option.WACCHOI_COPY_UPPER;
                toggle(content,activity,activity.getSharedPreferences("haiagaru_response_actions",0),upper?"ワッチョイ長押しに「上4桁をコピー」を表示":"ワッチョイ長押しに「下4桁をコピー」を表示",
                        upper?"wacchoiLongPressCopyPrefix":"wacchoiLongPressCopySuffix",true,null); break;
            case WACCHOI_COPY_PARENS:
                toggle(content,activity,activity.getSharedPreferences("haiagaru_response_actions",0),
                        "ワッチョイ全文コピーで前後の括弧を除く",WacchoiClipboard.STRIP_PARENTHESES,false,null);
                break;
            case THREAD_REPORTER_COPY:
                TextView reporterCopyHelp=new TextView(activity);
                reporterCopyHelp.setText("スレタイ長押しに「記者IDをコピー」を追加しました。エッヂの記者IDを含むNGThreadルールはスレ一覧でも照合します。");
                content.addView(reporterCopyHelp);break;
            case READING_POSITION_CARD_DEFAULT:
                toggle(content,activity,main,"カード表示に連動した読書位置補助保存",ReadingPosition.ENABLED,
                        ReadingPosition.defaultEnabled(main),null);break;
            case EXTRA_QUICK_FILTERS:
                toggle(content,activity,main,"フィルターにAA・自分・返信を追加",
                        "quickFilterExtras",false,()->ExtraQuickFilters.updateOptions(activity));break;
            case HIDDEN_NG_NEW_ARRIVAL_COUNT:
                toggle(content,activity,main,"スレ更新後の新着件数から非表示NGのレスを除く（191／226／242）",HiddenNgUnread.NEW_ARRIVAL_KEY,false,HiddenNgUnread::clear);
                break;
            case LOCAL_IMAGES:
                toggle(content, activity, LocalImageArchive.prefs(activity), "保存済み画像から表示",
                        "enabled", true, LocalImageArchive::reset);
                Button localImages = new Button(activity);
                localImages.setText("検索フォルダ・元URLとの関連付けを設定");
                localImages.setOnClickListener(view -> activity.startActivity(new Intent(activity, LocalImageArchiveActivity.class)));
                content.addView(localImages); break;
            case SETTINGS_LINKS:
                toggle(content, activity, FeatureSwitches.prefs(activity), "設定文字列をタップして設定を開く",
                        "settingsOptionLinksEnabled", true, null); break;
            case SITE_GROUPS:
                toggle(content, activity, main, "外部板をサイト別にまとめる",
                        ExternalBoardGroups.KEY, false, null); break;
            case EDGE: addSite(content, activity, "edge"); break;
            case ORG: addSite(content, activity, "kenmo"); break;
            case BAKUSAI: addSite(content, activity, "bakusai"); break;
            case FUTABA: addSite(content, activity, "futaba"); break;
            case ANIMAN: addSite(content, activity, "animanch"); break;
            case REPORTER_SEARCH:
                toggle(content, activity, FeatureSwitches.prefs(activity), "記者ID・スレ名の期間指定検索",
                        "reporterSearchEnabled", true, null); break;
            case REPORTER_MENU:
                toggle(content, activity, FeatureSwitches.prefs(activity), "エッヂ・オルグ板の記者IDをレスメニューに表示",
                        EdgeReporterOptions.MENU, true, null); break;
            case REPORTER_BOARD:
                toggle(content, activity, FeatureSwitches.prefs(activity), "エッヂ・オルグ板の記者IDをスレ一覧に表示",
                        EdgeReporterOptions.BOARD, true, null); break;
            case THREAD_THUMBNAILS:
                toggle(content, activity, ThreadListThumbnailSettings.prefs(activity),
                        "スレ一覧に画像・動画サムネイルを表示", ThreadListThumbnailSettings.ENABLE,
                        false, ThreadListThumbnail::refresh); break;
            case VIDEO_THUMBNAILS:
                toggle(content, activity, FeatureSwitches.prefs(activity), "動画からサムネイルを生成",
                        "videoFrameThumbnailsEnabled", true, null); break;
            case VIDEO_IMMERSIVE:
                toggle(content, activity, FeatureSwitches.prefs(activity), "専用動画ビューアの横画面で没入表示",
                        "videoLandscapeImmersive", false, null); break;
            case IMAGE_NG:
                toggle(content, activity, RegisteredImageNg.prefs(activity),
                        "登録画像をあぼーんにする", RegisteredImageNg.ENABLE, false,
                        RegisteredImageNg::settingsChanged); break;
            case COPY_PASTE_NG:
                toggle(content, activity, main, "コピペ省略されたレスを透明あぼーん",
                        ChainAboneVisibility.COPY_PASTE_KEY, false, null); break;
            case REPLACE_TXT:
                toggle(content, activity, StringReplacement.prefs(activity),
                        "ReplaceTxtによる文字列置換（正規表現対応）", "enabled", false,
                        () -> StringReplacement.setEnabled(activity,
                                StringReplacement.prefs(activity).getBoolean("enabled", false))); break;
            case HISTORY_TARGETS:
                toggle(content, activity, RefreshTargets.prefs(activity),
                        "履歴ポップアップの対象タブ", RefreshTargetHistory.VISIBLE_KEY, false, null); break;
            case WATCH_AFTER_POSTING:
                toggle(content, activity, RefreshTargets.prefs(activity),
                        "投稿後の自動監視", "watchAfterPosting", false, null); break;
            case DELETE_READ:
                toggle(content, activity, main, "既読スレ削除を更新ボタン長押しで開く",
                        DeleteReadThreads.LONG_PRESS_KEY, true, null); break;
            case IP_WIFI: addIpNetwork(content, activity, main, "IP表示スレへの投稿前確認（Wi-Fi）", 1); break;
            case IP_MOBILE: addIpNetwork(content, activity, main, "IP表示スレへの投稿前確認（モバイル回線）", 2); break;
            case KEYWORD_NAMES:
                Button names = new Button(activity);
                names.setText("キーワードの表示名を設定");
                names.setOnClickListener(view -> DisplayNames.showKeywords(activity));
                content.addView(names); break;
            case HOME_THREAD_ORDER:
                toggle(content,activity,SettingsProfiles.prefs(activity),"HOMEのお気に入りスレの並び替え・固定を使う",HomeThreadOrder.ENABLED,true,activity::invalidateOptionsMenu); break;
            case KEYWORD_MENU:
                toggle(content,activity,SettingsProfiles.prefs(activity),"HOMEの3点メニューにキーワード表示名の設定を表示",HomeThreadOrder.KEYWORD_MENU,false,activity::invalidateOptionsMenu); break;
            case RESPONSE_NOTES_MENU:
                LiveSettings.Toggle memo=new LiveSettings.Toggle(activity);memo.setText("レス長押しに「メモ」を表示");
                bindToggle(memo,activity.getSharedPreferences("haiagaru_response_actions",0),"response-note-menu",
                        ()->ResponseMenuSettings.visible(ResponseNotes.MENU),on->ResponseMenuSettings.storeVisibility(activity.getSharedPreferences("haiagaru_response_actions",0),ResponseNotes.MENU,on?1:2));
                content.addView(memo);break;
            case ROTATION_MENU:
                toggle(content,activity,FeatureSwitches.prefs(activity),"画像ビューアの回転操作を︙メニューにまとめる",ImageViewerRotationButton.MENU_KEY,true,null); break;
            case EXTERNAL_VIDEO_CACHE:
                toggle(content,activity,VideoViewerSettings.prefs(activity),"外部プレイヤー用にimgpile動画を一時取得",ExternalVideoCache.KEY,true,null); break;
            case POST_LIMIT_DISPLAY:
                toggle(content,activity,FeatureSwitches.prefs(activity),"投稿欄に板ごとの上限・残量・超過位置を表示", "postEditorLimitDisplay",true,null); break;
            case FILTER_OPTIMIZATION:
                toggle(content,activity,FeatureSwitches.prefs(activity),"フィルターの抽出・位置保持・件数集計を最適化",ExtraQuickFilters.OPTIMIZATION,false,null); break;
            case DELAYED_POSITION_SNAPSHOT:
                toggle(content,activity,SettingsProfiles.prefs(activity),"エキスパート設定：遅延位置スナップショット",FilterPosition.DELAYED_SNAPSHOT,false,null); break;
            case NOTE_INDICATOR:
                toggle(content,activity,SettingsProfiles.prefs(activity),"メモ済みレスの右下にアイコンを表示（タップで編集）",ResponseNoteIndicator.KEY,true,null); break;
            case HOME_NOTES_MENU:
                toggle(content,activity,SettingsProfiles.prefs(activity),"HOMEの3点メニューにメモを表示","homeResponseNotesMenu",true,activity::invalidateOptionsMenu); break;
            case ARCHIVE_VIEWER_MODE:
                Button viewerMode=new Button(activity);viewerMode.setText("専用ビューア1／2を選ぶ");viewerMode.setOnClickListener(view->ArchiveSearchLayout.choose(activity));content.addView(viewerMode);break;
            case CRASH_REPORTING:
                Button crashReporting = new Button(activity);
                CrashReportDelivery.bindSetting(activity,crashReporting);
                content.addView(crashReporting);
                break;
            case ANIMANCH_HEART:
                toggle(content,activity,SettingsProfiles.prefs(activity),"あにまんのレスにハートボタンを表示","animanchHeart",true,null); break;
            case KYODEMO_TOOLBAR_PALETTE:
                Button palette = new Button(activity);
                Runnable updatePalette = () -> palette.setText("Kyodemoのツールバー配色："
                        + CheckerBarOptions.PALETTE_NAMES[CheckerBarOptions.palette(activity)]);
                updatePalette.run();
                palette.setOnClickListener(view -> new HaiagaruDialog.Builder(activity)
                        .setTitle("Kyodemoビューのツールバー配色")
                        .setSingleChoiceItems(CheckerBarOptions.PALETTE_NAMES, CheckerBarOptions.palette(activity),
                                (dialog, which) -> {
                                    CheckerBarOptions.savePalette(activity, which);
                                    updatePalette.run();
                                    dialog.dismiss();
                                })
                        .setNegativeButton("閉じる", null).show());
                content.addView(palette);
                break;
            case X_POST_TRUNCATION_MODE:
                Button xWarningMode=new Button(activity);
                Runnable updateXMode=()->xWarningMode.setText("X投稿の省略判定："+(Haiagaru.xPostWarningThresholdMode()==0?"詳細判定（280ポイント）":"簡易判定（420バイト）"));
                updateXMode.run();
                xWarningMode.setOnClickListener(view->new HaiagaruDialog.Builder(activity).setTitle("X投稿の省略判定")
                        .setSingleChoiceItems(new String[]{"詳細判定（日本語・絵文字・URLを考慮）","簡易判定（420バイト）"},Haiagaru.xPostWarningThresholdMode(),(dialog,which)->{
                            SettingsProfiles.prefs(activity).edit().putInt("xPostWarningThresholdMode",which).apply();
                            updateXMode.run();XPostPreview.thresholdModeChanged();dialog.dismiss();
                        }).setNegativeButton("閉じる",null).show());
                content.addView(xWarningMode);break;
            case WACCHOI_NG_EXPIRY:
                TextView weeklyNgHelp=new TextView(activity);
                weeklyNgHelp.setText("ﾜｯﾁｮｲ上下4桁のNG登録画面に「一週間のみNGにする」を追加しました。ONにすると次の週次更新でその登録を自動削除します。既存の複合NGへ追記する場合は、他の条件を消さないよう期限を設定できません。");
                content.addView(weeklyNgHelp);break;
            case GLOBAL_SEARCH_BACKGROUND:
                toggle(content, activity, main, "全板検索をバックグラウンドで実行",
                        GlobalSearchHome.BACKGROUND, true, null); break;
            case GLOBAL_SEARCH_HISTORY:
                toggle(content, activity, main, "全板検索の取得済み結果を保存",
                        GlobalSearchHome.HISTORY, true, null); break;
            case GLOBAL_SEARCH_PARTIAL:
                toggle(content, activity, main, "全板検索の途中結果を開けるようにする",
                        GlobalSearchHome.PARTIAL, true, null); break;
            case VIEWER_DOUBLE_BACK:
                toggle(content, activity, VideoViewerSettings.prefs(activity), "専用ビューアーを戻るジェスチャー2回で閉じる",
                        MediaViewerBackGesture.DOUBLE_BACK, false, null); break;
            case ALWAYS_MOSAIC_GRAY:
                toggle(content, activity, main, "常時モザイクにモノクロを重ねる",
                        ThumbnailAppearance.ALWAYS_GRAY, false, null); break;
            case ALWAYS_MOSAIC_STRENGTH:
                toggle(content, activity, main, "常時モザイクにHaiagaruのモザイク強度を使う",
                        ThumbnailAppearance.ALWAYS_STRENGTH, false, null); break;
            case MODERATION_ADULT:
            case MODERATION_GORE:
            case MODERATION_LIST:
                String label = option == ReleaseFeatureOptions.Option.MODERATION_ADULT ? "成人向け画像を検出してモザイク"
                        : option == ReleaseFeatureOptions.Option.MODERATION_GORE ? "グロ画像を検出してモザイク"
                        : "スレ一覧の画像にも自動検出を適用する";
                String key = option == ReleaseFeatureOptions.Option.MODERATION_ADULT ? ImageModeration.ADULT
                        : option == ReleaseFeatureOptions.Option.MODERATION_GORE ? ImageModeration.GORE : ImageModeration.LIST;
                boolean installed = ImageModeration.available(activity);
                toggle(content, activity, main, installed ? label : label + "（画像検出ZIPが必要）", key, false, null)
                        .setEnabled(installed); break;
            case GIGAFILE_BUTTON:
                toggle(content,activity,SettingsProfiles.prefs(activity),GigaFilePosting.BUTTON_SETTING,
                        GigaFilePosting.SHOW_BUTTON,false,null); break;
            case GIGAFILE_LINK_MODE:
                Button gigaMode = new Button(activity);
                GigaFilePosting.bindLinkMode(activity,gigaMode);
                content.addView(gigaMode);
                break;
            case UPLOAD_DESTINATION:
                toggle(content, activity, FeatureSwitches.prefs(activity), "画像・動画のアップロード時にアップロード先を選ぶ",
                        MediaUploadHosts.ASK_DESTINATION, false, null); break;
            case NG_REPLY_NOTIFICATIONS:
                toggle(content, activity, FeatureSwitches.prefs(activity), "NGされたレスの返信通知を無効にする",
                        NotificationNg.KEY, true, null); break;
            case NG_CHAIN_REPLY_NOTIFICATIONS:
                toggle(content, activity, FeatureSwitches.prefs(activity), "連鎖NGされたレスへの返信も通知しない",
                        NotificationNg.CHAIN_KEY, false, null); break;
            case FILTER_TRANSPARENT_BACKGROUND:
                toggle(content, activity, SettingsProfiles.prefs(activity), "下部フィルターの背景を透過する",
                        QuickFilterOptions.TRANSPARENT, true, () -> ExtraQuickFilters.updateOptions(activity)); break;
            case CONDITIONAL_REFRESH:
                toggle(content,activity,SettingsProfiles.prefs(activity),"スレ更新で条件付き取得を省く",ThreadRefreshOptions.KEY,false,null);
                TextView conditionalRefreshHelp=new TextView(activity);
                conditionalRefreshHelp.setText("初期OFFではChMate標準の条件付き・Range更新を使います。更新日時だけで新着を取りこぼす場合にONにすると条件付きヘッダーを省きます。通信量が増えることがあります。");
                content.addView(conditionalRefreshHelp);break;
            case IMAGE_PAGING_GESTURES:
                toggle(content,activity,VideoViewerSettings.prefs(activity),"Haiagaruの画像切り替え設定を使う",
                        NativeImagePaging.ENABLED,false,null);break;
            case GIF_DEDICATED_VIEWER:
                LiveSettings.Toggle gifViewer=new LiveSettings.Toggle(activity);
                gifViewer.setText("GIF専用ビューアを使う");
                gifViewer.setChecked(!VideoViewerSettings.nativeGif(activity));
                gifViewer.setTag(SettingLinkEntry.KEY_TAG,VideoViewerSettings.GIF_DEDICATED);
                gifViewer.setOnCheckedChangeListener((button,on)->{
                    VideoViewerSettings.prefs(activity).edit().putBoolean(VideoViewerSettings.GIF_DEDICATED,on).apply();
                    SettingsEffects.changed(activity,VideoViewerSettings.GIF_DEDICATED,on);
                });content.addView(gifViewer);break;
            case IMAGE_NG_SETTINGS:
                Button images = new Button(activity);
                images.setText("登録画像・判定レベル・一致枚数を設定");
                images.setOnClickListener(view -> activity.startActivity(
                        new Intent(activity, RegisteredImageNgSettingsActivity.class)));
                content.addView(images); break;
            case THREAD_SCOPED_NG:
                Switch threadScopeToggle=new LiveSettings.Toggle(activity);
                threadScopeToggle.setText("レスからNG登録するときに対象範囲を選べるようにする");
                threadScopeToggle.setChecked(ThreadScopedNg.enabled(activity));
                threadScopeToggle.setOnCheckedChangeListener((button,on)->FeatureSwitches.prefs(activity).edit().putBoolean(ThreadScopedNg.ENABLED,on).apply());
                content.addView(threadScopeToggle);
                TextView threadNgHelp=new TextView(activity);
                threadNgHelp.setText("ONにすると、NG ID・NGName・NGワードをレスから登録するときに「このスレのみを対象にする」を選べます。OFFではChMate標準の登録処理を使います。ﾜｯﾁｮｲ上下4桁NGでは板限定も選べます。対象スレを削除すると、そのスレに限定したルールも削除します。");
                content.addView(threadNgHelp);break;
        }
    }

    private static void addSite(LinearLayout content, Activity activity, String kind) {
        SiteBoardGateway gateway = SiteBoardGateway.get(activity);
        LiveSettings.Toggle site = new LiveSettings.Toggle(activity);
        site.setText(SiteBoardMenuProtocol.title(kind) + "の閲覧・板一覧");
        String key=SiteBoardGateway.siteFlag(kind);
        bindToggle(site,gateway.prefs,key,()->gateway.siteEnabled(kind),
                on->gateway.prefs.edit().putBoolean(key,on).apply());
        content.addView(site);
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

    private static LiveSettings.Toggle toggle(LinearLayout content, Activity activity, SharedPreferences prefs,
                               String label, String key, boolean initial, Runnable effect) {
        LiveSettings.Toggle toggle = new LiveSettings.Toggle(activity);
        toggle.setText(label);
        bindToggle(toggle,prefs,key,()->prefs.getBoolean(key,initial),on -> {
            prefs.edit().putBoolean(key, on).apply();
            if (effect != null) effect.run();
            if (prefs == SettingsProfiles.prefs(activity)) SettingsEffects.changed(activity, key, on);
        });
        content.addView(toggle);
        return toggle;
    }

    private static void addIpNetwork(LinearLayout content, Activity activity, SharedPreferences prefs,
                                     String label, int bit) {
        LiveSettings.Toggle toggle = new LiveSettings.Toggle(activity);
        toggle.setText(label);
        bindToggle(toggle,prefs,PostingIpWarning.KEY,()->(prefs.getInt(PostingIpWarning.KEY,0)&bit)!=0,on -> {
            int flags = prefs.getInt(PostingIpWarning.KEY, 0);
            prefs.edit().putInt(PostingIpWarning.KEY, on ? flags | bit : flags & ~bit).apply();
        });
        content.addView(toggle);
    }

    private static void bindToggle(LiveSettings.Toggle toggle,SharedPreferences prefs,String key,
                                   java.util.function.BooleanSupplier read,java.util.function.Consumer<Boolean> write) {
        boolean[] updating={false};
        Runnable refresh=()->{
            updating[0]=true;
            try{toggle.setChecked(read.getAsBoolean());}finally{updating[0]=false;}
        };
        refresh.run();
        toggle.setOnCheckedChangeListener((view,on)->{if(!updating[0])write.accept(on);});
        SharedPreferences.OnSharedPreferenceChangeListener listener=(changed,name)->{
            if(name==null||key.equals(name))refresh.run();
        };
        toggle.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){
            public void onViewAttachedToWindow(View view){prefs.registerOnSharedPreferenceChangeListener(listener);refresh.run();}
            public void onViewDetachedFromWindow(View view){prefs.unregisterOnSharedPreferenceChangeListener(listener);}
        });
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
