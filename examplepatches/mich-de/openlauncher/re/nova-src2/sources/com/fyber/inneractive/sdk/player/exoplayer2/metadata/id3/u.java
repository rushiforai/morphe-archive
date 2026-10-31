package com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;

/* loaded from: classes3.dex */
public final class u extends o {
    public static final Parcelable.Creator<u> CREATOR = new t();

    /* renamed from: b, reason: collision with root package name */
    public final String f30121b;

    /* renamed from: c, reason: collision with root package name */
    public final String f30122c;

    public u(String str, String str2, String str3) {
        super(str);
        this.f30121b = str2;
        this.f30122c = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && u.class == obj.getClass()) {
            u uVar = (u) obj;
            if (this.f30116a.equals(uVar.f30116a) && z.a(this.f30121b, uVar.f30121b) && z.a(this.f30122c, uVar.f30122c)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iE = c0.e(527, 31, this.f30116a);
        String str = this.f30121b;
        int iHashCode = (iE + (str != null ? str.hashCode() : 0)) * 31;
        String str2 = this.f30122c;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f30116a);
        parcel.writeString(this.f30121b);
        parcel.writeString(this.f30122c);
    }

    public u(Parcel parcel) {
        super(parcel.readString());
        this.f30121b = parcel.readString();
        this.f30122c = parcel.readString();
    }
}
