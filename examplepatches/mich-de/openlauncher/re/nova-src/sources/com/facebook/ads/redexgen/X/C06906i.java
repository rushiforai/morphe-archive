package com.facebook.ads.redexgen.X;

import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.view.View;
import android.widget.RelativeLayout;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.6i, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C06906i extends ED {
    public C2502rq A00;
    public InterfaceC2749vp A01;
    public C2312oj A02;
    public boolean A03;
    public boolean A04;
    public boolean A05;
    public RelativeLayout A06;
    public C0823Cc A07;
    public final C0958Hi A08;
    public final BM A09;
    public final BG A0A;
    public final BE A0B;
    public final BC A0C;
    public final B3 A0D;
    public final String A0E;
    public final Paint A0F;
    public final Path A0G;
    public final RectF A0H;
    public final C2689ur A0I;
    public static String[] A0J = {"dJoea1DbFsfm9GTpKIzcXYdmCRfBe4FS", "N1xc2MysRccxXRgwDgHXZSQeh7bFq7uk", "3nDu3mubCrSGPsHb", "SUxuavEQD34fwSKO8hxc7w", "hmAyL1Y1BI3zOyZEMNvfuG", "1nycCDmAbpyAo4RWRzHJ2ixoeiRT", "fh6VcnyoMwgZMcb2oBIx6", "bmD"};
    public static final int A0L = (int) (AbstractC2385px.A02 * 0.0f);
    public static final int A0M = (int) (AbstractC2385px.A02 * 9.0f);
    public static final int A0K = (int) (AbstractC2385px.A02 * 9.0f);

    public C06906i(C2689ur c2689ur, boolean z11, String str, C0823Cc c0823Cc) {
        super(c2689ur, z11);
        this.A0G = new Path();
        this.A0H = new RectF();
        this.A0D = new B3() { // from class: com.facebook.ads.redexgen.X.6n
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(B4 b42) {
                if (this.A00.getVideoView() != null) {
                    this.A00.A07.A0T().setVolume(this.A00.getVideoView().getVolume());
                }
            }
        };
        this.A09 = new BM() { // from class: com.facebook.ads.redexgen.X.6m
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5Y c5y) {
                this.A00.A01();
                Object tag = this.A00.getTag(-1593835536);
                if (tag != null) {
                    this.A00.A07.A0R().AHW(((Integer) tag).intValue());
                }
            }
        };
        this.A0B = new BE() { // from class: com.facebook.ads.redexgen.X.6l
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(BF bf2) {
                this.A00.A00();
                this.A00.A07.A0S().AHi(this.A00);
            }
        };
        this.A0A = new BG() { // from class: com.facebook.ads.redexgen.X.6k
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5W c5w) {
                this.A00.A01();
                this.A00.A07.A0S().AHg(this.A00);
            }
        };
        this.A0C = new BC() { // from class: com.facebook.ads.redexgen.X.6j
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(BD bd2) {
                this.A00.A05 = true;
                this.A00.A02();
            }
        };
        this.A0I = c2689ur;
        this.A07 = c0823Cc;
        this.A0E = str;
        this.A08 = c2689ur.A06();
        setGravity(17);
        setPadding(A0L, 0, A0L, A0L);
        AbstractC2426qc.A0O(this, 0);
        setUpView(this.A08);
        this.A0F = new Paint();
        this.A0F.setColor(-16777216);
        this.A0F.setStyle(Paint.Style.FILL);
        this.A0F.setAlpha(16);
        this.A0F.setAntiAlias(true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A00() {
        if (this.A0I.A0E() != null && this.A02 != null) {
            this.A0I.A0E().ABd(this.A02.getSimpleVideoView());
            if (C2203mv.A2M(getContext())) {
                this.A0I.A0E().A0B(false);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A01() {
        if (this.A0I.A0E() != null) {
            this.A0I.A0E().A06();
            if (this.A02 != null) {
                this.A0I.A0E().ALp(this.A02.getSimpleVideoView());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A02() {
        if (this.A01 == null) {
            return;
        }
        if (!A1o() || !this.A05) {
            boolean zA1o = A1o();
            String[] strArr = A0J;
            if (strArr[3].length() != strArr[4].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0J;
            strArr2[3] = "whWH7G9NZGoicUCMK8TGye";
            strArr2[4] = "jQqQ2QRGHP0rmsCqitHuog";
            if (zA1o || !this.A04) {
                return;
            }
        }
        this.A01.ADv();
    }

    private void A03(View view) {
        RelativeLayout.LayoutParams layoutParams;
        if (view == null || (layoutParams = (RelativeLayout.LayoutParams) view.getLayoutParams()) == null) {
            return;
        }
        layoutParams.addRule(13, -1);
        view.setLayoutParams(layoutParams);
    }

    public static void A04(View view) {
        view.setLayoutParams(new RelativeLayout.LayoutParams(-1, -2));
        AbstractC2426qc.A0L(view);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A0H() {
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1g() {
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.ED
    public final void A1k() {
        if (A1o() && this.A02 != null) {
            this.A02.A01();
        }
    }

    @Override // com.facebook.ads.redexgen.X.ED
    public final void A1l() {
        if (A1o()) {
            A1m();
            if (this.A02 != null) {
                this.A02.A05(EnumC1664e4.A03);
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.ED
    public final void A1m() {
        float volume = this.A07.A0T().getVolume();
        if (!A1o() || this.A02 == null) {
            return;
        }
        float newVolume = this.A02.getVolume();
        if (volume != newVolume) {
            this.A02.setVolume(volume);
        }
    }

    @Override // com.facebook.ads.redexgen.X.ED
    public final boolean A1n() {
        return A1o() && this.A02 != null && this.A02.A06();
    }

    @Override // com.facebook.ads.redexgen.X.ED
    public final boolean A1o() {
        return this.A03;
    }

    public final void A1p(Map<String, String> extraParams) {
        if (this.A02 != null) {
            this.A02.A02();
            if (A1o()) {
                this.A02.A04(getAdEventManager(), this.A0E, extraParams);
            }
        }
    }

    public final C2312oj getVideoView() {
        return this.A02;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un, android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        this.A0G.reset();
        this.A0H.set(0.0f, 0.0f, getWidth(), getHeight());
        int i5 = 0;
        int radius = getResources().getConfiguration().orientation;
        boolean z11 = radius == 1;
        if (z11) {
            i5 = A0K;
        }
        this.A0G.addRoundRect(this.A0H, i5, i5, Path.Direction.CW);
        canvas.drawPath(this.A0G, this.A0F);
        RectF rectF = this.A0H;
        int radius2 = A0L;
        float f11 = radius2;
        int width = getWidth();
        int radius3 = A0L;
        float f12 = width - radius3;
        int height = getHeight();
        int radius4 = A0L;
        rectF.set(f11, 0.0f, f12, height - radius4);
        if (z11) {
            i5 = A0M;
        }
        this.A0G.addRoundRect(this.A0H, i5, i5, Path.Direction.CW);
        canvas.clipPath(this.A0G);
        super.onDraw(canvas);
    }

    public void setCTAInfo(C1746fP c1746fP, Map<String, String> extraData) {
        getCtaButton().setCta(c1746fP, this.A0E, extraData);
    }

    public void setImageUrl(String str) {
        if (this.A00 != null) {
            this.A00.setVisibility(0);
            new AsyncTaskC0892Et(this.A00, this.A08).A04().A06(new C0881Ei(this)).A07(str);
        }
        if (this.A02 != null) {
            this.A02.setVisibility(8);
        }
    }

    public void setIsVideo(boolean z11) {
        this.A03 = z11;
    }

    public void setOnAssetsLoadedListener(InterfaceC2749vp interfaceC2749vp) {
        this.A01 = interfaceC2749vp;
    }

    public void setUpImageView(C0958Hi c0958Hi) {
        this.A00 = new C2502rq(c0958Hi);
        if (C2203mv.A1J(c0958Hi)) {
            AbstractC2621tl.A00(this.A00, C2203mv.A1K(c0958Hi), new ViewOnClickListenerC2653uH(this));
        }
        A04(this.A00);
    }

    public void setUpMediaContainer(C0958Hi c0958Hi) {
        this.A06 = new RelativeLayout(c0958Hi);
        A04(this.A06);
        if (this.A00 != null) {
            this.A06.addView(this.A00);
            A03(this.A00);
        }
        if (this.A02 != null) {
            this.A06.addView(this.A02);
            A03(this.A02);
        }
        addView(this.A06);
    }

    public void setUpVideoView(C0958Hi c0958Hi) {
        this.A02 = new C2312oj(c0958Hi, new C2232nO(this.A0E, getAdEventManager()));
        if (C2203mv.A1L(c0958Hi)) {
            AbstractC2621tl.A00(this.A02, C2203mv.A1M(c0958Hi), new ViewOnClickListenerC2654uI(this));
        }
        A04(this.A02);
    }

    private void setUpView(C0958Hi c0958Hi) {
        setUpImageView(c0958Hi);
        setUpVideoView(c0958Hi);
        setUpMediaContainer(c0958Hi);
    }

    public void setVideoPlaceholderUrl(String str) {
        if (this.A02 != null) {
            this.A02.setPlaceholderUrl(str);
        }
    }

    public void setVideoUrl(String str) {
        if (this.A00 != null) {
            C2502rq c2502rq = this.A00;
            if (A0J[5].length() == 10) {
                throw new RuntimeException();
            }
            A0J[2] = "s54OOOYMcUndmM7F";
            c2502rq.setVisibility(8);
        }
        if (this.A02 != null) {
            this.A02.setVisibility(0);
            this.A02.setVideoURI(str);
            this.A02.A03(this.A0D);
            this.A02.A03(this.A09);
            this.A02.A03(this.A0B);
            this.A02.A03(this.A0A);
            this.A02.A03(this.A0C);
        }
    }
}
