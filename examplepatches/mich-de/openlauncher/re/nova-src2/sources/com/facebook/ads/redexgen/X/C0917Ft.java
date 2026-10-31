package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import com.facebook.ads.AudienceNetworkActivity;
import com.facebook.ads.internal.api.BuildConfigApi;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import javax.annotation.Nullable;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.Ft, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0917Ft extends RelativeLayout implements InterfaceC2460rA {
    public static byte[] A0I;
    public static String[] A0J = {"VjNTozFJBHBTAbZvfj55MfAwGP9LBSf6", "Pq0aBOwFzXTv3d8c4kUbGJ29Dl7JaeBe", "6Jh9GB1FdSmhvo4jirjJmKwQUVM2B32M", "TGGBgusTs1FvyAgmLwAY3Gsc6eBuJSRW", "x90wDNv6CtBtNBa5WCDyDNAaFj8t5cCY", "GDNjvFSJPJLifqCEdIwxfegvvEeKItWd", "ZGbO0A4ZRQBBFZeQfXm02pkO19XETszh", "zRbEM6nv1u3uOOYe"};
    public static final String A0K;
    public static final int A0L;
    public long A00;
    public long A01;

    @Nullable
    public String A02;
    public boolean A03;

    @Nullable
    public C1760fd A04;

    @Nullable
    public DialogC2494ri A05;
    public String A06;
    public boolean A07;
    public final InterfaceC2004je A08;
    public final LinearLayout A09;
    public final C1998jY A0A;
    public final C0958Hi A0B;
    public final InterfaceC2224nG A0C;
    public final InterfaceC2459r9 A0D;
    public final C2590tG A0E;
    public final InterfaceC2599tP A0F;
    public final F4 A0G;
    public final InterfaceC2604tU A0H;

    public static String A0D(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0I, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A0J;
            if (strArr[1].charAt(18) == strArr[4].charAt(18)) {
                throw new RuntimeException();
            }
            A0J[7] = "WrA4t0RN";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 62);
            i13++;
        }
    }

    public static void A0E() {
        A0I = new byte[]{114, -120, -120, -107, -120, -84, -41, -43, -120, -85, -41, -42, -36, -51, -42, -36, -120, -76, -41, -55, -52, -51, -52, -120, -68, -47, -43, -51, -94, -120, -70, -48, -48, -35, -48, -4, 31, 17, 20, -48, -10, 25, 30, 25, 35, 24, -48, 4, 25, 29, 21, -22, -48, -98, -76, -76, -63, -76, -32, 3, -11, -8, -76, -25, 8, -11, 6, 8, -76, -24, -3, 1, -7, -50, -76, -101, -79, -79, -66, -79, -29, -10, 4, 1, 0, -1, 4, -10, -79, -42, -1, -11, -79, -27, -6, -2, -10, -53, -79, -57, -35, -35, -22, -35, 16, 32, 47, 44, 41, 41, -35, 15, 34, 30, 33, 54, -35, 17, 38, 42, 34, -9, -35, -112, -90, -90, -77, -90, -39, -21, -7, -7, -17, -11, -12, -90, -52, -17, -12, -17, -7, -18, -90, -38, -17, -13, -21, -64, -90, -116, 92, 114, 114, AbstractJsonLexerKt.TC_INVALID, 114, -102, -77, -64, -74, -66, -73, -60, 114, -90, -69, -65, -73, -116, 114, -90, -42, -45, -37, -41, -55, -42, -124, -41, -55, -41, -41, -51, -45, -46, -124, -56, -59, -40, -59, -124, -48, -45, -53, -53, -55, -56, -124, -92, -124, -58, -57, -44, -38, -39, -97, -57, -47, -58, -45, -48, 9, 25, 22, 30, 26, 12, 25, -4, -7, -13, 24, 33, 30, 26, 35, 41, 9, 36, 32, 26, 35, -54, -61, -48, -58, -50, -57, -44, -74, -53, -49, -57, -31, -29, -32, -34, -32, -48, -44, -32, -43, -42, 17, 19, 16, 14, 16, 0, 4, 16, 5, 6, 0, 3, 19, 2, 15, 5, 0, 10, 4, 16, 15, 0, 22, 19, 13, -2, 0, -3, -5, -3, -19, -15, -3, -14, -13, -19, -16, 0, -17, -4, -14, -19, -4, -17, -5, -13, -79, -77, -80, -82, -80, -96, -92, -80, -91, -90, -96, -83, -94, -93, -90, -83, -96, -76, -74, -93, -75, -86, -75, -83, -90, 35, 37, 34, 32, 34, 18, 22, 34, 23, 24, 18, 31, 20, 21, 24, 31, 18, 39, 28, 39, 31, 24};
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final /* synthetic */ void onStart() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final /* synthetic */ void onStop() {
    }

    static {
        A0E();
        A0K = C0917Ft.class.getSimpleName();
        A0L = AbstractC2383pv.A0B;
    }

    public C0917Ft(C1998jY c1998jY, C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, InterfaceC2459r9 interfaceC2459r9, boolean z11) {
        F4 f42;
        super(c0958Hi);
        this.A08 = new C0920Fw(this);
        this.A07 = true;
        this.A01 = -1L;
        this.A03 = true;
        this.A0A = c1998jY;
        this.A0C = interfaceC2224nG;
        this.A0D = interfaceC2459r9;
        this.A0B = c0958Hi;
        if (c0958Hi.A0E() == null) {
            c0958Hi.A0F().AAZ();
        }
        this.A0F = A0F();
        if (AbstractC2204mw.A02(c0958Hi) || c0958Hi.A0E() == null) {
            f42 = new F4(c0958Hi, this.A0F);
        } else {
            f42 = new F4(c0958Hi, c0958Hi.A0E(), this.A0F);
        }
        this.A0G = f42;
        this.A0H = A0C(z11);
        this.A09 = (LinearLayout) this.A0H;
        this.A09.setId(View.generateViewId());
        this.A0H.setListener(new C0919Fv(this));
        this.A0G.setBrowserNavigationListener(this.A0H.getBrowserNavigationListener());
        this.A0E = new C2590tG(c0958Hi, null, 16842872);
        A0G();
        c1998jY.A0A(this.A08);
    }

    private InterfaceC2604tU A0C(boolean z11) {
        if (z11) {
            return new F8(this.A0B, this.A0G, false);
        }
        return new F6(this.A0B, this.A0G);
    }

    public InterfaceC2599tP A0F() {
        return new C0918Fu(this);
    }

    public void A0G() {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(10);
        this.A09.setPadding(AbstractC2383pv.A0e, AbstractC2383pv.A0e, AbstractC2383pv.A0e, AbstractC2383pv.A0e);
        this.A0D.A4V(this.A09, layoutParams);
        RelativeLayout.LayoutParams webViewParams = new RelativeLayout.LayoutParams(-1, -2);
        webViewParams.addRule(3, this.A09.getId());
        webViewParams.addRule(12);
        this.A0D.A4V(this.A0G, webViewParams);
        RelativeLayout.LayoutParams webViewParams2 = new RelativeLayout.LayoutParams(-1, A0L);
        webViewParams2.addRule(3, this.A09.getId());
        this.A0E.setProgress(0);
        this.A0D.A4V(this.A0E, webViewParams2);
    }

    public void A0H() {
        this.A0A.finish(1);
    }

    public void A0I() {
        A0J();
    }

    public final void A0J() {
        AudienceNetworkActivity audienceNetworkActivityA05;
        if (this.A04 == null) {
            return;
        }
        if ((this.A05 != null && this.A05.isShowing()) || (audienceNetworkActivityA05 = this.A0A.A05()) == null || audienceNetworkActivityA05.isFinishing() || audienceNetworkActivityA05.isDestroyed()) {
            return;
        }
        this.A05 = new DialogC2494ri(audienceNetworkActivityA05, this.A0B, this.A04, new C2232nO(this.A06, this.A0C));
        this.A05.show();
    }

    public void A0K(String str) {
    }

    public void ABc(@Nullable Intent intent, Bundle bundle, C1998jY c1998jY) {
        if (this.A01 < 0) {
            this.A01 = System.currentTimeMillis();
        }
        String strA0D = A0D(231, 11, 36);
        String strA0D2 = A0D(Sdk.SDKError.Reason.AD_RESPONSE_RETRY_AFTER_VALUE, 11, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE);
        String strA0D3 = A0D(Sdk.SDKError.Reason.AD_NOT_LOADED_VALUE, 10, 105);
        if (bundle == null) {
            this.A02 = intent.getStringExtra(strA0D3);
            this.A06 = intent.getStringExtra(strA0D2);
            String[] strArr = A0J;
            if (strArr[0].charAt(28) != strArr[2].charAt(28)) {
                throw new RuntimeException();
            }
            A0J[5] = "h34ynCyxETZN0C4DuHOjqZ0ETc7IsjOt";
            this.A00 = intent.getLongExtra(strA0D, -1L);
        } else {
            this.A02 = bundle.getString(strA0D3);
            this.A06 = bundle.getString(strA0D2);
            this.A00 = bundle.getLong(strA0D, -1L);
        }
        String promoCode = this.A02 != null ? this.A02 : A0D(199, 11, 39);
        this.A0H.setUrl(promoCode);
        this.A0G.loadUrl(promoCode);
        InterfaceC1640df interfaceC1640dfA0F = this.A0B.A0F();
        String url = EnumC2299oW.A05.name();
        interfaceC1640dfA0F.A5F(url);
        String url2 = A0D(242, 10, 51);
        String stringExtra = intent.getStringExtra(url2);
        if (stringExtra != null && !stringExtra.isEmpty()) {
            String url3 = A0D(323, 22, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE);
            String stringExtra2 = intent.getStringExtra(url3);
            String url4 = A0D(298, 25, 3);
            String stringExtra3 = intent.getStringExtra(url4);
            String url5 = A0D(277, 21, 80);
            String stringExtra4 = intent.getStringExtra(url5);
            String url6 = A0D(252, 25, 99);
            this.A04 = new C1760fd(stringExtra, stringExtra2, stringExtra3, stringExtra4, intent.getStringExtra(url6));
        }
        A0I();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AGF(boolean z11) {
        this.A0G.onPause();
        if (this.A03) {
            this.A03 = false;
            C2593tJ c2593tJA07 = new C2592tI(this.A0G.getFirstUrl()).A01(this.A00).A03(this.A01).A04(this.A0G.getResponseEndMs()).A00(this.A0G.getDomContentLoadedMs()).A05(this.A0G.getScrollReadyMs()).A02(this.A0G.getLoadFinishMs()).A06(System.currentTimeMillis()).A07();
            this.A0C.ABq(this.A06, c2593tJA07.A02());
            if (BuildConfigApi.isDebug()) {
                String str = A0D(169, 30, 38) + System.currentTimeMillis() + A0D(149, 20, 20) + c2593tJA07.A01 + A0D(53, 22, 86) + c2593tJA07.A03 + A0D(75, 24, 83) + c2593tJA07.A04 + A0D(0, 30, 42) + c2593tJA07.A00 + A0D(99, 24, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) + c2593tJA07.A05 + A0D(30, 23, 114) + c2593tJA07.A02 + A0D(Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE, 26, 72) + c2593tJA07.A06;
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AGp(boolean z11) {
        this.A0G.onResume();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AKD(Bundle bundle) {
        bundle.putString(A0D(Sdk.SDKError.Reason.AD_NOT_LOADED_VALUE, 10, 105), this.A02);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public String getCurrentClientToken() {
        return this.A06;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final boolean onActivityResult(int i5, int i11, Intent intent) {
        return false;
    }

    public void onDestroy() {
        this.A0B.A0F().A5E(EnumC2299oW.A05.name());
        DialogC2494ri dialog = this.A05;
        if (dialog != null) {
            dialog.A0C();
            this.A05 = null;
        }
        this.A0A.A0B(this.A08);
        AbstractC2613td.A03(this.A0G);
        this.A0G.destroy();
    }

    public void setListener(InterfaceC2459r9 interfaceC2459r9) {
    }
}
