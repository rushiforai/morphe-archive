package com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;

/* loaded from: classes3.dex */
public final class s extends o {
    public static final Parcelable.Creator<s> CREATOR = new r();

    /* renamed from: b, reason: collision with root package name */
    public final String f30119b;

    /* renamed from: c, reason: collision with root package name */
    public final String f30120c;

    public s(String str, String str2, String str3) {
        super(str);
        this.f30119b = str2;
        this.f30120c = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && s.class == obj.getClass()) {
            s sVar = (s) obj;
            if (this.f30116a.equals(sVar.f30116a) && z.a(this.f30119b, sVar.f30119b) && z.a(this.f30120c, sVar.f30120c)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iE = c0.e(527, 31, this.f30116a);
        String str = this.f30119b;
        int iHashCode = (iE + (str != null ? str.hashCode() : 0)) * 31;
        String str2 = this.f30120c;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f30116a);
        parcel.writeString(this.f30119b);
        parcel.writeString(this.f30120c);
    }

    public s(Parcel parcel) {
        super(parcel.readString());
        this.f30119b = parcel.readString();
        this.f30120c = parcel.readString();
    }
}
