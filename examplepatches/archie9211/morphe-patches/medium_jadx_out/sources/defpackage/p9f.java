package defpackage;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p9f implements Comparable {
    public int a;
    public int b;
    public int c;
    public int d;
    public int e;
    public int f;
    public TimeZone g;
    public int h;
    public boolean i;
    public boolean j;
    public boolean k;

    public p9f(GregorianCalendar gregorianCalendar) {
        this.a = 0;
        this.b = 0;
        this.c = 0;
        this.d = 0;
        this.e = 0;
        this.f = 0;
        this.g = null;
        this.i = false;
        this.j = false;
        this.k = false;
        Date time = gregorianCalendar.getTime();
        TimeZone timeZone = gregorianCalendar.getTimeZone();
        GregorianCalendar gregorianCalendar2 = (GregorianCalendar) Calendar.getInstance(Locale.US);
        gregorianCalendar2.setGregorianChange(new Date(Long.MIN_VALUE));
        gregorianCalendar2.setTimeZone(timeZone);
        gregorianCalendar2.setTime(time);
        this.a = gregorianCalendar2.get(1);
        this.b = gregorianCalendar2.get(2) + 1;
        this.c = gregorianCalendar2.get(5);
        this.d = gregorianCalendar2.get(11);
        this.e = gregorianCalendar2.get(12);
        this.f = gregorianCalendar2.get(13);
        this.h = gregorianCalendar2.get(14) * 1000000;
        this.g = gregorianCalendar2.getTimeZone();
        this.k = true;
        this.j = true;
        this.i = true;
    }

    public final GregorianCalendar a() {
        GregorianCalendar gregorianCalendar = (GregorianCalendar) Calendar.getInstance(Locale.US);
        gregorianCalendar.setGregorianChange(new Date(Long.MIN_VALUE));
        if (this.k) {
            gregorianCalendar.setTimeZone(this.g);
        }
        gregorianCalendar.set(1, this.a);
        gregorianCalendar.set(2, this.b - 1);
        gregorianCalendar.set(5, this.c);
        gregorianCalendar.set(11, this.d);
        gregorianCalendar.set(12, this.e);
        gregorianCalendar.set(13, this.f);
        gregorianCalendar.set(14, this.h / 1000000);
        return gregorianCalendar;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        long timeInMillis = a().getTimeInMillis() - ((p9f) obj).a().getTimeInMillis();
        return (int) (timeInMillis != 0 ? Math.signum(timeInMillis) : Math.signum(this.h - r5.h));
    }

    public final String toString() {
        return nk7.u0(this);
    }
}
