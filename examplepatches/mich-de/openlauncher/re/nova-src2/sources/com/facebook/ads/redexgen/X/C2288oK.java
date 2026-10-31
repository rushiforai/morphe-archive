package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import android.util.Pair;
import com.facebook.ads.internal.protocol.AdErrorType;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicReference;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.oK, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2288oK {
    public static byte[] A08;
    public static final ThreadFactoryC2429qf A09;
    public static final Executor A0A;
    public static final AtomicReference<InterfaceC2292oO> A0B;
    public long A00;
    public long A01;
    public InterfaceC2287oJ A02;
    public Map<String, String> A03;
    public final C1819ga A04;
    public final C0958Hi A05;
    public final C2289oL A06;
    public final String A07;

    public static String A06(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A08, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 80);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0B() {
        A08 = new byte[]{56, 63, 50, 56, 105, 63, 62, 57, 122, 105, 107, 119, 117, 78, 65, 68, 72, 67, 89, 82, 95, 72, 92, 88, 72, 94, 89, 82, 68, 73, 98, 88, 11, 121, 101, 17, 11, 100, 101, 10, 108, 99, 102, 102, 10, 88, 79, 73, 79, 67, 92, 79, 78, 20, 53, 122, 28, 51, 54, 54, 122, 63, 40, 40, 53, 40, 122, 57, 53, 62, 63, 122, 1, AbstractJsonLexerKt.TC_INVALID, 41, 7, 122, AbstractJsonLexerKt.TC_INVALID, 41, 15, 13, 6, 13, 26, 1, 11, 81, 90, 75, 72, 80, 77, 84, 40, 41, 0, 47, 42, 42, 14, 41, 41, 45, 41, 43, 54, 47, 48, 61, 60};
    }

    static {
        A0B();
        A09 = new ThreadFactoryC2429qf();
        A0A = Executors.newCachedThreadPool(A09);
        A0B = new AtomicReference<>();
    }

    public C2288oK(C0958Hi c0958Hi) {
        this(c0958Hi, AbstractC1820gb.A00(c0958Hi.A02()));
    }

    public C2288oK(C0958Hi c0958Hi, C1819ga c1819ga) {
        this.A01 = -1L;
        this.A00 = -1L;
        this.A05 = c0958Hi;
        this.A06 = C2289oL.A00();
        this.A07 = AbstractC2293oP.A01(c0958Hi);
        this.A04 = c1819ga;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public GJ A03(long j11, C2285oH c2285oH) {
        return new GJ(this, c2285oH, j11);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0A() {
        if (this.A05 == null || !C1454af.A0A(this.A05)) {
            return;
        }
        C2127lg c2127lg = new C2127lg(A06(8, 5, 107));
        c2127lg.A05(1);
        this.A05.A08().ABz(A06(86, 7, 111), AbstractC2126lf.A1x, c2127lg);
    }

    private void A0C(int i5, String str) {
        String strA06 = A06(37, 16, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE);
        String strA062 = A06(0, 8, 90);
        String strA063 = A06(93, 10, 22);
        AbstractC2273o5.A05(strA063, strA06, strA062);
        AbstractC2273o5.A04(strA063, String.format(Locale.US, A06(53, 26, 10), Integer.valueOf(i5), str));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0D(C2262nt c2262nt) {
        if (this.A02 != null) {
            this.A02.AEr(c2262nt);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0E(C2262nt c2262nt) {
        ExecutorC2419qV.A00(new GH(this, c2262nt));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0L(GG gg2) {
        if (this.A02 != null) {
            this.A02.AHE(gg2);
        } else {
            if (gg2.A00() == null || gg2.A00().A06() == null) {
                return;
            }
            C2328oz.A00(this.A05).A0D(gg2.A00().A06().toString(), gg2.A00().A0B());
        }
    }

    private void A0M(GG gg2) {
        InterfaceC2101lG syncModule;
        ExecutorC2419qV.A00(new GI(this, gg2));
        if (C2203mv.A2g(this.A05) && (syncModule = this.A05.A06()) != null) {
            syncModule.A7D();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0N(String str, long j11, C2285oH c2285oH) {
        String clientChallenge;
        try {
        } catch (Exception e3) {
            e = e3;
        }
        try {
            C2291oN c2291oNA07 = this.A06.A07(this.A05, str, j11);
            C2145ly c2145lyA00 = c2291oNA07.A00();
            if (c2145lyA00 != null) {
                C2203mv.A0T(this.A05).A39(c2145lyA00.A0A());
                if (C2203mv.A0w(this.A05) && c2145lyA00.A08() != null) {
                    AbstractC2155m9.A04(this.A05.A02(), c2145lyA00.A08());
                }
                if (C2203mv.A0x(this.A05) && c2145lyA00.A0C() != null) {
                    AbstractC2155m9.A05(this.A05.A02(), c2145lyA00.A0C());
                }
                this.A05.A08().ADG();
                this.A04.A0N(c2145lyA00.A07());
                AbstractC2284oG.A05(c2145lyA00.A05().A0B(), c2285oH);
                C2443qt.A01(this.A05, A0A, c2145lyA00);
                C2127lg c2127lg = new C2127lg(A06(30, 7, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE) + C2386py.A02());
                c2127lg.A06(1);
                c2127lg.A0A(false);
                this.A05.A08().AD0(A06(79, 7, 56), AbstractC2126lf.A1W, c2127lg);
            }
            switch (C2286oI.A00[c2291oNA07.A01().ordinal()]) {
                case 1:
                    GG gg2 = (GG) c2291oNA07;
                    if (c2145lyA00 != null) {
                        if (c2145lyA00.A05().A0E()) {
                            AbstractC2284oG.A07(str, c2285oH);
                        }
                        if (this.A03 != null) {
                            clientChallenge = this.A03.get(A06(13, 17, 93));
                        } else {
                            clientChallenge = null;
                        }
                        if (!TextUtils.isEmpty(c2291oNA07.A02()) && !TextUtils.isEmpty(clientChallenge)) {
                            this.A05.A03().AK0(this.A05, clientChallenge, c2291oNA07.A02());
                        }
                    }
                    this.A05.A0F().A3u(C2416qS.A01(this.A01), C2416qS.A02(this.A01, this.A00));
                    A0M(gg2);
                    break;
                case 2:
                    GF gf2 = (GF) c2291oNA07;
                    String strA04 = gf2.A04();
                    AdErrorType adErrorTypeAdErrorTypeFromCode = AdErrorType.adErrorTypeFromCode(gf2.A03(), AdErrorType.ERROR_MESSAGE);
                    A0C(gf2.A03(), strA04);
                    if (strA04 == null) {
                        strA04 = str;
                    }
                    this.A05.A0F().A3t(C2416qS.A01(this.A01), adErrorTypeAdErrorTypeFromCode.getErrorCode(), strA04, adErrorTypeAdErrorTypeFromCode.isPublicError());
                    A0E(C2262nt.A01(adErrorTypeAdErrorTypeFromCode, strA04));
                    break;
                default:
                    AdErrorType adErrorType = AdErrorType.UNKNOWN_RESPONSE;
                    this.A05.A0F().A3t(C2416qS.A01(this.A01), adErrorType.getErrorCode(), str, adErrorType.isPublicError());
                    A0E(C2262nt.A01(adErrorType, str));
                    break;
            }
        } catch (Exception e11) {
            e = e11;
            String message = e.getMessage();
            AdErrorType adErrorType2 = AdErrorType.PARSER_FAILURE;
            this.A05.A0F().A3t(C2416qS.A01(this.A01), adErrorType2.getErrorCode(), message, adErrorType2.isPublicError());
            A0E(C2262nt.A01(adErrorType2, message));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0O(String str, long j11, C2285oH c2285oH) {
        A0A.execute(new GK(this, str, j11, c2285oH));
    }

    private boolean A0P(C2285oH c2285oH) {
        String string = c2285oH.A06().toString();
        if (C2328oz.A00(this.A05).A0F(string)) {
            return false;
        }
        int iA0A = C2328oz.A00(this.A05).A0A(string);
        int storedAdsCount = C2203mv.A0H(this.A05);
        int iA09 = C2328oz.A00(this.A05).A09(string);
        if (iA0A >= storedAdsCount || iA0A > iA09) {
            C2328oz c2328ozA00 = C2328oz.A00(this.A05);
            String type = c2285oH.A06().toString();
            Pair<String, String> pairA0B = c2328ozA00.A0B(type);
            if (pairA0B != null && pairA0B.second != null && pairA0B.first != null) {
                A0O(pairA0B.second.toString(), 0L, c2285oH);
                return true;
            }
        }
        return false;
    }

    public final void A0Q(C2285oH c2285oH) {
        this.A01 = System.currentTimeMillis();
        C2136lp.A0B(this.A05);
        A0B.get();
        if (0 != 0) {
            throw new NullPointerException(A06(103, 7, 9));
        }
        if (C2203mv.A00(this.A05) > 0 && A0P(c2285oH)) {
            return;
        }
        if (AbstractC2284oG.A08(c2285oH)) {
            ExecutorC2431qh.A06.execute(new GM(this));
            String strA02 = AbstractC2284oG.A02(c2285oH);
            if (strA02 != null) {
                this.A05.A0F().AM0();
                A0O(strA02, 0L, c2285oH);
                return;
            } else {
                AdErrorType error = AdErrorType.LOAD_TOO_FREQUENTLY;
                this.A05.A0F().A3t(C2416qS.A01(this.A01), error.getErrorCode(), error.getDefaultErrorMessage(), error.isPublicError());
                A0E(C2262nt.A01(error, null));
                return;
            }
        }
        A0A.execute(new GL(this, c2285oH));
    }

    public final void A0R(InterfaceC2287oJ interfaceC2287oJ) {
        this.A02 = interfaceC2287oJ;
    }
}
