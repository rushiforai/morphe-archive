package ads_mobile_sdk;

import aa.d;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;

/* loaded from: classes.dex */
public final class tm2 extends AbstractSafeParcelable {
    public static final Parcelable.Creator<tm2> CREATOR = new d(2);

    /* renamed from: a, reason: collision with root package name */
    public final int f10009a;

    /* renamed from: b, reason: collision with root package name */
    public final int f10010b;

    /* renamed from: c, reason: collision with root package name */
    public final String f10011c;

    /* renamed from: d, reason: collision with root package name */
    public final String f10012d;

    /* renamed from: e, reason: collision with root package name */
    public final int f10013e;

    public tm2(String str, int i5, int i11, int i12, String str2) {
        this.f10009a = i5;
        this.f10010b = i11;
        this.f10011c = str;
        this.f10012d = str2;
        this.f10013e = i12;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = fg.a.j0(parcel, 20293);
        fg.a.i0(parcel, 1, 4);
        parcel.writeInt(this.f10009a);
        fg.a.i0(parcel, 2, 4);
        parcel.writeInt(this.f10010b);
        fg.a.c0(parcel, 3, this.f10011c);
        fg.a.c0(parcel, 4, this.f10012d);
        fg.a.i0(parcel, 5, 4);
        parcel.writeInt(this.f10013e);
        fg.a.k0(parcel, iJ0);
    }
}
