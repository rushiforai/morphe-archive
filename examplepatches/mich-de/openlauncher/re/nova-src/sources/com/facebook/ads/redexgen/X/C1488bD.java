package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;

@MetaExoPlayerCustomization
/* renamed from: com.facebook.ads.redexgen.X.bD, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1488bD {
    public final int A00;
    public final int A01;
    public final long A02;
    public final C1485bA A03;
    public final int[] A04;
    public final int[] A05;
    public final long[] A06;
    public final long[] A07;

    public C1488bD(C1485bA c1485bA, long[] jArr, int[] iArr, int i5, long[] jArr2, int[] iArr2, long j11) {
        AbstractC1062Ln.A07(iArr.length == jArr2.length);
        AbstractC1062Ln.A07(jArr.length == jArr2.length);
        AbstractC1062Ln.A07(iArr2.length == jArr2.length);
        this.A03 = c1485bA;
        this.A06 = jArr;
        this.A05 = iArr;
        this.A00 = i5;
        this.A07 = jArr2;
        this.A04 = iArr2;
        this.A02 = j11;
        this.A01 = jArr.length;
        if (iArr2.length > 0) {
            int length = iArr2.length - 1;
            iArr2[length] = iArr2[length] | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING;
        }
    }

    public final int A00(long j11) {
        for (int i5 = N1.A0L(this.A07, j11, true, false); i5 >= 0; i5--) {
            int startIndex = this.A04[i5];
            if ((startIndex & 1) != 0) {
                return i5;
            }
        }
        return -1;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x000b */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int A01(long j11) {
        for (int i5 = N1.A0K(this.A07, j11, true, false); i5 < startIndex; i5++) {
            int startIndex = this.A04[i5];
            if ((startIndex & 1) != 0) {
                return i5;
            }
        }
        return -1;
    }
}
