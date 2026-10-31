package com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class f extends o {
    public static final Parcelable.Creator<f> CREATOR = new e();

    /* renamed from: b, reason: collision with root package name */
    public final String f30093b;

    /* renamed from: c, reason: collision with root package name */
    public final int f30094c;

    /* renamed from: d, reason: collision with root package name */
    public final int f30095d;

    /* renamed from: e, reason: collision with root package name */
    public final long f30096e;

    /* renamed from: f, reason: collision with root package name */
    public final long f30097f;

    /* renamed from: g, reason: collision with root package name */
    public final o[] f30098g;

    public f(String str, int i5, int i11, long j11, long j12, o[] oVarArr) {
        super("CHAP");
        this.f30093b = str;
        this.f30094c = i5;
        this.f30095d = i11;
        this.f30096e = j11;
        this.f30097f = j12;
        this.f30098g = oVarArr;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.o, android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && f.class == obj.getClass()) {
            f fVar = (f) obj;
            if (this.f30094c == fVar.f30094c && this.f30095d == fVar.f30095d && this.f30096e == fVar.f30096e && this.f30097f == fVar.f30097f && z.a(this.f30093b, fVar.f30093b) && Arrays.equals(this.f30098g, fVar.f30098g)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int i5 = (((((((this.f30094c + 527) * 31) + this.f30095d) * 31) + ((int) this.f30096e)) * 31) + ((int) this.f30097f)) * 31;
        String str = this.f30093b;
        return i5 + (str != null ? str.hashCode() : 0);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f30093b);
        parcel.writeInt(this.f30094c);
        parcel.writeInt(this.f30095d);
        parcel.writeLong(this.f30096e);
        parcel.writeLong(this.f30097f);
        parcel.writeInt(this.f30098g.length);
        for (o oVar : this.f30098g) {
            parcel.writeParcelable(oVar, 0);
        }
    }

    public f(Parcel parcel) {
        super("CHAP");
        this.f30093b = parcel.readString();
        this.f30094c = parcel.readInt();
        this.f30095d = parcel.readInt();
        this.f30096e = parcel.readLong();
        this.f30097f = parcel.readLong();
        int i5 = parcel.readInt();
        this.f30098g = new o[i5];
        for (int i11 = 0; i11 < i5; i11++) {
            this.f30098g[i11] = (o) parcel.readParcelable(o.class.getClassLoader());
        }
    }
}
