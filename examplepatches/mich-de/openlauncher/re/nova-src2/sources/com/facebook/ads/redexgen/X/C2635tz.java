package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.a;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.tz, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2635tz {
    public static byte[] A0D;
    public static String[] A0E = {"w0encVdYtdlBuFlKTlHrfY7S0n4CAx8C", "RPvB1E5DRSMpZE0XwjUJChA7md", InneractiveMediationDefs.GENDER_MALE, "0sdiocFjTGqGOE6eOjz3o9Wki0pUi8AG", "t59k1azDDG0CEGUW7T70unsK474cSBoL", "GDmY36m9tWAlRY7MBLkOah4A", "t", "WOpZArfWPc2Ge2JtC4HX3vgB"};
    public static final C2632tw A0F;
    public final long A00;
    public final Handler A01;
    public final ImageView A02;
    public final ImageView A03;
    public final LinearLayout A04;
    public final LA A05;
    public final C1756fZ A06;
    public final C1819ga A07;
    public final C0958Hi A08;
    public final C2232nO A09;
    public final InterfaceC2459r9 A0A;
    public final Runnable A0B;
    public final String A0C;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public C2635tz(C0958Hi c0958Hi, LA la2, InterfaceC2459r9 interfaceC2459r9, C2232nO c2232nO) {
        this(c0958Hi, la2, interfaceC2459r9, c2232nO, 0L, 16, null);
        C1h.A09(c0958Hi, A04(0, 7, Sdk.SDKError.Reason.TPAT_ERROR_VALUE));
        C1h.A09(la2, A04(7, 10, 111));
        C1h.A09(interfaceC2459r9, A04(91, 8, 66));
    }

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0D, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 80);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A0D = new byte[]{44, 56, 55, 61, 46, 65, 61, 35, 32, 51, 32, 1, 52, 45, 35, 43, 36, 8, 6, 21, -30, 5, -28, 9, 16, 10, 4, 6, 20, -10, 19, 13, -55, -49, -49, -49, -54, 9, 7, 22, -27, 14, 11, 7, 16, 22, -10, 17, 13, 7, 16, -54, -48, -48, -48, -53, 45, 43, 58, 15, 52, 57, 58, 39, 52, 41, 43, -18, -12, -12, -12, -17, -68, -70, -55, -91, -74, -68, -70, -103, -70, -55, -74, -66, -63, -56, 125, -125, -125, -125, 126, -2, -5, 5, 6, -9, 0, -9, 4};
        String[] strArr = A0E;
        if (strArr[2].length() != strArr[6].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0E;
        strArr2[7] = "K7rq3ZqVwi51vIgSRq4yu0Er";
        strArr2[5] = "uBKDrs2e18M4jWmvww3MNJui";
    }

    static {
        A05();
        A0F = new C2632tw(null);
    }

    public C2635tz(C0958Hi c0958Hi, LA la2, InterfaceC2459r9 interfaceC2459r9, C2232nO c2232nO, long j11) {
        C1h.A09(c0958Hi, A04(0, 7, Sdk.SDKError.Reason.TPAT_ERROR_VALUE));
        C1h.A09(la2, A04(7, 10, 111));
        C1h.A09(interfaceC2459r9, A04(91, 8, 66));
        this.A08 = c0958Hi;
        this.A05 = la2;
        this.A0A = interfaceC2459r9;
        this.A09 = c2232nO;
        this.A00 = j11;
        this.A01 = new Handler(Looper.getMainLooper());
        C1819ga c1819gaA00 = AbstractC1820gb.A00(this.A08.A02());
        C1h.A08(c1819gaA00, A04(56, 16, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE));
        this.A07 = c1819gaA00;
        String strA37 = this.A05.A37();
        C1h.A08(strA37, A04(37, 19, 82));
        this.A0C = strA37;
        C1756fZ c1756fZA35 = this.A05.A35();
        C1h.A08(c1756fZA35, A04(72, 19, 5));
        this.A06 = c1756fZA35;
        ImageView imageView = new ImageView(this.A08);
        imageView.setLayoutParams(new LinearLayout.LayoutParams(-2, -2));
        imageView.setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.AD_CHOICE_V2_COLLAPSE));
        AbstractC2426qc.A0H(1104, imageView);
        this.A02 = imageView;
        ImageView imageView2 = new ImageView(this.A08);
        imageView2.setLayoutParams(new LinearLayout.LayoutParams(-2, -2));
        imageView2.setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.AD_CHOICE_V2_EXPAND));
        AbstractC2426qc.A0H(1105, imageView2);
        this.A03 = imageView2;
        this.A0B = new RunnableC2634ty(this);
        LinearLayout linearLayout = new LinearLayout(this.A08);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(12);
        layoutParams.addRule(11);
        layoutParams.setMargins(0, 0, AbstractC2383pv.A0n, 0);
        linearLayout.setLayoutParams(layoutParams);
        linearLayout.setPadding(AbstractC2383pv.A0y, AbstractC2383pv.A0y, 0, 0);
        linearLayout.addView(this.A02);
        linearLayout.addView(this.A03);
        AbstractC2426qc.A0H(1103, linearLayout);
        linearLayout.setOnClickListener(new ViewOnClickListenerC2633tx(this, linearLayout));
        this.A04 = linearLayout;
        A07(8);
    }

    public /* synthetic */ C2635tz(C0958Hi c0958Hi, LA la2, InterfaceC2459r9 interfaceC2459r9, C2232nO c2232nO, long j11, int i5, AbstractC05811i abstractC05811i) {
        this(c0958Hi, la2, interfaceC2459r9, c2232nO, (i5 & 16) != 0 ? a.f39430h : j11);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void A06() {
        C2232nO c2232nO = this.A09;
        if (c2232nO != null) {
            c2232nO.A04(EnumC2231nN.A0A, null);
        }
        if (this.A07.A0O(this.A08.A02(), true)) {
            this.A0A.ABW(this.A0C, this.A06);
            return;
        }
        String strA00 = this.A06.A00();
        C1h.A08(strA00, A04(17, 20, 81));
        if (!(strA00.length() > 0)) {
            return;
        }
        C2347pK.A0P(new C2347pK(), this.A08, AbstractC2351pP.A00(this.A06.A00()), this.A0C);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void A07(int i5) {
        if (i5 == 0) {
            this.A03.setVisibility(0);
            this.A02.setVisibility(8);
        } else {
            this.A03.setVisibility(8);
            this.A02.setVisibility(0);
        }
    }

    public final LinearLayout A0A() {
        return this.A04;
    }

    public final void A0B() {
        this.A01.removeCallbacks(this.A0B);
    }

    public final void A0C() {
        this.A01.removeCallbacks(this.A0B);
        if (this.A03.getVisibility() == 0) {
            A07(8);
        }
    }
}
