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
        System.out.println("UI translation checks passed");
    }
}
