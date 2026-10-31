package com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class q extends o {
    public static final Parcelable.Creator<q> CREATOR = new p();

    /* renamed from: b, reason: collision with root package name */
    public final String f30117b;

    /* renamed from: c, reason: collision with root package name */
    public final byte[] f30118c;

    public q(String str, byte[] bArr) {
        super("PRIV");
        this.f30117b = str;
        this.f30118c = bArr;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && q.class == obj.getClass()) {
            q qVar = (q) obj;
            if (z.a(this.f30117b, qVar.f30117b) && Arrays.equals(this.f30118c, qVar.f30118c)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        String str = this.f30117b;
        return Arrays.hashCode(this.f30118c) + (((str != null ? str.hashCode() : 0) + 527) * 31);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f30117b);
        parcel.writeByteArray(this.f30118c);
    }

    public q(Parcel parcel) {
        super("PRIV");
        this.f30117b = parcel.readString();
        this.f30118c = parcel.createByteArray();
    }
}
