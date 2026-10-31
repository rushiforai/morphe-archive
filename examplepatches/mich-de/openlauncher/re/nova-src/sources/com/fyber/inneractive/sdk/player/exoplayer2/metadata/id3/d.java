package com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class d extends o {
    public static final Parcelable.Creator<d> CREATOR = new c();

    /* renamed from: b, reason: collision with root package name */
    public final byte[] f30092b;

    public d(String str, byte[] bArr) {
        super(str);
        this.f30092b = bArr;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && d.class == obj.getClass()) {
            d dVar = (d) obj;
            if (this.f30116a.equals(dVar.f30116a) && Arrays.equals(this.f30092b, dVar.f30092b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(this.f30092b) + c0.e(527, 31, this.f30116a);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f30116a);
        parcel.writeByteArray(this.f30092b);
    }

    public d(Parcel parcel) {
        super(parcel.readString());
        this.f30092b = parcel.createByteArray();
    }
}
