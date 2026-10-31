package com.google.android.exoplayer2.metadata.scte35;

import android.os.Parcel;
import android.os.Parcelable;
import di.b;
import wf.v;

/* loaded from: classes3.dex */
public final class PrivateCommand extends SpliceCommand {
    public static final Parcelable.Creator<PrivateCommand> CREATOR = new b(18);

    /* renamed from: a, reason: collision with root package name */
    public final long f31559a;

    /* renamed from: b, reason: collision with root package name */
    public final long f31560b;

    /* renamed from: c, reason: collision with root package name */
    public final byte[] f31561c;

    public PrivateCommand(long j11, byte[] bArr, long j12) {
        this.f31559a = j12;
        this.f31560b = j11;
        this.f31561c = bArr;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeLong(this.f31559a);
        parcel.writeLong(this.f31560b);
        parcel.writeByteArray(this.f31561c);
    }

    public PrivateCommand(Parcel parcel) {
        this.f31559a = parcel.readLong();
        this.f31560b = parcel.readLong();
        byte[] bArrCreateByteArray = parcel.createByteArray();
        int i5 = v.f94376a;
        this.f31561c = bArrCreateByteArray;
    }
}
