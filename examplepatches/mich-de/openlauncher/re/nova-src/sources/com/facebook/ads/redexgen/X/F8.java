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
public final class F8 extends LinearLayout implements InterfaceC2604tU {
    public static byte[] A0C;
    public static String[] A0D = {"BcFQtfDK9hAKOHqMXZ8WU6w7kFFUFtET", "X99THADY", "xrszHQ9U", "LYniCeaA4In2f6PN1EUmKn0u4UFNnAjg", "67LwLf7vOYRi", "KnFyaMa0IlAp039IMTM4cUE050arzdiU", "KZPDiGlj7ylPLpBKS8aEPn6szpzZSRmX", "X62cFkrE6UVt0O0iOT2HQ44CPhejJ5g7"};
    public static final int A0E;
    public static final int A0F;
    public static final int A0G;
    public static final Uri A0H;
    public static final View.OnTouchListener A0I;
    public ImageView A00;
    public ImageView A01;
    public ImageView A02;
    public ImageView A03;
    public C2595tL A04;
    public InterfaceC2603tT A05;
    public String A06;
    public final WebView A07;
    public final C0958Hi A08;
    public final InterfaceC2600tQ A09;
    public final boolean A0A;
    public final boolean A0B;

    public static String A06(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0C, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 110);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0A() {
        A0C = new byte[]{-18, 13, 15, 23, -21, 20, 23, 27, 13, 17, 58, 61, 66, 44, 61, 47, -53, -20, -31, -22, -100, -22, -35, -16, -27, -14, -31, -100, -34, -18, -21, -13, -17, -31, -18, 27, 28, 41, 47, 46, -12, 28, 38, 27, 40, 37, 42, 55, 45, 59, 56, 50, 45, -9, 50, 55, 61, 46, 55, 61, -9, 42, 44, 61, 50, 56, 55, -9, 31, 18, 14, 32, 72, 84, 82, 19, 70, 83, 73, 87, 84, 78, 73, 19, 72, 77, 87, 84, 82, 74, 53, 65, 65, 61, 7, -4, -4, 68, 68, 68, -5, 51, 46, 48, 50, 47, 60, 60, 56, -5, 48, 60, 58};
    }

    static {
        A0A();
        A0F = Color.rgb(Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE, Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE, Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE);
        A0G = Color.argb(34, 0, 0, 0);
        A0E = AbstractC2383pv.A0n;
        A0H = AbstractC2351pP.A00(A06(90, 23, 95));
        A0I = new ViewOnTouchListenerC2580t6();
    }

    public F8(C0958Hi c0958Hi, WebView webView, boolean z11) {
        super(c0958Hi);
        this.A09 = new F9(this);
        this.A07 = webView;
        this.A08 = c0958Hi;
        this.A0A = AbstractC2204mw.A06(c0958Hi);
        this.A0B = z11;
        A08();
        A0C(false);
        AbstractC2426qc.A0H(1113, this);
    }

    private void A08() {
        float f11;
        AbstractC2426qc.A0O(this, -1);
        setGravity(16);
        this.A01 = new ImageView(this.A08);
        this.A01.setContentDescription(A06(4, 5, 58));
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(A0E, A0E);
        layoutParams.setMargins(0, 0, AbstractC2383pv.A0e, 0);
        this.A01.setScaleType(ImageView.ScaleType.CENTER);
        this.A01.setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.BROWSER_CLOSE));
        this.A01.setOnTouchListener(A0I);
        this.A01.setOnClickListener(new ViewOnClickListenerC2581t7(this));
        addView(this.A01, layoutParams);
        if (this.A0A && !C2203mv.A2z(this.A08)) {
            this.A00 = new ImageView(this.A08);
            this.A00.setEnabled(false);
            this.A00.setAlpha(0.3f);
            this.A00.setContentDescription(A06(0, 4, 62));
            ViewGroup.LayoutParams backButtonParams = new LinearLayout.LayoutParams(A0E, A0E);
            this.A00.setScaleType(ImageView.ScaleType.CENTER);
            this.A00.setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.BACK_ARROW_V2));
            this.A00.setOnTouchListener(A0I);
            this.A00.setOnClickListener(new ViewOnClickListenerC2582t8(this));
            addView(this.A00, backButtonParams);
        }
        this.A04 = new C2595tL(this.A08);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(0, -2);
        if (this.A0A || C2203mv.A2z(this.A08)) {
            f11 = 0.5f;
        } else {
            f11 = 1.0f;
        }
        layoutParams2.weight = f11;
        this.A04.setGravity(17);
        if (C2203mv.A2z(this.A08) && !this.A0B) {
            LinearLayout linearLayout = new LinearLayout(this.A08);
            linearLayout.setOrientation(1);
            addView(linearLayout, layoutParams2);
            AbstractC2426qc.A0L(linearLayout);
            ImageView imageView = new ImageView(this.A08);
            imageView.setScaleType(ImageView.ScaleType.CENTER);
            imageView.setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.HANDLER));
            linearLayout.addView(imageView, new LinearLayout.LayoutParams(-1, -2));
            LinearLayout.LayoutParams closeButtonParams = new LinearLayout.LayoutParams(-1, -2);
            linearLayout.addView(this.A04, closeButtonParams);
        } else {
            View view = this.A04;
            String[] strArr = A0D;
            if (strArr[3].charAt(7) == strArr[6].charAt(7)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0D;
            strArr2[1] = "wak0M6ib";
            strArr2[2] = "1XgxFmUy";
            addView(view, layoutParams2);
        }
        if (this.A0A && !C2203mv.A2z(this.A08)) {
            this.A02 = new ImageView(this.A08);
            this.A02.setEnabled(false);
            this.A02.setAlpha(0.3f);
            this.A02.setContentDescription(A06(9, 7, 93));
            ViewGroup.LayoutParams titleViewsParams = new LinearLayout.LayoutParams(A0E, A0E);
            this.A02.setScaleType(ImageView.ScaleType.CENTER);
            this.A02.setImageBitmap(AbstractC2438qo.A02(EnumC2437qn.BACK_ARROW_V2));
            this.A02.setOnTouchListener(A0I);
            this.A02.setOnClickListener(new ViewOnClickListenerC2583t9(this));
            addView(this.A02, titleViewsParams);
        }
        this.A03 = new ImageView(this.A08);
        LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(A0E, A0E);
        layoutParams3.setMargins(AbstractC2383pv.A0e, 0, 0, 0);
        this.A03.setContentDescription(A06(16, 19, 14));
        this.A03.setScaleType(ImageView.ScaleType.CENTER);
        this.A03.setOnTouchListener(A0I);
        this.A03.setOnClickListener(new ViewOnClickListenerC2584tA(this));
        addView(this.A03, layoutParams3);
        AbstractC2426qc.A0H(1115, this.A03);
        A09();
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x00c1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A09() {
        Bitmap externalBrowserBitmap = null;
        boolean zA0i = C2203mv.A0i(this.A08);
        if (!zA0i) {
            PackageManager packageManager = this.A08.getPackageManager();
            String[] strArr = A0D;
            if (strArr[3].charAt(7) == strArr[6].charAt(7)) {
                throw new RuntimeException();
            }
            A0D[0] = "lQYGsBWT24Q2YVMaF1tmmHwBjIp9uckf";
            if (packageManager != null) {
                List<ResolveInfo> listQueryIntentActivities = packageManager.queryIntentActivities(new Intent(A06(46, 26, 91), A0H), SQLiteDatabase.OPEN_FULLMUTEX);
                if (listQueryIntentActivities.isEmpty()) {
                    ImageView imageView = this.A03;
                    String[] strArr2 = A0D;
                    if (strArr2[5].charAt(10) != strArr2[7].charAt(10)) {
                        String[] strArr3 = A0D;
                        strArr3[3] = "k9u9nASwQo9p6YeHFfN1cTIckCKFKkxM";
                        strArr3[6] = "FVRvmn8raceFS21tZwAIPV0R9ueq98qI";
                        imageView.setVisibility(8);
                    } else {
                        imageView.setVisibility(8);
                    }
                } else if (listQueryIntentActivities.size() == 1 && listQueryIntentActivities.get(0).activityInfo != null) {
                    if (A06(72, 18, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE).equals(listQueryIntentActivities.get(0).activityInfo.packageName)) {
                        externalBrowserBitmap = AbstractC2438qo.A01(EnumC2437qn.BROWSER_LAUNCH_CHROME);
                    }
                } else {
                    externalBrowserBitmap = getExternalBrowserBitmap();
                }
            }
        }
        if (C2203mv.A2z(this.A08) || zA0i) {
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
        if (this.A02 != null) {
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
        return this.A09;
    }

    public static Bitmap getExternalBrowserBitmap() {
        return AbstractC2438qo.A01(EnumC2437qn.BROWSER_LAUNCH_NATIVE_V2);
    }

    public void setCloseButtonVisibility(int i5) {
        this.A01.setVisibility(i5);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2604tU
    public void setListener(InterfaceC2603tT interfaceC2603tT) {
        this.A05 = interfaceC2603tT;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2604tU
    public void setTitle(String str) {
        this.A04.setTitle(str);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2604tU
    public void setUrl(String str) throws SecurityException {
        this.A06 = str;
        if (!TextUtils.isEmpty(this.A06)) {
            String strA06 = A06(35, 11, 76);
            String str2 = this.A06;
            if (A0D[4].length() == 25) {
                throw new RuntimeException();
            }
            A0D[0] = "AeRJB9OTfMvsbBGGlXyED2wo8BwDWifT";
            if (!strA06.equals(str2)) {
                this.A04.setSubtitle(this.A06);
                ImageView imageView = this.A03;
                String[] strArr = A0D;
                if (strArr[5].charAt(10) == strArr[7].charAt(10)) {
                    String[] strArr2 = A0D;
                    strArr2[1] = "st1TAnSo";
                    strArr2[2] = "hb2Gh0RK";
                    imageView.setEnabled(false);
                    this.A03.setColorFilter((ColorFilter) null);
                    return;
                }
                String[] strArr3 = A0D;
                strArr3[3] = "CdcgRHbkiupQGtXo0S5IQ6iiLJJUYX6Y";
                strArr3[6] = "vmQ5n0yhFYv8xX8lqJCwlk97Jzxr9JD0";
                imageView.setEnabled(true);
                this.A03.setColorFilter((ColorFilter) null);
                return;
            }
        }
        this.A04.setSubtitle(null);
        this.A03.setEnabled(false);
        this.A03.setColorFilter(new PorterDuffColorFilter(A0F, PorterDuff.Mode.SRC_IN));
    }
}
