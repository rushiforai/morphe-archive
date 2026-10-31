package com.facebook.ads.redexgen.X;

import android.graphics.Canvas;
import android.graphics.Path;
import android.graphics.RectF;
import android.view.View;
import android.widget.RelativeLayout;
import java.util.Arrays;
import java.util.Map;
import javax.annotation.Nullable;

/* renamed from: com.facebook.ads.redexgen.X.5h, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC06635h extends ED implements InterfaceC2378pq {
    public static byte[] A0J;
    public static String[] A0K = {"qhyqdRyY73KxC1tvVKC1RR7Ww7cHpMNI", "u", "iJdLLXjMERWS6nrrifgRezU5bBYClEhc", "x", "WOUUBmwieka2tKtPzyD3Oi2ICBGgzBJ3", "WP6s1WN1sTlakT5s9", "KSyuISu5FHLXIH2Y107I8yc5wcH1bRtg", "Ol7jHPVUjn6ZJiqNSUfBRDjTd93E4eRO"};
    public static final int A0L;

    @Nullable
    public InterfaceC2749vp A00;
    public boolean A01;
    public boolean A02;
    public final int A03;
    public final Path A04;
    public final RectF A05;
    public final RelativeLayout A06;
    public final C0958Hi A07;
    public final C2380ps A08;
    public final InterfaceC2459r9 A09;
    public final C2689ur A0A;
    public final C0823Cc A0B;
    public final C2312oj A0C;
    public final BM A0D;
    public final BG A0E;
    public final BE A0F;
    public final BC A0G;
    public final B3 A0H;
    public final String A0I;

    public static String A0A(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0J, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 87);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0B() {
        A0J = new byte[]{108, 110, 125, 96, 122, 124, 106, 99, 80, 108, 110, 125, 107};
    }

    public abstract void A1t(C0958Hi c0958Hi);

    public abstract void A1u(C0958Hi c0958Hi, InterfaceC1959iv interfaceC1959iv);

    static {
        A0B();
        A0L = (int) (AbstractC2385px.A02 * 1.0f);
    }

    public AbstractC06635h(C2689ur c2689ur, boolean z11, String str, C0823Cc c0823Cc) {
        super(c2689ur, z11);
        this.A04 = new Path();
        this.A05 = new RectF();
        this.A03 = Math.min(AbstractC2385px.A04.widthPixels, AbstractC2385px.A04.heightPixels);
        this.A0H = new B3() { // from class: com.facebook.ads.redexgen.X.5m
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(B4 b42) {
                this.A00.A0B.A0T().setVolume(this.A00.getVideoView().getVolume());
            }
        };
        this.A0D = new BM() { // from class: com.facebook.ads.redexgen.X.5l
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5Y c5y) {
                if (this.A00.getTag(-1593835536) != null) {
                    this.A00.A0B.A0R().AHW(((Integer) this.A00.getTag(-1593835536)).intValue());
                }
            }
        };
        this.A0F = new BE() { // from class: com.facebook.ads.redexgen.X.5k
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(BF bf2) {
                this.A00.A0B.A0S().AHi(this.A00);
            }
        };
        this.A0E = new BG() { // from class: com.facebook.ads.redexgen.X.5j
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5W c5w) {
                this.A00.A0B.A0S().AHg(this.A00);
            }
        };
        this.A0G = new BC() { // from class: com.facebook.ads.redexgen.X.5i
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(BD bd2) {
                this.A00.A02 = true;
                this.A00.A1r();
            }
        };
        this.A09 = c2689ur.A0C();
        this.A0A = c2689ur;
        this.A0B = c0823Cc;
        this.A0I = str;
        this.A07 = c2689ur.A06();
        this.A08 = C2380ps.A00(c2689ur.A06(), c2689ur.A05(), this);
        setGravity(17);
        AbstractC2426qc.A0O(this, 0);
        this.A0C = new C2312oj(this.A07, new C2232nO(this.A0I, getAdEventManager()));
        this.A06 = new RelativeLayout(this.A07);
        setUpView(this.A07);
    }

    private final void A0C() {
        A0E(this.A06);
        C2379pr c2379prA02 = this.A08.A02(this.A0A.A05());
        this.A0A.A06().A0H().A00(c2379prA02.A01);
        if (this.A0A.A05().A2O() && C2203mv.A2z(this.A07)) {
            this.A06.setOnClickListener(new ViewOnClickListenerC2122lb(this));
        } else {
            if (!c2379prA02.A00) {
                return;
            }
            this.A06.setOnClickListener(new View.OnClickListener() { // from class: com.facebook.ads.redexgen.X.li
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    this.A00.A1s(view);
                }
            });
        }
    }

    private final void A0D() {
        if (C2203mv.A1L(this.A07)) {
            AbstractC2621tl.A00(this.A0C, C2203mv.A1M(this.A07), new ViewOnClickListenerC2080kt(this));
        }
        A0E(this.A0C);
    }

    public static void A0E(View view) {
        view.setLayoutParams(new RelativeLayout.LayoutParams(-1, -2));
        AbstractC2426qc.A0L(view);
    }

    private int[] A0G(int i5, int i11, int i12) {
        int[] iArr = new int[2];
        if (i5 > 1 && i5 <= 4) {
            iArr[0] = (this.A03 - i11) / i12;
            int i13 = iArr[0];
            if (A0K[4].charAt(0) != 'W') {
                throw new RuntimeException();
            }
            A0K[4] = "WTV1dVCQcENUUbed7e8E95Qy9FJJmz5N";
            iArr[1] = (int) (i13 * 1.27f);
            return iArr;
        }
        iArr[0] = this.A03;
        iArr[1] = (int) (iArr[0] * 1.27f);
        return iArr;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public boolean A0H() {
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1Q() {
        super.A1Q();
        this.A08.A03();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1g() {
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.ED
    public final void A1k() {
        if (A1o()) {
            this.A0C.A01();
        }
    }

    @Override // com.facebook.ads.redexgen.X.ED
    public final void A1l() {
        if (A1o()) {
            A1m();
            this.A0C.A05(EnumC1664e4.A03);
        }
    }

    @Override // com.facebook.ads.redexgen.X.ED
    public final void A1m() {
        float volume = this.A0B.A0T().getVolume();
        if (A1o()) {
            float newVolume = this.A0C.getVolume();
            if (volume != newVolume) {
                this.A0C.setVolume(volume);
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.ED
    public final boolean A1n() {
        return A1o() && this.A0C.A06();
    }

    @Override // com.facebook.ads.redexgen.X.ED
    public final boolean A1o() {
        return this.A01;
    }

    public final void A1p() {
        getTitleDescContainer().setVisibility(8);
        getCtaButton().setVisibility(8);
    }

    public final void A1q() {
        getCtaButton().A0F();
    }

    public final void A1r() {
        if (this.A00 == null) {
            return;
        }
        this.A00.ADv();
        String[] strArr = A0K;
        if (strArr[1].length() != strArr[3].length()) {
            throw new RuntimeException();
        }
        A0K[0] = "qFZ7enCZmgehLrVIOo4WKB0E9QEWCPAv";
    }

    public final /* synthetic */ void A1s(View view) {
        getCtaButton().A0E(A0A(0, 13, 88));
    }

    public final void A1v(Map<String, String> extraParams) {
        this.A0C.A02();
        if (A1o()) {
            this.A0C.A04(getAdEventManager(), this.A0I, extraParams);
        }
    }

    public final int[] A1w(int i5, int i11, int i12, int i13) {
        if (i5 == 1) {
            return A0G(i11, i12, i13);
        }
        return new int[]{this.A03, this.A03};
    }

    public final RelativeLayout getMediaContainer() {
        return this.A06;
    }

    public final C2312oj getVideoView() {
        return this.A0C;
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        this.A04.reset();
        this.A05.set(A0L, 0.0f, getWidth() - A0L, getHeight() - A0L);
        this.A04.addRoundRect(this.A05, 0.0f, 0.0f, Path.Direction.CW);
        canvas.clipPath(this.A04);
        super.onDraw(canvas);
    }

    public void setAdTitleAndDescription(String str, String str2) {
        getTitleDescContainer().A04(str, str2, null, true, false);
    }

    public void setCTAInfo(C1746fP c1746fP, Map<String, String> extraData) {
        getCtaButton().setCta(c1746fP, this.A0I, extraData);
    }

    public void setOnAssetsLoadedListener(InterfaceC2749vp interfaceC2749vp) {
        this.A00 = interfaceC2749vp;
    }

    private void setUpView(C0958Hi c0958Hi) {
        A0D();
        A0C();
        this.A06.addView(this.A0C);
        A1t(c0958Hi);
    }

    public void setVideo(boolean z11) {
        this.A01 = z11;
    }

    public void setVideoPlaceholderUrl(String str) {
        this.A0C.setPlaceholderUrl(str);
    }

    public void setVideoUrl(String str) {
        this.A0C.setVisibility(0);
        this.A0C.setVideoURI(str);
        this.A0C.A03(this.A0H);
        this.A0C.A03(this.A0D);
        this.A0C.A03(this.A0F);
        this.A0C.A03(this.A0E);
        this.A0C.A03(this.A0G);
    }
}
