package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.net.Uri;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.Arrays;
import java.util.List;

/* loaded from: assets/audience_network/classes.dex */
public final class F6 extends LinearLayout implements InterfaceC2604tU {
    public static byte[] A0E;
    public static String[] A0F = {"knq4crm7fvqQP", "POuWJNR6FFtqsTvB6KeDXgsqVDDrfXB5", "10LYd3PkBnL3JTlwXO74lkb8laVhyfxM", "yGvyB2PsIdOlgSHN7xWAdIyeKrkcUuSJ", "30OsfDGqNeLBXhmKwxFpv8WuoKRgKdOB", "v4mwmIuaROl", "LuFvPWZsJ2RrZ", "py7QobRXpH9AZVstdVJJOkEIejHuBaN9"};
    public static final int A0G;
    public static final int A0H;
    public static final int A0I;
    public static final int A0J;
    public static final int A0K;
    public static final Uri A0L;
    public static final View.OnTouchListener A0M;
    public ImageView A00;
    public ImageView A01;
    public ImageView A02;
    public ImageView A03;
    public LinearLayout A04;
    public C2596tM A05;
    public InterfaceC2603tT A06;
    public String A07;
    public final WebView A08;
    public final C0958Hi A09;
    public final InterfaceC2600tQ A0A;
    public final boolean A0B;
    public final boolean A0C;
    public final boolean A0D;

    public static String A06(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0E, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 39);
            String[] strArr = A0F;
            if (strArr[3].charAt(13) == strArr[1].charAt(13)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0F;
            strArr2[6] = "2vQcPj1ELj1bu";
            strArr2[0] = "7aOELiI6quiDs";
            bArrCopyOfRange[i13] = b11;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0A() {
        A0E = new byte[]{80, 115, 113, 121, 27, 52, 55, 43, 61, 39, 14, 19, 22, 0, 19, 5, 14, 49, 36, 47, 97, 47, 32, 53, 40, 55, 36, 97, 35, 51, 46, 54, 50, 36, 51, 5, 6, 11, 17, 16, 94, 6, 8, 5, 10, 15, 18, 29, 23, 1, 28, 26, 23, 93, 26, 29, 7, 22, 29, 7, 93, 18, 16, 7, 26, 28, 29, 93, 37, 58, 54, 36, 27, 23, 21, 86, 25, 22, 28, 10, 23, 17, 28, 86, 27, 16, 10, 23, 21, 29, 80, 76, 76, 72, 2, 23, 23, 79, 79, 79, 22, 94, 89, 91, 93, 90, 87, 87, 83, 22, 91, 87, 85};
    }

    static {
        A0A();
        A0I = Color.rgb(Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE, Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE, Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE);
        A0L = AbstractC2351pP.A00(A06(90, 23, 31));
        A0M = new ViewOnTouchListenerC2585tB();
        A0K = Color.argb(34, 0, 0, 0);
        A0G = AbstractC2383pv.A0R;
        A0H = AbstractC2383pv.A0K;
        A0J = AbstractC2383pv.A0B;
    }

    public F6(C0958Hi c0958Hi, WebView webView) {
        this(c0958Hi, webView, false, false);
    }

    public F6(C0958Hi c0958Hi, WebView webView, boolean z11, boolean z12) {
        super(c0958Hi);
        this.A0A = new F7(this);
        this.A08 = webView;
        this.A09 = c0958Hi;
        this.A0B = AbstractC2204mw.A06(c0958Hi);
        this.A0D = z11;
        this.A0C = z12;
        A08();
        if (z12) {
            A0C(false);
        }
    }

    private void A08() {
        float f11;
        AbstractC2426qc.A0O(this, -1);
        setGravity(16);
        this.A01 = new ImageView(this.A09);
        this.A01.setContentDescription(A06(4, 5, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE));
        ViewGroup.LayoutParams layoutParams = new LinearLayout.LayoutParams(A0G, A0G);
        this.A01.setScaleType(ImageView.ScaleType.CENTER);
        this.A01.setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.BROWSER_CLOSE));
        this.A01.setOnTouchListener(A0M);
        this.A01.setOnClickListener(new ViewOnClickListenerC2586tC(this));
        addView(this.A01, layoutParams);
        if (this.A0B && !C2203mv.A2z(this.A09)) {
            this.A00 = new ImageView(this.A09);
            this.A00.setEnabled(false);
            this.A00.setAlpha(0.3f);
            this.A00.setContentDescription(A06(0, 4, 53));
            ViewGroup.LayoutParams backButtonParams = new LinearLayout.LayoutParams(A0G, A0G);
            this.A00.setScaleType(ImageView.ScaleType.CENTER);
            this.A00.setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.BACK_ARROW));
            this.A00.setOnTouchListener(A0M);
            this.A00.setOnClickListener(new ViewOnClickListenerC2587tD(this));
            addView(this.A00, backButtonParams);
        }
        this.A05 = new C2596tM(this.A09);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(0, -2);
        if (this.A0B || C2203mv.A2z(this.A09)) {
            f11 = 0.5f;
        } else {
            f11 = 1.0f;
        }
        layoutParams2.weight = f11;
        this.A05.setGravity(17);
        if (C2203mv.A2z(this.A09) && !this.A0D) {
            this.A04 = new LinearLayout(this.A09);
            this.A04.setOrientation(1);
            this.A04.setPadding(0, A0J, 0, A0J);
            layoutParams2.setMarginStart(0);
            addView(this.A04, layoutParams2);
            ImageView imageView = new ImageView(this.A09);
            imageView.setScaleType(ImageView.ScaleType.CENTER);
            imageView.setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.HANDLER));
            imageView.setPadding(0, A0H, 0, A0H);
            LinearLayout.LayoutParams closeButtonParams = new LinearLayout.LayoutParams(-1, -2);
            this.A04.addView(imageView, closeButtonParams);
            LinearLayout.LayoutParams titleViewsParams = new LinearLayout.LayoutParams(-1, -2);
            this.A04.addView(this.A05, titleViewsParams);
        } else {
            addView(this.A05, layoutParams2);
        }
        if (this.A0B && !C2203mv.A2z(this.A09)) {
            this.A02 = new ImageView(this.A09);
            this.A02.setEnabled(false);
            this.A02.setAlpha(0.3f);
            this.A02.setContentDescription(A06(9, 7, 70));
            ViewGroup.LayoutParams titleViewsParams2 = new LinearLayout.LayoutParams(A0G, A0G);
            this.A02.setScaleType(ImageView.ScaleType.CENTER);
            this.A02.setImageBitmap(AbstractC2438qo.A02(EnumC2437qn.BACK_ARROW));
            this.A02.setOnTouchListener(A0M);
            this.A02.setOnClickListener(new ViewOnClickListenerC2588tE(this));
            addView(this.A02, titleViewsParams2);
        }
        this.A03 = new ImageView(this.A09);
        ViewGroup.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(A0G, A0G);
        this.A03.setContentDescription(A06(16, 19, 102));
        this.A03.setScaleType(ImageView.ScaleType.CENTER);
        this.A03.setOnTouchListener(A0M);
        this.A03.setOnClickListener(new ViewOnClickListenerC2589tF(this));
        addView(this.A03, layoutParams3);
        A09();
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x009c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A09() {
        PackageManager packageManager;
        Bitmap externalBrowserBitmap = null;
        boolean zA0i = C2203mv.A0i(this.A09);
        if (!zA0i && (packageManager = this.A09.getPackageManager()) != null) {
            List<ResolveInfo> listQueryIntentActivities = packageManager.queryIntentActivities(new Intent(A06(46, 26, 84), A0L), SQLiteDatabase.OPEN_FULLMUTEX);
            if (listQueryIntentActivities.isEmpty()) {
                this.A03.setVisibility(8);
            } else if (listQueryIntentActivities.size() != 1 || listQueryIntentActivities.get(0).activityInfo == null) {
                externalBrowserBitmap = getExternalBrowserBitmap();
            } else if (A06(72, 18, 95).equals(listQueryIntentActivities.get(0).activityInfo.packageName)) {
                EnumC2437qn enumC2437qn = EnumC2437qn.BROWSER_LAUNCH_CHROME;
                if (A0F[4].charAt(28) == 'h') {
                    throw new RuntimeException();
                }
                String[] strArr = A0F;
                strArr[3] = "wfUY0m3OLxiViQ5pYdTJeAjco4FSuRgM";
                strArr[1] = "aNDMwOovjkuIBRKYf6vflm3uDfmFdOS8";
                externalBrowserBitmap = AbstractC2438qo.A01(enumC2437qn);
            }
        }
        if (C2203mv.A2z(this.A09) || zA0i) {
            this.A03.setVisibility(0);
            externalBrowserBitmap = getExternalBrowserBitmap();
        }
        this.A03.setImageBitmap(externalBrowserBitmap);
    }

    private void A0C(boolean z11) {
        int i5 = z11 ? 0 : 8;
        if (this.A00 != null) {
            this.A00.setVisibility(i5);
        }
        ImageView imageView = this.A02;
        String[] strArr = A0F;
        String str = strArr[3];
        String str2 = strArr[1];
        int iCharAt = str.charAt(13);
        int visibility = str2.charAt(13);
        if (iCharAt == visibility) {
            throw new RuntimeException();
        }
        A0F[4] = "60KYo7QhjtgENhj2KqPalgoBByrtiSu8";
        if (imageView != null) {
            this.A02.setVisibility(i5);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0D(boolean z11) {
        if (z11) {
            A0C(true);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2604tU
    public InterfaceC2600tQ getBrowserNavigationListener() {
        return this.A0A;
    }

    private Bitmap getExternalBrowserBitmap() {
        if (this.A0C) {
            Bitmap bitmapA01 = AbstractC2438qo.A01(EnumC2437qn.BROWSER_LAUNCH_NATIVE_V2);
            if (A0F[5].length() == 31) {
                throw new RuntimeException();
            }
            A0F[4] = "wMzYYSB4aZPNeA9ARsTFIivGNhHq4oSc";
            return bitmapA01;
        }
        return AbstractC2438qo.A01(EnumC2437qn.BROWSER_LAUNCH_NATIVE);
    }

    public void setCloseButtonVisibility(int i5) {
        this.A01.setVisibility(i5);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2604tU
    public void setListener(InterfaceC2603tT interfaceC2603tT) {
        this.A06 = interfaceC2603tT;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2604tU
    public void setTitle(String str) {
        this.A05.setTitle(str);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2604tU
    public void setUrl(String str) throws SecurityException {
        this.A07 = str;
        if (TextUtils.isEmpty(this.A07) || A06(35, 11, 67).equals(this.A07)) {
            this.A05.setSubtitle(null);
            this.A03.setEnabled(false);
            this.A03.setColorFilter(new PorterDuffColorFilter(A0I, PorterDuff.Mode.SRC_IN));
        } else {
            this.A05.setSubtitle(this.A07);
            this.A03.setEnabled(true);
            this.A03.setColorFilter((ColorFilter) null);
        }
    }
}
