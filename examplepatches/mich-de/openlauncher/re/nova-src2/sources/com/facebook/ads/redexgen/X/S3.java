package com.facebook.ads.redexgen.X;

import android.database.Cursor;

/* loaded from: assets/audience_network/classes.dex */
public final class S3 implements InterfaceC1244Ta {
    public final Cursor A00;

    public final /* synthetic */ boolean A01() {
        return TZ.A00(this);
    }

    public S3(Cursor cursor) {
        this.A00 = cursor;
    }

    public final TW A00() {
        return C8u.A01(this.A00);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.A00.close();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1244Ta
    public final int getPosition() {
        return this.A00.getPosition();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1244Ta
    public final boolean moveToPosition(int i5) {
        return this.A00.moveToPosition(i5);
    }
}
