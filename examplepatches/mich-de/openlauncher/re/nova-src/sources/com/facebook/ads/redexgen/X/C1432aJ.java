package com.facebook.ads.redexgen.X;

import android.os.Parcel;

/* renamed from: com.facebook.ads.redexgen.X.aJ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1432aJ {
    public final int A00;
    public final long A01;
    public final long A02;

    public C1432aJ(int i5, long j11, long j12) {
        this.A00 = i5;
        this.A02 = j11;
        this.A01 = j12;
    }

    public /* synthetic */ C1432aJ(int i5, long j11, long j12, C1431aI c1431aI) {
        this(i5, j11, j12);
    }

    public static C1432aJ A00(Parcel parcel) {
        return new C1432aJ(parcel.readInt(), parcel.readLong(), parcel.readLong());
    }

    public final void A01(Parcel parcel) {
        parcel.writeInt(this.A00);
        parcel.writeLong(this.A02);
        parcel.writeLong(this.A01);
    }
}
