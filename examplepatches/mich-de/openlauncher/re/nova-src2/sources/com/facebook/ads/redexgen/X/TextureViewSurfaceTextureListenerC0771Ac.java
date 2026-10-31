package com.facebook.ads.redexgen.X;

import android.app.Activity;
import android.graphics.SurfaceTexture;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.AttributeSet;
import android.util.Log;
import android.view.Surface;
import android.view.TextureView;
import android.view.View;
import android.widget.MediaController;
import com.facebook.ads.internal.settings.AdInternalSettings;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.Ac, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class TextureViewSurfaceTextureListenerC0771Ac extends TextureView implements TextureView.SurfaceTextureListener, InterfaceC1579cg, InterfaceC1550cD, InterfaceC1577ce {
    public static byte[] A0O;
    public static String[] A0P = {"5i34yksohRV8hSvEB2dTOBGqhO", "V2RNkeamXobpzSRVkM4sjlG", "1HR", "8SLqGCa2wxiVkGjIaPVK9LXerY", "SSmTkZgpl4jZsKBndOsNgmbhAq5FKejN", "hgMiihLf1lx1lIiVFZ8jC", "euSTtDnbG06q2RqThlQcyR1Es6oMHQDw", "iHXqYQoKvaPWKvo"};
    public static final String A0Q;
    public float A00;
    public int A01;
    public int A02;
    public int A03;
    public long A04;
    public long A05;
    public Uri A06;
    public Surface A07;
    public View A08;
    public MediaController A09;
    public C0958Hi A0A;
    public EnumC1664e4 A0B;
    public C1576cd A0C;
    public EnumC1549cC A0D;
    public EnumC1549cC A0E;
    public InterfaceC1548cB A0F;
    public String A0G;
    public boolean A0H;
    public boolean A0I;
    public boolean A0J;
    public boolean A0K;
    public boolean A0L;
    public boolean A0M;
    public boolean A0N;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0O, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 68);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A07() {
        A0O = new byte[]{84, 99, 99, 126, 99, 49, 120, AbstractJsonLexerKt.TC_INVALID, 49, 84, 105, 126, 65, 125, 112, 104, 116, 99, 49, 117, 100, 116, 49, 101, 126, 49, 126, AbstractJsonLexerKt.TC_INVALID, 66, 100, 99, 119, 112, 114, 116, 69, 116, 105, 101, 100, 99, 116, 85, 116, 98, 101, 99, 126, 104, 116, 117, 49, 117, 100, 99, 120, AbstractJsonLexerKt.TC_INVALID, 118, 49, 98, 116, 101, 71, 120, 117, 116, 126, 66, 100, 99, 119, 112, 114, 116, 49, 78, 115, 100, 91, 103, 106, 114, 110, 121, 43, 110, 121, 121, 100, 121, 43, AbstractJsonLexerKt.TC_INVALID, 121, 98, 108, 108, 110, 121, 110, 111, 43, 105, 114, 43, 100, 101, 88, 126, 121, 109, 106, 104, 110, 95, 110, 115, AbstractJsonLexerKt.TC_INVALID, 126, 121, 110, 79, 110, 120, AbstractJsonLexerKt.TC_INVALID, 121, 100, 114, 110, 111, 43, 111, 126, 121, 98, 101, 108, 43, 123, 106, 126, 120, 110, 43, 48, 24, 24, 16, 27, 18, 87, 22, 27, 0, 22, 14, 4, 87, 3, 31, 5, 24, 0, 87, 22, 25, 87, 18, 15, 20, 18, 7, 3, 30, 24, 25, 87, 0, 30, 3, 31, 87, 4, 18, 3, 53, 22, 20, 28, 16, 5, 24, 2, 25, 19, 51, 5, 22, 0, 22, 21, 27, 18, 87, 24, 25, 87, 57, 24, 2, 16, 22, 3, 87, 22, 21, 24, 1, 18, 89, 87, 4, 24, 87, 0, 18, 87, 4, 30, 27, 18, 25, 3, 27, 14, 87, 30, 16, 25, 24, 5, 18, 87, 30, 3, 89, AbstractJsonLexerKt.TC_INVALID, 87, 87, 95, 84, 93, 24, 89, 84, 79, 89, 65, 75, 24, 76, 80, 74, 87, 79, 24, 89, 86, 24, 93, 64, 91, 93, 72, 76, 81, 87, 86, 24, 79, 81, 76, 80, 24, 75, 93, 76, 126, 87, 74, 93, 95, 74, 87, 77, 86, 92, 24, 87, 86, 24, 118, 87, 77, 95, 89, 76, 24, 89, 90, 87, 78, 93, 22, 24, 75, 87, 24, 79, 93, 24, 75, 81, 84, 93, 86, 76, 84, 65, 24, 81, 95, 86, 87, 74, 93, 24, 81, 76, 22, 51, 12, 1, 0, 10, 69, 22, 17, 4, 17, 0, 69, 6, 13, 4, 11, 2, 0, 1, 69, 17, 10, 69, 46, 44, 39, 44, 59, 32, 42};
        String[] strArr = A0P;
        if (strArr[4].charAt(4) == strArr[6].charAt(4)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0P;
        strArr2[3] = "4Rjqxy3w03hT2rk3wOaPN94qCv";
        strArr2[0] = "J56YrdEaTg6GnpCj3tljjm9xxp";
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 12 out of bounds for length 11
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // android.view.TextureView.SurfaceTextureListener
    public final void onSurfaceTextureUpdated(SurfaceTexture surfaceTexture) {
        if (C2203mv.A20(this.A0A) && this.A0D != EnumC1549cC.A08) {
            if (!this.A0L) {
                this.A0L = true;
                this.A0A.A0F().AKH();
            }
            long currentPosition = getCurrentPosition();
            long currentPosition2 = getCurrentPosition();
            long jCurrentTimeMillis = System.currentTimeMillis();
            float volume = getVolume();
            if (this.A0F != null) {
                this.A0F.AF1(currentPosition, currentPosition2, jCurrentTimeMillis, volume);
            }
        }
    }

    static {
        A07();
        A0Q = TextureViewSurfaceTextureListenerC0771Ac.class.getSimpleName();
    }

    public TextureViewSurfaceTextureListenerC0771Ac(C0958Hi c0958Hi) {
        super(c0958Hi);
        this.A0D = EnumC1549cC.A04;
        this.A0E = EnumC1549cC.A04;
        this.A0M = false;
        this.A0N = false;
        this.A0J = false;
        this.A03 = 0;
        this.A02 = 0;
        this.A00 = 1.0f;
        this.A01 = -1;
        this.A0I = false;
        this.A0H = false;
        this.A0B = EnumC1664e4.A04;
        this.A0K = false;
        this.A0L = false;
        this.A0A = c0958Hi;
    }

    public TextureViewSurfaceTextureListenerC0771Ac(C0958Hi c0958Hi, AttributeSet attributeSet) {
        super(c0958Hi, attributeSet);
        this.A0D = EnumC1549cC.A04;
        this.A0E = EnumC1549cC.A04;
        this.A0M = false;
        this.A0N = false;
        this.A0J = false;
        this.A03 = 0;
        this.A02 = 0;
        this.A00 = 1.0f;
        this.A01 = -1;
        this.A0I = false;
        this.A0H = false;
        this.A0B = EnumC1664e4.A04;
        this.A0K = false;
        this.A0L = false;
        this.A0A = c0958Hi;
    }

    public TextureViewSurfaceTextureListenerC0771Ac(C0958Hi c0958Hi, AttributeSet attributeSet, int i5) {
        super(c0958Hi, attributeSet, i5);
        this.A0D = EnumC1549cC.A04;
        this.A0E = EnumC1549cC.A04;
        this.A0M = false;
        this.A0N = false;
        this.A0J = false;
        this.A03 = 0;
        this.A02 = 0;
        this.A00 = 1.0f;
        this.A01 = -1;
        this.A0I = false;
        this.A0H = false;
        this.A0B = EnumC1664e4.A04;
        this.A0K = false;
        this.A0L = false;
        this.A0A = c0958Hi;
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0093  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A04() {
        this.A0C = new C1576cd(this.A0A);
        this.A0C.A0H(this);
        this.A0C.A0G(this);
        this.A0C.A0I(false);
        if (this.A0J && !this.A0I) {
            Activity activityA0E = this.A0A.A0E();
            if (A0P[5].length() != 21) {
                throw new RuntimeException();
            }
            String[] strArr = A0P;
            strArr[4] = "kOzpobq3cn2ENPvO1dz11rE9gYrdsM2t";
            strArr[6] = "XeC6T5eSgweGxN3AGx0qK1AhpVQau6BW";
            if (activityA0E != null) {
                this.A09 = new MediaController(activityA0E);
                this.A09.setAnchorView(this.A08 == null ? this : this.A08);
                this.A09.setMediaPlayer(new C1559cM(this));
                this.A09.setEnabled(true);
            } else {
                this.A09 = null;
            }
        }
        String str = this.A0G;
        String[] strArr2 = A0P;
        if (strArr2[4].charAt(4) != strArr2[6].charAt(4)) {
            A0P[1] = "7OzxCvlMe7OewOex";
            if (str != null) {
                if (this.A0G.length() == 0 || this.A0K) {
                    this.A0C.A0F(this.A0A.A02(), this.A06);
                }
            }
        } else {
            String[] strArr3 = A0P;
            strArr3[4] = "NXAVCVHzJxAz58YH1UEgH4PHy83Kp8aQ";
            strArr3[6] = "f1ODdwAOeVqSGvJpvEMDUKedn4FgojKu";
            if (str != null) {
            }
        }
        setVideoState(EnumC1549cC.A08);
        if (isAvailable()) {
            onSurfaceTextureAvailable(getSurfaceTexture(), 0, 0);
        }
    }

    private void A05() {
        if (this.A0C == null) {
            return;
        }
        C1578cf c1578cfA08 = this.A0C.A08();
        String[] strArr = A0P;
        if (strArr[3].length() != strArr[0].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0P;
        strArr2[3] = "yniwio37QFCiL85s5GWvJngxgc";
        strArr2[0] = "95HbvmBBNGyB2bovEph22CE4vZ";
        if (c1578cfA08 != null) {
            A08(c1578cfA08.A01, c1578cfA08.A00);
        }
    }

    private void A06() {
        if (this.A07 != null) {
            this.A07.release();
            this.A07 = null;
        }
        if (this.A0C != null) {
            this.A0C.A09();
            if (A0P[5].length() != 21) {
                throw new RuntimeException();
            }
            String[] strArr = A0P;
            strArr[3] = "he0jjWxzFB8qDestWT3k7cDZmQ";
            strArr[0] = "YQusGxI3ZRGEiRLtvLIlZ3cCdg";
            this.A0C = null;
        }
        this.A09 = null;
        this.A0N = false;
        setVideoState(EnumC1549cC.A04);
    }

    private void A08(int i5, int i11) {
        if (i5 != this.A03 || i11 != this.A02) {
            this.A03 = i5;
            this.A02 = i11;
            if (this.A03 != 0 && this.A02 != 0) {
                requestLayout();
            }
        }
    }

    public static boolean A09() {
        return C1576cd.A03();
    }

    public final /* synthetic */ void A0A() {
        Activity activity = this.A0A.A0E();
        if (activity != null && activity.isInMultiWindowMode()) {
            return;
        }
        AAH();
        if (A0P[1].length() == 30) {
            throw new RuntimeException();
        }
        String[] strArr = A0P;
        strArr[3] = "ibP83lPIHp18E6DzSXuO582r7E";
        strArr[0] = "bqS8XhAkEDMP7WptTe4caNAUJi";
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public final void AAH() {
        if (!this.A0H) {
            AI4(false, 3);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public final boolean AAU() {
        return this.A0C != null && this.A0C.A0K();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public final boolean AAV() {
        return this.A0N;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public final boolean ABK() {
        return this.A0M;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1579cg
    public final void AGQ(String str, Exception exc) {
        this.A0A.A0F().ADN(str);
        this.A0A.A0F().A45(1);
        setVideoState(EnumC1549cC.A03);
        this.A0A.A08().ABz(A03(362, 7, 13), AbstractC2126lf.A1N, new C2127lg(exc));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1579cg
    public final void AGR(boolean z11, int i5) {
        if (this.A0C == null) {
            return;
        }
        switch (i5) {
            case 1:
                setVideoState(EnumC1549cC.A04);
                return;
            case 2:
                A05();
                if (this.A01 < 0) {
                    return;
                }
                int i11 = this.A01;
                this.A01 = -1;
                InterfaceC1548cB interfaceC1548cB = this.A0F;
                String[] strArr = A0P;
                String str = strArr[2];
                String str2 = strArr[7];
                int length = str.length();
                int seekFrom = str2.length();
                if (length == seekFrom) {
                    throw new RuntimeException();
                }
                A0P[1] = "rrPXv2FoHSgfFGcrQjG2fRVM";
                if (interfaceC1548cB == null) {
                    return;
                }
                InterfaceC1548cB interfaceC1548cB2 = this.A0F;
                int seekFrom2 = getCurrentPosition();
                interfaceC1548cB2.AGy(i11, seekFrom2);
                return;
            case 3:
                A05();
                this.A04 = System.currentTimeMillis();
                setRequestedVolume(this.A00);
                if (this.A05 > 0 && this.A05 < this.A0C.A07()) {
                    this.A0C.A0D(this.A05);
                    this.A05 = 0L;
                }
                if (this.A0C.A06() != 0 && !z11 && this.A0N) {
                    setVideoState(EnumC1549cC.A05);
                    return;
                }
                if (z11 || this.A0D == EnumC1549cC.A06) {
                    return;
                }
                setVideoState(EnumC1549cC.A07);
                if (this.A0E != EnumC1549cC.A0A) {
                    return;
                }
                ALO(this.A0B, 8);
                this.A0E = EnumC1549cC.A04;
                return;
            case 4:
                if (z11) {
                    setVideoState(EnumC1549cC.A06);
                }
                if (this.A0C != null) {
                    this.A0C.A0I(false);
                    if (!z11) {
                        this.A0C.A0A();
                    }
                }
                this.A0N = false;
                return;
            default:
                return;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1577ce
    public final void AHk(int i5, int i11, int i12, float f11) {
        A08(i5, i11);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public final void AI4(boolean z11, int i5) {
        this.A0A.A0F().A41(i5);
        this.A0E = EnumC1549cC.A05;
        this.A0M = z11;
        if (this.A0C != null) {
            this.A0C.A0I(false);
        } else {
            setVideoState(EnumC1549cC.A04);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public final void ALJ(int i5) {
        this.A0A.A0F().ADO(i5);
        setVideoState(EnumC1549cC.A09);
        ALY(5);
        this.A05 = 0L;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public final void ALO(EnumC1664e4 enumC1664e4, int i5) {
        this.A0A.A0F().A4F(i5);
        this.A0M = false;
        this.A0E = EnumC1549cC.A0A;
        this.A0B = enumC1664e4;
        if (this.A0C == null) {
            setup(this.A06);
        } else {
            if (this.A0D != EnumC1549cC.A07 && this.A0D != EnumC1549cC.A05 && this.A0D != EnumC1549cC.A06) {
                return;
            }
            this.A0C.A0I(true);
            setVideoState(EnumC1549cC.A0A);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public final void ALY(int i5) {
        this.A0A.A0F().A4H(i5);
        this.A0E = EnumC1549cC.A04;
        if (this.A0C != null) {
            this.A0C.A0B();
            this.A0C.A09();
            this.A0C = null;
        }
        setVideoState(EnumC1549cC.A04);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public final void destroy() {
        A06();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public int getCurrentPosition() {
        if (this.A0C != null) {
            return (int) this.A0C.A06();
        }
        return 0;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public int getDuration() {
        if (this.A0C == null) {
            return 0;
        }
        return (int) this.A0C.A07();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public long getInitialBufferTime() {
        return this.A04;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public EnumC1664e4 getStartReason() {
        return this.A0B;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public EnumC1549cC getState() {
        return this.A0D;
    }

    public EnumC1549cC getTargetState() {
        return this.A0E;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public int getVideoHeight() {
        return this.A02;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public int getVideoWidth() {
        return this.A03;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public View getView() {
        return this;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public float getVolume() {
        return this.A00;
    }

    @Override // android.view.TextureView, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (C2203mv.A2o(getContext()) && !isHardwareAccelerated()) {
            setVideoState(EnumC1549cC.A03);
            ALY(8);
        }
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final void onSurfaceTextureAvailable(SurfaceTexture surfaceTexture, int i5, int i11) {
        if (this.A07 != null) {
            this.A07.release();
        }
        this.A07 = new Surface(surfaceTexture);
        if (this.A0C == null) {
            return;
        }
        this.A0C.A0E(this.A07);
        if (this.A0D == EnumC1549cC.A05 && !this.A0M) {
            ALO(this.A0B, 7);
        }
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final boolean onSurfaceTextureDestroyed(SurfaceTexture surfaceTexture) {
        if (this.A07 != null) {
            this.A07.release();
            this.A07 = null;
            if (this.A0C != null) {
                try {
                    this.A0C.A0E(null);
                } catch (Exception e3) {
                    this.A0A.A0F().ADN(A03(0, 75, 85) + e3.getMessage());
                }
            }
        }
        if (this.A0D != EnumC1549cC.A05) {
            try {
                AI4(false, 5);
                return true;
            } catch (Exception e11) {
                this.A0A.A0F().ADN(A03(75, 68, 79) + e11.getMessage());
                return true;
            }
        }
        return true;
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final void onSurfaceTextureSizeChanged(SurfaceTexture surfaceTexture, int i5, int i11) {
    }

    @Override // android.view.View
    public final void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        if (this.A0C == null) {
            return;
        }
        if (this.A09 != null && this.A09.isShowing()) {
            return;
        }
        if (!z11) {
            if (this.A0D != EnumC1549cC.A05) {
                if ((this.A0A.A0H().A01() || C2203mv.A25(this.A0A)) && Build.VERSION.SDK_INT >= 24) {
                    new Handler(Looper.getMainLooper()).postDelayed(new Runnable() { // from class: com.facebook.ads.redexgen.X.cO
                        @Override // java.lang.Runnable
                        public final void run() {
                            this.A00.A0A();
                        }
                    }, 1000L);
                    return;
                } else {
                    AAH();
                    return;
                }
            }
            return;
        }
        if (this.A0D != EnumC1549cC.A05 || this.A0M) {
            return;
        }
        ALO(this.A0B, 9);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public final void seekTo(int i5) {
        if (this.A0C != null) {
            this.A01 = getCurrentPosition();
            this.A0C.A0D(i5);
            return;
        }
        long j11 = i5;
        String[] strArr = A0P;
        if (strArr[2].length() == strArr[7].length()) {
            throw new RuntimeException();
        }
        A0P[5] = "kfjJwAtkK1UY2s6fcoM3d";
        this.A05 = j11;
    }

    @Override // android.view.TextureView, android.view.View
    public void setBackgroundDrawable(Drawable drawable) {
        if (Build.VERSION.SDK_INT < 24) {
            super.setBackgroundDrawable(drawable);
            return;
        }
        boolean zIsDebugBuild = AdInternalSettings.isDebugBuild();
        if (A0P[5].length() != 21) {
            throw new RuntimeException();
        }
        A0P[1] = "HF5JdwiOlRNKOfaOH";
        if (!zIsDebugBuild) {
            return;
        }
        Log.w(A0Q, A03(143, 102, 51));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public void setBackgroundPlaybackEnabled(boolean z11) {
        this.A0H = z11;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public void setControlsAnchorView(View view) {
        this.A08 = view;
        view.setOnTouchListener(new ViewOnTouchListenerC1557cK(this));
    }

    @Override // android.view.TextureView, android.view.View
    public void setForeground(Drawable drawable) {
        if (Build.VERSION.SDK_INT < 24) {
            super.setForeground(drawable);
            return;
        }
        if (!AdInternalSettings.isDebugBuild()) {
            return;
        }
        String str = A0Q;
        String[] strArr = A0P;
        if (strArr[3].length() != strArr[0].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0P;
        strArr2[4] = "adR4uJi1AjYNmamYU7fKdN8LPQzpuqJY";
        strArr2[6] = "LCKmfGi2Ka9VnYBnqFwdGZK0MZJmec2m";
        Log.w(str, A03(245, 94, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public void setFullScreen(boolean z11) {
        this.A0J = z11;
        if (z11 && !this.A0I) {
            setOnTouchListener(new ViewOnTouchListenerC1558cL(this));
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public void setRequestedVolume(float f11) {
        this.A00 = f11;
        if (this.A0C != null && this.A0D != EnumC1549cC.A08 && this.A0D != EnumC1549cC.A04) {
            this.A0C.A0C(f11);
        }
    }

    public void setTestMode(boolean z11) {
        this.A0K = z11;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public void setVideoMPD(String str) {
        this.A0G = str;
    }

    private void setVideoState(EnumC1549cC enumC1549cC) {
        if (enumC1549cC != this.A0D) {
            if (this.A0A.A05().AB6()) {
                String str = A03(339, 23, 33) + enumC1549cC;
            }
            this.A0D = enumC1549cC;
            if (this.A0D == EnumC1549cC.A0A) {
                this.A0N = true;
            }
            if (this.A0F != null) {
                this.A0F.AHn(enumC1549cC);
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public void setVideoStateChangeListener(InterfaceC1548cB interfaceC1548cB) {
        this.A0F = interfaceC1548cB;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1550cD
    public void setup(Uri uri) {
        this.A0A.A0F().A44();
        if (this.A0C != null) {
            A06();
        }
        this.A06 = uri;
        setSurfaceTextureListener(this);
        A04();
    }
}
