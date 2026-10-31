package com.facebook.ads.redexgen.X;

import android.os.Parcel;

/* renamed from: com.facebook.ads.redexgen.X.aM, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1435aM {
    public final int A00;
    public final long A01;

    public C1435aM(int i5, long j11) {
        this.A00 = i5;
        this.A01 = j11;
    }

    public /* synthetic */ C1435aM(int i5, long j11, C1434aL c1434aL) {
        this(i5, j11);
    }

    public static C1435aM A00(Parcel parcel) {
        return new C1435aM(parcel.readInt(), parcel.readLong());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A02(Parcel parcel) {
        parcel.writeInt(this.A00);
        parcel.writeLong(this.A01);
    }
}
