package com.google.android.material.datepicker;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class CalendarConstraints implements Parcelable {
    public static final Parcelable.Creator<CalendarConstraints> CREATOR = new a();

    /* renamed from: a, reason: collision with root package name */
    public final Month f34187a;

    /* renamed from: b, reason: collision with root package name */
    public final Month f34188b;

    /* renamed from: c, reason: collision with root package name */
    public final DateValidator f34189c;

    /* renamed from: d, reason: collision with root package name */
    public final Month f34190d;

    /* renamed from: e, reason: collision with root package name */
    public final int f34191e;

    /* renamed from: f, reason: collision with root package name */
    public final int f34192f;

    /* renamed from: g, reason: collision with root package name */
    public final int f34193g;

    public interface DateValidator extends Parcelable {
    }

    public CalendarConstraints(Month month, Month month2, DateValidator dateValidator, Month month3, int i5) {
        Objects.requireNonNull(month, "start cannot be null");
        Objects.requireNonNull(month2, "end cannot be null");
        Objects.requireNonNull(dateValidator, "validator cannot be null");
        this.f34187a = month;
        this.f34188b = month2;
        this.f34190d = month3;
        this.f34191e = i5;
        this.f34189c = dateValidator;
        if (month3 != null && month.f34231a.compareTo(month3.f34231a) > 0) {
            throw new IllegalArgumentException("start Month cannot be after current Month");
        }
        if (month3 != null && month3.f34231a.compareTo(month2.f34231a) > 0) {
            throw new IllegalArgumentException("current Month cannot be after end Month");
        }
        if (i5 < 0 || i5 > v.c(null).getMaximum(7)) {
            throw new IllegalArgumentException("firstDayOfWeek is not valid");
        }
        this.f34193g = month.i(month2) + 1;
        this.f34192f = (month2.f34233c - month.f34233c) + 1;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof CalendarConstraints)) {
            return false;
        }
        CalendarConstraints calendarConstraints = (CalendarConstraints) obj;
        return this.f34187a.equals(calendarConstraints.f34187a) && this.f34188b.equals(calendarConstraints.f34188b) && Objects.equals(this.f34190d, calendarConstraints.f34190d) && this.f34191e == calendarConstraints.f34191e && this.f34189c.equals(calendarConstraints.f34189c);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f34187a, this.f34188b, this.f34190d, Integer.valueOf(this.f34191e), this.f34189c});
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeParcelable(this.f34187a, 0);
        parcel.writeParcelable(this.f34188b, 0);
        parcel.writeParcelable(this.f34190d, 0);
        parcel.writeParcelable(this.f34189c, 0);
        parcel.writeInt(this.f34191e);
    }
}
