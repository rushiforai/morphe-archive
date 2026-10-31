package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Pair;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.ads.internal.view.FullScreenAdToolbar;
import com.vungle.ads.internal.protos.Sdk;
import java.text.NumberFormat;
import java.util.Arrays;
import java.util.HashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;

/* loaded from: assets/audience_network/classes.dex */
public final class FS extends RelativeLayout implements InterfaceC2460rA {
    public static byte[] A0h;
    public static String[] A0i = {"57rzzR6raHrat8cHk0n2c9utIvWN6OL8", "vZo4DQACnHxpUIABCEPhLIrXR", "3pKkUgRnbq5D8", "3oPHUcYdGBLGT6sjvwgTS6nCZs8dHXKK", "yMOWmEDq6oq3Yf8aoY", "BRjJ0geTmUVj6Aeo1VqVThKYcHpwhF7A", "bCnfD5Zsza6fNT9UI62TNCVdI9Gt63Qd", "0XbQU4AacrxlEwxF12eBigHvJ8"};
    public static final int A0j;
    public static final int A0k;
    public static final int A0l;
    public static final int A0m;
    public static final int A0n;
    public static final int A0o;
    public static final RelativeLayout.LayoutParams A0p;
    public View A00;
    public LinearLayout A01;
    public RelativeLayout A02;
    public RelativeLayout A03;
    public RelativeLayout A04;
    public Toast A05;
    public C1998jY A06;
    public C2370pi A07;
    public C2566ss A08;
    public C2570sw A09;
    public ViewOnClickListenerC0884El A0A;
    public C1876hX A0B;
    public C1814gV A0C;
    public String A0D;
    public String A0E;
    public boolean A0F;
    public boolean A0G;
    public boolean A0H;
    public boolean A0I;
    public boolean A0J;
    public boolean A0K;
    public boolean A0L;
    public boolean A0M;
    public final Handler A0N;
    public final LA A0O;
    public final C1758fb A0P;
    public final InterfaceC2004je A0Q;
    public final C0958Hi A0R;
    public final InterfaceC2224nG A0S;
    public final C2232nO A0T;
    public final C2370pi A0U;
    public final ViewOnSystemUiVisibilityChangeListenerC2412qO A0V;
    public final InterfaceC2459r9 A0W;
    public final InterfaceC2515s3 A0X;
    public final InterfaceC2658uM A0Y;
    public final C2659uN A0Z;
    public final C1870hR A0a;
    public final AtomicBoolean A0b;
    public final AtomicBoolean A0c;
    public final boolean A0d;
    public final boolean A0e;
    public final boolean A0f;
    public final AbstractC2452r2 A0g;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public FS(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, InterfaceC2459r9 interfaceC2459r9, LA la2, String str, InterfaceC2515s3 interfaceC2515s3, boolean z11) throws JSONException {
        super(c0958Hi);
        String strA0D = A0D(0, 0, 66);
        this.A0E = strA0D;
        this.A0D = strA0D;
        this.A0Q = new FZ(this);
        this.A0c = new AtomicBoolean(false);
        this.A0b = new AtomicBoolean(false);
        this.A0K = false;
        this.A0M = true;
        this.A0H = false;
        this.A0G = false;
        this.A0N = new Handler(Looper.getMainLooper());
        this.A0F = false;
        this.A0f = z11;
        this.A0R = c0958Hi;
        this.A0W = interfaceC2459r9;
        this.A0S = interfaceC2224nG;
        this.A0O = la2;
        this.A0P = la2.A32().A0I().A07();
        this.A0T = new C2232nO(this.A0O.A37(), this.A0S);
        this.A0X = interfaceC2515s3;
        this.A0C = new C1814gV(c0958Hi, this.A0X, str, this.A0W);
        if (la2.A32().A0I().A07() != null) {
            this.A0I = la2.A32().A0I().A07().A0c();
            this.A0E = la2.A32().A0I().A07().A0P();
            this.A0D = la2.A32().A0I().A07().A0O();
        }
        this.A0J = this.A0O.A32().A0T() && this.A0O.A32().A0I().A03() > 0;
        this.A0e = this.A0O.A32().A0I().A0B();
        if (this.A0P == null) {
            this.A0W.A5C(this.A0X.A8c());
            this.A0W.A5C(this.A0X.A8X());
        }
        int iA03 = this.A0P != null ? !this.A0P.A0h() ? (this.A0J && this.A0e) ? this.A0O.A32().A0I().A03() : this.A0P.A0C() : this.A0P.A0E() : 0;
        this.A0c.set(!this.A0P.A0Z());
        FZ fz2 = null;
        this.A0U = new C2370pi(iA03, new FU(this, fz2));
        this.A0d = C2203mv.A0m(this.A0R);
        this.A0g = A07();
        if (this.A0P.A0h()) {
            this.A0g.A09();
        }
        this.A0a = new C1870hR(this.A0R, this.A0S, this.A0O);
        String strA08 = la2.A32().A0I().A08();
        if (strA08 != null) {
            AbstractC2668uW.A00(c0958Hi, this, strA08);
        }
        this.A0V = new ViewOnSystemUiVisibilityChangeListenerC2412qO(this);
        this.A0V.A05(EnumC2411qN.A03);
        if (C2203mv.A2L(this.A0R)) {
            this.A0g.setProgressSpinnerInvisible(true);
        }
        FT ft2 = new FT(this, fz2);
        HashMap map = new HashMap();
        map.put(A0D(56, 9, 37), this.A0X.A9O());
        this.A0B = new C1876hX(this.A0R, this.A0O, this.A0P, this.A0S, ft2, map);
        A0K();
        this.A0W.A4V(this, new RelativeLayout.LayoutParams(-1, -1));
        A0H();
        this.A0Y = new FY(this);
        this.A0Z = new C2659uN(this.A0R, this.A0g, this.A0O, (C0799Be) null, this.A0W, this.A0Y, this.A0A, this.A02, this.A0B);
        if (Build.VERSION.SDK_INT >= 35) {
            setFitsSystemWindows(true);
        }
        if (this.A0P.A0h()) {
            this.A0R.A0F().AFX();
        }
    }

    public static String A0D(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0h, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 40);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0P() {
        A0h = new byte[]{-98, 112, -4, 20, 6, 4, 20, -2, -77, -68, -71, -77, -69, -81, -65, -62, -71, -73, -71, -66, -17, -8, -11, -17, -9, -21, -1, -5, 1, -2, -17, -15, -60, -55, -49, -64, -51, -50, -49, -60, -49, -60, -68, -57, -45, -58, -39, -50, -37, -54, -60, -56, -47, -50, -56, -48, -67, -71, -82, -80, -78, -70, -78, -69, -63, -85, -98, -80, -102, -85, -99, -98, -99, -104, -81, -94, -99, -98, -88, -39, -57, -60, -40, -53, -57, -39, -63, -59, -50, -53, -59, -51};
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final /* synthetic */ void onStart() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final /* synthetic */ void onStop() {
    }

    static {
        A0P();
        A0p = new RelativeLayout.LayoutParams(-1, -1);
        A0k = AbstractC2383pv.A0P;
        A0l = AbstractC2383pv.A0A;
        A0o = AbstractC2383pv.A08;
        A0m = AbstractC2383pv.A06;
        A0n = AbstractC1841gx.A02(-1, 77);
        A0j = AbstractC2383pv.A0X;
    }

    public FS(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, InterfaceC2459r9 interfaceC2459r9, LA la2, String str, InterfaceC2515s3 interfaceC2515s3) {
        this(c0958Hi, interfaceC2224nG, interfaceC2459r9, la2, str, interfaceC2515s3, false);
    }

    private FullScreenAdToolbar A07() {
        FullScreenAdToolbar fullScreenAdToolbar = new FullScreenAdToolbar(this.A0R, this.A0W, this.A0T, 0, this.A0O.A2u(), this.A0I);
        fullScreenAdToolbar.setFullscreen(true);
        fullScreenAdToolbar.A0D(this.A0O.A31().A01(), ViewOnClickListenerC0884El.A05(this.A0O));
        fullScreenAdToolbar.setPageDetailsVisible(false);
        fullScreenAdToolbar.setPageDetails(this.A0O.A35(), this.A0O.A37(), this.A0P.A0C(), this.A0O.A36());
        fullScreenAdToolbar.setToolbarListener(new FV(this));
        return fullScreenAdToolbar;
    }

    private ViewOnClickListenerC0884El A09() {
        if (this.A0B == null || this.A0B.getViewabilityChecker() == null || this.A0B.getTouchDataRecorder() == null) {
            return null;
        }
        ViewOnClickListenerC0884El viewOnClickListenerC0884El = new ViewOnClickListenerC0884El(this.A0R, this.A0X.A7x(), this.A0O.A31().A01(), this.A0S, this.A0W, this.A0B.getViewabilityChecker(), this.A0B.getTouchDataRecorder(), this.A0O.A33());
        AbstractC2426qc.A0L(viewOnClickListenerC0884El);
        viewOnClickListenerC0884El.setText(this.A0O.A32().A0K().A05());
        viewOnClickListenerC0884El.setTextSize(14.0f);
        viewOnClickListenerC0884El.setPadding(AbstractC2383pv.A02, AbstractC2383pv.A02, AbstractC2383pv.A02, AbstractC2383pv.A02);
        viewOnClickListenerC0884El.setOnClickListener(new ViewOnClickListenerC2485rZ(this));
        return viewOnClickListenerC0884El;
    }

    private C2667uV A0B() {
        C2667uV c2667uV = new C2667uV(this.A0R, this.A0O.A31().A01(), true, !this.A0J ? 16 : 17, !this.A0J ? 14 : 13, 0);
        c2667uV.A04(this.A0O.A32().A0J().A0H(), this.A0O.A32().A0J().A0G(), null, false, true);
        TextView descriptionTv = c2667uV.getDescriptionTextView();
        descriptionTv.setAlpha(0.8f);
        descriptionTv.setMaxLines(1);
        descriptionTv.setEllipsize(TextUtils.TruncateAt.END);
        TextView descriptionTv2 = c2667uV.getTitleTextView();
        descriptionTv2.setMaxLines(1);
        descriptionTv2.setEllipsize(TextUtils.TruncateAt.END);
        return c2667uV;
    }

    private void A0G() {
        String strA01;
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(A0k, A0k);
        layoutParams.addRule(15);
        layoutParams.addRule(9);
        C2661uP c2661uP = new C2661uP(this.A0R);
        AbstractC2426qc.A0O(c2661uP, 0);
        AbstractC2426qc.A0L(c2661uP);
        new AsyncTaskC0892Et(c2661uP, this.A0R).A05(A0k, A0k).A07(this.A0O.A35().A01());
        TextView textView = new TextView(this.A0R);
        AbstractC2426qc.A0L(textView);
        textView.setLayoutParams(new LinearLayout.LayoutParams(-2, -2));
        textView.setTextColor(this.A0O.A31().A01().A07(true));
        textView.setText(this.A0O.A32().A0J().A0H());
        textView.setTextSize(!this.A0I ? 16.0f : 17.0f);
        textView.setMaxLines(1);
        textView.setEllipsize(TextUtils.TruncateAt.END);
        C2663uR c2663uR = new C2663uR(this.A0R, !this.A0I ? A0o : A0m, 5, A0n, -1);
        c2663uR.setGravity(16);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-2, -1);
        TextView titleView = new TextView(this.A0R);
        titleView.setTextColor(this.A0O.A31().A01().A07(true));
        titleView.setGravity(16);
        titleView.setIncludeFontPadding(false);
        if (!this.A0I) {
            titleView.setTextSize(13.0f);
        }
        LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(-2, -1);
        layoutParams3.leftMargin = AbstractC2383pv.A0X;
        LinearLayout linearLayout = new LinearLayout(this.A0R);
        linearLayout.setOrientation(0);
        linearLayout.setGravity(16);
        RelativeLayout.LayoutParams layoutParams4 = new RelativeLayout.LayoutParams(-2, A0l);
        layoutParams4.topMargin = AbstractC2383pv.A0X / 2;
        layoutParams4.addRule(3, textView.getId());
        linearLayout.addView(c2663uR, layoutParams2);
        linearLayout.addView(titleView, layoutParams3);
        RelativeLayout.LayoutParams ratingInfoContainerParams = new RelativeLayout.LayoutParams(-2, -2);
        ratingInfoContainerParams.leftMargin = AbstractC2383pv.A0X;
        ratingInfoContainerParams.addRule(1, c2661uP.getId());
        ratingInfoContainerParams.addRule(15);
        RelativeLayout relativeLayout = new RelativeLayout(getContext());
        relativeLayout.addView(linearLayout, layoutParams4);
        relativeLayout.addView(textView);
        if (this.A04 != null) {
            this.A04.removeAllViews();
            this.A04.addView(relativeLayout, ratingInfoContainerParams);
            this.A04.addView(c2661uP, layoutParams);
        }
        if (TextUtils.isEmpty(this.A0O.A32().A0J().A0D())) {
            linearLayout.setVisibility(8);
            return;
        }
        linearLayout.setVisibility(0);
        if (A0i[7].length() == 4) {
            throw new RuntimeException();
        }
        A0i[7] = "eZ";
        c2663uR.setRating(Float.parseFloat(this.A0O.A32().A0J().A0D()));
        if (this.A0O.A32().A0J().A0A() == null) {
            return;
        }
        StringBuilder ratingSB = new StringBuilder();
        ratingSB.append(A0D(0, 1, 78));
        if (!this.A0I) {
            strA01 = NumberFormat.getNumberInstance().format(Integer.parseInt(this.A0O.A32().A0J().A0A()));
        } else {
            strA01 = AbstractC2395q7.A01(Integer.parseInt(this.A0O.A32().A0J().A0A()));
        }
        ratingSB.append(strA01);
        ratingSB.append(A0D(1, 1, 31));
        titleView.setText(ratingSB.toString());
    }

    private void A0H() throws JSONException {
        if (this.A0P.A0Z()) {
            A0J();
        } else {
            A0O();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0I() {
        this.A0L = true;
        if (this.A0O.A32().A0T()) {
            this.A0C.A06();
            this.A0W.A5D(this.A0X.A7L(), new C5Y(0, 0));
        }
    }

    private void A0J() {
        C2499rn c2499rnA0F = new C2501rp(this.A0R, this.A0O.A32().A0J(), this.A0O.A35()).A0A(this.A0O.A31().A01()).A0D(this.A0P.A0R()).A0C(this.A0P.A0L()).A09(2000).A0E(this.A0I).A0B(this.A0E).A0F();
        AbstractC2234nQ.A04(c2499rnA0F, this.A0T, EnumC2231nN.A0U);
        addView(c2499rnA0F, A0p);
        c2499rnA0F.A04(new FX(this));
    }

    private void A0K() throws JSONException {
        RelativeLayout.LayoutParams layoutParams;
        this.A0A = A09();
        this.A02 = new RelativeLayout(getContext());
        AbstractC2426qc.A0L(this.A02);
        this.A04 = new RelativeLayout(getContext());
        AbstractC2426qc.A0L(this.A04);
        if (this.A0d) {
            A0G();
        } else {
            RelativeLayout relativeLayout = this.A04;
            C2667uV c2667uVA0B = A0B();
            RelativeLayout.LayoutParams iconAndMetaDataContainerParams = new RelativeLayout.LayoutParams(-2, -2);
            relativeLayout.addView(c2667uVA0B, iconAndMetaDataContainerParams);
        }
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams2.setMargins(0, 0, AbstractC2383pv.A0A, 0);
        this.A02.addView(this.A04, layoutParams2);
        if (this.A0A != null) {
            layoutParams2.addRule(0, this.A0A.getId());
            if (!this.A0I) {
                layoutParams = new RelativeLayout.LayoutParams(-2, -2);
                layoutParams.addRule(6, this.A04.getId());
                layoutParams.addRule(8, this.A04.getId());
            } else {
                layoutParams = new RelativeLayout.LayoutParams(-2, -2);
                AbstractC2426qc.A0W(this.A0A, AbstractC2426qc.A06(-16738826, A0j));
                this.A0A.setStateListAnimator(null);
                this.A0A.setPadding(AbstractC2383pv.A0C, AbstractC2383pv.A07, AbstractC2383pv.A0C, AbstractC2383pv.A07);
                AbstractC2426qc.A0a(this.A0A);
            }
            layoutParams.addRule(11);
            this.A02.addView(this.A0A, layoutParams);
        }
        AbstractC2426qc.A0L(this.A0g);
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams3.addRule(10);
        this.A01 = new LinearLayout(getContext());
        AbstractC2426qc.A0L(this.A01);
        RelativeLayout.LayoutParams adWebViewParams = new RelativeLayout.LayoutParams(-2, -2);
        adWebViewParams.setMargins(AbstractC2383pv.A0A, AbstractC2383pv.A06, AbstractC2383pv.A0A, AbstractC2383pv.A06);
        adWebViewParams.addRule(12);
        this.A01.setOrientation(1);
        RelativeLayout.LayoutParams toolbarParams = new RelativeLayout.LayoutParams(-1, -1);
        toolbarParams.setMargins(AbstractC2383pv.A0A, 0, AbstractC2383pv.A0A, 0);
        toolbarParams.addRule(3, this.A0g.getId());
        toolbarParams.addRule(2, this.A01.getId());
        this.A01.addView(this.A02, new RelativeLayout.LayoutParams(-2, -2));
        this.A03 = new RelativeLayout(getContext());
        AbstractC2426qc.A0L(this.A03);
        this.A01.addView(this.A03);
        if (this.A0O.A3F()) {
            this.A0g.A08();
            A0M();
        }
        if (this.A0O.A3U()) {
            A0L();
        }
        this.A0g.setVisibility(4);
        this.A0B.setVisibility(4);
        this.A02.setVisibility(4);
        addView(this.A0g, layoutParams3);
        addView(this.A0B, toolbarParams);
        addView(this.A01, adWebViewParams);
        if (this.A0P.A0d()) {
            this.A0B.A0C();
        }
    }

    private void A0L() {
        this.A09 = AbstractC2571sx.A02(this.A0R, EnumC2569sv.A03, this.A0O);
        AbstractC2426qc.A0L(this.A09);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(9);
        layoutParams.topMargin = AbstractC2383pv.A0A;
        this.A03.addView(this.A09, layoutParams);
    }

    private void A0M() {
        this.A08 = AbstractC2571sx.A01(this.A0R, true, this.A0O, this.A0T, this.A0W, EnumC2569sv.A03, AbstractC2568su.A00(this.A0O));
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(11);
        layoutParams.topMargin = AbstractC2383pv.A0A;
        this.A03.addView(this.A08, layoutParams);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0081  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x00ca  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00e0  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0109  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x011f A[PHI: r1 r3
      0x011f: PHI (r1v13 int) = (r1v8 int), (r1v24 int) binds: [B:35:0x011b, B:26:0x00d5] A[DONT_GENERATE, DONT_INLINE]
      0x011f: PHI (r3v4 int) = (r3v2 int), (r3v7 int) binds: [B:35:0x011b, B:26:0x00d5] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0165 A[PHI: r1 r3
      0x0165: PHI (r1v9 int) = (r1v8 int), (r1v24 int) binds: [B:35:0x011b, B:26:0x00d5] A[DONT_GENERATE, DONT_INLINE]
      0x0165: PHI (r3v3 int) = (r3v2 int), (r3v7 int) binds: [B:35:0x011b, B:26:0x00d5] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x01f1  */
    /* JADX WARN: Removed duplicated region for block: B:64:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void A0N() {
        String[] strArr;
        int i5;
        int i11;
        if (this.A0O.A3F() && this.A08 != null) {
            this.A08.A0P();
            if (this.A0O.A3S()) {
                AbstractC2568su.A05(this.A0R, EnumC2569sv.A02);
            } else {
                AbstractC2568su.A06(this.A0R, EnumC2569sv.A02);
            }
        }
        if (this.A0O.A3U() && this.A09 != null) {
            C0958Hi c0958Hi = this.A0R;
            EnumC2569sv enumC2569sv = EnumC2569sv.A02;
            if (A0i[5].charAt(2) != 'm') {
                A0i[0] = "6k4i0rLafWNu6HrnPvo1bAEbeaagXJGg";
                AbstractC2568su.A07(c0958Hi, enumC2569sv);
                new C2232nO(this.A0O.A37(), this.A0S).A04(EnumC2231nN.A1D, null);
                this.A0b.set(true);
                AbstractC2426qc.A0X(this);
                AbstractC2426qc.A0I(this.A0B);
                AbstractC2426qc.A0e(this.A0Z, this.A00, this.A0B);
                if (!this.A0I) {
                }
                AbstractC2426qc.A0M(this.A0A);
                Pair<EnumC1871hS, View> pairA03 = this.A0a.A03(this.A0A);
                this.A00 = (View) pairA03.second;
                int[] iArr = C2486ra.A00;
                Object obj = pairA03.first;
                strArr = A0i;
                if (strArr[3].charAt(19) == strArr[6].charAt(19)) {
                }
                if (!this.A0P.A0h()) {
                }
            }
        } else {
            new C2232nO(this.A0O.A37(), this.A0S).A04(EnumC2231nN.A1D, null);
            this.A0b.set(true);
            AbstractC2426qc.A0X(this);
            AbstractC2426qc.A0I(this.A0B);
            AbstractC2426qc.A0e(this.A0Z, this.A00, this.A0B);
            if (!this.A0I) {
                boolean z11 = this.A0d;
                if (A0i[5].charAt(2) != 'm') {
                    A0i[7] = "zEEZOPKoSNVBjVMgZJuGrCvhSdzM";
                    if (z11) {
                        AbstractC2426qc.A0I(this.A0g);
                    }
                }
            } else {
                AbstractC2426qc.A0M(this.A0g);
            }
            AbstractC2426qc.A0M(this.A0A);
            Pair<EnumC1871hS, View> pairA032 = this.A0a.A03(this.A0A);
            this.A00 = (View) pairA032.second;
            int[] iArr2 = C2486ra.A00;
            Object obj2 = pairA032.first;
            strArr = A0i;
            if (strArr[3].charAt(19) == strArr[6].charAt(19)) {
                int i12 = iArr2[((EnumC1871hS) obj2).ordinal()];
                i5 = 8;
                i11 = -1;
                switch (i12) {
                    case 1:
                        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(i11, i11);
                        layoutParams.setMargins(0, this.A0g.getToolbarHeight(), 0, 0);
                        if (!this.A0I) {
                            AbstractC2426qc.A0M(this.A02);
                            layoutParams.addRule(2, this.A01.getId());
                            if (A0i[7].length() == 4) {
                                addView(this.A00, layoutParams);
                                break;
                            } else {
                                A0i[0] = "icoWBTg9rYjeEkG7v6VzgCyo6GWZLUtb";
                                addView(this.A00, layoutParams);
                                break;
                            }
                        } else {
                            View c2606tW = new C2606tW(this.A0R, this.A0O.A35(), this.A0O.A32().A0J(), A09(), this.A0D, new ViewOnClickListenerC2484rY(this));
                            RelativeLayout.LayoutParams screenshotParams = new RelativeLayout.LayoutParams(i11, i11);
                            if (this.A0O.A3F()) {
                                screenshotParams.addRule(2, this.A01.getId());
                                if (this.A02 != null) {
                                    AbstractC2426qc.A0P(this.A02, i5);
                                }
                            }
                            addView(c2606tW, screenshotParams);
                            removeView(this.A0g);
                            break;
                        }
                    case 2:
                        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(i11, i11);
                        if (this.A0O.A3F()) {
                            int id2 = this.A01.getId();
                            if (A0i[0].charAt(29) == 'D') {
                                throw new RuntimeException();
                            }
                            A0i[5] = "VAHNC1P4RBkuL3irqbFU8y6RUzC9H5KG";
                            layoutParams2.addRule(2, id2);
                            if (this.A02 != null) {
                                AbstractC2426qc.A0P(this.A02, i5);
                            }
                        } else {
                            AbstractC2426qc.A0e(this.A01);
                        }
                        addView(this.A00, layoutParams2);
                        break;
                }
            } else {
                A0i[5] = "CWd9rKrOeQbDNpEihJyRkvyhU2YuIgjh";
                int i13 = iArr2[((EnumC1871hS) obj2).ordinal()];
                i5 = 8;
                i11 = -1;
                switch (i13) {
                }
            }
            if (!this.A0P.A0h()) {
                InterfaceC1640df interfaceC1640dfA0F = this.A0R.A0F();
                if (A0i[0].charAt(29) != 'D') {
                    String[] strArr2 = A0i;
                    strArr2[3] = "r0g43FXfQnx9t7rigJmT6UuKbf0C8Pnv";
                    strArr2[6] = "P4UbBzaC1s2Wo3EeRciTBjjQYhuDTIDZ";
                    interfaceC1640dfA0F.AFS();
                    return;
                }
                interfaceC1640dfA0F.AFS();
                return;
            }
            return;
        }
        throw new RuntimeException();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0O() throws JSONException {
        AbstractC2426qc.A0X(this);
        if (!this.A0P.A0d()) {
            C1876hX c1876hX = this.A0B;
            if (A0i[4].length() != 18) {
                throw new RuntimeException();
            }
            String[] strArr = A0i;
            strArr[1] = "xj34PAIXy0BC0JvFurkBkOtWc";
            strArr[2] = "hWQrQPNffHRqy";
            c1876hX.A0C();
        }
        this.A0g.setVisibility(0);
        this.A0B.setVisibility(0);
        if (this.A02 != null) {
            RelativeLayout relativeLayout = this.A02;
            if (A0i[7].length() != 4) {
                A0i[7] = "GHPvfAAYCmFSIETbcdzzC0huzOqb6N";
                relativeLayout.setVisibility(0);
            } else {
                String[] strArr2 = A0i;
                strArr2[3] = "tvYjLA1oGXNhTHZAIhYTsER90pYUTPum";
                strArr2[6] = "jKhXSIgEZQzlredWxanTIzgk7i5P2ie1";
                relativeLayout.setVisibility(0);
            }
        }
        this.A0R.A0F().A3s();
        if (this.A0A != null && this.A0O.A2x() > 0 && this.A07 == null) {
            this.A07 = new C2370pi(this.A0O.A2x(), new FW(this));
            this.A07.A07();
        }
        this.A0U.A07();
        if (this.A08 != null && this.A0O.A3O()) {
            this.A08.A0Q();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0Q(int i5) {
        String strValueOf = String.valueOf(i5);
        Toast toast = this.A05;
        String strA0K = this.A0P.A0K();
        String progress = A0D(2, 6, Sdk.SDKError.Reason.TPAT_ERROR_VALUE);
        AbstractC2426qc.A0c(toast, strA0K.replace(progress, strValueOf), 49, 0, AbstractC2383pv.A0V);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0W(boolean z11, String str) throws PackageManager.NameNotFoundException, RemoteException {
        this.A0H = true;
        HashMap map = new HashMap();
        map.put(A0D(8, 12, 40), z11 ? A0D(79, 13, 58) : A0D(44, 12, 61));
        map.put(A0D(20, 12, 100), str);
        C2644u8 c2644u8 = new C2644u8(this.A0R, this.A0X.A7x(), this.A0B.getViewabilityChecker(), this.A0B.getTouchDataRecorder(), this.A0S, this.A0O.A33(), this.A0W);
        c2644u8.A0A(this.A0O);
        c2644u8.A06(this.A0O.A37(), this.A0O.A32().A0K().A06(), map);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean A0X() {
        if (!this.A0O.A1c().equals(A0D(65, 14, 17))) {
            if (this.A0O.A1c().equals(A0D(32, 12, 51))) {
                LA la2 = this.A0O;
                if (A0i[4].length() != 18) {
                    throw new RuntimeException();
                }
                A0i[0] = "r5y7OBqhAYVA47bIfl4AlIWKO2XfiX80";
                if (la2.A32().A0W()) {
                }
            }
            return false;
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean A0Y() {
        return this.A0e && !this.A0K && !this.A0M && this.A0P.A0C() < this.A0O.A32().A0I().A03();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void ABc(Intent intent, Bundle bundle, C1998jY c1998jY) {
        this.A06 = c1998jY;
        this.A06.A0A(this.A0Q);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AGF(boolean z11) {
        this.A0U.A06();
        this.A0G = true;
        if (!this.A0F && !z11) {
            C2566ss c2566ss = this.A08;
            if (A0i[4].length() != 18) {
                throw new RuntimeException();
            }
            String[] strArr = A0i;
            strArr[3] = "khoeLKhAkDTHqtvHh44TDBpYJbcg0vVG";
            strArr[6] = "EayQQNVlJFU2ogZcZ4XThOAwKTaD1bU7";
            if (c2566ss != null) {
                this.A08.A0P();
            }
        }
        this.A0F = false;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AGp(boolean z11) {
        if (this.A0e && this.A0M) {
            return;
        }
        boolean z12 = this.A0K;
        if (A0i[5].charAt(2) == 'm') {
            throw new RuntimeException();
        }
        A0i[0] = "UQp6GtSKm4mkcrS1rXAjxFqYQJcA6U4M";
        if (!z12 && this.A0c.get() && !this.A0U.A05()) {
            this.A0U.A07();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AKD(Bundle bundle) {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public String getCurrentClientToken() {
        return this.A0O.A37();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final boolean onActivityResult(int i5, int i11, Intent intent) {
        return false;
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (Build.VERSION.SDK_INT >= 35) {
            setFitsSystemWindows(true);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0033  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x00a6  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x00b2  */
    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onDestroy() {
        this.A0V.A03();
        if (this.A08 != null) {
            this.A08.A0O();
        }
        if (this.A06 != null) {
            C1998jY c1998jY = this.A06;
            if (A0i[0].charAt(29) != 'D') {
                A0i[0] = "voPpcOtL9PQSCLq1wYvqOCQr8JaLbGKq";
                c1998jY.A0B(this.A0Q);
                if (this.A0B != null) {
                    if (!TextUtils.isEmpty(this.A0O.A37())) {
                        this.A0S.ABt(this.A0O.A37(), new C2618ti().A05(this.A0B.getViewabilityChecker()).A04(this.A0B.getTouchDataRecorder()).A07());
                    }
                    C1876hX c1876hX = this.A0B;
                    String[] strArr = A0i;
                    if (strArr[1].length() != strArr[2].length()) {
                        String[] strArr2 = A0i;
                        strArr2[1] = "HjELnbww4zRnKHk33aEIOd3z3";
                        strArr2[2] = "L9K5feiifaRZL";
                        c1876hX.A0D();
                    }
                }
                this.A0U.A06();
                this.A0g.setToolbarListener(null);
                this.A0N.removeCallbacksAndMessages(null);
                if (A0i[7].length() != 4) {
                    throw new RuntimeException();
                }
                A0i[4] = "edn3At82DbAhSP2VjV";
                this.A05 = null;
                this.A06 = null;
                return;
            }
        } else {
            if (this.A0B != null) {
            }
            this.A0U.A06();
            this.A0g.setToolbarListener(null);
            this.A0N.removeCallbacksAndMessages(null);
            if (A0i[7].length() != 4) {
            }
        }
        throw new RuntimeException();
    }

    @Override // android.view.View
    public final void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        if (z11) {
            AGp(false);
        } else {
            if (A0i[7].length() == 4) {
                throw new RuntimeException();
            }
            A0i[0] = "oMjhyB5nK2QQecdmAxokhN3bvhPRjHlA";
            this.A0F = true;
            AGF(false);
        }
    }

    public void setListener(InterfaceC2459r9 interfaceC2459r9) {
    }

    public void setServerSideRewardHandler(C1814gV c1814gV) {
        this.A0C = c1814gV;
    }
}
