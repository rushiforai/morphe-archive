package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.content.res.Configuration;
import android.widget.RelativeLayout;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Do, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC0861Do extends RelativeLayout implements InterfaceC2378pq {
    public static byte[] A0G;
    public static String[] A0H = {"GLI61c", "Gbf2n", "7bd7TV7pMbRIF38Nborxv5epDmSsEj2C", "cQLaEEMMEiimfofb8zDJfbgqVtv3fmi7", "aVi4o9E6lLTFPv8kc2NfhQTkHmvWHalD", "NCa69VsR", "Lfh54ChHEBOQerOMfcW", "6zIvkyWJ8mnF"};
    public static final int A0I;
    public String A00;
    public boolean A01;
    public boolean A02;
    public final AbstractC1540c3 A03;
    public final boolean A04;
    public final boolean A05;
    public final int A06;
    public final int A07;
    public final LA A08;
    public final C0958Hi A09;
    public final InterfaceC2224nG A0A;
    public final C2380ps A0B;
    public final C2417qT A0C;
    public final InterfaceC2459r9 A0D;
    public final InterfaceC2515s3 A0E;
    public final C1539c2 A0F;

    public static String A1W(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0G, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 111);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A1X() {
        byte[] bArr = {124, 51, 58, 124, 85, 112, 52};
        String[] strArr = A0H;
        if (strArr[3].charAt(23) == strArr[2].charAt(23)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0H;
        strArr2[3] = "h3qn7WLUBJgp6gvgJ4ymnM7ynHZRVVWd";
        strArr2[2] = "JzPss5ZdN0xJNYiAE3LRHVWltNu3eEAA";
        A0G = bArr;
    }

    public abstract EnumC1698ec A1a(String str);

    public abstract void A1g();

    public abstract void A1h();

    public abstract void A1j(boolean z11);

    public abstract void A1k(boolean z11);

    public abstract boolean A1o();

    public abstract boolean A1p();

    public abstract boolean A1q();

    public abstract C2597tN getFullScreenAdStyle();

    static {
        A1X();
        A0I = (int) (AbstractC2385px.A02 * 80.0f);
    }

    public AbstractC0861Do(C0958Hi c0958Hi, InterfaceC2515s3 interfaceC2515s3, InterfaceC2224nG interfaceC2224nG, LA la2, int i5, boolean z11, boolean z12, InterfaceC2459r9 interfaceC2459r9, int i11) {
        super(c0958Hi);
        this.A0C = new C2417qT();
        this.A02 = false;
        this.A01 = true;
        this.A00 = A1W(0, 0, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE);
        this.A03 = new C0862Dp(this);
        this.A07 = i5;
        this.A06 = i11;
        this.A09 = c0958Hi;
        this.A05 = z11;
        this.A04 = z12;
        this.A0D = interfaceC2459r9;
        this.A0E = interfaceC2515s3;
        this.A08 = la2;
        this.A0A = interfaceC2224nG;
        this.A0F = new C1539c2(this, 1, new WeakReference(this.A03), c0958Hi);
        this.A0F.A0W(la2.A1J());
        this.A0F.A0X(la2.A1K());
        this.A0B = C2380ps.A00(this.A09, this.A08, this);
        if (this.A08.A2M()) {
            this.A00 = A1V(this.A07, i11);
        }
    }

    public static String A1V(int i5, int i11) {
        return A1W(4, 3, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE) + (i5 + 1) + A1W(0, 4, 51) + i11;
    }

    public void A1b() {
        this.A0B.A03();
    }

    public void A1c() {
    }

    public void A1d() {
    }

    public void A1e() {
    }

    public final void A1f() {
        if (!this.A02) {
            this.A0F.A0U();
            this.A02 = true;
        }
    }

    public void A1i(boolean z11) {
    }

    public boolean A1l() {
        return false;
    }

    public boolean A1m() {
        return false;
    }

    public boolean A1n() {
        return false;
    }

    public boolean A1r(int i5, int i11, Intent intent) {
        return false;
    }

    public LA getAdDataBundle() {
        return this.A08;
    }

    public C1539c2 getAdViewabilityChecker() {
        return this.A0F;
    }

    public int getCurrentPlayCount() {
        return 0;
    }

    public C2417qT getTouchDataRecorder() {
        return this.A0C;
    }

    @Override // android.view.View
    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
    }
}
