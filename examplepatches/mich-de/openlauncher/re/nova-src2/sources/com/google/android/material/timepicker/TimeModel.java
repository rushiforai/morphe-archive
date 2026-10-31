package com.google.android.material.timepicker;

import android.content.res.Resources;
import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* loaded from: classes3.dex */
class TimeModel implements Parcelable {
    public static final Parcelable.Creator<TimeModel> CREATOR = new l();

    /* renamed from: a, reason: collision with root package name */
    public final j f34468a;

    /* renamed from: b, reason: collision with root package name */
    public final j f34469b;

    /* renamed from: c, reason: collision with root package name */
    public final int f34470c;

    /* renamed from: d, reason: collision with root package name */
    public int f34471d;

    /* renamed from: e, reason: collision with root package name */
    public int f34472e;

    /* renamed from: f, reason: collision with root package name */
    public int f34473f;

    /* renamed from: g, reason: collision with root package name */
    public int f34474g;

    public TimeModel(int i5) {
        this(0, 0, 10, i5);
    }

    public static String a(Resources resources, CharSequence charSequence, String str) {
        try {
            return String.format(resources.getConfiguration().locale, str, Integer.valueOf(Integer.parseInt(String.valueOf(charSequence))));
        } catch (NumberFormatException unused) {
            return null;
        }
    }

    public final int b() {
        if (this.f34470c == 1) {
            return this.f34471d % 24;
        }
        int i5 = this.f34471d;
        if (i5 % 12 == 0) {
            return 12;
        }
        return this.f34474g == 1 ? i5 - 12 : i5;
    }

    public final void d(int i5) {
        if (this.f34470c == 1) {
            this.f34471d = i5;
        } else {
            this.f34471d = (i5 % 12) + (this.f34474g != 1 ? 0 : 12);
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final void e(int i5) {
        this.f34472e = i5 % 60;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof TimeModel)) {
            return false;
        }
        TimeModel timeModel = (TimeModel) obj;
        return this.f34471d == timeModel.f34471d && this.f34472e == timeModel.f34472e && this.f34470c == timeModel.f34470c && this.f34473f == timeModel.f34473f;
    }

    public final void f(int i5) {
        if (i5 != this.f34474g) {
            this.f34474g = i5;
            int i11 = this.f34471d;
            if (i11 < 12 && i5 == 1) {
                this.f34471d = i11 + 12;
            } else {
                if (i11 < 12 || i5 != 0) {
                    return;
                }
                this.f34471d = i11 - 12;
            }
        }
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(this.f34470c), Integer.valueOf(this.f34471d), Integer.valueOf(this.f34472e), Integer.valueOf(this.f34473f)});
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.f34471d);
        parcel.writeInt(this.f34472e);
        parcel.writeInt(this.f34473f);
        parcel.writeInt(this.f34470c);
    }

    public TimeModel(int i5, int i11, int i12, int i13) {
        this.f34471d = i5;
        this.f34472e = i11;
        this.f34473f = i12;
        this.f34470c = i13;
        this.f34474g = i5 >= 12 ? 1 : 0;
        this.f34468a = new j(59);
        this.f34469b = new j(i13 == 1 ? 23 : 12);
    }
}
