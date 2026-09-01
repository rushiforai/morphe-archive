package defpackage;

import android.content.res.Configuration;
import android.os.LocaleList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class y10 {
    public static void a(Configuration configuration, Configuration configuration2, Configuration configuration3) {
        LocaleList locales = configuration.getLocales();
        LocaleList locales2 = configuration2.getLocales();
        if (locales.equals(locales2)) {
            return;
        }
        configuration3.setLocales(locales2);
        configuration3.locale = configuration2.locale;
    }

    public static i67 b(Configuration configuration) {
        return i67.b(configuration.getLocales().toLanguageTags());
    }

    public static void c(i67 i67Var) {
        LocaleList.setDefault(LocaleList.forLanguageTags(i67Var.a.a()));
    }

    public static void d(Configuration configuration, i67 i67Var) {
        configuration.setLocales(LocaleList.forLanguageTags(i67Var.a.a()));
    }
}
