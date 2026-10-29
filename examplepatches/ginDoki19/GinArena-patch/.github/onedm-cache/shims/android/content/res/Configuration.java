package android.content.res;

import android.os.LocaleList;
import java.util.Locale;

public class Configuration {
    public Locale locale = Locale.US;
    private final LocaleList locales = new LocaleList(Locale.US);

    public LocaleList getLocales() {
        return locales;
    }
}
