package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.SparseArray;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.TextureView;
import com.bytedance.sdk.openadsdk.api.reward.BackupConstant;
import com.facebook.ads.androidx.media3.common.Timeline;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArraySet;
import org.checkerframework.checker.nullness.qual.RequiresNonNull;

/* renamed from: com.facebook.ads.redexgen.X.93, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class AnonymousClass93 extends VK implements InterfaceC1228Sk {
    public static byte[] A0N;
    public static String[] A0O = {"uMVMaQPfnslh4nnIXSeSACeU724L8uWm", "mLPKU5hu8JCj3mzugb6OIsu3W3FTLtXk", "2sE51WRPe0hhbu3tFkLAYKycp3vSWy9U", "IWmWJaflJ0eX35LZGEyePJ3TgxSjchUM", "n47nQMjeCZ", "jR5GUqCdTaTbsWeiDqt", "JbFN8FtVIDdO3BsbGSr1Yf3LiBkC6O75", "DVJz4Bqu2qCnCaC6HJWXyHx7FQQcy"};
    public float A00;
    public int A01;
    public int A02;
    public Surface A03;
    public SurfaceHolder A04;
    public TextureView A05;
    public VL A06;
    public VC A07;
    public VC A08;
    public O7 A09;
    public O7 A0A;
    public InterfaceC1276Uj A0B;
    public boolean A0C;
    public final Handler A0D;
    public final AnonymousClass95 A0E;
    public final SurfaceHolderCallbackC1222Se A0F;
    public final InterfaceC1219Sb A0G;
    public final CopyOnWriteArraySet<InterfaceC1170Qe> A0H;
    public final CopyOnWriteArraySet<LJ> A0I;
    public final CopyOnWriteArraySet<TS> A0J;
    public final CopyOnWriteArraySet<YC> A0K;
    public final CopyOnWriteArraySet<InterfaceC1221Sd> A0L;
    public final InterfaceC1224Sg[] A0M;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public AnonymousClass93(Context context, InterfaceC1155Pi interfaceC1155Pi, AbstractC1323Wi abstractC1323Wi, InterfaceC1145Ot interfaceC1145Ot, InterfaceC1333Ws interfaceC1333Ws, InterfaceC1212Ru interfaceC1212Ru, InterfaceC1338Wy<InterfaceC1069Lu, InterfaceC1219Sb> interfaceC1338Wy, InterfaceC1069Lu interfaceC1069Lu) {
        this.A0F = new SurfaceHolderCallbackC1222Se(this);
        this.A0L = new CopyOnWriteArraySet<>();
        this.A0J = new CopyOnWriteArraySet<>();
        this.A0K = new CopyOnWriteArraySet<>();
        this.A0H = new CopyOnWriteArraySet<>();
        Looper looperMyLooper = Looper.myLooper() != null ? Looper.myLooper() : Looper.getMainLooper();
        this.A0D = new Handler(looperMyLooper);
        this.A0M = interfaceC1155Pi.A67(this.A0D, this.A0F, this.A0F, this.A0F, this.A0F, interfaceC1212Ru);
        this.A00 = 1.0f;
        this.A01 = 0;
        this.A06 = VL.A07;
        this.A02 = 1;
        this.A0E = A06(this.A0M, abstractC1323Wi, interfaceC1145Ot, interfaceC1333Ws, interfaceC1069Lu);
        this.A0G = interfaceC1338Wy.A4c(interfaceC1069Lu);
        this.A0G.AKx(this.A0E, looperMyLooper);
        this.A0I = new CopyOnWriteArraySet<>();
    }

    public static String A07(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0N, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 107);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0E() {
        byte[] bArr = {3, 25, 29, 32, 28, 21, -11, 40, 31, 0, 28, 17, 41, 21, 34, -7, 27, 24, 12, 7, 9, 11, -6, 11, 30, 26, 27, 24, 11, -14, 15, 25, 26, 11, 20, 11, 24, -58, 7, 18, 24, 11, 7, 10, 31, -58, 27, 20, 25, 11, 26, -58, 21, 24, -58, 24, 11, 22, 18, 7, 9, 11, 10, -44};
        if (A0O[3].charAt(15) != 'Z') {
            throw new RuntimeException();
        }
        A0O[4] = "s";
        A0N = bArr;
    }

    static {
        A0E();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Wy != com.google.common.base.Function<com.facebook.ads.androidx.media3.common.util.Clock, com.facebook.ads.androidx.media3.exoplayer.analytics.AnalyticsCollector> */
    public AnonymousClass93(Context context, InterfaceC1155Pi interfaceC1155Pi, AbstractC1323Wi abstractC1323Wi, InterfaceC1145Ot interfaceC1145Ot, InterfaceC1333Ws interfaceC1333Ws, InterfaceC1212Ru interfaceC1212Ru, InterfaceC1338Wy<InterfaceC1069Lu, InterfaceC1219Sb> interfaceC1338Wy) {
        this(context, interfaceC1155Pi, abstractC1323Wi, interfaceC1145Ot, interfaceC1333Ws, interfaceC1212Ru, interfaceC1338Wy, InterfaceC1069Lu.A00);
    }

    @Deprecated
    public AnonymousClass93(InterfaceC1155Pi interfaceC1155Pi, AbstractC1323Wi abstractC1323Wi, InterfaceC1145Ot interfaceC1145Ot, InterfaceC1333Ws interfaceC1333Ws, InterfaceC1212Ru interfaceC1212Ru) {
        this(null, interfaceC1155Pi, abstractC1323Wi, interfaceC1145Ot, interfaceC1333Ws, interfaceC1212Ru, new InterfaceC1338Wy() { // from class: com.facebook.ads.redexgen.X.Sj
            @Override // com.facebook.ads.redexgen.X.InterfaceC1338Wy
            public final Object A4c(Object obj) {
                return new InterfaceC1219Sb((InterfaceC1069Lu) obj) { // from class: com.facebook.ads.redexgen.X.91
                    public static String[] A09 = {"XIJMZpGz2dJN", "uXNrOY6Tg1Hz", "9HKEdM0Iuvoc8Jjs1PoUbO8kREjKabW6", "9pjlej0iwxjS", "4By8B1i4ZnuRAvJ8EtYDFGuvAdFcE", "IlNNYI8ReicxFDQ5KYTYnRCMl6w6doxP", "rLtqdfItlP0s2x2BIVj9HEpFslbTSVD0", "hVM3LW0e6CvXFK2YKs0EYNfFMTjbKdod"};
                    public LQ A00;
                    public MM A01;
                    public MS<InterfaceC1166Px> A02;
                    public boolean A03;
                    public final InterfaceC1069Lu A07;
                    public final UM A05 = new UM();
                    public final UK A06 = new UK();
                    public final Pz A08 = new Pz(this.A05);
                    public final SparseArray<Pv> A04 = new SparseArray<>();

                    /* JADX WARN: Failed to parse debug info
                    java.lang.ArrayIndexOutOfBoundsException
                     */
                    @RequiresNonNull
                    private final Pv A03(Timeline timeline, int i5, C1202Rk c1202Rk) {
                        C1202Rk c1202Rk2 = c1202Rk;
                        if (timeline.A0N()) {
                            c1202Rk2 = null;
                        }
                        long jA6s = this.A07.A6s();
                        boolean z11 = timeline.equals(this.A00.A8H()) && i5 == this.A00.A8C();
                        if (c1202Rk2 != null && c1202Rk2.A00()) {
                            jA04 = z11 && this.A00.A89() == c1202Rk2.A00 && this.A00.A8A() == c1202Rk2.A01 ? this.A00.A8F() : 0L;
                            String[] strArr = A09;
                            if (strArr[1].length() != strArr[0].length()) {
                                throw new RuntimeException();
                            }
                            String[] strArr2 = A09;
                            strArr2[2] = "BvmtFOFZk37aydmEaqYHeOWtooKGdgT5";
                            strArr2[4] = "Ru4BLhJbDirpzxaLh0kYnsSKUiL12";
                        } else if (z11) {
                            jA04 = this.A00.A84();
                        } else if (!timeline.A0N()) {
                            jA04 = timeline.A0K(i5, this.A06).A04();
                        }
                        return new Pv(jA6s, timeline, i5, c1202Rk2, jA04, this.A00.A8H(), this.A00.A8C(), this.A08.A06(), this.A00.A8F(), this.A00.A9w());
                    }

                    {
                        this.A07 = (InterfaceC1069Lu) AbstractC1062Ln.A01(interfaceC1069Lu);
                        this.A02 = new MS<>(N1.A0d(), interfaceC1069Lu, new MQ() { // from class: com.facebook.ads.redexgen.X.SY
                        });
                    }

                    private final Pv A00() {
                        return A04(this.A08.A06());
                    }

                    private Pv A01(int i5, C1202Rk c1202Rk) {
                        AbstractC1062Ln.A01(this.A00);
                        boolean z11 = true;
                        if (c1202Rk != null) {
                            Timeline timelineA05 = this.A08.A05(c1202Rk);
                            String[] strArr = A09;
                            if (strArr[2].length() == strArr[4].length()) {
                                throw new RuntimeException();
                            }
                            String[] strArr2 = A09;
                            strArr2[1] = "iy4IerdMnFVa";
                            strArr2[0] = "K3yk7TLFjcQp";
                            if (timelineA05 == null) {
                                z11 = false;
                            }
                            if (z11) {
                                return A04(c1202Rk);
                            }
                            return A03(Timeline.A02, i5, c1202Rk);
                        }
                        Timeline timelineA8H = this.A00.A8H();
                        if (i5 >= timelineA8H.A07()) {
                            z11 = false;
                        }
                        if (!z11) {
                            timelineA8H = Timeline.A02;
                        }
                        String[] strArr3 = A09;
                        if (strArr3[2].length() == strArr3[4].length()) {
                            throw new RuntimeException();
                        }
                        A09[3] = "IesJoG5lz";
                        return A03(timelineA8H, i5, null);
                    }

                    private Pv A02(UY uy2) {
                        if (uy2 instanceof AnonymousClass96) {
                            AnonymousClass96 anonymousClass96 = (AnonymousClass96) uy2;
                            if (anonymousClass96.A05 != null) {
                                return A04(new C1202Rk(anonymousClass96.A05));
                            }
                        }
                        return A00();
                    }

                    private Pv A04(C1202Rk c1202Rk) {
                        Timeline timelineA05;
                        AbstractC1062Ln.A01(this.A00);
                        if (c1202Rk == null) {
                            timelineA05 = null;
                        } else {
                            timelineA05 = this.A08.A05(c1202Rk);
                        }
                        if (c1202Rk == null || timelineA05 == null) {
                            int windowIndex = this.A00.A8C();
                            Timeline knownTimeline = this.A00.A8H();
                            if (!(windowIndex < knownTimeline.A07())) {
                                knownTimeline = Timeline.A02;
                            }
                            return A03(knownTimeline, windowIndex, null);
                        }
                        return A03(timelineA05, timelineA05.A0J(c1202Rk.A04, this.A05).A00, c1202Rk);
                    }

                    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.MP != com.facebook.ads.androidx.media3.common.util.ListenerSet$Event<com.facebook.ads.androidx.media3.exoplayer.analytics.AnalyticsListener> */
                    private final void A05(Pv pv2, int i5, MP<InterfaceC1166Px> mp2) {
                        this.A04.put(i5, pv2);
                        this.A02.A0A(i5, mp2);
                    }

                    @Override // com.facebook.ads.redexgen.X.InterfaceC1219Sb
                    public final void ADV() {
                        if (!this.A03) {
                            final Pv pvA00 = A00();
                            this.A03 = true;
                            A05(pvA00, -1, new MP() { // from class: com.facebook.ads.redexgen.X.SW
                            });
                        }
                    }

                    @Override // com.facebook.ads.redexgen.X.LJ
                    public final void AEa(final C1249Tf c1249Tf) {
                        final Pv pvA00 = A00();
                        A05(pvA00, 27, new MP() { // from class: com.facebook.ads.redexgen.X.SU
                        });
                    }

                    @Override // com.facebook.ads.redexgen.X.LJ
                    public final void AEb(final List<C1251Th> list) {
                        final Pv pvA00 = A00();
                        A05(pvA00, 27, new MP() { // from class: com.facebook.ads.redexgen.X.SL
                        });
                    }

                    @Override // com.facebook.ads.redexgen.X.InterfaceC1288Uv
                    public final void AEm(int i5, C1202Rk c1202Rk, final C1271Ue c1271Ue) {
                        final Pv pvA01 = A01(i5, c1202Rk);
                        A05(pvA01, 1004, new MP() { // from class: com.facebook.ads.redexgen.X.SZ
                        });
                    }

                    @Override // com.facebook.ads.redexgen.X.InterfaceC1288Uv
                    public final void AFe(int i5, C1202Rk c1202Rk, final Uc uc2, final C1271Ue c1271Ue) {
                        final Pv pvA01 = A01(i5, c1202Rk);
                        A05(pvA01, 1002, new MP() { // from class: com.facebook.ads.redexgen.X.SV
                        });
                    }

                    @Override // com.facebook.ads.redexgen.X.InterfaceC1288Uv
                    public final void AFg(@MetaExoPlayerCustomization(type = {"NEW_METHOD_ARGS"}) int i5, @MetaExoPlayerCustomization(type = {"NEW_METHOD_ARGS"}) C1202Rk c1202Rk, final Uc uc2, final C1271Ue c1271Ue, Object obj2, Object obj3) {
                        final Pv pvA01 = A01(i5, c1202Rk);
                        A05(pvA01, 1001, new MP() { // from class: com.facebook.ads.redexgen.X.SN
                        });
                    }

                    @Override // com.facebook.ads.redexgen.X.InterfaceC1288Uv
                    public final void AFj(int i5, C1202Rk c1202Rk, final Uc uc2, final C1271Ue c1271Ue, final IOException iOException, final boolean z11) {
                        final Pv pvA01 = A01(i5, c1202Rk);
                        A05(pvA01, BackupConstant.SCENE_CLOSED_WITHOUT_SHOW, new MP() { // from class: com.facebook.ads.redexgen.X.Sa
                        });
                    }

                    @Override // com.facebook.ads.redexgen.X.LJ
                    public final void AGN(final UW uw2) {
                        final Pv pvA00 = A00();
                        A05(pvA00, 12, new MP() { // from class: com.facebook.ads.redexgen.X.ST
                        });
                    }

                    @Override // com.facebook.ads.redexgen.X.LJ
                    public final void AGP(final UY uy2) {
                        final Pv pvA02 = A02(uy2);
                        A05(pvA02, 10, new MP() { // from class: com.facebook.ads.redexgen.X.SX
                        });
                    }

                    @Override // com.facebook.ads.redexgen.X.LJ
                    public final void AGR(final boolean z11, final int i5) {
                        final Pv pvA00 = A00();
                        A05(pvA00, -1, new MP() { // from class: com.facebook.ads.redexgen.X.SS
                        });
                    }

                    @Override // com.facebook.ads.redexgen.X.LJ
                    public final void AH0() {
                        final Pv pvA00 = A00();
                        A05(pvA00, -1, new MP() { // from class: com.facebook.ads.redexgen.X.SM
                        });
                    }

                    @Override // com.facebook.ads.redexgen.X.LJ
                    public final void AHI(Timeline timeline, final int i5) {
                        this.A08.A07((LQ) AbstractC1062Ln.A01(this.A00));
                        final Pv pvA00 = A00();
                        A05(pvA00, 0, new MP() { // from class: com.facebook.ads.redexgen.X.SQ
                        });
                    }

                    @Override // com.facebook.ads.redexgen.X.LJ
                    public final void AHN(final C1266Tx c1266Tx) {
                        final Pv pvA00 = A00();
                        A05(pvA00, 2, new MP() { // from class: com.facebook.ads.redexgen.X.SO
                        });
                    }

                    @Override // com.facebook.ads.redexgen.X.InterfaceC1219Sb
                    public final void AKx(final LQ lq, Looper looper) {
                        AbstractC1062Ln.A08(this.A00 == null || this.A08.A03.isEmpty());
                        this.A00 = (LQ) AbstractC1062Ln.A01(lq);
                        this.A01 = this.A07.A5y(looper, null);
                        this.A02 = this.A02.A07(looper, new MQ() { // from class: com.facebook.ads.redexgen.X.SR
                        });
                    }
                };
            }
        });
    }

    private final AnonymousClass95 A06(InterfaceC1224Sg[] interfaceC1224SgArr, AbstractC1323Wi abstractC1323Wi, InterfaceC1145Ot interfaceC1145Ot, InterfaceC1333Ws interfaceC1333Ws, InterfaceC1069Lu interfaceC1069Lu) {
        return new AnonymousClass95(interfaceC1224SgArr, abstractC1323Wi, interfaceC1145Ot, interfaceC1333Ws, interfaceC1069Lu);
    }

    private void A0D() {
        if (this.A05 != null) {
            if (this.A05.getSurfaceTextureListener() != this.A0F) {
                Log.w(A07(0, 15, 69), A07(15, 49, 59));
            } else {
                this.A05.setSurfaceTextureListener(null);
            }
            this.A05 = null;
        }
        if (this.A04 != null) {
            this.A04.removeCallback(this.A0F);
            this.A04 = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0F(Surface surface, boolean z11) {
        ArrayList arrayList = new ArrayList();
        for (InterfaceC1224Sg interfaceC1224Sg : this.A0M) {
            if (interfaceC1224Sg.AA0() == 2) {
                arrayList.add(this.A0E.A0L(interfaceC1224Sg).A07(1).A08(surface).A06());
            }
        }
        Surface surface2 = this.A03;
        if (A0O[2].charAt(17) == '5') {
            throw new RuntimeException();
        }
        A0O[7] = "Ks";
        if (surface2 != null && this.A03 != surface) {
            try {
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    ((PS) it.next()).A0C();
                }
            } catch (InterruptedException unused) {
                Thread.currentThread().interrupt();
            }
            if (this.A0C) {
                this.A03.release();
            }
        }
        this.A03 = surface;
        this.A0C = z11;
    }

    @Override // com.facebook.ads.redexgen.X.VK
    public final void A0H(int i5, long j11) {
        this.A0G.ADV();
        this.A0E.A0H(i5, j11);
    }

    public final int A0I() {
        return this.A01;
    }

    public final VC A0J() {
        return this.A07;
    }

    public final VC A0K() {
        return this.A08;
    }

    public final void A0L() {
        this.A0E.A0M();
        A0D();
        if (this.A03 != null) {
            if (this.A0C) {
                Surface surface = this.A03;
                if (A0O[3].charAt(15) != 'Z') {
                    throw new RuntimeException();
                }
                A0O[0] = "UvN3cM6pmFJL36WdLmfoMTxOeTkBuHQ9";
                surface.release();
            }
            this.A03 = null;
        }
        if (this.A0B != null) {
            this.A0B.AJj(this.A0G);
            this.A0B = null;
        }
    }

    public final void A0M(float f11) {
        float fA00 = N1.A00(f11, 0.0f, 1.0f);
        if (this.A00 == fA00) {
            return;
        }
        this.A00 = fA00;
        for (InterfaceC1224Sg interfaceC1224Sg : this.A0M) {
            if (interfaceC1224Sg.AA0() == 1) {
                AnonymousClass95 anonymousClass95 = this.A0E;
                if (A0O[0].charAt(29) == 'i') {
                    throw new RuntimeException();
                }
                A0O[3] = "jr3unv9cijOSBrxZjY5KKoYSuFZh1wIm";
                anonymousClass95.A0L(interfaceC1224Sg).A07(2).A08(Float.valueOf(fA00)).A06();
            }
        }
    }

    public final void A0N(Surface surface) {
        A0D();
        A0F(surface, false);
    }

    public final void A0O(LJ lj2) {
        this.A0E.A0O(lj2);
        this.A0I.add(lj2);
    }

    public final void A0P(InterfaceC1221Sd interfaceC1221Sd) {
        this.A0L.add(interfaceC1221Sd);
    }

    public final void A0Q(InterfaceC1276Uj interfaceC1276Uj) {
        A0R(interfaceC1276Uj, true, true);
    }

    public final void A0R(InterfaceC1276Uj interfaceC1276Uj, boolean z11, boolean z12) {
        if (this.A0B != null) {
            this.A0B.AJj(this.A0G);
        }
        this.A0B = interfaceC1276Uj;
        interfaceC1276Uj.A4P(this.A0D, this.A0G);
        this.A0E.A0P(interfaceC1276Uj, z11, z12);
    }

    public final void A0S(boolean z11) {
        this.A0E.A0Q(z11);
    }

    public final boolean A0T() {
        return this.A0E.A0R();
    }

    @Override // com.facebook.ads.redexgen.X.LQ
    public final long A7h() {
        return this.A0E.A7h();
    }

    @Override // com.facebook.ads.redexgen.X.LQ
    public final long A84() {
        return this.A0E.A84();
    }

    @Override // com.facebook.ads.redexgen.X.LQ
    public final int A89() {
        return this.A0E.A89();
    }

    @Override // com.facebook.ads.redexgen.X.LQ
    public final int A8A() {
        return this.A0E.A8A();
    }

    @Override // com.facebook.ads.redexgen.X.LQ
    public final int A8C() {
        return this.A0E.A8C();
    }

    @Override // com.facebook.ads.redexgen.X.LQ
    public final int A8D() {
        return this.A0E.A8D();
    }

    @Override // com.facebook.ads.redexgen.X.LQ
    public final long A8F() {
        return this.A0E.A8F();
    }

    @Override // com.facebook.ads.redexgen.X.LQ
    public final Timeline A8H() {
        return this.A0E.A8H();
    }

    @Override // com.facebook.ads.redexgen.X.LQ
    public final int A8I() {
        return this.A0E.A8I();
    }

    @Override // com.facebook.ads.redexgen.X.LQ
    public final long A8T() {
        return this.A0E.A8T();
    }

    @Override // com.facebook.ads.redexgen.X.LQ
    public final long A9w() {
        return this.A0E.A9w();
    }

    @Override // com.facebook.ads.redexgen.X.LQ
    public final boolean ABL() {
        return this.A0E.ABL();
    }

    @Override // com.facebook.ads.redexgen.X.LQ
    public final void ALZ(boolean z11) {
        this.A0E.ALZ(z11);
        if (this.A0B != null) {
            this.A0B.AJj(this.A0G);
            this.A0B = null;
            if (z11) {
                this.A0B = null;
            }
        }
    }
}
