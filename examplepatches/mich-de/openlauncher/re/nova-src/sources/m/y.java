package m;

import android.content.res.Configuration;
import android.os.LocaleList;

/* loaded from: classes2.dex */
public abstract class y {
    public static void a(Configuration configuration, Configuration configuration2, Configuration configuration3) {
        LocaleList locales = configuration.getLocales();
        LocaleList locales2 = configuration2.getLocales();
        if (locales.equals(locales2)) {
            return;
        }
        configuration3.setLocales(locales2);
        configuration3.locale = configuration2.locale;
    }

    public static w4.g b(Configuration configuration) {
        return w4.g.a(configuration.getLocales().toLanguageTags());
    }

    public static void c(w4.g gVar) {
        LocaleList.setDefault(LocaleList.forLanguageTags(gVar.e()));
    }

    public static void d(Configuration configuration, w4.g gVar) {
        configuration.setLocales(LocaleList.forLanguageTags(gVar.e()));
    }
}
