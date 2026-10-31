package com.facebook.ads.redexgen.X;

import android.content.Context;
import com.facebook.ads.internal.dynamicloading.DynamicLoaderImpl;
import com.facebook.ads.internal.util.process.ProcessUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class HG implements InterfaceC2097lC {
    public static HG A07;
    public static byte[] A08;
    public static String[] A09 = {"kZNWMB05A80rolZkZr5gINRkemJedumA", "PGnlsDLswmZGHAGkHnqyou4j", "CQczeQcoxNMNqPeDO5UPH4delPie3CF6", "Ozs7AQnIuhnl4TF488yhCLnc3lqg3Tqv", "QUMQF15y8F49TOv2Mbtf3pi6YRJU7tsl", "iRM3Hx3PCEqf", "8yEJzjy1AvS4vnL", "zEXAgd0MZ6iopjt"};
    public InterfaceC1644dj A00;
    public InterfaceC2090l3 A01;
    public InterfaceC2096lB A02;
    public InterfaceC2112lR A03;
    public C2156mA A04;
    public InterfaceC2236nS A05;
    public AH A06;

    public static String A06(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A08, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A09;
            if (strArr[6].length() != strArr[7].length()) {
                break;
            }
            String[] strArr2 = A09;
            strArr2[6] = "Hv2WK1fJh7GnXaP";
            strArr2[7] = "jwUFRNkRPBL5IaL";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            int i14 = bArrCopyOfRange[i13] - i12;
            String[] strArr3 = A09;
            if (strArr3[4].charAt(26) != strArr3[0].charAt(26)) {
                break;
            }
            String[] strArr4 = A09;
            strArr4[2] = "3jbuj6iR6sIerVLqEJ9xAsC0KuP7QrbG";
            strArr4[3] = "qsuffxm3RCjhy50iWQEl04Txy4tWGAPw";
            bArrCopyOfRange[i13] = (byte) (i14 - 98);
            i13++;
        }
        throw new RuntimeException();
    }

    public static void A07() {
        A08 = new byte[]{-57, -55, -10, -58, -57, -13, -64, -13, -16, 2, 16, 16, 6, 12, 11, -67, 1, -2, 17, -2, -67, 6, 11, 6, 17, 6, -2, 9, 6, 23, 2, 1, 33, 20, 31, 30, 33, 35, 2, 20, 34, 34, 24, 30, 29, -13, 16, 35, 16, -8, 29, 24, 35, 24, 16, 27, 24, 41, 20, 19};
        if (A09[1].length() == 32) {
            throw new RuntimeException();
        }
        String[] strArr = A09;
        strArr[2] = "XQj6tBQR93KUWcmqG7acynHpkyXbPHo4";
        strArr[3] = "0fPU7ngiro1m2vFzwgFa3cBnolZ3o5pA";
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public final synchronized void A0C(C0957Hh c0957Hh) {
        if (this.A06 != null) {
            return;
        }
        this.A03 = A01(c0957Hh);
        this.A06 = A05(c0957Hh, this.A03, A03(c0957Hh));
        A09(c0957Hh, A00(c0957Hh, this.A06));
        A0A(c0957Hh, this.A06);
        A0B(c0957Hh, this.A06);
        if (this.A06 != null) {
            this.A06.A7D();
        }
    }

    static {
        A07();
    }

    public static InterfaceC2055kT A00(C0957Hh c0957Hh, AH ah2) {
        if (!C2203mv.A1r(c0957Hh) || ah2 == null) {
            return null;
        }
        return AbstractC2056kU.A00().A00(ah2);
    }

    public static InterfaceC2112lR A01(C0957Hh c0957Hh) {
        return AbstractC2113lS.A00().A00(c0957Hh, new HN());
    }

    public static synchronized HG A02() {
        if (A07 == null) {
            A07 = new HG();
        }
        return A07;
    }

    public static InterfaceC1529bs A03(C0957Hh c0957Hh) {
        if (!C2203mv.A1n(c0957Hh)) {
            return null;
        }
        return C1454af.A01(c0957Hh);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.InterfaceC2097lC
    /* renamed from: A04, reason: merged with bridge method [inline-methods] */
    public final synchronized AH A9s() {
        return this.A06;
    }

    public static AH A05(C0957Hh c0957Hh, InterfaceC2112lR interfaceC2112lR, InterfaceC1529bs interfaceC1529bs) {
        if (!C2203mv.A2p(c0957Hh) || interfaceC1529bs == null || ProcessUtils.isRemoteRenderingProcess()) {
            return null;
        }
        return AbstractC1382Yu.A00().A00(c0957Hh, interfaceC2112lR, interfaceC1529bs, AbstractC2293oP.A04(c0957Hh), new HH(new C2285oH(c0957Hh, A06(0, 0, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE), null, EnumC2265nx.A07, 0, new C2269o1(), AbstractC2408qK.A01(C2203mv.A0L(c0957Hh)), null, null, new K5()), c0957Hh), ZO.A00().A00());
    }

    public static void A08() {
        String strA06 = A06(8, 24, 59);
        if (A09[5].length() == 20) {
            throw new RuntimeException();
        }
        A09[5] = "4ii3kc4oT9MJsiDOLfNQb5ib2";
        AbstractC2273o5.A05(A06(32, 28, 77), strA06, A06(0, 8, 46));
    }

    public static void A09(C0957Hh c0957Hh, InterfaceC2055kT interfaceC2055kT) {
        if (!C2203mv.A1r(c0957Hh) || interfaceC2055kT == null) {
            return;
        }
        AbstractC2053kR.A00().A00(interfaceC2055kT, c0957Hh);
    }

    public static void A0A(C0957Hh c0957Hh, AH ah2) {
        if (!C2203mv.A0k(c0957Hh) || ah2 == null) {
            return;
        }
        new C2075ko(c0957Hh, ah2, new C2076kp(), DynamicLoaderImpl.getBidderTokenProviderApi().A00());
    }

    public static void A0B(C0957Hh c0957Hh, AH ah2) {
        if (ah2 == null) {
            return;
        }
        AbstractC2207mz.A00(c0957Hh, ah2);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2097lC
    public final InterfaceC2224nG A7N(C0957Hh c0957Hh) {
        return C0943Gt.A01(c0957Hh);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2097lC
    public final synchronized InterfaceC2096lB A7e(C2095lA c2095lA) {
        if (this.A02 == null) {
            this.A02 = new HI(this);
        }
        return this.A02;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2097lC
    public final synchronized InterfaceC2090l3 A7r() {
        if (this.A01 == null) {
            this.A01 = new C0959Hj();
        }
        return this.A01;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2097lC
    public final synchronized InterfaceC2112lR A8M(C2095lA c2095lA) {
        if (this.A03 == null) {
            this.A03 = A01(c2095lA.A02());
        }
        return this.A03;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2097lC
    public final synchronized InterfaceC2125le A8O(C2095lA c2095lA) {
        return new HW(c2095lA);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2097lC
    public final synchronized InterfaceC2098lD A8Y(final C2095lA c2095lA) {
        return new HM(c2095lA) { // from class: com.facebook.ads.redexgen.X.7B
            @Override // com.facebook.ads.redexgen.X.InterfaceC2098lD
            public final boolean AAQ() {
                return TextureViewSurfaceTextureListenerC0771Ac.A09();
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC2098lD
            public final void ADG() {
                C2150m4.A06(C2013jn.A09(super.A00));
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC2098lD
            public final void ADj() {
                C2150m4.A07(C2013jn.A09(super.A00));
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC2098lD
            public final void AEE(C0957Hh c0957Hh) {
                AbstractC1802gJ.A01(c0957Hh);
            }
        };
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2097lC
    public final synchronized InterfaceC1644dj A8n(C2095lA c2095lA) {
        if (!C2203mv.A12(c2095lA)) {
            return null;
        }
        if (this.A00 == null) {
            this.A00 = AbstractC1645dk.A00().A00(new HL(c2095lA));
        }
        return this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2097lC
    public final synchronized InterfaceC2100lF A9b(C2095lA c2095lA) {
        return new HJ(c2095lA);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2097lC
    public final C0957Hh A9c(Context context) {
        C0957Hh sdkContext = AbstractC2094l9.A00();
        if (sdkContext == null) {
            C0957Hh sdkContext2 = new C0957Hh(context, this);
            AbstractC2094l9.A01(sdkContext2);
            return sdkContext2;
        }
        return sdkContext;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2097lC
    public final synchronized InterfaceC2236nS A9d(C0957Hh c0957Hh) {
        if (this.A05 == null) {
            this.A05 = new H1(c0957Hh);
        }
        return this.A05;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2097lC
    public final synchronized C2156mA A9j() {
        if (this.A04 == null) {
            this.A04 = new C2156mA();
            A08();
        }
        return this.A04;
    }
}
