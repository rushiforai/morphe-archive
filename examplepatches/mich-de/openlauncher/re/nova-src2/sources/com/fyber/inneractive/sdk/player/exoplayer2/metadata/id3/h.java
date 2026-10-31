package com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class h extends o {
    public static final Parcelable.Creator<h> CREATOR = new g();

    /* renamed from: b, reason: collision with root package name */
    public final String f30099b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f30100c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f30101d;

    /* renamed from: e, reason: collision with root package name */
    public final String[] f30102e;

    /* renamed from: f, reason: collision with root package name */
    public final o[] f30103f;

    public h(String str, boolean z11, boolean z12, String[] strArr, o[] oVarArr) {
        super("CTOC");
        this.f30099b = str;
        this.f30100c = z11;
        this.f30101d = z12;
        this.f30102e = strArr;
        this.f30103f = oVarArr;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && h.class == obj.getClass()) {
            h hVar = (h) obj;
            if (this.f30100c == hVar.f30100c && this.f30101d == hVar.f30101d && z.a(this.f30099b, hVar.f30099b) && Arrays.equals(this.f30102e, hVar.f30102e) && Arrays.equals(this.f30103f, hVar.f30103f)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int i5 = ((((this.f30100c ? 1 : 0) + 527) * 31) + (this.f30101d ? 1 : 0)) * 31;
        String str = this.f30099b;
        return i5 + (str != null ? str.hashCode() : 0);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f30099b);
        parcel.writeByte(this.f30100c ? (byte) 1 : (byte) 0);
        parcel.writeByte(this.f30101d ? (byte) 1 : (byte) 0);
        parcel.writeStringArray(this.f30102e);
        parcel.writeInt(this.f30103f.length);
        int i11 = 0;
        while (true) {
            o[] oVarArr = this.f30103f;
            if (i11 >= oVarArr.length) {
                return;
            }
            parcel.writeParcelable(oVarArr[i11], 0);
            i11++;
        }
    }

    public h(Parcel parcel) {
        super("CTOC");
        this.f30099b = parcel.readString();
        this.f30100c = parcel.readByte() != 0;
        this.f30101d = parcel.readByte() != 0;
        this.f30102e = parcel.createStringArray();
        int i5 = parcel.readInt();
        this.f30103f = new o[i5];
        for (int i11 = 0; i11 < i5; i11++) {
            this.f30103f[i11] = (o) parcel.readParcelable(o.class.getClassLoader());
        }
    }
}
