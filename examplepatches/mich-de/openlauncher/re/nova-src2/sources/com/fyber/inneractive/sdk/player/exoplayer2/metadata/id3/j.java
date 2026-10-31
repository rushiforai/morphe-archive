package com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;

/* loaded from: classes3.dex */
public final class j extends o {
    public static final Parcelable.Creator<j> CREATOR = new i();

    /* renamed from: b, reason: collision with root package name */
    public final String f30104b;

    /* renamed from: c, reason: collision with root package name */
    public final String f30105c;

    /* renamed from: d, reason: collision with root package name */
    public final String f30106d;

    public j(String str, String str2, String str3) {
        super("COMM");
        this.f30104b = str;
        this.f30105c = str2;
        this.f30106d = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && j.class == obj.getClass()) {
            j jVar = (j) obj;
            if (z.a(this.f30105c, jVar.f30105c) && z.a(this.f30104b, jVar.f30104b) && z.a(this.f30106d, jVar.f30106d)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        String str = this.f30104b;
        int iHashCode = ((str != null ? str.hashCode() : 0) + 527) * 31;
        String str2 = this.f30105c;
        int iHashCode2 = (iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31;
        String str3 = this.f30106d;
        return iHashCode2 + (str3 != null ? str3.hashCode() : 0);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f30116a);
        parcel.writeString(this.f30104b);
        parcel.writeString(this.f30106d);
    }

    public j(Parcel parcel) {
        super("COMM");
        this.f30104b = parcel.readString();
        this.f30105c = parcel.readString();
        this.f30106d = parcel.readString();
    }
}
