package com.google.android.material.datepicker;

import android.icu.text.DateFormat;
import android.icu.text.DisplayContext;
import android.icu.util.TimeZone;
import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
final class Month implements Comparable<Month>, Parcelable {
    public static final Parcelable.Creator<Month> CREATOR = new o(0);

    /* renamed from: a, reason: collision with root package name */
    public final Calendar f34231a;

    /* renamed from: b, reason: collision with root package name */
    public final int f34232b;

    /* renamed from: c, reason: collision with root package name */
    public final int f34233c;

    /* renamed from: d, reason: collision with root package name */
    public final int f34234d;

    /* renamed from: e, reason: collision with root package name */
    public final int f34235e;

    /* renamed from: f, reason: collision with root package name */
    public final long f34236f;

    /* renamed from: g, reason: collision with root package name */
    public String f34237g;

    public Month(Calendar calendar) {
        calendar.set(5, 1);
        Calendar calendarA = v.a(calendar);
        this.f34231a = calendarA;
        this.f34232b = calendarA.get(2);
        this.f34233c = calendarA.get(1);
        this.f34234d = calendarA.getMaximum(7);
        this.f34235e = calendarA.getActualMaximum(5);
        this.f34236f = calendarA.getTimeInMillis();
    }

    public static Month a(int i5, int i11) {
        Calendar calendarC = v.c(null);
        calendarC.set(1, i5);
        calendarC.set(2, i11);
        return new Month(calendarC);
    }

    public static Month b(long j11) {
        Calendar calendarC = v.c(null);
        calendarC.setTimeInMillis(j11);
        return new Month(calendarC);
    }

    @Override // java.lang.Comparable
    public final int compareTo(Month month) {
        return this.f34231a.compareTo(month.f34231a);
    }

    public final String d() {
        if (this.f34237g == null) {
            long timeInMillis = this.f34231a.getTimeInMillis();
            Locale locale = Locale.getDefault();
            AtomicReference atomicReference = v.f34279a;
            DateFormat instanceForSkeleton = DateFormat.getInstanceForSkeleton("yMMMM", locale);
            instanceForSkeleton.setTimeZone(TimeZone.getTimeZone("UTC"));
            instanceForSkeleton.setContext(DisplayContext.CAPITALIZATION_FOR_STANDALONE);
            this.f34237g = instanceForSkeleton.format(new Date(timeInMillis));
        }
        return this.f34237g;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Month)) {
            return false;
        }
        Month month = (Month) obj;
        return this.f34232b == month.f34232b && this.f34233c == month.f34233c;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(this.f34232b), Integer.valueOf(this.f34233c)});
    }

    public final int i(Month month) {
        if (!(this.f34231a instanceof GregorianCalendar)) {
            throw new IllegalArgumentException("Only Gregorian calendars are supported.");
        }
        return (month.f34232b - this.f34232b) + ((month.f34233c - this.f34233c) * 12);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.f34233c);
        parcel.writeInt(this.f34232b);
    }
}
