package com.fyber.inneractive.sdk.player.exoplayer2.drm;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.util.Arrays;
import java.util.UUID;

/* loaded from: classes3.dex */
public final class c implements Parcelable {
    public static final Parcelable.Creator<c> CREATOR = new b();

    /* renamed from: a, reason: collision with root package name */
    public int f29116a;

    /* renamed from: b, reason: collision with root package name */
    public final UUID f29117b;

    /* renamed from: c, reason: collision with root package name */
    public final String f29118c;

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f29119d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f29120e;

    public c(UUID uuid, String str, byte[] bArr) {
        uuid.getClass();
        this.f29117b = uuid;
        this.f29118c = str;
        bArr.getClass();
        this.f29119d = bArr;
        this.f29120e = false;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof c)) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        c cVar = (c) obj;
        return this.f29118c.equals(cVar.f29118c) && z.a(this.f29117b, cVar.f29117b) && Arrays.equals(this.f29119d, cVar.f29119d);
    }

    public final int hashCode() {
        if (this.f29116a == 0) {
            this.f29116a = Arrays.hashCode(this.f29119d) + c0.e(this.f29117b.hashCode() * 31, 31, this.f29118c);
        }
        return this.f29116a;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeLong(this.f29117b.getMostSignificantBits());
        parcel.writeLong(this.f29117b.getLeastSignificantBits());
        parcel.writeString(this.f29118c);
        parcel.writeByteArray(this.f29119d);
        parcel.writeByte(this.f29120e ? (byte) 1 : (byte) 0);
    }

    public c(Parcel parcel) {
        this.f29117b = new UUID(parcel.readLong(), parcel.readLong());
        this.f29118c = parcel.readString();
        this.f29119d = parcel.createByteArray();
        this.f29120e = parcel.readByte() != 0;
    }
}
