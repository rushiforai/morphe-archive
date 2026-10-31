package com.facebook.ads.redexgen.X;

import android.net.Uri;
import android.os.Bundle;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class UK implements InterfaceC1018Jt {
    public static byte[] A0H;
    public static String[] A0I = {"CRN0hGm9pLPRKzlpzE443dmYLVfMUuoy", "rnDEoG", "ItK9AhqRSbWdzc6lXKTPtxjTH0z1DcUl", "JI2gcrD7INQNJp2I4TzyxvCSr3A9oR", "CNqMxmhzBOjtEQdMOhwR", "HJQ3OXuP0FxDG82bkyHAEZvRk", "KBZAcECbAAaQLfP89GkTUbK7uJBbcbRh", "4or5KbzE8wJ6ToGpR"};
    public static final InterfaceC1017Js<UK> A0J;
    public static final Object A0K;
    public static final C1273Ug A0L;
    public static final Object A0M;
    public static final String A0N;
    public static final String A0O;
    public static final String A0P;
    public static final String A0Q;
    public static final String A0R;
    public static final String A0S;
    public static final String A0T;
    public static final String A0U;
    public static final String A0V;
    public static final String A0W;
    public static final String A0X;
    public static final String A0Y;
    public static final String A0Z;
    public int A00;
    public int A01;
    public long A02;
    public long A03;
    public long A04;
    public long A05;
    public long A06;
    public long A07;
    public C1277Uk A08;
    public Object A0A;

    @Deprecated
    public Object A0B;
    public boolean A0D;

    @Deprecated
    public boolean A0E;
    public boolean A0F;
    public boolean A0G;
    public Object A0C = A0K;
    public C1273Ug A09 = A0L;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 30 out of bounds for length 30
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static UK A00(Bundle bundle) {
        Bundle bundle2 = bundle.getBundle(A0W);
        C1273Ug c1273Ug = bundle2 != null ? (C1273Ug) C1273Ug.A07.A7F(bundle2) : C1273Ug.A08;
        long j11 = bundle.getLong(A0Y, -9223372036854775807L);
        long j12 = bundle.getLong(A0Z, -9223372036854775807L);
        long j13 = bundle.getLong(A0P, -9223372036854775807L);
        boolean z11 = bundle.getBoolean(A0T, false);
        boolean z12 = bundle.getBoolean(A0R, false);
        Bundle bundle3 = bundle.getBundle(A0V);
        C1277Uk c1277Uk = bundle3 != null ? (C1277Uk) C1277Uk.A06.A7F(bundle3) : null;
        boolean z13 = bundle.getBoolean(A0S, false);
        long j14 = bundle.getLong(A0N, 0L);
        long j15 = bundle.getLong(A0O, -9223372036854775807L);
        int i5 = bundle.getInt(A0Q, 0);
        int i11 = bundle.getInt(A0U, 0);
        long j16 = bundle.getLong(A0X, 0L);
        UK uk2 = new UK();
        uk2.A07(A0M, c1273Ug, null, j11, j12, j13, z11, z12, c1277Uk, j14, j15, i5, i11, j16);
        uk2.A0F = z13;
        return uk2;
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0H, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 88);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A0H = new byte[]{48, 60, 58, -5, 51, 46, 48, 50, 47, 60, 60, 56, -5, 46, 49, 64, -5, 46, 59, 49, 63, 60, 54, 49, 69, -5, 58, 50, 49, 54, 46, 0, -5, 48, 60, 58, 58, 60, 59, -5, 33, 54, 58, 50, 57, 54, 59, 50};
    }

    static {
        A03();
        A0K = new Object();
        A0M = new Object();
        A0L = new C1034Kj().A03(A02(0, 48, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE)).A00(Uri.EMPTY).A05();
        A0W = N1.A0h(1);
        A0Y = N1.A0h(2);
        A0Z = N1.A0h(3);
        A0P = N1.A0h(4);
        A0T = N1.A0h(5);
        A0R = N1.A0h(6);
        A0V = N1.A0h(7);
        A0S = N1.A0h(8);
        A0N = N1.A0h(9);
        A0O = N1.A0h(10);
        A0Q = N1.A0h(11);
        A0U = N1.A0h(12);
        A0X = N1.A0h(13);
        A0J = new InterfaceC1017Js() { // from class: com.facebook.ads.redexgen.X.UL
            @Override // com.facebook.ads.redexgen.X.InterfaceC1017Js
            public final InterfaceC1018Jt A7F(Bundle bundle) {
                return UK.A00(bundle);
            }
        };
    }

    public final long A04() {
        return N1.A0P(this.A02);
    }

    public final long A05() {
        return this.A02;
    }

    public final long A06() {
        return N1.A0P(this.A03);
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0022  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final UK A07(Object obj, C1273Ug c1273Ug, Object obj2, long j11, long j12, long j13, boolean z11, boolean z12, C1277Uk c1277Uk, long j14, long j15, int i5, int i11, long j16) {
        Object obj3;
        this.A0C = obj;
        this.A09 = c1273Ug != null ? c1273Ug : A0L;
        if (c1273Ug != null) {
            C1042Kr c1042Kr = c1273Ug.A03;
            if (A0I[3].length() != 30) {
                throw new RuntimeException();
            }
            A0I[6] = "h3G8ym5P8t5kbfswind79baZa3Ju2VDk";
            if (c1042Kr == null) {
                obj3 = null;
            } else {
                obj3 = c1273Ug.A03.A03;
            }
        }
        this.A0B = obj3;
        this.A0A = obj2;
        this.A06 = j11;
        this.A07 = j12;
        this.A04 = j13;
        this.A0G = z11;
        this.A0D = z12;
        this.A0E = c1277Uk != null;
        this.A08 = c1277Uk;
        this.A02 = j14;
        this.A03 = j15;
        this.A00 = i5;
        this.A01 = i11;
        this.A05 = j16;
        this.A0F = false;
        if (A0I[3].length() != 30) {
            return this;
        }
        String[] strArr = A0I;
        strArr[7] = "10uQ3EvA1StLF51Ey";
        strArr[4] = "1GYw7E8tdmALiJ1Exlj3";
        return this;
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00d3  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !getClass().equals(obj.getClass())) {
            return false;
        }
        UK uk2 = (UK) obj;
        if (N1.A1E(this.A0C, uk2.A0C) && N1.A1E(this.A09, uk2.A09) && N1.A1E(this.A0A, uk2.A0A)) {
            boolean zA1E = N1.A1E(this.A08, uk2.A08);
            if (A0I[6].charAt(13) == 'f') {
                A0I[5] = "VZCjmgY1";
                if (zA1E && this.A06 == uk2.A06) {
                    long j11 = this.A07;
                    long j12 = uk2.A07;
                    if (A0I[3].length() == 30) {
                        String[] strArr = A0I;
                        strArr[7] = "Ns7gCmiAWnf8TCTMb";
                        strArr[4] = "qNDpCiYA7n4834q8C0O8";
                        if (j11 == j12 && this.A04 == uk2.A04) {
                            boolean z11 = this.A0G;
                            boolean z12 = uk2.A0G;
                            if (A0I[5].length() != 7) {
                                A0I[0] = "jKXpBwmT3BpaphLVXOvr3km9c4JXYR51";
                                if (z11 == z12) {
                                    if (this.A0D == uk2.A0D && this.A0F == uk2.A0F) {
                                        long j13 = this.A02;
                                        if (A0I[2].charAt(21) != 'o') {
                                            A0I[0] = "rLVvreRZahpYjM6MuIkPSbmg4vaZeUJ4";
                                            if (j13 == uk2.A02) {
                                                if (this.A03 == uk2.A03 && this.A00 == uk2.A00 && this.A01 == uk2.A01 && this.A05 == uk2.A05) {
                                                    return true;
                                                }
                                            }
                                        } else if (j13 == uk2.A02) {
                                        }
                                    }
                                }
                            } else if (z11 == z12) {
                            }
                        }
                    }
                }
            }
            throw new RuntimeException();
        }
        return false;
    }

    public final int hashCode() {
        return (((((((((((((((((((((((((((((7 * 31) + this.A0C.hashCode()) * 31) + this.A09.hashCode()) * 31) + (this.A0A == null ? 0 : this.A0A.hashCode())) * 31) + (this.A08 != null ? this.A08.hashCode() : 0)) * 31) + ((int) (this.A06 ^ (this.A06 >>> 32)))) * 31) + ((int) (this.A07 ^ (this.A07 >>> 32)))) * 31) + ((int) (this.A04 ^ (this.A04 >>> 32)))) * 31) + (this.A0G ? 1 : 0)) * 31) + (this.A0D ? 1 : 0)) * 31) + (this.A0F ? 1 : 0)) * 31) + ((int) (this.A02 ^ (this.A02 >>> 32)))) * 31) + ((int) (this.A03 ^ (this.A03 >>> 32)))) * 31) + this.A00) * 31) + this.A01) * 31) + ((int) (this.A05 ^ (this.A05 >>> 32)));
    }
}
