package com.facebook.ads.redexgen.X;

import android.graphics.Canvas;
import android.graphics.Path;
import android.graphics.RectF;
import android.os.Handler;
import android.os.Looper;
import android.view.MotionEvent;
import android.webkit.WebChromeClient;
import android.webkit.WebViewClient;
import java.lang.ref.WeakReference;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

/* renamed from: com.facebook.ads.redexgen.X.Ev, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0894Ev extends AbstractC2607tX {
    public static byte[] A0F;
    public static String[] A0G = {"8gq0YClbFfezV7VWazRrkmUo5IqHlAe0", "DZEC2fF8R1zbFaxtc", "FhN1N87P5UC3PnJCVDWnxEC", "JmSzPmcyjiRof3lizahs2qZ", "A3Evrr3LcR4BJzz79LIh", "2a6NLKfKqYFtWGCWoigE8lnPrM", "Nz12Z6hGfXPsqa2uThDzH9TN", "eI6gTMB0yvKckA2LC3VZ0zYV"};
    public static final String A0H;
    public float A00;
    public C2417qT A01;
    public AbstractC1540c3 A02;
    public C1539c2 A03;
    public boolean A04;
    public boolean A05;
    public boolean A06;
    public final Path A07;
    public final RectF A08;
    public final C0958Hi A09;
    public final WeakReference<InterfaceC2610ta> A0A;
    public final AtomicBoolean A0B;
    public final AtomicBoolean A0C;
    public final AtomicInteger A0D;
    public final AtomicReference<String> A0E;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0F, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A0G;
            if (strArr[7].length() != strArr[6].length()) {
                throw new RuntimeException();
            }
            A0G[1] = "qkBM5EbEKD4bLDmS2";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 94);
            i13++;
        }
    }

    public static void A04() {
        A0F = new byte[]{0, 35, 2, 46, 45, 51, 49, 46, 43};
    }

    static {
        A04();
        A0H = C0894Ev.class.getSimpleName();
    }

    public C0894Ev(C0958Hi c0958Hi, WeakReference<InterfaceC2610ta> weakReference, int i5, String str) {
        this(c0958Hi, weakReference, i5, false);
        if (C2203mv.A1z(c0958Hi)) {
            c0958Hi.A02().A0B().AM8(this, str == null ? A02(0, 0, 74) : str, false, true);
            this.A06 = true;
        }
    }

    public C0894Ev(C0958Hi c0958Hi, WeakReference<InterfaceC2610ta> weakReference, int i5, boolean z11) {
        super(c0958Hi);
        this.A0B = new AtomicBoolean();
        this.A0C = new AtomicBoolean(true);
        this.A07 = new Path();
        this.A08 = new RectF();
        this.A0D = new AtomicInteger(5000);
        this.A0E = new AtomicReference<>();
        this.A01 = new C2417qT();
        this.A05 = true;
        this.A06 = false;
        this.A09 = c0958Hi;
        this.A04 = z11;
        this.A0A = weakReference;
        this.A02 = new C0898Ez(this);
        this.A03 = new C1539c2(this, i5, new WeakReference(this.A02), this.A09);
        setWebChromeClient(A0G());
        setWebViewClient(A0H());
        getSettings().setSupportZoom(false);
        getSettings().setCacheMode(1);
        addJavascriptInterface(new C2609tZ(this, weakReference.get(), this.A03, this.A0B, this.A0C, this.A09), A02(0, 9, 97));
    }

    private final boolean A05() {
        return this.A0B.get();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2607tX
    public final WebChromeClient A0G() {
        return new C2611tb();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2607tX
    public final WebViewClient A0H() {
        return new C2612tc(this.A09, this.A0A, new WeakReference(this.A03), new WeakReference(this.A01), new WeakReference(this.A0C), new WeakReference(this), this.A0D, this.A0E, this.A04);
    }

    public final void A0K() {
        this.A09.A0F().AMA();
        this.A0B.set(true);
        new Handler(Looper.getMainLooper()).post(new C0896Ex(this.A03));
    }

    public final void A0L(int i5, int i11) {
        if (this.A03 != null) {
            this.A03.A0W(i5);
            this.A03.A0X(i11);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2607tX, android.webkit.WebView
    public final void destroy() {
        if (this.A06) {
            this.A09.A02().A0B().ALo(this);
        }
        if (this.A03 != null) {
            this.A03.A0V();
            this.A03 = null;
        }
        AbstractC2426qc.A0K(this);
        this.A02 = null;
        this.A01 = null;
        AbstractC2613td.A03(this);
        super.destroy();
    }

    public C2417qT getTouchDataRecorder() {
        return this.A01;
    }

    public C1539c2 getViewabilityChecker() {
        return this.A03;
    }

    @Override // android.webkit.WebView, android.view.View
    public final void onDraw(Canvas canvas) {
        if (this.A00 > 0.0f) {
            this.A08.set(0.0f, 0.0f, getWidth(), getHeight());
            this.A07.reset();
            this.A07.addRoundRect(this.A08, this.A00, this.A00, Path.Direction.CW);
            canvas.clipPath(this.A07);
        }
        super.onDraw(canvas);
    }

    @Override // android.webkit.WebView, android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        this.A01.A06(this.A09, motionEvent, this, this);
        return super.onTouchEvent(motionEvent);
    }

    @Override // android.webkit.WebView, android.view.View
    public final void onWindowVisibilityChanged(int i5) {
        super.onWindowVisibilityChanged(i5);
        if (this.A0A.get() != null) {
            this.A0A.get();
        }
        if (i5 == 0) {
            InterfaceC1640df interfaceC1640dfA0F = this.A09.A0F();
            if (AbstractC2503rr.A01(interfaceC1640dfA0F.getId())) {
                String strName = EnumC2299oW.A04.name();
                if (A0G[1].length() != 17) {
                    throw new RuntimeException();
                }
                String[] strArr = A0G;
                strArr[7] = "DtJWCHxLbH6gtxJRxIB1oyEG";
                strArr[6] = "cIpyg99BbIZ2paT5Gicx86FT";
                interfaceC1640dfA0F.A5E(strName);
            }
        }
        if (this.A03 == null) {
            return;
        }
        this.A09.A0F().AMO(i5);
        if (i5 == 0 && A05()) {
            this.A03.A0U();
        } else {
            if (i5 != 8) {
                return;
            }
            this.A03.A0V();
        }
    }

    public void setBlockLocalFileAccessOutsideCache(boolean z11) {
        this.A04 = z11;
    }

    public void setCheckAssetsByJavascriptBridge(boolean z11) {
        this.A0C.set(z11);
    }

    public void setCornerRadius(float f11) {
        this.A00 = f11;
        invalidate();
    }

    public void setLogMultipleImpressions(boolean z11) {
        this.A05 = z11;
    }

    public void setRequestId(String str) {
        this.A0E.set(str);
    }

    public void setWebViewTimeoutInMillis(int i5) {
        if (i5 >= 0) {
            this.A0D.set(i5);
        }
    }
}
