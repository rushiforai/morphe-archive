package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.kq, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2077kq {
    public static byte[] A03;
    public static String[] A04 = {"fwnF9NqGlDDvd3tmLjHzlBLQ0vKEWHbi", "JyVh64c57ZQhNNoyVwIaBwBMCWCp47TX", "NiVjB9zhlvCIBmozr5iuMf4XPmRpTykj", "aMEAUKQnrJbxe7", "r8tEg4U8ig5A4Tipsx9WF382DZkzVk0N", b.f42142b, "NXFd2c7X4J9ga52f6GNSRbndM6EeYerJ", "Iv2mUp4tdjLGTNz"};
    public static final AtomicBoolean A05;
    public C0957Hh A00;
    public String A01;
    public final C2400qC A02 = new C2400qC(300000000000L, new C0965Hp(this));

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 91);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A03 = new byte[]{114, 125, 114, AbstractJsonLexerKt.TC_INVALID, 124, 116, 42, 33, 48, 51, 43, 54, 47, 59, 48, 61, 52, 33, 75, 93, 75, 75, 81, 87, 86, 71, 76, 81, 85, 93};
    }

    static {
        A04();
        A05 = new AtomicBoolean(false);
    }

    public static InterfaceC2162mG A00(C0957Hh c0957Hh) {
        if (C2203mv.A1A(c0957Hh)) {
            return C2163mH.A01(A01(0, 6, 104), A01(18, 12, 67), A01(6, 12, 63));
        }
        HF hfA00 = C2163mH.A00();
        String[] strArr = A04;
        if (strArr[2].charAt(0) != strArr[6].charAt(0)) {
            throw new RuntimeException();
        }
        A04[0] = "UkANKLN4N59lG96lj5R5seL3Uvk1PYyc";
        return hfA00;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A02() {
        C0957Hh c0957Hh;
        synchronized (this) {
            c0957Hh = this.A00;
        }
        if (c0957Hh == null) {
            return;
        }
        String strA05 = C2165mJ.A00().A01(c0957Hh, true).A05(A00(c0957Hh));
        synchronized (this) {
            this.A01 = strA05;
        }
    }

    public static void A03() {
        A05.set(true);
    }

    public final synchronized String A06(C0957Hh c0957Hh) {
        this.A00 = c0957Hh;
        this.A00.A08().ADG();
        this.A00.A04().AEE(c0957Hh);
        if (this.A00.A07().ALE() || ((A05.get() && C2203mv.A21(this.A00)) || this.A01 == null)) {
            A02();
            this.A02.A04().A03();
            A05.set(false);
        }
        this.A02.A06();
        return this.A01;
    }

    public final void A07() {
        this.A02.A05();
    }
}
