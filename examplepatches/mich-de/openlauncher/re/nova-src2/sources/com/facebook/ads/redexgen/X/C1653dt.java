package com.facebook.ads.redexgen.X;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.RelativeLayout;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.dt, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1653dt {
    public static byte[] A00;

    static {
        A01();
    }

    public /* synthetic */ C1653dt(AbstractC05811i abstractC05811i) {
        this();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 60);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{105, 101, 100, 126, 111, 114, 126, 38, 42, 48, 43, 49, 33, 42, 50, 43, 7, 36, 55, 105, 118, 123, 122, 112, 93, 126, 109};
    }

    public C1653dt() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void A02(View view) {
        ViewParent parent = view.getParent();
        ViewGroup viewGroup = parent instanceof ViewGroup ? (ViewGroup) parent : null;
        if (viewGroup != null) {
            viewGroup.removeView(view);
        }
    }

    @JvmStatic
    public final C1652ds A04(C0958Hi c0958Hi, C0781Am c0781Am, int i5) {
        C1h.A09(c0958Hi, A00(0, 7, 54));
        C1h.A09(c0781Am, A00(7, 12, Sdk.SDKError.Reason.TPAT_ERROR_VALUE));
        C0781Am fullBar = new C0781Am(c0958Hi, i5);
        fullBar.A0A(AbstractC0891Es.A0g, C1652ds.A02, true);
        AbstractC2426qc.A0L(fullBar);
        fullBar.A09(i5);
        C1652ds container = new C1652ds(c0958Hi, fullBar, c0781Am);
        AbstractC2426qc.A0L(container);
        return container;
    }

    @JvmStatic
    public final C1652ds A05(C0958Hi c0958Hi, C0781Am c0781Am, int i5, int i11, int i12) {
        C1h.A09(c0958Hi, A00(0, 7, 54));
        C1h.A09(c0781Am, A00(19, 8, 35));
        C0781Am emptyBar = new C0781Am(c0958Hi, c0781Am.getCustomDuration());
        emptyBar.A0A(i5, i11, true);
        emptyBar.setPadding(0, 0, 0, 0);
        AbstractC2426qc.A0L(emptyBar);
        C1652ds c1652ds = new C1652ds(c0958Hi, c0781Am, emptyBar);
        AbstractC2426qc.A0H(1109, c1652ds);
        c1652ds.setLayoutParams(new RelativeLayout.LayoutParams(-1, i12));
        return c1652ds;
    }
}
