package e.e.a;
import java.util.Locale;
public final class UiStringsTest {
    private static void check(boolean ok, String message) { if (!ok) throw new AssertionError(message); }
    public static void main(String[] args) {
        check("Shorts".equals(UiStrings.translate("ショート", Locale.US)), "English Shorts title");
        check("Bold comments".equals(UiStrings.translate("コメントを太字にする", Locale.US)), "English bold comments");
        check("粗體留言".equals(UiStrings.translate("コメントを太字にする", Locale.TAIWAN)), "Chinese bold comments");
        check("デフォルトに戻す".equals(UiStrings.translate("Reset to default", Locale.JAPAN)), "English reset action returns Japanese");
        check("Reset to default".equals(UiStrings.translate("デフォルトに戻す", Locale.US)), "Japanese reset action translates to English");
        check("還原預設值".equals(UiStrings.translate("デフォルトに戻す", Locale.TAIWAN)), "Reset action translates to Chinese");
        check("使用しない".equals(UiStrings.translate("Never", Locale.JAPAN)), "English setting entry returns Japanese");
        check("設定".equals(UiStrings.translate("Setting", Locale.JAPAN)), "English upstream setting alias returns Japanese");
        check("キャッシュのみを使用し再生".equals(UiStrings.translate("Use cached files for offline playback", Locale.JAPAN)), "English cache entry returns Japanese");
        check("モバイル通信時のみ".equals(UiStrings.translate("On mobile data only", Locale.JAPAN)), "English mobile data entry returns Japanese");
        check("不使用".equals(UiStrings.translate("使用しない", Locale.TAIWAN)), "Setting entry translates to Chinese");
        check("短片".equals(UiStrings.translate("ショート", Locale.TAIWAN)), "Traditional Chinese Shorts title");
        check("ショート".equals(UiStrings.translate("ショート", Locale.JAPAN)), "Japanese unchanged");
        check("App language".equals(UiStrings.translate("Language of the entire application", Locale.US)), "Improve old English");
        check("應用程式語言".equals(UiStrings.translate("語言的整個應用程序的", Locale.TAIWAN)), "Improve old Chinese");
        check("none".equals(UiStrings.translate("none", Locale.US)), "Preference values unchanged");
        check("%s".equals(UiStrings.translate("%s", Locale.US)), "List summary placeholder unchanged");
        check(UiStrings.translate(null, Locale.US) == null, "Null is safe");
        check("Startup screen".equals(UiStrings.translate("起動時の画面", Locale.US)), "Startup title translates");
        check("Nico Reports".equals(UiStrings.translate("ニコレポ", Locale.US)), "Reports title translates");
        check("顯示投稿者追蹤按鈕".equals(UiStrings.translate("投稿者のフォローボタンを表示", Locale.TAIWAN)), "Follow setting translates");
        UiStrings.selectLanguage("ja");
        check("ショート".equals(UiStrings.translate("ショート")), "App Japanese selection overrides device locale");
        UiStrings.selectLanguage("en");
        check("Shorts".equals(UiStrings.translate("ショート")), "App English selection overrides device locale");
        UiStrings.selectLanguage("zh-TW");
        check("短片".equals(UiStrings.translate("ショート")), "App Chinese selection overrides device locale");
        UiStrings.selectLanguage("invalid");
        Locale previous = Locale.getDefault();
        try {
            Locale.setDefault(Locale.US);
            check("Save playback position".equals(UiStrings.translate("再生位置の保存")), "Uses selected app locale");
            Locale.setDefault(Locale.TAIWAN);
            check("儲存偵錯記錄".equals(UiStrings.translate("デバッグログを共有")), "Locale switch works");
        } finally { Locale.setDefault(previous); }
        check("デバッグログの保存".equals(UiStrings.translate("デバッグログを共有", Locale.JAPAN)), "Native Japanese menu saves logs");
        check("Save debug log".equals(UiStrings.translate("デバッグログを共有", Locale.US)), "Native English menu saves logs");
        String format = UiStrings.translate("再生:%,d  コメント:%,d  マイリス:%,d  いいね:%,d", Locale.US);
        check(String.format(Locale.US, format, 1, 2, 3, 4).contains("Likes: 4"), "Count format keeps all arguments");
        for (String source : new String[]{"ログイン方法", "通常ログイン", "Cookie手動入力", "保存",
                "user_sessionの値、またはuser_session=… の形式で入力してください。",
                "Cookieを保存できませんでした。再試行してください。"}) {
            check(!source.equals(UiStrings.translate(source, Locale.US)), "Manual sign-in English translation");
            check(!source.equals(UiStrings.translate(source, Locale.TAIWAN)), "Manual sign-in Chinese translation");
        }
        for (String source : new String[]{"再生速度変更","スワイプで音量調整","上下スワイプで音量を調整します。輝度調整もONの場合は動画の右側で操作します","スワイプで輝度調整","上下スワイプで再生画面の輝度を調整します。音量調整もONの場合は動画の左側で操作します","キャッシュのコピーが完了しました","キャッシュをコピー中","コピー","コピーに失敗しました。元のファイルは保持されています","フォルダー選択画面を開けませんでした","以前の保存先からコピーします。元のファイルは削除しません","保存先を使用できません。別のフォルダーを選択してください","後で","既存キャッシュをコピー","設定でキャッシュ保存先を選択してください","キャスト再生中です","ポップアップ再生を利用するには他のアプリの上に表示を許可してください","パーミッションの取得","この動画はRTMPを使用している為再生できません","再生する","再生リスト","実況プレイ動画","バーチャル","ランダム","人気が低い順","人気が高い順","並び順指定なし","あなたにオススメの動画","過去の視聴情報などからのオススメ動画","端末との接続を解除","既に登録済みです","%s をお気に入りから解除しますか？","フォローに失敗しました","フォローしました","%s をフォローしますか？","フォロー","フォロー済み","昇順(上から下)","降順(下から上)","再生:<b>%s</b> コメ:<b>%s</b> マイ:<b>%s</b> いいね:<b>%s</b>","ジャンル:<font color='#000000'><b>%s</b></font><br>過去最高:<font color='#000000'><b>%s</b></font>","カテゴリ:<font color='#000000'><b>%s</b></font><br>前日順位:<font color='#000000'><b>%s</b></font>(過去最高:<font color='#000000'><b>%s</b></font>)","再生履歴の保存やキャッシュなどを取得する為にメディア、ファイルへのアクセス許可が必要です。\nアプリを再起動し再度許可ダイアログを表示させるか、端末の設定画面からアプリ→nicoidを選択し、ストレージのアクセス権限を付与してください。"}) {
            check(!source.equals(UiStrings.translate(source, Locale.US)), "English translation: " + source);
            check(!source.equals(UiStrings.translate(source, Locale.TAIWAN)), "Traditional Chinese translation: " + source);
            check(source.equals(UiStrings.translate(source, Locale.JAPAN)), "Japanese text preserved: " + source);
        }
        String follow = UiStrings.translate("%s をフォローしますか？", Locale.TAIWAN);
        check(String.format(follow, "nicoid").contains("nicoid"), "Follow placeholder preserved");
        for (String source : new String[]{"再生位置に自動追従","再生時間順","ニコる数順","ランキング","通常の画質設定に従う","コメントの影の種類","コメントの影の大きさ","コメントの最大行数","コメントの表示時間","10行","5秒","コメント取得数"}) {
            check(!source.equals(UiStrings.translate(source, Locale.US)), "Missing-screen English: " + source);
            check(!source.equals(UiStrings.translate(source, Locale.TAIWAN)), "Missing-screen Chinese: " + source);
        }
        for (String source : new String[]{"取得数：","次回の再生から反映されます。追加取得数は動画やログイン状態により異なります。","再生状況や通信エラーなどの診断ログを Download フォルダに保存します。不具合報告時に利用できます。"}) {
            check(!source.equals(UiStrings.translate(source, Locale.US)), "English updated copy: " + source);
            check(!source.equals(UiStrings.translate(source, Locale.TAIWAN)), "Chinese updated copy: " + source);
        }
        for (String source : new String[]{"I will change the language of the entire application.","External memory (SD card)","None (view all)","Are you sure you want to delete all the cache?","I set the comment drawing frame rate limit.","I will change the display method suitable for each tablet, smartphone","I will change the method of playing videos (streaming / cache)","I will change the language of the comment and video information. (The default is subject to the language of the entire application.)","And what to do when you tap the video list. (Item other than that you set will be displayed by tapping the triangle in the bottom right-hand corner.)","Video List of cached (Viewable offline)","Keywords video, tag search","Language","Pop-up playback"}) {
            check(!source.equals(UiStrings.translate(source, Locale.JAPAN)), "English resource translated to Japanese: " + source);
            check(!source.equals(UiStrings.translate(source, Locale.TAIWAN)), "English resource translated to Chinese: " + source);
        }
        check(UiStrings.translate("取得数：", Locale.JAPAN).endsWith("："), "Target summary uses a colon");
        check(UiStrings.translate("件。", Locale.US).contains(". "), "English comment target summary punctuation");
        System.out.println("UI translation checks passed");
    }
}
