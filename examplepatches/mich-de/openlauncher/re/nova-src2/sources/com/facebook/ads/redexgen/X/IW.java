package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import com.facebook.ads.AdClosedListener;
import com.facebook.ads.AdOptionsView;
import com.facebook.ads.NativeAdBase;
import com.facebook.ads.NativeAdLayout;
import com.facebook.ads.internal.api.AdComponentViewApi;
import com.facebook.ads.internal.api.AdOptionsViewApi;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class IW extends C2006jg implements AdOptionsViewApi, InterfaceC2567st {
    public static byte[] A0B;
    public static String[] A0C = {"CkZnzxl3KoAR2AUpu7E0ljmyeM3xVlhW", "s96L7cd5OC6f2FYllBG2mQFBNJ0iBr9H", "sBJxdwGnmfegaNl1eKOK7oxYkds", "gi8OfYTwYtYM2mj23YR2GOQCf0QAGaqx", "9AU2dLWnp", "ak8nPc64jiqBpYJD5gtwuYZ79ATDfOmL", "lvwIomut4bETUNlBWCmSjtPEmfL", "UQ4fUWn5EXj3yIA2p0bY5IranxkdL484"};
    public static final int A0D;
    public static final int A0E;
    public ImageView A00;
    public ImageView A01;
    public C2579t5 A02;
    public boolean A03;
    public boolean A04;
    public boolean A05;
    public final Context A06;
    public final LinearLayout A07;
    public final AdOptionsView A08;
    public final NativeAdLayout A09;
    public final GT A0A;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0B, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A08() {
        A0B = new byte[]{91, 108, 121, 102, 123, 125, 41, 72, 109};
    }

    static {
        A08();
        A0D = (int) (AbstractC2385px.A02 * 23.0f);
        A0E = (int) (AbstractC2385px.A02 * 4.0f);
    }

    public IW(Context context, NativeAdBase nativeAdBase, NativeAdLayout nativeAdLayout, AdOptionsView.Orientation orientation, int i5, AdOptionsView adOptionsView) {
        this.A05 = false;
        this.A04 = false;
        this.A03 = false;
        this.A08 = adOptionsView;
        this.A09 = nativeAdLayout;
        this.A06 = context;
        this.A07 = new LinearLayout(context);
        this.A08.addView(this.A07);
        this.A07.setOrientation(orientation != AdOptionsView.Orientation.HORIZONTAL ? 1 : 0);
        this.A0A = GT.A0L(nativeAdBase.getInternalNativeAd());
        this.A0A.A1c(nativeAdLayout);
        this.A0A.A1e(this);
        C1056Lh c1056LhA12 = this.A0A.A12();
        if (c1056LhA12 != null && c1056LhA12.A0R() && !c1056LhA12.A0P()) {
            this.A07.setVisibility(8);
            return;
        }
        EnumC2391q3.A04(this.A08, EnumC2391q3.A0B);
        if (A0C()) {
            A05();
            return;
        }
        if (A0B()) {
            A06();
        } else {
            A09(i5);
        }
        A04();
    }

    public IW(Context context, NativeAdBase nativeAdBase, NativeAdLayout nativeAdLayout, AdOptionsView adOptionsView) {
        this(context, nativeAdBase, nativeAdLayout, AdOptionsView.Orientation.HORIZONTAL, 23, adOptionsView);
    }

    private ImageView A00(EnumC2437qn enumC2437qn) {
        ImageView imageView = new ImageView(this.A08.getContext());
        imageView.setScaleType(ImageView.ScaleType.FIT_CENTER);
        imageView.setPadding(A0E, A0E, A0E, A0E);
        imageView.setImageBitmap(AbstractC2438qo.A01(enumC2437qn));
        return imageView;
    }

    public static EnumC2437qn A01(LA la2) {
        if (AbstractC2568su.A00(la2) == EnumC2572sy.A02) {
            return EnumC2437qn.AD_CHOICE_COLLAPSED_PILL;
        }
        return EnumC2437qn.CREDIT_LINE_COLLAPSED_PILL;
    }

    public static EnumC2437qn A02(LA la2) {
        if (AbstractC2568su.A00(la2) == EnumC2572sy.A02) {
            return EnumC2437qn.AD_CHOICE_EXPANDED_PILL;
        }
        return EnumC2437qn.CREDIT_LINE_PILL;
    }

    private void A04() {
        this.A07.setOnClickListener(new View.OnClickListener() { // from class: com.facebook.ads.redexgen.X.jV
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.A00.A0D(view);
            }
        });
    }

    private void A05() {
        C2570sw c2570swA02 = AbstractC2571sx.A02(this.A0A.A15(), EnumC2569sv.A05, this.A0A.A13());
        c2570swA02.setBackgroundColor(-2145637581);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
        this.A07.addView(c2570swA02, layoutParams);
    }

    private void A06() {
        if (this.A0A.A13() != null) {
            A0A(A01(this.A0A.A13()));
        }
        ImageView imageView = this.A00;
        if (A0C[5].charAt(31) == 'O') {
            throw new RuntimeException();
        }
        A0C[4] = "YyD4X5GiymoBAkrpucGvbVP";
        if (imageView != null && this.A09 != null) {
            LA laA13 = this.A0A.A13();
            String[] strArr = A0C;
            if (strArr[7].charAt(30) == strArr[0].charAt(30)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0C;
            strArr2[6] = "fnm2gTZWgC6YLAGn3BGtgGXwIc7";
            strArr2[2] = "oA9NxMIHKATFOovnEa6fPm1uf7i";
            if (laA13 != null) {
                this.A02 = AbstractC2571sx.A03(this.A0A.A15(), EnumC2569sv.A05, this.A0A.A13(), this.A00, A02(this.A0A.A13()), this.A09, this);
                if (this.A0A.A13().A3O()) {
                    this.A02.A0A();
                }
            }
        }
    }

    private void A07() {
        this.A0A.A1O();
        if (C2203mv.A2b(this.A06)) {
            this.A07.performAccessibilityAction(128, null);
        }
    }

    private void A09(int i5) {
        this.A01 = A00(EnumC2437qn.DEFAULT_INFO_ICON);
        A0A(EnumC2437qn.AD_CHOICES_ICON);
        this.A07.addView(this.A01);
        setIconSizeDp(i5);
        setIconColor(-10459280);
    }

    private void A0A(EnumC2437qn enumC2437qn) {
        this.A00 = A00(enumC2437qn);
        this.A00.setContentDescription(A03(0, 9, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE));
        this.A07.addView(this.A00);
    }

    private boolean A0B() {
        return this.A0A.A13() != null && this.A0A.A13().A3O();
    }

    private boolean A0C() {
        return this.A0A.A13() != null && this.A0A.A13().A3U();
    }

    public final /* synthetic */ void A0D(View view) {
        if (A0B()) {
            if (this.A02 != null) {
                C2579t5 c2579t5 = this.A02;
                String[] strArr = A0C;
                if (strArr[7].charAt(30) == strArr[0].charAt(30)) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A0C;
                strArr2[7] = "FI36i5ZBheG2467KeCXdwFmzZVvcFROh";
                strArr2[0] = "Ohr6PfUStlEZFb2oqP0dd6shAo9me27T";
                c2579t5.A0B();
                return;
            }
            return;
        }
        A07();
    }

    public final void A0E(EnumC2437qn enumC2437qn) {
        if (this.A01 != null) {
            this.A01.setImageBitmap(AbstractC2438qo.A01(enumC2437qn));
        }
    }

    public final boolean A0F() {
        return this.A03;
    }

    public final boolean A0G() {
        return this.A04;
    }

    public final boolean A0H() {
        return this.A05;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2567st
    public final void AEX(View view) {
        A07();
    }

    @Override // com.facebook.ads.internal.api.AdComponentViewApiProvider
    public final AdComponentViewApi getAdComponentViewApi() {
        return this;
    }

    @Override // com.facebook.ads.redexgen.X.C2006jg, com.facebook.ads.internal.api.AdComponentView
    public final void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        if (!z11 && this.A02 != null) {
            this.A02.A09();
        }
    }

    @Override // com.facebook.ads.internal.api.AdOptionsViewApi
    public final void setIconColor(int i5) {
        if (this.A01 != null) {
            this.A01.setColorFilter(i5);
        }
        if (this.A00 != null && !A0B()) {
            this.A00.setColorFilter(i5);
            this.A03 = true;
        }
    }

    @Override // com.facebook.ads.internal.api.AdOptionsViewApi
    public final void setIconSizeDp(int i5) {
        int iconSize = Math.max(A0D, (int) (AbstractC2385px.A02 * i5));
        LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(iconSize, iconSize);
        if (this.A01 != null) {
            this.A01.setLayoutParams(iconParams);
        }
        if (this.A00 != null) {
            this.A00.setLayoutParams(iconParams);
            this.A04 = true;
        }
    }

    @Override // com.facebook.ads.redexgen.X.C2006jg, com.facebook.ads.internal.api.AdComponentView
    public final void setLayoutParams(ViewGroup.LayoutParams layoutParams) {
        layoutParams.width = -2;
        layoutParams.height = -2;
        super.setLayoutParams(layoutParams);
    }

    @Override // com.facebook.ads.internal.api.AdOptionsViewApi
    public final void setOnAdClosedListener(AdClosedListener adClosedListener) {
        this.A0A.A1Y(adClosedListener);
    }

    @Override // com.facebook.ads.internal.api.AdOptionsViewApi
    public final void setSingleIcon(boolean z11) {
        if (this.A01 != null) {
            AbstractC2426qc.A0P(this.A01, z11 ? 8 : 0);
        }
        this.A05 = true;
    }
}
