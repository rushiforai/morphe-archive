package com.fyber.inneractive.sdk.player.exoplayer2.video;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class c implements Parcelable {
    public static final Parcelable.Creator<c> CREATOR = new b();

    /* renamed from: a, reason: collision with root package name */
    public final int f30524a;

    /* renamed from: b, reason: collision with root package name */
    public final int f30525b;

    /* renamed from: c, reason: collision with root package name */
    public final int f30526c;

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f30527d;

    /* renamed from: e, reason: collision with root package name */
    public int f30528e;

    public c(int i5, int i11, int i12, byte[] bArr) {
        this.f30524a = i5;
        this.f30525b = i11;
        this.f30526c = i12;
        this.f30527d = bArr;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && c.class == obj.getClass()) {
            c cVar = (c) obj;
            if (this.f30524a == cVar.f30524a && this.f30525b == cVar.f30525b && this.f30526c == cVar.f30526c && Arrays.equals(this.f30527d, cVar.f30527d)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        if (this.f30528e == 0) {
            this.f30528e = Arrays.hashCode(this.f30527d) + ((((((this.f30524a + 527) * 31) + this.f30525b) * 31) + this.f30526c) * 31);
        }
        return this.f30528e;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ColorInfo(");
        sb2.append(this.f30524a);
        sb2.append(", ");
        sb2.append(this.f30525b);
        sb2.append(", ");
        sb2.append(this.f30526c);
        sb2.append(", ");
        return a80.m.k(sb2, this.f30527d != null, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.f30524a);
        parcel.writeInt(this.f30525b);
        parcel.writeInt(this.f30526c);
        parcel.writeInt(this.f30527d != null ? 1 : 0);
        byte[] bArr = this.f30527d;
        if (bArr != null) {
            parcel.writeByteArray(bArr);
        }
    }

    public c(Parcel parcel) {
        this.f30524a = parcel.readInt();
        this.f30525b = parcel.readInt();
        this.f30526c = parcel.readInt();
        this.f30527d = parcel.readInt() != 0 ? parcel.createByteArray() : null;
    }
}
