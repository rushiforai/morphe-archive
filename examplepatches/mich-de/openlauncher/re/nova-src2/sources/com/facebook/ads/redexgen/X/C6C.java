package com.facebook.ads.redexgen.X;

import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.Pair;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;

/* renamed from: com.facebook.ads.redexgen.X.6C, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C6C extends AbstractC0861Do {
    public static byte[] A0j;
    public static String[] A0k = {"zF", "YuhgBsbCJ4GENG72FYuTSQ3UxVCmrs0t", "RSfzcHToFNO8jc1tX2m0S0AZ0vbf9kKl", "p", "lGjhRdALEILVIUsiuWCm6MXJK2R8L6Co", "wXQvDYR5huLQKlTsBS5mG0rN7ygrQvR2", "AYgBJnzxyMi9rrwHO3oB8yOhTSWVLxNu", "3k2Jytm7iEKA6X2jmmGhgFSNDYaf4AHR"};
    public static final int A0l;
    public static final int A0m;
    public static final int A0n;
    public static final int A0o;
    public static final int A0p;
    public static final int A0q;
    public static final int A0r;
    public static final int A0s;
    public static final int A0t;
    public static final int A0u;
    public static final int A0v;
    public float A00;
    public C1744fN A01;
    public C2370pi A02;
    public C2673ub A03;
    public C2701v3 A04;
    public C2728vU A05;
    public C1861hI A06;
    public EnumC1664e4 A07;
    public C0777Ai A08;
    public boolean A09;
    public boolean A0A;
    public boolean A0B;
    public boolean A0C;
    public boolean A0D;
    public boolean A0E;
    public boolean A0F;
    public boolean A0G;
    public boolean A0H;
    public final int A0I;
    public final int A0J;
    public final int A0K;
    public final int A0L;
    public final int A0M;
    public final Handler A0N;
    public final View A0O;
    public final C0958Hi A0P;
    public final C2232nO A0Q;
    public final AbstractC2452r2 A0R;
    public final AbstractC2624to A0S;
    public final ViewOnClickListenerC0884El A0T;
    public final InterfaceC2511rz A0U;
    public final C1870hR A0V;
    public final C0804Bj A0W;
    public final C0799Be A0X;
    public final C5Z A0Y;
    public final BM A0Z;
    public final BK A0a;
    public final BG A0b;
    public final BE A0c;
    public final BC A0d;
    public final BB A0e;
    public final C0793Ay A0f;
    public final C0781Am A0g;
    public final boolean A0h;
    public final boolean A0i;

    public static String A0C(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0j, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 44);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0L() {
        A0j = new byte[]{-55, -43, -45, -108, -52, -57, -55, -53, -56, -43, -43, -47, -108, -57, -54, -39, -108, -49, -44, -38, -53, -40, -39, -38, -49, -38, -49, -57, -46, -108, -55, -46, -49, -55, -47, -53, -54, 15, 24, 27, 12, 14, 13, 8, 23, 29, 13, -33, -46, -28, -50, -33, -47, -46, -47, -52, -29, -42, -47, -46, -36, -67, -80, -85, -84, -74};
    }

    static {
        A0L();
        A0p = (int) (AbstractC2385px.A02 * 48.0f);
        A0n = AbstractC1841gx.A02(-1, 77);
        A0u = (int) (AbstractC2385px.A02 * 26.0f);
        A0v = (int) (AbstractC2385px.A02 * 12.0f);
        A0r = (int) (AbstractC2385px.A02 * 12.0f);
        A0s = (int) (AbstractC2385px.A02 * 44.0f);
        A0q = AbstractC2383pv.A0y;
        A0t = (int) (AbstractC2385px.A02 * 16.0f);
        A0o = AbstractC1841gx.A02(A0n, 90);
        A0m = (int) (AbstractC2385px.A02 * 4.0f);
        A0l = (int) (AbstractC2385px.A03 * 32.0f);
    }

    public C6C(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, LA la2, C2086kz c2086kz, InterfaceC2515s3 interfaceC2515s3, int i5, InterfaceC2459r9 interfaceC2459r9, C2232nO c2232nO, AbstractC2452r2 abstractC2452r2, int i11, int i12, int i13, boolean z11, int i14, boolean z12, boolean z13, boolean z14, InterfaceC2511rz interfaceC2511rz, int i15, int i16) {
        C1744fN c1744fNA00;
        super(c0958Hi, interfaceC2515s3, interfaceC2224nG, la2, i5, z13, z14, interfaceC2459r9, i16);
        this.A0N = new Handler(Looper.getMainLooper());
        this.A00 = 0.0f;
        this.A09 = false;
        this.A0A = false;
        this.A0H = false;
        this.A0B = false;
        this.A0F = false;
        this.A0E = true;
        this.A0C = false;
        this.A0D = false;
        this.A0d = new BC() { // from class: com.facebook.ads.redexgen.X.6I
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(BD bd2) {
                this.A00.A0H = true;
                if (this.A00.getAdDataBundle().A2M()) {
                    this.A00.A0P.A0F().AM1(AbstractC2361pZ.A00((float) ((AbstractC0861Do) this.A00).A08.A1F()), this.A00.getResources().getConfiguration().orientation, true, true, AbstractC1701ef.A0E(C1702eg.A00(this.A00.A0P, ((AbstractC0861Do) this.A00).A0A, b.f42142b, AbstractC2351pP.A00(((AbstractC0861Do) this.A00).A08.A32().A0K().A06()), new HashMap(), ((AbstractC0861Do) this.A00).A08.A33())));
                    this.A00.A0N(this.A00.getResources().getConfiguration().orientation);
                    this.A00.A0S.setVisibility(0);
                    if (this.A00.A0S instanceof AbstractC0891Es) {
                        ((AbstractC0891Es) this.A00.A0S).A0u(this.A00.getResources().getConfiguration().orientation);
                    }
                }
                if (this.A00.getAdDataBundle().A2O()) {
                    this.A00.A0g.setOnClickListener(this.A00.A0T);
                }
            }
        };
        this.A0c = new BE() { // from class: com.facebook.ads.redexgen.X.6H
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(BF bf2) {
                if (!((AbstractC0861Do) this.A00).A0C.A07()) {
                    this.A00.A1f();
                }
            }
        };
        this.A0b = new BG() { // from class: com.facebook.ads.redexgen.X.6G
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            public final /* bridge */ /* synthetic */ void A03(C2170mO c2170mO) {
            }
        };
        this.A0e = new BB() { // from class: com.facebook.ads.redexgen.X.6F
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5V c5v) {
                this.A00.A0V(c5v);
                this.A00.A0U.AEz((this.A00.A00 * this.A00.A0X.getDuration()) + c5v.A00());
            }
        };
        this.A0Z = new BM() { // from class: com.facebook.ads.redexgen.X.6E
            public static String[] A01 = {"WHlfg22LQewOceL2LP0nfjs", "MLczN6H9d0ts9YHCrKUbmxW9Pv4xX40Z", "bfgAoKxvo7gEuP52Z2EO408IJ8JPPLb2", "8W4TrLCVwT5pN341HhH6D3mP2byMMwpU", "ScQcjv0hvXE5sqpvLhFnJdo", "ew857MaMURY893GG0hi3zO6RFtTWvxkk", "kzrdBoT0QozH1fOZ2V6a3FXV0JrhAD1i", "6tn8KSSYbJPeTKsUVc3lRKjtLiYgy0EC"};

            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5Y c5y) {
                this.A00.A0U.AEd(this.A00.A0X.getDuration());
                C6C.A01(this.A00, 1.0f);
                if (!this.A00.getAdDataBundle().A3G() && this.A00.A00 <= ((AbstractC0861Do) this.A00).A08.A32().A0H()) {
                    this.A00.A0X.A0f(EnumC1664e4.A03, 28);
                    return;
                }
                if (this.A00.getAdDataBundle().A3G() && !this.A00.A0C) {
                    int iA30 = this.A00.getAdDataBundle().A30();
                    if (this.A00.A00 >= iA30) {
                        float f11 = this.A00.A00;
                        float f12 = iA30;
                        String[] strArr = A01;
                        String str = strArr[5];
                        String str2 = strArr[3];
                        int iCharAt = str.charAt(17);
                        int threshold = str2.charAt(17);
                        if (iCharAt != threshold) {
                            throw new RuntimeException();
                        }
                        String[] strArr2 = A01;
                        strArr2[0] = "Y6tJEDKh19k0rBQmCTxaUfC";
                        strArr2[4] = "6GhykS7c96Spqt9ACDuQK2F";
                        if (f11 != f12) {
                            this.A00.A0K();
                            return;
                        }
                        this.A00.A0E = false;
                        this.A00.A0U.AH3(true);
                        this.A00.A0H();
                        return;
                    }
                    this.A00.A0H();
                    return;
                }
                if (!this.A00.getAdDataBundle().A3G() || !this.A00.A0C) {
                    this.A00.A0E = false;
                    this.A00.A0K();
                }
            }
        };
        this.A0a = new C6D(this);
        this.A0P = c0958Hi;
        this.A0Q = c2232nO;
        this.A0R = abstractC2452r2;
        this.A0M = i15;
        int i17 = -1;
        if (!super.A08.A2M()) {
            this.A0O = new C0786Ar(this.A0P, c2232nO);
        } else {
            i17 = i15;
            this.A0O = new C0785Aq(this.A0P, c2232nO);
        }
        this.A0g = new C0781Am(this.A0P, i17);
        if (this.A00 < la2.A32().A0H()) {
            this.A0g.setShouldClearAnimationWhenVideoCompleted(false);
        }
        this.A0K = i14;
        this.A0i = z12;
        this.A0J = i11;
        this.A0L = i12;
        this.A0U = interfaceC2511rz;
        this.A0I = i13;
        this.A0h = z11;
        this.A0V = new C1870hR(this.A0P, interfaceC2224nG, super.A08);
        if (i12 == 1) {
            c1744fNA00 = super.A08.A31().A01();
        } else {
            c1744fNA00 = super.A08.A31().A00();
        }
        this.A01 = c1744fNA00;
        this.A0X = new C0799Be(this.A0P);
        this.A0X.getEventBus().A03(this.A0d, this.A0c, this.A0b, this.A0e, this.A0Z, this.A0a);
        this.A0Y = new C5Z(c0958Hi, interfaceC2224nG, this.A0X, la2.A37(), 0, 0, la2.A32().A0V(), null, null);
        A0J();
        this.A0X.setVideoURI(c2086kz.A0T(super.A08.A32().A0I().A09()));
        A0I();
        C2379pr c2379prA02 = super.A0B.A02(la2);
        this.A0P.A0H().A00(c2379prA02.A01);
        this.A0S = A06();
        if (this.A0S instanceof C0880Eh) {
            new C0774Af(this.A0S, Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, 100, 0).A4b(true, false);
        } else {
            this.A0S.setVisibility(8);
        }
        this.A0f = new C0793Ay(true, la2.A32().A0V());
        A0M();
        this.A0T = this.A0S.getCTAButton();
        if (c2379prA02.A00) {
            this.A0X.setOnClickListener(new View.OnClickListener() { // from class: com.facebook.ads.redexgen.X.1D
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    this.A00.A1t(view);
                }
            });
        }
        AbstractC2426qc.A0H(1001, this.A0T);
        A0G();
        if (!getAdDataBundle().A2M()) {
            A0F();
        }
        this.A0S.bringToFront();
        if (C2203mv.A1z(this.A0P)) {
            this.A0P.A0B().AM7(this.A0X, super.A08.A37(), true);
        }
        if (C2203mv.A20(this.A0P)) {
            this.A0W = new C0804Bj(this.A0P, interfaceC2224nG, this.A0X, super.A08.A37(), la2.A32().A0V(), this.A0Y, null);
        } else {
            this.A0W = null;
        }
    }

    public static /* synthetic */ float A01(C6C c6c, float f11) {
        float f12 = c6c.A00 + f11;
        c6c.A00 = f12;
        return f12;
    }

    private AbstractC2624to A06() {
        String strA0C;
        AbstractC2624to c0880Eh;
        RelativeLayout.LayoutParams adDetailsParams = new RelativeLayout.LayoutParams(-1, -2);
        adDetailsParams.addRule(12);
        if (super.A08.A1c().equals(A0C(47, 14, 65))) {
            strA0C = EnumC1658dy.A04.A03();
        } else {
            strA0C = A0C(0, 37, 58);
        }
        double dA1F = super.A08.A1F();
        boolean zA2M = getAdDataBundle().A2M();
        String clickEvent = A0k[2];
        if (clickEvent.charAt(19) == 'M') {
            throw new RuntimeException();
        }
        A0k[2] = "UjX50goOnLgU03JCSIrIh8CV2epyWLz0";
        if (zA2M) {
            c0880Eh = new C2669uX((float) dA1F, strA0C, this.A0P, getColors(), super.A08, super.A0D, this.A0T, AbstractC0861Do.A0I, false, super.A0A, super.A0F, super.A0C, this.A0g, this.A0Q, false).A03();
            ((AbstractC0891Es) c0880Eh).setChainedAdInfo(super.A00);
        } else {
            c0880Eh = new C0880Eh(this.A0P, null, A0p, super.A08.A32().A0J().A00() == EnumC1740fJ.A05, getColors(), super.A08.A32().A0K().A07(), strA0C, super.A0A, super.A0D, super.A0F, super.A0C, super.A08);
        }
        c0880Eh.getCTAButton().getCtaActionHelper().A0A(super.A08);
        AbstractC2426qc.A0H(1008, c0880Eh);
        c0880Eh.A0l(this.A0L);
        addView(c0880Eh, adDetailsParams);
        c0880Eh.setInfo(super.A08.A32().A0J(), super.A08.A32().A0K(), super.A08.A37(), super.A08.A35().A01(), null, new InterfaceC2643u7() { // from class: com.facebook.ads.redexgen.X.Db
            @Override // com.facebook.ads.redexgen.X.InterfaceC2643u7
            public final void AEZ() {
                this.A00.A1s();
            }
        });
        return c0880Eh;
    }

    private void A0D() {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        if (this.A06 != null) {
            this.A06.A0f(false);
            addView(this.A06.A0W(), layoutParams);
        }
    }

    private void A0E() {
        EnumC2275o7 enumC2275o7A00 = EnumC2275o7.A00(getAdDataBundle().A1a());
        if (enumC2275o7A00 == EnumC2275o7.A08) {
            AbstractC2426qc.A0e(this.A0S, this.A0O, this.A0T);
            this.A05 = new C2728vU(this.A0P, getAdDataBundle(), this.A0Q, this.A0N, super.A0D, this.A0R);
            addView(this.A05.A0K(this.A0T), new RelativeLayout.LayoutParams(-1, -1));
            return;
        }
        if (enumC2275o7A00 == EnumC2275o7.A05) {
            AbstractC2426qc.A0e(this.A0S, this.A0O, this.A0T);
            this.A03 = new C2673ub(this.A0P, getAdDataBundle(), this.A0Q, this.A0N, super.A0D);
            addView(this.A03.A0D(this.A0T), new RelativeLayout.LayoutParams(-1, -1));
            return;
        }
        if (getAdDataBundle().A32().A0L().A04()) {
            C1735fE c1735fEA32 = getAdDataBundle().A32();
            if (A0k[4].charAt(4) != 'R') {
                throw new RuntimeException();
            }
            A0k[5] = "IG6C4D4FNzKOlmveDSOZA8Sm7vA0oiYo";
            if (!c1735fEA32.A0L().A03().isEmpty()) {
                AbstractC2426qc.A0e(this.A0S, this.A0O, this.A0T);
                this.A06 = new C1861hI(this.A0P, getAdDataBundle(), super.A0D, this.A0T, this.A0N, this.A0Q);
                A0D();
                return;
            }
        }
        if (getAdDataBundle().A32().A0L().A05() || getAdDataBundle().A32().A0L().A04()) {
            AbstractC2426qc.A0e(this.A0S, this.A0O, this.A0T);
            this.A04 = new C2701v3(this.A0P, super.A08, this.A0Q, this.A0N, super.A0D);
            this.A04.A0K(false);
            addView(this.A04.A0E(this.A0T));
            return;
        }
        C1870hR c1870hR = this.A0V;
        String[] strArr = A0k;
        if (strArr[7].charAt(6) == strArr[6].charAt(6)) {
            throw new RuntimeException();
        }
        A0k[2] = "b3YZz6eZKLVTjLGY7Qv3itRrcKhjm6bQ";
        Pair<EnumC1871hS, View> pairA03 = c1870hR.A03(this.A0T);
        View view = (View) pairA03.second;
        AbstractC2426qc.A0H(1101, view);
        A0U((EnumC1871hS) pairA03.first, view);
    }

    private void A0F() {
        this.A0g.A0A(-1, A0n, false);
        this.A0g.setPadding(A0v, A0v, A0v, A0v);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, A0u);
        layoutParams.addRule(12);
        addView(this.A0g, layoutParams);
    }

    private void A0G() {
        RelativeLayout.LayoutParams layoutParams;
        if (!super.A08.A2M()) {
            this.A0O.setPadding(A0r, A0r, A0r, A0r);
            layoutParams = new RelativeLayout.LayoutParams(A0s, A0s);
            layoutParams.setMargins(0, AbstractC2452r2.A00, A0q, 0);
            layoutParams.addRule(11);
            layoutParams.addRule(10);
        } else {
            layoutParams = new RelativeLayout.LayoutParams(A0l, A0l);
            layoutParams.setMargins(AbstractC2383pv.A0e, AbstractC2383pv.A0u, AbstractC2383pv.A0e, AbstractC2383pv.A0c);
            layoutParams.addRule(9);
        }
        ViewGroup.LayoutParams videoViewParams = new RelativeLayout.LayoutParams(-1, -1);
        addView(this.A0X, videoViewParams);
        addView(this.A0O, layoutParams);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0H() {
        this.A0X.A0f(EnumC1664e4.A03, 28);
    }

    private void A0I() {
        postDelayed(new DX(this), C2203mv.A0N(this.A0P));
    }

    private void A0J() {
        this.A0X.A0g(this.A0g);
        if (this.A0O instanceof InterfaceC1663e3) {
            this.A0X.A0g((InterfaceC1663e3) this.A0O);
        }
        if (!TextUtils.isEmpty(super.A08.A32().A0I().A08())) {
            C5B c5b = new C5B(this.A0P);
            this.A0X.A0g(c5b);
            c5b.setImage(super.A08.A32().A0I().A08());
        }
        this.A0X.A0g(new AnonymousClass55(this.A0P));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0K() {
        if (A1o()) {
            A1g();
        } else {
            this.A0U.AE6();
        }
    }

    private final void A0M() {
        View expandableLayout = this.A0S.getExpandableLayout();
        if (expandableLayout != null) {
            if (this.A08 != null) {
                this.A0f.A0L(this.A08);
            }
            C1744fN c1744fNA01 = super.A08.A31().A01();
            this.A0f.A0L(new C0775Ag(this.A0S.getCTAButton(), 300, -1, c1744fNA01.A0A(true)));
            Drawable drawableA08 = AbstractC2426qc.A08(A0n, A0o, A0m);
            Drawable endDrawable = AbstractC2426qc.A05(c1744fNA01.A09(true), A0m);
            this.A0f.A0L(new C0778Aj(this.A0S.getCTAButton(), 300, drawableA08, endDrawable));
            this.A0f.A0L(new C0776Ah(expandableLayout, PerAppFeatureCatalog.MAX_TOOLS, false));
            this.A0f.ABd(this.A0X);
            this.A0f.A0K(2300);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0N(int i5) {
        if (!getAdDataBundle().A2M()) {
            return;
        }
        this.A0P.A0F().AM3(i5);
        this.A0X.A0a(i5);
        A0O(i5, this.A0X, (RelativeLayout) this.A0X.getVideoView());
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x006f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final void A0O(int i5, ViewGroup viewGroup, RelativeLayout relativeLayout) {
        if (this.A0S instanceof AbstractC0891Es) {
            if ((this.A0S instanceof C06986q) || (this.A0S instanceof C06976p)) {
                AbstractC2426qc.A0K(this.A0S);
                RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
                if (getResources().getConfiguration().orientation == 2) {
                    layoutParams.addRule(1, relativeLayout.getId());
                    this.A0S.setLayoutParams(layoutParams);
                    viewGroup.addView(this.A0S);
                } else {
                    View view = this.A0S;
                    if (A0k[5].charAt(17) == 'S') {
                        A0k[1] = "FRMsyzuLc3gZfdMKASlNmMY9tlCkF6nx";
                        addView(view, layoutParams);
                    }
                }
                AbstractC2624to abstractC2624to = this.A0S;
                if (A0k[4].charAt(4) == 'R') {
                    String[] strArr = A0k;
                    strArr[7] = "PKo2vwQTJwyDgvIModIJuZ40o1531gqX";
                    strArr[6] = "2NjiF537ycZcGbLh0nonhJtG51ansIa1";
                    abstractC2624to.A0l(i5);
                    ((AbstractC0891Es) this.A0S).A0y(viewGroup, relativeLayout, i5);
                    return;
                }
            } else {
                AbstractC2624to abstractC2624to2 = this.A0S;
                if (A0k[4].charAt(4) == 'R') {
                }
            }
            throw new RuntimeException();
        }
    }

    private void A0U(EnumC1871hS enumC1871hS, View view) {
        this.A0X.A0i(false);
        this.A0X.setVisibility(8);
        switch (C1B.A00[enumC1871hS.ordinal()]) {
            case 1:
                this.A0S.setVisibility(0);
                RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
                layoutParams.setMargins(0, AbstractC2452r2.A00, 0, 0);
                layoutParams.addRule(2, this.A0S.getId());
                addView(view, layoutParams);
                break;
            case 2:
                AbstractC2426qc.A0e(this.A0S);
                RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -1);
                layoutParams2.setMargins(A0t, A0t, A0t, A0t);
                addView(view, layoutParams2);
                break;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0V(C5V c5v) {
        if (this.A0X.getState() == EnumC1549cC.A02 && C2203mv.A1e(this.A0P)) {
            postDelayed(new DW(this, c5v), 5000L);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0W(String str) {
        if (!this.A0F) {
            this.A0F = true;
            this.A0U.AHa(str);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final EnumC1698ec A1a(String str) {
        if (getAdDataBundle().A3G() && getCurrentPlayCount() < getAdDataBundle().A30()) {
            boolean z11 = this.A0C;
            String[] strArr = A0k;
            if (strArr[0].length() == strArr[3].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0k;
            strArr2[0] = "rD";
            strArr2[3] = "0";
            if (!z11) {
                this.A0C = true;
                this.A0E = false;
                EnumC1698ec outcome = this.A0T.A0E(A0C(37, 10, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE));
                if (!A1o()) {
                    this.A0U.AH3(true);
                } else {
                    A1g();
                }
                return outcome;
            }
        }
        return this.A0T.A0E(str);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1b() {
        super.A1b();
        this.A0S.A0j();
        if (this.A02 != null) {
            this.A02.A06();
        }
        this.A0N.removeCallbacksAndMessages(null);
        if (this.A05 != null) {
            this.A05.A0L();
        }
        if (this.A03 != null) {
            this.A03.A0E();
        }
        if (this.A06 != null) {
            this.A06.A0Y();
        }
        C2701v3 c2701v3 = this.A04;
        String[] strArr = A0k;
        if (strArr[0].length() != strArr[3].length()) {
            A0k[2] = "4e1dr9g4n9kT22ZIdoKy0n8REVoGbgbF";
            if (c2701v3 != null) {
                C2701v3 c2701v32 = this.A04;
                if (A0k[1].charAt(26) != '5') {
                    A0k[2] = "sDtqF7ractOdV57EDY7GyqTfjJ1PXsQF";
                    c2701v32.A0H();
                }
            }
            if (C2203mv.A1z(this.A0P)) {
                this.A0P.A0B().ALo(this.A0X);
            }
            if (this.A0W != null) {
                this.A0W.A07();
            }
            if (this.A0X != null) {
                this.A0X.getEventBus().A04(this.A0d, this.A0c, this.A0b, this.A0e, this.A0Z, this.A0a);
                AbstractC2426qc.A0I(this.A0X);
                this.A0X.A0X();
            }
            this.A0Y.A0p();
            AbstractC2426qc.A0e(this.A0X, this.A0g, this.A0O);
            super.A0F.A0V();
            return;
        }
        throw new RuntimeException();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1g() {
        this.A0P.A0F().A5W();
        this.A09 = true;
        AbstractC2426qc.A0X(this);
        AbstractC2426qc.A0I(this.A0X);
        AbstractC2426qc.A0e(this.A0X, this.A0g, this.A0O);
        A0E();
        if (this.A0I != 0 || !this.A0h) {
            this.A0U.AH3(true);
            if (this.A0R != null && getAdDataBundle().A32().A0L().A00() > 0) {
                this.A0A = false;
                if (getAdDataBundle().A3N()) {
                    this.A0R.setToolbarActionMode(8);
                } else {
                    this.A0R.setToolbarActionMode(2);
                }
                new Handler(Looper.getMainLooper()).postDelayed(new Runnable() { // from class: com.facebook.ads.redexgen.X.1C
                    @Override // java.lang.Runnable
                    public final void run() throws Throwable {
                        if (AbstractC2311oi.A02(this)) {
                            return;
                        }
                        try {
                            this.A00.A0A = true;
                            this.A00.A0U.AH3(true);
                        } catch (Throwable th2) {
                            AbstractC2311oi.A00(th2, this);
                        }
                    }
                }, getAdDataBundle().A32().A0L().A00());
                return;
            }
            this.A0A = true;
            return;
        }
        if (this.A0i) {
            this.A0U.ALw();
        }
        if (this.A0R != null) {
            this.A0R.setToolbarActionMode(getAdDataBundle().A3N() ? 8 : 2);
        }
        this.A02 = new C2370pi(this.A0K, 100.0f, 100L, new Handler(Looper.getMainLooper()), new C0847Da(this));
        this.A02.A07();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1h() {
        this.A0X.setVolume(super.A08.A32().A0I().A0A() ? 0.0f : 1.0f);
        this.A0X.A0f(EnumC1664e4.A03, 20);
        if (!getAdDataBundle().A3G() || this.A0C) {
            int iA02 = super.A08.A32().A0I().A02();
            if (iA02 >= 0) {
                this.A0R.setProgressSpinnerInvisible(true);
            }
            if (iA02 != 0) {
                int secondsForNextCta = this.A0M;
                if (iA02 < secondsForNextCta) {
                    if (iA02 <= 0) {
                        return;
                    }
                    new C2370pi(iA02, new DZ(this)).A07();
                    return;
                }
            }
            this.A0R.setToolbarActionMode(8);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1i(boolean z11) {
        if (z11) {
            this.A0D = true;
        }
        if (z11 && getAdDataBundle().A3G() && getCurrentPlayCount() < getAdDataBundle().A30()) {
            boolean z12 = this.A0C;
            if (A0k[5].charAt(17) != 'S') {
                throw new RuntimeException();
            }
            String[] strArr = A0k;
            strArr[7] = "HQMNmsEpSladYJ4PQutWG71JU8T5RrCM";
            strArr[6] = "fScVEufYqboG567jNGnQCk8yQ2DxEz8s";
            if (!z12) {
                this.A0R.setToolbarActionMode(8);
                return;
            }
        }
        if (z11 && getAdDataBundle().A3G() && this.A0C) {
            this.A0E = false;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x003d  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x009b  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00aa  */
    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A1j(boolean z11) {
        if (!this.A0B) {
            AbstractC2624to abstractC2624to = this.A0S;
            if (A0k[2].charAt(19) != 'M') {
                String[] strArr = A0k;
                strArr[0] = "34";
                strArr[3] = "e";
                abstractC2624to.A0m(z11);
                if (this.A05 != null && !this.A0B) {
                    C2728vU c2728vU = this.A05;
                    if (A0k[1].charAt(26) != '5') {
                        A0k[1] = "4wNyCTM8ZErgqvJ584yFMDN96NuiIKcr";
                        c2728vU.A0N(z11);
                    }
                }
                if (this.A03 != null && !this.A0B) {
                    this.A03.A0G(z11);
                }
                if (this.A06 != null && !this.A0B) {
                    this.A06.A0e(z11);
                }
                C2701v3 c2701v3 = this.A04;
                if (A0k[2].charAt(19) == 'M') {
                    A0k[4] = "tUEuR5Hu5W0wqcl6w1396euuBpvmuQY6";
                    if (c2701v3 != null) {
                        if (!this.A0B) {
                            this.A04.A0J(z11);
                        }
                    }
                } else {
                    String[] strArr2 = A0k;
                    strArr2[0] = "OQ";
                    strArr2[3] = "X";
                    if (c2701v3 != null) {
                    }
                }
                this.A0B = false;
                if (A0k[4].charAt(4) == 'R') {
                    throw new RuntimeException();
                }
                A0k[4] = "tYy8RE9rHMYlmDryM9ERZuucPYH6oSxt";
                if (this.A02 != null) {
                    this.A02.A06();
                }
                if (this.A0X.A0o()) {
                    return;
                }
                this.A07 = this.A0X.getVideoStartReason();
                this.A0G = z11;
                this.A0X.A0j(false, 13);
                return;
            }
        } else {
            if (this.A05 != null) {
                C2728vU c2728vU2 = this.A05;
                if (A0k[1].charAt(26) != '5') {
                }
            }
            if (this.A03 != null) {
                this.A03.A0G(z11);
            }
            if (this.A06 != null) {
                this.A06.A0e(z11);
            }
            C2701v3 c2701v32 = this.A04;
            if (A0k[2].charAt(19) == 'M') {
            }
            this.A0B = false;
            if (A0k[4].charAt(4) == 'R') {
            }
        }
        throw new RuntimeException();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1k(boolean z11) {
        if (this.A02 != null && !this.A02.A05()) {
            C2370pi c2370pi = this.A02;
            if (A0k[5].charAt(17) != 'S') {
                throw new RuntimeException();
            }
            String[] strArr = A0k;
            strArr[7] = "pObqmm4LdTsqTcUgL7kozPbufRCkwYZC";
            strArr[6] = "5szeP9lNqMFVM0rzjOQcuK8NUDwg7u3G";
            c2370pi.A07();
        }
        if (this.A09 || this.A0X.getState() == EnumC1549cC.A06 || this.A07 == null) {
            return;
        }
        if (!this.A0G || z11) {
            this.A0X.A0f(this.A07, 19);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final boolean A1l() {
        return this.A0E && !this.A0C;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final boolean A1o() {
        return (this.A0I == 2 || !super.A08.A32().A0W() || this.A09) ? false : true;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final boolean A1p() {
        return this.A09;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final boolean A1q() {
        return this.A0A;
    }

    public final /* synthetic */ void A1s() {
        this.A0C = true;
        if (getAdDataBundle().A3G() && this.A0D) {
            this.A0E = false;
            this.A0U.AH3(true);
        }
    }

    public final /* synthetic */ void A1t(View view) {
        this.A0T.A0E(A0C(61, 5, 27));
    }

    public C1744fN getColors() {
        return this.A01;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public int getCurrentPlayCount() {
        return (int) this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public C2597tN getFullScreenAdStyle() {
        return new C2597tN(true, C2597tN.A06, super.A08.A31().A01(), ViewOnClickListenerC0884El.A05(super.A08), super.A08.A31().A01().A08(true), super.A08.A32().A0I().A08());
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public C2417qT getTouchDataRecorder() {
        return super.A0C;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do, android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        C1744fN c1744fNA00;
        super.onConfigurationChanged(configuration);
        if (!this.A09) {
            if (getAdDataBundle().A2M()) {
                A0N(configuration.orientation);
                return;
            }
            if (configuration.orientation == 1) {
                C1731fA c1731fAA31 = super.A08.A31();
                if (A0k[4].charAt(4) != 'R') {
                    throw new RuntimeException();
                }
                A0k[1] = "uYIsd2DhsQ91Wp0xmXJ9348eeMLtSRMf";
                c1744fNA00 = c1731fAA31.A01();
            } else {
                c1744fNA00 = super.A08.A31().A00();
            }
            this.A01 = c1744fNA00;
            this.A0T.setViewShowsOverMedia(true);
            this.A0T.setUpButtonColors(this.A01);
            this.A0S.A0l(configuration.orientation);
            return;
        }
        if (this.A05 != null) {
            this.A05.A0M(configuration.orientation);
        } else if (this.A03 != null) {
            this.A03.A0F(configuration.orientation);
        } else {
            if (this.A06 == null) {
                return;
            }
            this.A06.A0a(configuration.orientation);
        }
    }

    @Override // android.widget.RelativeLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        View expandableLayout;
        super.onLayout(z11, i5, i11, i12, i13);
        if (!getAdDataBundle().A2M() && (expandableLayout = this.A0S.getExpandableLayout()) != null && z11 && this.A08 == null) {
            this.A08 = new C0777Ai(expandableLayout, 300, expandableLayout.getHeight(), 0);
            this.A0f.A0L(this.A08);
            this.A0f.A0J();
        }
    }

    @Override // android.view.View
    public final void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        if (z11) {
            A1k(false);
        } else {
            this.A0B = true;
            A1j(false);
        }
    }
}
