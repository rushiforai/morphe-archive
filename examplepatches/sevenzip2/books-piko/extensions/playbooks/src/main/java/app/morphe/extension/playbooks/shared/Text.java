package app.morphe.extension.playbooks.shared;

import java.util.Locale;

/** Minimal Korean / English text selection without app resources. */
public final class Text {
    private Text() {
    }

    public static String t(String korean, String english) {
        return "ko".equals(Locale.getDefault().getLanguage()) ? korean : english;
    }
}
