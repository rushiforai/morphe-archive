package com.facebook.ads.redexgen.X;

import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;

/* renamed from: com.facebook.ads.redexgen.X.to, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2624to extends LinearLayout {
    public static byte[] A0A;
    public static String[] A0B = {"cmzsI0MqV", "rmZj6bXGr2Mc3k6GGfUNTI8ab", "Oqa2BQOYUIgPEQnUKqUaSgjmS1hAy2aw", "VbR8t651F3u5xAC0yd", "KwIIB1PdAD0xOvkamO3Meu", "6KEr", "QBka00Gf2XeExLF7IYa6e3", b.f42142b};
    public static final LinearLayout.LayoutParams A0C;
    public LinearLayout A00;
    public TextView A01;
    public String A02;
    public boolean A03;
    public final int A04;
    public final View.OnClickListener A05;
    public final RelativeLayout A06;
    public final C0958Hi A07;
    public final ViewOnClickListenerC0884El A08;
    public final C2661uP A09;

    public static String A0h(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0A, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 49);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0i() {
        byte[] bArr = {-56, -53, -53, -52, -37, -56, -48, -45, -38};
        if (A0B[1].length() != 25) {
            throw new RuntimeException();
        }
        A0B[2] = "W8PIFEgMaUlhByfzvyeLgAFdtcDk8ZOz";
        A0A = bArr;
    }

    public abstract void A0l(int i5);

    static {
        A0i();
        A0C = new LinearLayout.LayoutParams(-2, -2);
    }

    public AbstractC2624to(C0958Hi c0958Hi, ViewOnClickListenerC0884El viewOnClickListenerC0884El, int i5, C1744fN c1744fN, boolean z11, String str, InterfaceC2224nG interfaceC2224nG, InterfaceC2459r9 interfaceC2459r9, C1539c2 c1539c2, C2417qT c2417qT, C1750fT c1750fT, boolean z12, String str2) {
        super(c0958Hi);
        this.A02 = A0h(0, 0, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE);
        AbstractC2426qc.A0L(this);
        this.A07 = c0958Hi;
        this.A04 = i5;
        this.A03 = z12;
        this.A02 = str2;
        this.A09 = new C2661uP(c0958Hi);
        AbstractC2426qc.A0O(this.A09, 0);
        AbstractC2426qc.A0H(1106, this.A09);
        if (z12) {
            this.A00 = new LinearLayout(c0958Hi);
            this.A01 = new TextView(c0958Hi);
            AbstractC2426qc.A0L(this.A01);
        }
        if (viewOnClickListenerC0884El == null) {
            this.A08 = new ViewOnClickListenerC0884El(c0958Hi, str, c1744fN, z11, interfaceC2224nG, interfaceC2459r9, c1539c2, c2417qT, c1750fT);
        } else {
            this.A08 = viewOnClickListenerC0884El;
        }
        AbstractC2426qc.A0H(1001, this.A08);
        this.A05 = AbstractC2675ud.A03(this.A08, A0h(0, 9, 54));
        this.A06 = new RelativeLayout(c0958Hi);
        this.A06.setLayoutParams(A0C);
        AbstractC2426qc.A0L(this.A06);
    }

    public void A0j() {
    }

    public void A0k() {
        this.A09.setOnClickListener(this.A05);
    }

    public void A0m(boolean z11) {
    }

    public final ViewOnClickListenerC0884El getCTAButton() {
        return this.A08;
    }

    public View getExpandableLayout() {
        return null;
    }

    public final ImageView getIconView() {
        return this.A09;
    }

    public void setInfo(C1742fL c1742fL, C1746fP c1746fP, String str, String str2, InterfaceC2396q8 interfaceC2396q8, InterfaceC2643u7 interfaceC2643u7) {
        this.A08.setCta(c1746fP, str, new HashMap(), interfaceC2396q8, interfaceC2643u7);
        new AsyncTaskC0892Et(this.A09, this.A07).A05(this.A04, this.A04).A07(str2);
    }

    public void setTitleMaxLines(int i5) {
    }
}
