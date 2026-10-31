package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.MotionEvent;
import android.view.View;
import android.view.animation.TranslateAnimation;
import android.view.inputmethod.InputMethodManager;
import android.widget.RelativeLayout;
import com.facebook.ads.internal.protocol.AdPlacementType;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.78, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class AnonymousClass78 extends C0917Ft implements View.OnClickListener, View.OnTouchListener {
    public static int A09;
    public static int A0A;
    public static int A0B;
    public static int A0C;
    public static int A0D;
    public static byte[] A0E;
    public static String[] A0F = {"vfTLnFhfSR04yeCwpvXggcuo0R5", "ZWqkUfXAT4shJrSnLwE7AR", "uDvCFU1cpeIDU20c5XpSWP5NsJK", "LZCc6xsCgIvsqlWtLYm2xpoo9wVjlUK6", "XWtwisYBczvYKAmZU1o9rLXCsVE6mj6U", "L5HF9ROWNN8fhzCl", "opMnHAf4pzNwIHSRqseTLBuOcV2JnA3E", "J4YnYXEx7z1RD4kZFuYo5ZRCwoH6qkZ0"};
    public int A00;
    public int A01;
    public C2232nO A02;
    public boolean A03;
    public final int A04;
    public final Handler A05;
    public final InputMethodManager A06;
    public final Runnable A07;
    public final String A08;

    public static String A05(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0E, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 39);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A09() {
        A0E = new byte[]{18, 29, 24, 18, 26, 46, 2, 30, 4, 3, 18, 20, 50, 62, 60, AbstractJsonLexerKt.TC_INVALID, 55, 48, 50, 52, 51, 62, 62, 58, AbstractJsonLexerKt.TC_INVALID, 48, 53, 34, AbstractJsonLexerKt.TC_INVALID, 51, 48, 63, 63, 52, 35, AbstractJsonLexerKt.TC_INVALID, 50, 61, 56, 50, 58, 52, 53, 46, 34, 32, 99, 43, 44, 46, 40, 47, 34, 34, 38, 99, 44, 41, 62, 99, 36, 35, 57, 40, 63, 62, 57, 36, 57, 36, 44, 33, 99, 46, 33, 36, 46, 38, 40, 41, 91, 87, 85, 22, 94, 89, 91, 93, 90, 87, 87, 83, 22, 89, 92, 75, 22, 86, 89, 76, 81, 78, 93, 22, 89, 92, 103, 91, 84, 81, 91, 83, 88, 95, 65, 68, 69, 110, 92, 84, 69, 89, 94, 85, 4, 2, 20, 3, 46, 19, 4, 23, 23, 20, 3, 20, 21, 46, 18, 29, 24, 18, 26, 46, 24, 16, 19, 46, 18, 29, 24, 18, 26, 2, 20, 18, 4, 19, 62, 3, 20, 7, 7, 4, 19, 4, 5, 62, 2, 13, 8, 2, 10, 62, 8, 0, 3, 62, 21, 24, 17, 8, 15, 6};
    }

    static {
        A09();
        A0B = 450;
        A09 = 500;
        A0A = 50;
        A0D = 450;
        A0C = PerAppFeatureCatalog.MAX_TOOLS;
    }

    public AnonymousClass78(C1998jY c1998jY, C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, InterfaceC2459r9 interfaceC2459r9, String str, int i5) {
        super(c1998jY, c0958Hi, interfaceC2224nG, interfaceC2459r9, false);
        this.A00 = 0;
        this.A01 = 0;
        this.A03 = false;
        this.A07 = new RunnableC2462rC(this);
        this.A08 = str;
        this.A05 = new Handler(Looper.getMainLooper());
        this.A06 = (InputMethodManager) c0958Hi.getSystemService(A05(112, 12, 22));
        this.A04 = i5;
    }

    public static /* synthetic */ int A02(AnonymousClass78 anonymousClass78) {
        int i5 = anonymousClass78.A00;
        anonymousClass78.A00 = i5 + 1;
        return i5;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A06() {
        AbstractC2426qc.A0O(this, 1610612736);
    }

    private void A07() {
        if (this.A08 == null) {
            return;
        }
        if (AdPlacementType.BANNER.name().equals(this.A08)) {
            this.A0A.A0E(A05(12, 31, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE), null);
            return;
        }
        if (AdPlacementType.NATIVE.name().equals(this.A08)) {
            this.A0A.A0E(A05(80, 32, 31), null);
            return;
        }
        String strName = AdPlacementType.INTERSTITIAL.name();
        String str = this.A08;
        if (A0F[4].charAt(16) == 's') {
            throw new RuntimeException();
        }
        String[] strArr = A0F;
        strArr[2] = "8IzRIUJb9efYPKAtJhwGPycbwOZ";
        strArr[0] = "TYtUym7r2NCZhHy5XAtvyYbKtYz";
        if (strName.equals(str)) {
            this.A0A.A0E(A05(43, 37, 106), null);
            return;
        }
        AdPlacementType adPlacementType = AdPlacementType.REWARDED_VIDEO;
        if (A0F[1].length() != 22) {
            A0F[4] = "SFf1ftnlqD0kN47UujIaTMcIpRdH9pNa";
            if (!adPlacementType.name().equals(this.A08)) {
                return;
            }
        } else {
            A0F[5] = "xl3LAAZMJtlBjKhfgYaNvWZdB";
            if (!adPlacementType.name().equals(this.A08)) {
                return;
            }
        }
        this.A0A.A0E(EnumC1658dy.A04.A03(), null);
    }

    private void A08() {
        AbstractC2426qc.A0O(this, 0);
    }

    public static /* synthetic */ boolean A0B(View view, MotionEvent motionEvent) {
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.C0917Ft
    public final InterfaceC2599tP A0F() {
        return new C0921Fx(this);
    }

    @Override // com.facebook.ads.redexgen.X.C0917Ft
    public final void A0G() {
        AbstractC2426qc.A0O(this, 1610612736);
        setPadding(getResources().getConfiguration().orientation);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setCornerRadii(new float[]{A0A, A0A, A0A, A0A, 0.0f, 0.0f, 0.0f, 0.0f});
        gradientDrawable.setColor(-1);
        this.A09.setBackground(gradientDrawable);
        this.A09.setOnTouchListener(new View.OnTouchListener() { // from class: com.facebook.ads.redexgen.X.rB
            @Override // android.view.View.OnTouchListener
            public final boolean onTouch(View view, MotionEvent motionEvent) {
                return AnonymousClass78.A0B(view, motionEvent);
            }
        });
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(10);
        addView(this.A09, layoutParams);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams2.addRule(3, this.A09.getId());
        layoutParams2.addRule(12);
        this.A0G.setBackgroundColor(-1);
        addView(this.A0G, layoutParams2);
        this.A0G.setOnTouchListener(this);
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-1, (int) (C0917Ft.A0L * AbstractC2385px.A02));
        layoutParams3.addRule(3, this.A09.getId());
        this.A0E.setProgress(0);
        addView(this.A0E, layoutParams3);
        A06();
        this.A0D.A4V(this, new RelativeLayout.LayoutParams(-1, -1));
    }

    @Override // com.facebook.ads.redexgen.X.C0917Ft
    public final void A0H() {
        A08();
        this.A0A.A05().overridePendingTransition(0, 0);
        TranslateAnimation translateAnimation = new TranslateAnimation(0.0f, 0.0f, 0.0f, Resources.getSystem().getDisplayMetrics().heightPixels);
        translateAnimation.setDuration(A09);
        translateAnimation.setFillAfter(true);
        translateAnimation.setAnimationListener(new AnimationAnimationListenerC2464rE(this));
        startAnimation(translateAnimation);
    }

    @Override // com.facebook.ads.redexgen.X.C0917Ft
    public final void A0I() {
    }

    @Override // com.facebook.ads.redexgen.X.C0917Ft
    public final void A0K(String str) {
        if (this.A04 > 0 && !this.A03) {
            this.A03 = true;
            this.A05.removeCallbacksAndMessages(null);
            Map<String, String> mapA07 = new C2618ti().A05(null).A04(null).A07();
            mapA07.put(A05(0, 12, 86), str);
            if (this.A02 != null) {
                this.A02.A04(EnumC2231nN.A0J, mapA07);
            }
            A07();
            this.A0C.ACA(super.A06, mapA07);
            if (C2203mv.A2W(this.A0B)) {
                HashMap map = new HashMap();
                map.put(MH.A04, Boolean.TRUE.toString());
                map.put(MH.A05, Boolean.TRUE.toString());
                map.put(MH.A06, Boolean.TRUE.toString());
                this.A0C.ACb(super.A06, map);
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.C0917Ft, com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void ABc(Intent intent, Bundle bundle, C1998jY c1998jY) {
        super.ABc(intent, bundle, c1998jY);
        this.A02 = new C2232nO(super.A06, this.A0C);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        A08();
        TranslateAnimation translateAnimation = new TranslateAnimation(0.0f, 0.0f, Resources.getSystem().getDisplayMetrics().heightPixels, 0.0f);
        translateAnimation.setDuration(A0B);
        translateAnimation.setFillAfter(true);
        translateAnimation.setAnimationListener(new AnimationAnimationListenerC2463rD(this));
        startAnimation(translateAnimation);
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            A0H();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        setPadding(configuration.orientation);
    }

    @Override // com.facebook.ads.redexgen.X.C0917Ft, com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void onDestroy() {
        super.onDestroy();
        this.A05.removeCallbacksAndMessages(null);
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        switch (motionEvent.getActionMasked()) {
            case 0:
                InputMethodManager inputMethodManager = this.A06;
                if (A0F[3].charAt(27) != 'j') {
                    A0F[3] = "Hgev4doSvbcbElmdNlOVsn7Rf5RjbGzx";
                    if (inputMethodManager == null) {
                        return false;
                    }
                } else {
                    String[] strArr = A0F;
                    strArr[2] = "qGqyMKbBFDFRjfgCXxgALDISrIL";
                    strArr[0] = "EN7i1IUPYbUCnP9fW5N1h9YqXh6";
                    if (inputMethodManager == null) {
                        return false;
                    }
                }
                InputMethodManager inputMethodManager2 = this.A06;
                if (A0F[1].length() != 22) {
                    throw new RuntimeException();
                }
                A0F[4] = "madM7u7tjAexKCWlkxQmLTMOJOLS0YZT";
                if (!inputMethodManager2.isAcceptingText()) {
                    return false;
                }
                A0K(A05(154, 30, 70));
                return false;
            case 1:
                int i5 = this.A01;
                String[] strArr2 = A0F;
                if (strArr2[7].charAt(9) != strArr2[6].charAt(9)) {
                    throw new RuntimeException();
                }
                A0F[4] = "Huh8TFUZudwEPF459QqvFaUogfM154L9";
                this.A01 = i5 + 1;
                if (this.A01 < 5) {
                    return false;
                }
                A0K(A05(Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE, 30, 86));
                return false;
            default:
                return false;
        }
    }

    private void setPadding(int i5) {
        if (i5 == 2) {
            setPadding(0, A0C, 0, 0);
        } else {
            setPadding(0, A0D, 0, 0);
        }
    }
}
