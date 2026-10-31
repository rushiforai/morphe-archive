package com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class b extends o {
    public static final Parcelable.Creator<b> CREATOR = new a();

    /* renamed from: b, reason: collision with root package name */
    public final String f30088b;

    /* renamed from: c, reason: collision with root package name */
    public final String f30089c;

    /* renamed from: d, reason: collision with root package name */
    public final int f30090d;

    /* renamed from: e, reason: collision with root package name */
    public final byte[] f30091e;

    public b(String str, String str2, int i5, byte[] bArr) {
        super("APIC");
        this.f30088b = str;
        this.f30089c = str2;
        this.f30090d = i5;
        this.f30091e = bArr;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && b.class == obj.getClass()) {
            b bVar = (b) obj;
            if (this.f30090d == bVar.f30090d && z.a(this.f30088b, bVar.f30088b) && z.a(this.f30089c, bVar.f30089c) && Arrays.equals(this.f30091e, bVar.f30091e)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int i5 = (this.f30090d + 527) * 31;
        String str = this.f30088b;
        int iHashCode = (i5 + (str != null ? str.hashCode() : 0)) * 31;
        String str2 = this.f30089c;
        return Arrays.hashCode(this.f30091e) + ((iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f30088b);
        parcel.writeString(this.f30089c);
        parcel.writeInt(this.f30090d);
        parcel.writeByteArray(this.f30091e);
    }

    public b(Parcel parcel) {
        super("APIC");
        this.f30088b = parcel.readString();
        this.f30089c = parcel.readString();
        this.f30090d = parcel.readInt();
        this.f30091e = parcel.createByteArray();
    }
}
