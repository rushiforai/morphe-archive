package com.facebook.ads.redexgen.X;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.view.View;
import android.widget.RelativeLayout;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Map;
import javax.annotation.Nullable;

/* renamed from: com.facebook.ads.redexgen.X.6V, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public abstract class C6V extends ED implements InterfaceC2378pq {
    public static byte[] A0L;
    public static String[] A0M = {"ZJd3r9AhG0a", "i1M", "myOt", "scTs", "x2qjzjwt5KjNEBlbZiSy7b60v5gMv07i", "l9mbaUlHikXHnlqbzXlarwn", "RgzjkxP8tSu3AToRYAuzqOa1HsgYA", "48ukShptsWaLS3SUfEjE876"};
    public static final int A0N;
    public static final int A0O;
    public static final int A0P;
    public RelativeLayout A00;
    public C2502rq A01;

    @Nullable
    public InterfaceC2749vp A02;
    public C0823Cc A03;
    public C2312oj A04;
    public boolean A05;
    public boolean A06;
    public boolean A07;
    public final Paint A08;
    public final Path A09;
    public final RectF A0A;
    public final C0958Hi A0B;
    public final C2380ps A0C;
    public final InterfaceC2459r9 A0D;
    public final C2689ur A0E;
    public final BM A0F;
    public final BG A0G;
    public final BE A0H;
    public final BC A0I;
    public final B3 A0J;
    public final String A0K;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0L, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 74);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A0L = new byte[]{34, 32, 49, 46, 52, 50, 36, 43, 30, 34, 32, 49, 35};
    }

    public abstract void A1q(C0958Hi c0958Hi);

    static {
        A03();
        A0O = (int) (AbstractC2385px.A02 * 1.0f);
        A0P = (int) (AbstractC2385px.A02 * 4.0f);
        A0N = (int) (AbstractC2385px.A02 * 6.0f);
    }

    public C6V(C2689ur c2689ur, boolean z11, String str, C0823Cc c0823Cc) {
        super(c2689ur, z11);
        this.A09 = new Path();
        this.A0A = new RectF();
        this.A0J = new B3() { // from class: com.facebook.ads.redexgen.X.6a
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(B4 b42) {
                this.A00.A03.A0T().setVolume(this.A00.getVideoView().getVolume());
            }
        };
        this.A0F = new BM() { // from class: com.facebook.ads.redexgen.X.6Z
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5Y c5y) {
                Object tag = this.A00.getTag(-1593835536);
                if (tag != null) {
                    this.A00.A03.A0R().AHW(((Integer) tag).intValue());
                }
            }
        };
        this.A0H = new BE() { // from class: com.facebook.ads.redexgen.X.6Y
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(BF bf2) {
                this.A00.A03.A0S().AHi(this.A00);
            }
        };
        this.A0G = new BG() { // from class: com.facebook.ads.redexgen.X.6X
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5W c5w) {
                this.A00.A03.A0S().AHg(this.A00);
            }
        };
        this.A0I = new BC() { // from class: com.facebook.ads.redexgen.X.6W
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(BD bd2) {
                this.A00.A07 = true;
                this.A00.A02();
            }
        };
        this.A0D = c2689ur.A0C();
        this.A0E = c2689ur;
        this.A03 = c0823Cc;
        this.A0K = str;
        this.A0B = c2689ur.A06();
        this.A0C = C2380ps.A00(c2689ur.A06(), c2689ur.A05(), this);
        setGravity(17);
        setPadding(A0O, 0, A0O, A0O);
        AbstractC2426qc.A0O(this, 0);
        setUpView(this.A0B);
        this.A08 = new Paint();
        this.A08.setColor(-16777216);
        this.A08.setStyle(Paint.Style.FILL);
        this.A08.setAlpha(16);
        this.A08.setAntiAlias(true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A02() {
        if (this.A02 == null) {
            return;
        }
        if ((A1o() && this.A07) || (!A1o() && this.A06)) {
            this.A02.ADv();
        }
    }

    private void A04(View view) {
        view.setLayoutParams(new RelativeLayout.LayoutParams(-1, -2));
        AbstractC2426qc.A0L(view);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public boolean A0H() {
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1Q() {
        super.A1Q();
        this.A0C.A03();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1g() {
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.ED
    public final void A1k() {
        if (A1o()) {
            this.A04.A01();
        }
    }

    @Override // com.facebook.ads.redexgen.X.ED
    public final void A1l() {
        if (A1o()) {
            A1m();
            this.A04.A05(EnumC1664e4.A03);
        }
    }

    @Override // com.facebook.ads.redexgen.X.ED
    public final void A1m() {
        float volume = this.A03.A0T().getVolume();
        if (A1o()) {
            float newVolume = this.A04.getVolume();
            if (volume != newVolume) {
                this.A04.setVolume(volume);
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.ED
    public final boolean A1n() {
        return A1o() && this.A04.A06();
    }

    @Override // com.facebook.ads.redexgen.X.ED
    public final boolean A1o() {
        return this.A05;
    }

    public final /* synthetic */ void A1p(View view) {
        getCtaButton().A0E(A01(0, 13, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE));
    }

    public final void A1r(Map<String, String> extraParams) {
        this.A04.A02();
        if (A1o()) {
            this.A04.A04(getAdEventManager(), this.A0K, extraParams);
        }
    }

    public final RelativeLayout getMediaContainer() {
        return this.A00;
    }

    public final C2312oj getVideoView() {
        return this.A04;
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        this.A09.reset();
        this.A0A.set(0.0f, 0.0f, getWidth(), getHeight());
        this.A09.addRoundRect(this.A0A, A0N, A0N, Path.Direction.CW);
        canvas.drawPath(this.A09, this.A08);
        this.A0A.set(A0O, 0.0f, getWidth() - A0O, getHeight() - A0O);
        this.A09.addRoundRect(this.A0A, A0P, A0P, Path.Direction.CW);
        canvas.clipPath(this.A09);
        super.onDraw(canvas);
    }

    public void setAdTitleAndDescription(String str, String str2) {
        getTitleDescContainer().A04(str, str2, null, true, false);
    }

    public void setCTAInfo(C1746fP c1746fP, Map<String, String> extraData) {
        getCtaButton().setCta(c1746fP, this.A0K, extraData);
    }

    public void setImageUrl(String str) {
        this.A01.setVisibility(0);
        this.A04.setVisibility(8);
        new AsyncTaskC0892Et(this.A01, this.A0B).A04().A06(new EB(this)).A07(str);
    }

    public void setIsVideo(boolean z11) {
        this.A05 = z11;
    }

    public void setOnAssetsLoadedListener(InterfaceC2749vp interfaceC2749vp) {
        this.A02 = interfaceC2749vp;
    }

    public void setUpImageView(C0958Hi c0958Hi) {
        this.A01 = new C2502rq(c0958Hi);
        if (C2203mv.A1J(c0958Hi)) {
            AbstractC2621tl.A00(this.A01, C2203mv.A1K(c0958Hi), new ViewOnClickListenerC2755vv(this));
        }
        A04(this.A01);
    }

    public void setUpMediaContainer(C0958Hi c0958Hi) {
        this.A00 = new RelativeLayout(c0958Hi);
        A04(this.A00);
        C2379pr c2379prA02 = this.A0C.A02(this.A0E.A05());
        this.A0E.A06().A0H().A00(c2379prA02.A01);
        if (this.A0E.A05().A2O() && C2203mv.A2z(this.A0B)) {
            this.A00.setOnClickListener(new ViewOnClickListenerC2754vu(this));
        } else {
            if (!c2379prA02.A00) {
                return;
            }
            this.A00.setOnClickListener(new View.OnClickListener() { // from class: com.facebook.ads.redexgen.X.vt
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    this.A00.A1p(view);
                }
            });
        }
    }

    public void setUpVideoView(C0958Hi c0958Hi) {
        this.A04 = new C2312oj(c0958Hi, new C2232nO(this.A0K, getAdEventManager()));
        if (C2203mv.A1L(c0958Hi)) {
            AbstractC2621tl.A00(this.A04, C2203mv.A1M(c0958Hi), new ViewOnClickListenerC2756vw(this));
        }
        A04(this.A04);
        String[] strArr = A0M;
        if (strArr[5].length() != strArr[7].length()) {
            throw new RuntimeException();
        }
        A0M[4] = "V2iAUpZbaEbKk91ZDPvMgym9lCZNc3yl";
    }

    private void setUpView(C0958Hi c0958Hi) {
        setUpImageView(c0958Hi);
        setUpVideoView(c0958Hi);
        setUpMediaContainer(c0958Hi);
        this.A00.addView(this.A01);
        this.A00.addView(this.A04);
        A1q(c0958Hi);
    }

    public void setVideoPlaceholderUrl(String str) {
        this.A04.setPlaceholderUrl(str);
    }

    public void setVideoUrl(String str) {
        this.A01.setVisibility(8);
        this.A04.setVisibility(0);
        this.A04.setVideoURI(str);
        this.A04.A03(this.A0J);
        this.A04.A03(this.A0F);
        this.A04.A03(this.A0H);
        this.A04.A03(this.A0G);
        this.A04.A03(this.A0I);
    }
}
