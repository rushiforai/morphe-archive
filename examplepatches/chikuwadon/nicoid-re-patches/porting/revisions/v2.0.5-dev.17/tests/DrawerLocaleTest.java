package e.e.a;
import java.util.Locale;
public final class DrawerLocaleTest {
    public static void main(String[] args) {
        Locale previous = Locale.getDefault();
        try {
            Locale.setDefault(Locale.US);
            for (String language : new String[]{"0", "1", "2", "0", "-1"}) {
                UiStrings.selectLanguage(language);
                String expected = "1".equals(language) || "-1".equals(language) ? "Settings" : "設定";
                for (String source : new String[]{"設定", "Setting", "Settings"}) {
                    String actual = UiStrings.translate(source);
                    if (!expected.equals(actual) || !actual.equals(UiStrings.translate(actual))) {
                        throw new AssertionError(language + ": " + source + " -> " + actual);
                    }
                }
            }
        } finally {
            Locale.setDefault(previous);
            UiStrings.selectLanguage(null);
        }
        System.out.println("PASS: canonical drawer heading, all aliases, language switch and repeated binding");
    }
}
