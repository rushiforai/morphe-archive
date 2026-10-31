package py;

import aosp.android.icu.impl.CalendarAstronomer;
import java.util.GregorianCalendar;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: d, reason: collision with root package name */
    public static d f83140d;

    /* renamed from: a, reason: collision with root package name */
    public long f83141a;

    /* renamed from: b, reason: collision with root package name */
    public long f83142b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f83143c;

    public final void a(double d5, double d11, long j11) {
        GregorianCalendar gregorianCalendar = new GregorianCalendar();
        gregorianCalendar.setTimeInMillis(j11);
        gregorianCalendar.set(11, 12);
        CalendarAstronomer calendarAstronomer = new CalendarAstronomer();
        double dF = CalendarAstronomer.f((d11 * 0.017453292519943295d) + 3.141592653589793d, 6.283185307179586d) - 3.141592653589793d;
        calendarAstronomer.f15363b = CalendarAstronomer.f((d5 * 0.017453292519943295d) + 3.141592653589793d, 6.283185307179586d) - 3.141592653589793d;
        calendarAstronomer.f15364c = (long) (((dF * 24.0d) * 3600000.0d) / 6.283185307179586d);
        calendarAstronomer.g(gregorianCalendar.getTimeInMillis());
        boolean z11 = true;
        this.f83142b = calendarAstronomer.e(true);
        long jE = calendarAstronomer.e(false);
        this.f83141a = jE;
        if (j11 >= this.f83142b && j11 <= jE) {
            z11 = false;
        }
        this.f83143c = z11;
    }
}
