package v50;

import java.util.Calendar;
import java.util.Locale;
import java.util.TimeZone;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final TimeZone f92103a = TimeZone.getTimeZone("GMT");

    public static final d a(Long l9) {
        Calendar calendar = Calendar.getInstance(f92103a, Locale.ROOT);
        Intrinsics.d(calendar);
        if (l9 != null) {
            calendar.setTimeInMillis(l9.longValue());
        }
        int i5 = calendar.get(16) + calendar.get(15);
        int i11 = calendar.get(13);
        int i12 = calendar.get(12);
        int i13 = calendar.get(11);
        int i14 = (calendar.get(7) + 5) % 7;
        f.f92118a.getClass();
        f fVar = (f) f.f92120c.get(i14);
        int i15 = calendar.get(5);
        int i16 = calendar.get(6);
        o7.a aVar = e.f92115a;
        int i17 = calendar.get(2);
        aVar.getClass();
        return new d(i11, i12, i13, fVar, i15, i16, (e) e.f92117c.get(i17), calendar.get(1), calendar.getTimeInMillis() + i5);
    }
}
