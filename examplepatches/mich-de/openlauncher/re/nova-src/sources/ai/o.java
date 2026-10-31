package ai;

import com.amplitude.core.events.Identify;
import java.util.Calendar;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class o extends v1 {

    /* renamed from: c, reason: collision with root package name */
    public long f13185c;

    /* renamed from: d, reason: collision with root package name */
    public String f13186d;

    @Override // ai.v1
    public final boolean E() {
        Calendar calendar = Calendar.getInstance();
        this.f13185c = TimeUnit.MINUTES.convert(calendar.get(16) + calendar.get(15), TimeUnit.MILLISECONDS);
        Locale locale = Locale.getDefault();
        String language = locale.getLanguage();
        Locale locale2 = Locale.ENGLISH;
        String lowerCase = language.toLowerCase(locale2);
        String lowerCase2 = locale.getCountry().toLowerCase(locale2);
        this.f13186d = b.c0.r(new StringBuilder(String.valueOf(lowerCase).length() + 1 + String.valueOf(lowerCase2).length()), lowerCase, Identify.UNSET_VALUE, lowerCase2);
        return false;
    }

    public final long H() {
        F();
        return this.f13185c;
    }

    public final String I() {
        F();
        return this.f13186d;
    }
}
