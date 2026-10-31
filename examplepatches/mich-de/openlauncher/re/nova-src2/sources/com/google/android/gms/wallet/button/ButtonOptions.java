package com.google.android.gms.wallet.button;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import fg.a;
import gi.g;
import gu.j;
import java.util.Arrays;
import sg.w;

/* loaded from: classes3.dex */
public final class ButtonOptions extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<ButtonOptions> CREATOR = new g(20);

    /* renamed from: f, reason: collision with root package name */
    public int f33911f;

    /* renamed from: g, reason: collision with root package name */
    public int f33912g;

    /* renamed from: h, reason: collision with root package name */
    public int f33913h;

    /* renamed from: i, reason: collision with root package name */
    public String f33914i;

    private ButtonOptions() {
    }

    public static j d() {
        return new j(new ButtonOptions(), 11);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof ButtonOptions) {
            ButtonOptions buttonOptions = (ButtonOptions) obj;
            if (w.k(Integer.valueOf(this.f33911f), Integer.valueOf(buttonOptions.f33911f)) && w.k(Integer.valueOf(this.f33912g), Integer.valueOf(buttonOptions.f33912g)) && w.k(Integer.valueOf(this.f33913h), Integer.valueOf(buttonOptions.f33913h)) && w.k(this.f33914i, buttonOptions.f33914i)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(this.f33911f)});
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = a.j0(parcel, 20293);
        int i11 = this.f33911f;
        a.i0(parcel, 1, 4);
        parcel.writeInt(i11);
        int i12 = this.f33912g;
        a.i0(parcel, 2, 4);
        parcel.writeInt(i12);
        int i13 = this.f33913h;
        a.i0(parcel, 3, 4);
        parcel.writeInt(i13);
        a.c0(parcel, 4, this.f33914i);
        a.k0(parcel, iJ0);
    }
}
