package com.facebook.ads.redexgen.X;

import android.app.Activity;
import android.net.Uri;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.vb, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2735vb {
    public static byte[] A07;
    public static String[] A08 = {"haAao560MlSTxWqUAHMCm5oR0KBsm1Ww", "umnkhQ8rIodYbYqxzqt7nPicaMhZg9CK", "H", "4ixm2r5uTwfheAcWfK6HDDdCe6WXZ2Gf", "KGJrFfmXYNSCZFQvReVMHPUB7kxEUc", "HNVnypr1qZEqSppMjXNTLaqStfvf5", "K5Q9FotLSlKiPyFwik6KrQfI", "cgEkHXj4ygonc5gl3QnsGpxgvAJSyTPz"};
    public static final int A09;
    public static final C2731vX A0A;
    public AbstractC0990Io A00;
    public JF A01;
    public JQ A02;
    public boolean A03;
    public final C0958Hi A04;
    public final InterfaceC2734va A05;
    public final EP A06;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 115);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A07 = new byte[]{9, 12, 43, 7, 6, 28, 13, 16, 28, 63, 26, 9, 24, 24, 13, 26, 50, 55, 45, 42, 59, 48, 59, 44, 39, 32, 62};
    }

    static {
        A04();
        A0A = new C2731vX(null);
        A09 = 94532;
    }

    public C2735vb(C0958Hi c0958Hi, InterfaceC2734va interfaceC2734va) {
        C1h.A09(c0958Hi, A03(0, 16, 27));
        C1h.A09(interfaceC2734va, A03(16, 8, 45));
        this.A04 = c0958Hi;
        this.A05 = interfaceC2734va;
        this.A06 = new EP(this);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void A09(String str, int i5, int i11) throws SecurityException {
        Activity activityA0E;
        J0 j02 = new J0(this.A02);
        j02.A09(true);
        if (i5 > 0) {
            j02.A08(i5, 1);
        }
        if (i11 > 0) {
            j02.A07(i11);
        }
        Uri uriA00 = AbstractC2351pP.A00(str);
        if (uriA00 == null || (activityA0E = this.A04.A0E()) == null) {
            return;
        }
        j02.A0A().A03(activityA0E, uriA00);
        if (A08[5].length() == 28) {
            throw new RuntimeException();
        }
        A08[5] = "lJQFf";
    }

    public final void A0B() {
        JF jf2 = this.A01;
        if (jf2 != null) {
            try {
                this.A04.unbindService(jf2);
            } catch (Exception unused) {
            }
        }
        this.A01 = null;
        this.A00 = null;
        this.A02 = null;
    }

    public final void A0C() {
        Activity activityA0E = this.A04.A0E();
        if (activityA0E == null) {
            return;
        }
        activityA0E.finishActivity(94532);
    }

    public final boolean A0D(String str, int i5, int i11) throws SecurityException {
        C1h.A09(str, A03(24, 3, 33));
        String strA03 = AbstractC0990Io.A03(this.A04.getApplicationContext(), null);
        if (strA03 == null) {
            return false;
        }
        this.A01 = new EO(this, str, i5, i11);
        C0958Hi c0958Hi = this.A04;
        JF jf2 = this.A01;
        C1h.A06(jf2);
        if (!AbstractC0990Io.A06(c0958Hi, strA03, jf2)) {
            A09(str, i5, i11);
        }
        this.A04.A0F().A5R();
        return true;
    }
}
