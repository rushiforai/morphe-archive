package com.facebook.ads.redexgen.X;

import android.animation.AnimatorSet;
import android.net.Uri;
import android.os.Handler;
import android.util.AttributeSet;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import android.widget.Toast;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.Be, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0799Be extends RelativeLayout implements InterfaceC1548cB, InterfaceC1770fn {
    public static byte[] A0G;
    public static String[] A0H = {"bTF0mPynjITMPKd7AWnGFE0wjuUHqGk", "NLuteA0O4hImypGMVaagZ7KROvpQko", "vHIsSgA1dNPe0TxNLDw8T5r", "Tu3OEd7", "fTm", "FLX2LFKD3Z9kyRG7iyj3Ajj18EKg1", "ES7oyLysdjBWPeOJZDQ9P8Sn", "e8"};
    public static final BL A0I;
    public static final BF A0J;
    public static final BD A0K;
    public static final B8 A0L;
    public static final B7 A0M;
    public static final B4 A0N;
    public static final B2 A0O;
    public static final B1 A0P;
    public float A00;
    public int A01;
    public C2232nO A02;
    public C1678eI A03;
    public boolean A04;
    public boolean A05;
    public boolean A06;
    public boolean A07;
    public final Handler A08;
    public final Handler A09;
    public final View.OnTouchListener A0A;
    public final C0958Hi A0B;
    public final C2171mP<AbstractC2172mQ, C2170mO> A0C;
    public final C1732fB A0D;
    public final List<InterfaceC1663e3> A0E;
    public final InterfaceC1550cD A0F;

    public static String A0H(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0G, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 103);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0K() {
        byte[] bArr = {4, 87, 73, 71, 4, 88, 83, 88, 69, 80, 4, 91, 69, 88, 71, 76, 4, 88, 77, 81, 73, 38, 88, 85, 85, 72, 81, 87, 79, 92, 3, 68, 87, 3};
        if (A0H[6].length() != 24) {
            throw new RuntimeException();
        }
        String[] strArr = A0H;
        strArr[5] = "dnbQEbQJ0095hjHrUlDt4BBpkj0Wp";
        strArr[7] = "GI";
        A0G = bArr;
    }

    static {
        A0K();
        A0K = new BD();
        A0I = new BL();
        A0L = new B8();
        A0M = new B7();
        A0J = new BF();
        A0N = new B4();
        A0P = new B1();
        A0O = new B2();
    }

    public C0799Be(C0958Hi c0958Hi) {
        super(c0958Hi);
        this.A0E = new ArrayList();
        this.A08 = new Handler();
        this.A09 = new Handler();
        this.A0C = new C2171mP<>();
        this.A06 = true;
        this.A0D = new C1732fB();
        this.A01 = 200;
        this.A00 = 1.0f;
        this.A0A = new ViewOnTouchListenerC1771fo(this);
        this.A0B = c0958Hi;
        if (A0U(c0958Hi)) {
            this.A0F = new TextureViewSurfaceTextureListenerC0771Ac(c0958Hi);
        } else {
            this.A0F = new TextureViewSurfaceTextureListenerC0770Ab(c0958Hi);
        }
        A0I();
    }

    public C0799Be(C0958Hi c0958Hi, AttributeSet attributeSet) {
        super(c0958Hi, attributeSet);
        this.A0E = new ArrayList();
        this.A08 = new Handler();
        this.A09 = new Handler();
        this.A0C = new C2171mP<>();
        this.A06 = true;
        this.A0D = new C1732fB();
        this.A01 = 200;
        this.A00 = 1.0f;
        this.A0A = new ViewOnTouchListenerC1771fo(this);
        this.A0B = c0958Hi;
        if (A0U(c0958Hi)) {
            this.A0F = new TextureViewSurfaceTextureListenerC0771Ac(c0958Hi, attributeSet);
        } else {
            this.A0F = new TextureViewSurfaceTextureListenerC0770Ab(c0958Hi, attributeSet);
        }
        A0I();
    }

    public C0799Be(C0958Hi c0958Hi, AttributeSet attributeSet, int i5) {
        super(c0958Hi, attributeSet, i5);
        this.A0E = new ArrayList();
        this.A08 = new Handler();
        this.A09 = new Handler();
        this.A0C = new C2171mP<>();
        this.A06 = true;
        this.A0D = new C1732fB();
        this.A01 = 200;
        this.A00 = 1.0f;
        this.A0A = new ViewOnTouchListenerC1771fo(this);
        this.A0B = c0958Hi;
        if (A0U(c0958Hi)) {
            this.A0F = new TextureViewSurfaceTextureListenerC0771Ac(c0958Hi, attributeSet, i5);
        } else {
            this.A0F = new TextureViewSurfaceTextureListenerC0770Ab(c0958Hi, attributeSet, i5);
        }
        A0I();
    }

    private float A06(InterfaceC1550cD interfaceC1550cD) {
        int videoHeight = interfaceC1550cD.getVideoHeight();
        if (videoHeight == 0) {
            return 1.0f;
        }
        int height = interfaceC1550cD.getVideoWidth();
        return height / videoHeight;
    }

    private void A0I() {
        this.A07 = C2203mv.A0s(this.A0B);
        this.A0B.A0F().A40();
        this.A0F.setRequestedVolume(1.0f);
        this.A0F.setVideoStateChangeListener(this);
        this.A03 = new C1678eI(this.A0B, this.A0F);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        layoutParams.addRule(13);
        AbstractC2426qc.A0L(this.A03);
        addView(this.A03, layoutParams);
        setOnTouchListener(this.A0A);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0J() {
        this.A08.postDelayed(new C0803Bi(this), this.A01);
    }

    private final void A0L() {
        for (InterfaceC1663e3 plugin : this.A0E) {
            if (plugin instanceof BP) {
                A0S((BP) plugin);
            }
            plugin.ABd(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0M(int i5) {
        if (C2203mv.A0z(this.A0B)) {
            Toast.makeText(this.A0B, A0H(21, 13, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE) + (i5 / 1000.0f) + A0H(0, 21, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE), 1).show();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0N(EnumC2231nN enumC2231nN) {
        if (this.A02 == null) {
            return;
        }
        this.A02.A04(enumC2231nN, null);
    }

    private void A0R(InterfaceC1663e3 interfaceC1663e3) {
        if (interfaceC1663e3 instanceof BP) {
            A0T((BP) interfaceC1663e3);
        }
        interfaceC1663e3.ALp(this);
    }

    private void A0S(BP bp2) {
        if (bp2.getParent() == null) {
            if (bp2 instanceof C5B) {
                this.A03.A02(bp2);
            } else {
                addView(bp2);
            }
        }
    }

    private void A0T(BP bp2) {
        if (bp2 instanceof C5B) {
            this.A03.A03(bp2);
        } else {
            AbstractC2426qc.A0K(bp2);
        }
    }

    private boolean A0U(C0958Hi c0958Hi) {
        return C2203mv.A34(c0958Hi, C1576cd.A03());
    }

    public final void A0X() {
        this.A0F.setVideoStateChangeListener(null);
        this.A0F.destroy();
    }

    public final void A0Y() {
        if (A0o()) {
            return;
        }
        this.A0F.AAH();
    }

    public final void A0Z() {
        Iterator<InterfaceC1663e3> it = this.A0E.iterator();
        while (true) {
            boolean zHasNext = it.hasNext();
            if (A0H[0].length() != 31) {
                throw new RuntimeException();
            }
            A0H[0] = "GYUlZXdJo7nruMh2UHaMalRUd7rYm0D";
            if (zHasNext) {
                A0R(it.next());
            } else {
                this.A0E.clear();
                String[] strArr = A0H;
                if (strArr[4].length() != strArr[3].length()) {
                    String[] strArr2 = A0H;
                    strArr2[4] = "dBG";
                    strArr2[3] = "pEPub8w";
                    return;
                }
                return;
            }
        }
    }

    public final void A0a(int i5) {
        RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.A03.getLayoutParams();
        layoutParams.removeRule(13);
        layoutParams.removeRule(10);
        layoutParams.removeRule(9);
        if (this.A00 == 1.0f) {
            InterfaceC1550cD interfaceC1550cD = this.A0F;
            if (A0H[0].length() != 31) {
                throw new RuntimeException();
            }
            String[] strArr = A0H;
            strArr[4] = "I7V";
            strArr[3] = "Q5Fe3RK";
            this.A00 = A06(interfaceC1550cD);
        }
        if (i5 == 1) {
            layoutParams.addRule(10);
        } else if (AbstractC2361pZ.A05(this.A00)) {
            layoutParams.addRule(13);
        } else {
            layoutParams.addRule(9);
        }
        this.A03.setLayoutParams(layoutParams);
    }

    public final void A0b(int i5) {
        this.A08.removeCallbacksAndMessages(null);
        this.A0F.seekTo(i5);
    }

    public final void A0c(int i5) {
        this.A0F.ALY(i5);
    }

    public final void A0d(AnimatorSet animatorSet, boolean z11) {
        this.A03.A01(animatorSet, z11);
    }

    public final void A0e(EnumC1718ex enumC1718ex) {
        C0800Bf c0800Bf = new C0800Bf(this);
        if (this.A07) {
            ExecutorC2419qV.A00(c0800Bf);
        } else {
            Handler handler = this.A09;
            if (A0H[6].length() != 24) {
                throw new RuntimeException();
            }
            A0H[6] = "kK0l9LoMdPIpLA2D0gOeof4W";
            handler.post(c0800Bf);
        }
        this.A0F.ALJ(enumC1718ex.A03());
    }

    public final void A0f(EnumC1664e4 enumC1664e4, int i5) {
        if (this.A04 && this.A0F.getState() == EnumC1549cC.A06) {
            this.A04 = false;
            this.A0D.A00();
        }
        this.A0F.ALO(enumC1664e4, i5);
    }

    public final void A0g(InterfaceC1663e3 interfaceC1663e3) {
        this.A0E.add(interfaceC1663e3);
    }

    public final void A0h(InterfaceC1663e3 interfaceC1663e3) {
        this.A0E.remove(interfaceC1663e3);
        A0R(interfaceC1663e3);
    }

    public final void A0i(boolean z11) {
        A0j(z11, 0);
    }

    public final void A0j(boolean z11, int i5) {
        if (A0o()) {
            return;
        }
        this.A0F.AI4(z11, i5);
    }

    public final void A0k(boolean z11, boolean z12, int i5) {
        this.A06 = z12;
        A0j(z11, i5);
    }

    public final boolean A0l() {
        return this.A0F.AAU();
    }

    public final boolean A0m() {
        return this.A0F.AAV();
    }

    public final boolean A0n() {
        return getVolume() == 0.0f;
    }

    public final boolean A0o() {
        return getState() == EnumC1549cC.A05;
    }

    public final boolean A0p() {
        return A0o() && this.A0F.ABK();
    }

    public final boolean A0q() {
        return getState() == EnumC1549cC.A0A;
    }

    public final boolean A0r() {
        return this.A07;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1770fn
    public final boolean AB8() {
        return A0U(this.A0B);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1770fn
    public final boolean ABD() {
        return this.A05;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1548cB
    public final void AF1(final long j11, final long j12, final long j13, final float f11) {
        if (!C2203mv.A20(this.A0B)) {
            return;
        }
        this.A0C.A02(new BO(j11, j12, j13, f11) { // from class: com.facebook.ads.redexgen.X.5X
        });
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1548cB
    public final void AFs() {
        A0j(true, 4);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1548cB
    public final void AFt() {
        A0f(EnumC1664e4.A05, 6);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1548cB
    public final void AGy(int i5, int i11) {
        C0801Bg c0801Bg = new C0801Bg(this, i5, i11);
        if (this.A07) {
            ExecutorC2419qV.A00(c0801Bg);
        } else {
            this.A09.post(c0801Bg);
        }
        A0J();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1548cB
    public final void AHn(EnumC1549cC enumC1549cC) {
        int currentPositionInMillis = getCurrentPositionInMillis();
        int currentPositionMS = getDuration();
        C0802Bh c0802Bh = new C0802Bh(this, enumC1549cC, currentPositionInMillis, currentPositionMS);
        if (this.A07) {
            ExecutorC2419qV.A00(c0802Bh);
        } else {
            this.A09.post(c0802Bh);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1770fn
    public int getCurrentPositionInMillis() {
        return this.A0F.getCurrentPosition();
    }

    public int getDuration() {
        return this.A0F.getDuration();
    }

    public C2171mP<AbstractC2172mQ, C2170mO> getEventBus() {
        return this.A0C;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1770fn
    public long getInitialBufferTime() {
        return this.A0F.getInitialBufferTime();
    }

    public List<InterfaceC1663e3> getPlugins() {
        return this.A0E;
    }

    public EnumC1549cC getState() {
        return this.A0F.getState();
    }

    public Handler getStateHandler() {
        return this.A09;
    }

    public TextureView getTextureView() {
        return (TextureView) this.A0F;
    }

    public int getVideoHeight() {
        return this.A0F.getVideoHeight();
    }

    public View getVideoImplView() {
        return this.A0F.getView();
    }

    public int getVideoProgressReportIntervalMs() {
        return this.A01;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1770fn
    public EnumC1664e4 getVideoStartReason() {
        return this.A0F.getStartReason();
    }

    public View getVideoView() {
        return this.A03;
    }

    public int getVideoWidth() {
        return this.A0F.getVideoWidth();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1770fn
    public float getVolume() {
        return this.A0F.getVolume();
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        this.A0C.A02(A0O);
        super.onAttachedToWindow();
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        this.A0C.A02(A0P);
        super.onDetachedFromWindow();
    }

    public void setBackgroundPlaybackEnabled(boolean z11) {
        this.A0F.setBackgroundPlaybackEnabled(z11);
    }

    public void setControlsAnchorView(View view) {
        if (this.A0F != null) {
            this.A0F.setControlsAnchorView(view);
        }
    }

    public void setFunnelLoggingHandler(C2232nO c2232nO) {
        this.A02 = c2232nO;
    }

    public void setIsFullScreen(boolean z11) {
        this.A05 = z11;
        this.A0F.setFullScreen(z11);
    }

    @Override // android.view.View
    public void setLayoutParams(ViewGroup.LayoutParams layoutParams) {
        super.setLayoutParams(layoutParams);
    }

    public void setRoundedCornerVideoView(float f11) {
        this.A03.setRoundedCornersVideoStyle(f11);
    }

    public void setVideoMPD(String str) {
        this.A0F.setVideoMPD(str);
    }

    public void setVideoProgressReportIntervalMs(int i5) {
        this.A01 = i5;
    }

    public void setVideoURI(Uri uri) {
        if (uri == null) {
            A0Z();
        } else {
            A0L();
            this.A0F.setup(uri);
        }
        this.A04 = false;
        this.A0D.A00();
    }

    public void setVideoURI(String str) {
        this.A0B.A0F().A4A(str);
        setVideoURI(str != null ? AbstractC2351pP.A00(str) : null);
    }

    public void setVolume(float f11) {
        if (f11 == 1.0f) {
            A0N(EnumC2231nN.A11);
            this.A0B.A0F().A4E();
        } else {
            A0N(EnumC2231nN.A10);
            this.A0B.A0F().A4D();
        }
        this.A0F.setRequestedVolume(f11);
        C2171mP<AbstractC2172mQ, C2170mO> eventBus = getEventBus();
        if (A0H[2].length() == 19) {
            throw new RuntimeException();
        }
        A0H[2] = "etD2zaPMct9y2wbR2YehsJmmTem";
        eventBus.A02(A0N);
    }
}
