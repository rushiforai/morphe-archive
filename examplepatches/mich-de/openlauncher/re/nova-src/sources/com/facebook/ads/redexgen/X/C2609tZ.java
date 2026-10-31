package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.webkit.JavascriptInterface;
import java.lang.ref.WeakReference;
import java.util.concurrent.atomic.AtomicBoolean;

/* renamed from: com.facebook.ads.redexgen.X.tZ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2609tZ {
    public static String[] A07 = {"FOFLIt4izaDLaQDOMIXk8qYNT283z5pM", "oiToeohcscvINDKXEsytRf9HFldaqPXB", "4ipPd9h88IiL3d99rWL92oIsRR1k6HBA", "hPx", "0GhefH5NzI2ypbPnqUG75Cq8VmhNX1", "2b6", "snO0JYp8WiAdMwbOevXppfTs6iFhTSIS", "awSLBYFe7Md8cHgboMT9P3Pgh1wlsZGE"};
    public final String A00 = C2609tZ.class.getSimpleName();
    public final WeakReference<AtomicBoolean> A01;
    public final WeakReference<AtomicBoolean> A02;
    public final WeakReference<InterfaceC1640df> A03;
    public final WeakReference<InterfaceC2610ta> A04;
    public final WeakReference<C1539c2> A05;
    public final WeakReference<C0894Ev> A06;

    public C2609tZ(C0894Ev c0894Ev, InterfaceC2610ta interfaceC2610ta, C1539c2 c1539c2, AtomicBoolean atomicBoolean, AtomicBoolean atomicBoolean2, C0958Hi c0958Hi) {
        this.A06 = new WeakReference<>(c0894Ev);
        this.A04 = new WeakReference<>(interfaceC2610ta);
        this.A05 = new WeakReference<>(c1539c2);
        this.A01 = new WeakReference<>(atomicBoolean);
        this.A02 = new WeakReference<>(atomicBoolean2);
        this.A03 = new WeakReference<>(c0958Hi.A0F());
    }

    private InterfaceC1640df A00() {
        InterfaceC1640df funnel = this.A03.get();
        if (funnel == null) {
            return new C1097Mx();
        }
        return funnel;
    }

    @JavascriptInterface
    public void alert(String str) {
        Log.e(this.A00, str);
    }

    @JavascriptInterface
    public String getAnalogInfo() {
        return AbstractC2392q4.A01(C2136lp.A02());
    }

    @JavascriptInterface
    public void logFunnel(int i5, String str) {
        A00().AMB(i5, str);
    }

    @JavascriptInterface
    public void onMainAssetLoaded() {
        A00().AMC();
        if (this.A06.get() == null || this.A01.get() == null || this.A02.get() == null) {
            return;
        }
        boolean z11 = this.A02.get().get();
        String[] strArr = A07;
        if (strArr[4].length() == strArr[5].length()) {
            throw new RuntimeException();
        }
        A07[1] = "xXjDpbk5Vvc7CvrBd08NYXaJ46SIZN7q";
        if (z11) {
            this.A01.get().set(true);
            A00().AMD();
            if (this.A06.get().isShown()) {
                A00().AME();
                new Handler(Looper.getMainLooper()).post(new C0896Ex(this.A05));
            }
            InterfaceC2610ta interfaceC2610ta = this.A04.get();
            if (interfaceC2610ta != null) {
                new Handler(Looper.getMainLooper()).post(new RunnableC2608tY(this, interfaceC2610ta));
            }
        }
    }

    @JavascriptInterface
    public void onPageInitialized() {
        C0894Ev webView = this.A06.get();
        if (webView == null || webView.A0J()) {
            A00().AMF(true);
            return;
        }
        InterfaceC2610ta listener = this.A04.get();
        if (listener == null) {
            A00().AMF(true);
        } else {
            A00().AMF(false);
            listener.AGD();
        }
    }
}
