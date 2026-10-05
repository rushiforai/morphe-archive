package e.e.a;
import java.util.Locale;
public final class UiStringsTest {
    private static void check(boolean ok, String message) { if (!ok) throw new AssertionError(message); }
    public static void main(String[] args) {
        check("Shorts".equals(UiStrings.translate("ショート", Locale.US)), "English Shorts title");
        check("短片".equals(UiStrings.translate("ショート", Locale.TAIWAN)), "Traditional Chinese Shorts title");
        check("ショート".equals(UiStrings.translate("ショート", Locale.JAPAN)), "Japanese unchanged");
        check("App language".equals(UiStrings.translate("Language of the entire application", Locale.US)), "Improve old English");
        check("應用程式語言".equals(UiStrings.translate("語言的整個應用程序的", Locale.TAIWAN)), "Improve old Chinese");
        check("none".equals(UiStrings.translate("none", Locale.US)), "Preference values unchanged");
        check("%s".equals(UiStrings.translate("%s", Locale.US)), "List summary placeholder unchanged");
        check(UiStrings.translate(null, Locale.US) == null, "Null is safe");
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
            check("分享偵錯紀錄".equals(UiStrings.translate("デバッグログを共有")), "Locale switch works");
        } finally { Locale.setDefault(previous); }
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
        System.out.println("UI translation checks passed");
    }
}
