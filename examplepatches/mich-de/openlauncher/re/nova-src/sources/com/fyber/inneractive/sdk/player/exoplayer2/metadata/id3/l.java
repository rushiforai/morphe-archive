package com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class l extends o {
    public static final Parcelable.Creator<l> CREATOR = new k();

    /* renamed from: b, reason: collision with root package name */
    public final String f30107b;

    /* renamed from: c, reason: collision with root package name */
    public final String f30108c;

    /* renamed from: d, reason: collision with root package name */
    public final String f30109d;

    /* renamed from: e, reason: collision with root package name */
    public final byte[] f30110e;

    public l(String str, String str2, String str3, byte[] bArr) {
        super("GEOB");
        this.f30107b = str;
        this.f30108c = str2;
        this.f30109d = str3;
        this.f30110e = bArr;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && l.class == obj.getClass()) {
            l lVar = (l) obj;
            if (z.a(this.f30107b, lVar.f30107b) && z.a(this.f30108c, lVar.f30108c) && z.a(this.f30109d, lVar.f30109d) && Arrays.equals(this.f30110e, lVar.f30110e)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        String str = this.f30107b;
        int iHashCode = ((str != null ? str.hashCode() : 0) + 527) * 31;
        String str2 = this.f30108c;
        int iHashCode2 = (iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31;
        String str3 = this.f30109d;
        return Arrays.hashCode(this.f30110e) + ((iHashCode2 + (str3 != null ? str3.hashCode() : 0)) * 31);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f30107b);
        parcel.writeString(this.f30108c);
        parcel.writeString(this.f30109d);
        parcel.writeByteArray(this.f30110e);
    }

    public l(Parcel parcel) {
        super("GEOB");
        this.f30107b = parcel.readString();
        this.f30108c = parcel.readString();
        this.f30109d = parcel.readString();
        this.f30110e = parcel.createByteArray();
    }
}
