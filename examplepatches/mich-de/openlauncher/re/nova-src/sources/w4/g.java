package w4;

import android.os.LocaleList;
import java.util.Locale;

/* loaded from: classes2.dex */
public final class g {

    /* renamed from: b, reason: collision with root package name */
    public static final g f93750b = f(new LocaleList(new Locale[0]));

    /* renamed from: a, reason: collision with root package name */
    public final h f93751a;

    public g(h hVar) {
        this.f93751a = hVar;
    }

    public static g a(String str) {
        if (str == null || str.isEmpty()) {
            return f93750b;
        }
        String[] strArrSplit = str.split(",", -1);
        int length = strArrSplit.length;
        Locale[] localeArr = new Locale[length];
        for (int i5 = 0; i5 < length; i5++) {
            String str2 = strArrSplit[i5];
            int i11 = f.f93749a;
            localeArr[i5] = Locale.forLanguageTag(str2);
        }
        return f(new LocaleList(localeArr));
    }

    public static g c() {
        return f93750b;
    }

    public static g f(LocaleList localeList) {
        return new g(new h(localeList));
    }

    public final Locale b(int i5) {
        return this.f93751a.f93752a.get(i5);
    }

    public final boolean d() {
        return this.f93751a.f93752a.isEmpty();
    }

    public final String e() {
        return this.f93751a.f93752a.toLanguageTags();
    }

    public final boolean equals(Object obj) {
        if (obj instanceof g) {
            return this.f93751a.equals(((g) obj).f93751a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f93751a.f93752a.hashCode();
    }

    public final String toString() {
        return this.f93751a.f93752a.toString();
    }
}
