package ads_mobile_sdk;

import aa.d;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import java.util.Arrays;

/* loaded from: classes.dex */
public final class vm2 extends AbstractSafeParcelable {
    public static final Parcelable.Creator<vm2> CREATOR = new d(4);

    /* renamed from: a, reason: collision with root package name */
    public final int f10829a;

    /* renamed from: b, reason: collision with root package name */
    public final byte[] f10830b;

    /* renamed from: c, reason: collision with root package name */
    public final int f10831c;

    public vm2(byte[] bArr, int i5, int i11) {
        this.f10829a = i5;
        this.f10830b = bArr == null ? null : Arrays.copyOf(bArr, bArr.length);
        this.f10831c = i11;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = fg.a.j0(parcel, 20293);
        fg.a.i0(parcel, 1, 4);
        parcel.writeInt(this.f10829a);
        fg.a.V(parcel, 2, this.f10830b);
        fg.a.i0(parcel, 3, 4);
        parcel.writeInt(this.f10831c);
        fg.a.k0(parcel, iJ0);
    }
}
