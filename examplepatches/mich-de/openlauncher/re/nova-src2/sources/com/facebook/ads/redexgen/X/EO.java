package com.facebook.ads.redexgen.X;

import android.content.ComponentName;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class EO extends JF {
    public static byte[] A04;
    public final /* synthetic */ int A00;
    public final /* synthetic */ int A01;
    public final /* synthetic */ C2735vb A02;
    public final /* synthetic */ String A03;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 14);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A04 = new byte[]{98, 109, 104, 100, 111, 117, 58, 53, 57, 49};
    }

    public EO(C2735vb c2735vb, String str, int i5, int i11) {
        this.A02 = c2735vb;
        this.A03 = str;
        this.A00 = i5;
        this.A01 = i11;
    }

    @Override // com.facebook.ads.redexgen.X.JF
    public final void A04(ComponentName componentName, AbstractC0990Io abstractC0990Io) throws SecurityException {
        C1h.A09(componentName, A00(6, 4, 90));
        C1h.A09(abstractC0990Io, A00(0, 6, 15));
        this.A02.A00 = abstractC0990Io;
        abstractC0990Io.A08(0L);
        this.A02.A02 = abstractC0990Io.A07(this.A02.A06);
        this.A02.A09(this.A03, this.A00, this.A01);
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        C1h.A09(componentName, A00(6, 4, 90));
        this.A02.A00 = null;
        this.A02.A02 = null;
    }
}
