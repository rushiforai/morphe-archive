package k7;

import android.os.Parcel;
import android.util.SparseIntArray;
import b.c0;
import z.e;

/* loaded from: classes2.dex */
public final class b extends a {

    /* renamed from: d, reason: collision with root package name */
    public final SparseIntArray f71184d;

    /* renamed from: e, reason: collision with root package name */
    public final Parcel f71185e;

    /* renamed from: f, reason: collision with root package name */
    public final int f71186f;

    /* renamed from: g, reason: collision with root package name */
    public final int f71187g;

    /* renamed from: h, reason: collision with root package name */
    public final String f71188h;

    /* renamed from: i, reason: collision with root package name */
    public int f71189i;

    /* renamed from: j, reason: collision with root package name */
    public int f71190j;

    /* renamed from: k, reason: collision with root package name */
    public int f71191k;

    public b(Parcel parcel) {
        this(parcel, parcel.dataPosition(), parcel.dataSize(), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, new e(0), new e(0), new e(0));
    }

    @Override // k7.a
    public final b a() {
        Parcel parcel = this.f71185e;
        int iDataPosition = parcel.dataPosition();
        int i5 = this.f71190j;
        if (i5 == this.f71186f) {
            i5 = this.f71187g;
        }
        return new b(parcel, iDataPosition, i5, c0.q(new StringBuilder(), this.f71188h, "  "), this.f71181a, this.f71182b, this.f71183c);
    }

    @Override // k7.a
    public final boolean e(int i5) {
        while (this.f71190j < this.f71187g) {
            int i11 = this.f71191k;
            if (i11 == i5) {
                return true;
            }
            if (String.valueOf(i11).compareTo(String.valueOf(i5)) > 0) {
                return false;
            }
            int i12 = this.f71190j;
            Parcel parcel = this.f71185e;
            parcel.setDataPosition(i12);
            int i13 = parcel.readInt();
            this.f71191k = parcel.readInt();
            this.f71190j += i13;
        }
        return this.f71191k == i5;
    }

    @Override // k7.a
    public final void i(int i5) {
        int i11 = this.f71189i;
        SparseIntArray sparseIntArray = this.f71184d;
        Parcel parcel = this.f71185e;
        if (i11 >= 0) {
            int i12 = sparseIntArray.get(i11);
            int iDataPosition = parcel.dataPosition();
            parcel.setDataPosition(i12);
            parcel.writeInt(iDataPosition - i12);
            parcel.setDataPosition(iDataPosition);
        }
        this.f71189i = i5;
        sparseIntArray.put(i5, parcel.dataPosition());
        parcel.writeInt(0);
        parcel.writeInt(i5);
    }

    public b(Parcel parcel, int i5, int i11, String str, e eVar, e eVar2, e eVar3) {
        super(eVar, eVar2, eVar3);
        this.f71184d = new SparseIntArray();
        this.f71189i = -1;
        this.f71191k = -1;
        this.f71185e = parcel;
        this.f71186f = i5;
        this.f71187g = i11;
        this.f71190j = i5;
        this.f71188h = str;
    }
}
