package com.facebook.ads.redexgen.X;

import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.text.TextUtils;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.vungle.ads.internal.protos.Sdk;

/* renamed from: com.facebook.ads.redexgen.X.rv, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2507rv extends LinearLayout {
    public static String[] A0C = {"qGr1oM6ze2ZvFDq8Ki3qRyObr5yzRiJx", "GLhQikeqKozzt8o0SUwffnX5udb8oJhX", "2L4KKrHXh4pefLzkJRf8f09TlA9KR0NV", "T9fSNkPH9eMciWKd16clkbXZ3ykgb54M", "faicLsaAheKF2xUwCFU0HAFzkiHnyWgp", "0QtCZdrMF7Ex6Wq3s19CgAsJPWeoHmD8", "KP6WAOmVSLY7bWYEX9zVsd7UruvbgzkW", "NylqH8MrhRt2V7B6iVtXBwRRmORn3eZu"};
    public static final int A0D = AbstractC2383pv.A0H;
    public int A00;
    public LA A01;
    public int A02;
    public TextView A03;
    public C2649uD A04;
    public final GradientDrawable A05;
    public final GradientDrawable A06;
    public final ImageView A07;
    public final LinearLayout A08;
    public final RelativeLayout A09;
    public final TextView A0A;
    public final C0958Hi A0B;

    public C2507rv(C0958Hi c0958Hi, LA la2, int i5) {
        super(c0958Hi);
        this.A05 = new GradientDrawable();
        this.A06 = new GradientDrawable();
        this.A0B = c0958Hi;
        this.A01 = la2;
        this.A02 = this.A01.A36().A00();
        this.A07 = new ImageView(c0958Hi);
        this.A08 = new LinearLayout(c0958Hi);
        this.A09 = new RelativeLayout(c0958Hi);
        this.A0A = new TextView(c0958Hi);
        this.A00 = i5;
        A02();
    }

    private void A00() {
        if (this.A04 == null) {
            A05();
        }
    }

    private void A01() {
        if (this.A03 == null) {
            A06();
        }
    }

    private void A02() {
        this.A05.setShape(1);
        this.A05.setColor(Integer.MIN_VALUE);
        this.A06.setShape(0);
        this.A06.setColor(Integer.MIN_VALUE);
        this.A06.setCornerRadii(new float[]{50.0f, 50.0f, 50.0f, 50.0f, 50.0f, 50.0f, 50.0f, 50.0f});
        A04();
        this.A09.addView(this.A0A);
        A03();
        this.A09.addView(this.A07);
        setToolbarActionMode(this.A00);
        setGravity(17);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.setMargins(AbstractC2383pv.A0e, 0, AbstractC2383pv.A0e, 0);
        this.A08.addView(this.A09, layoutParams);
        addView(this.A08, new LinearLayout.LayoutParams(-2, -2));
    }

    private void A03() {
        this.A07.setColorFilter(-1);
        this.A07.setPadding(AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(A0D, A0D);
        layoutParams.addRule(1, this.A0A.getId());
        this.A07.setLayoutParams(layoutParams);
    }

    private void A04() {
        this.A0A.setTextColor(-1);
        this.A0A.setTextSize(12.0f);
        if (Build.VERSION.SDK_INT >= 28) {
            this.A0A.setTypeface(Typeface.create(Typeface.SANS_SERIF, 500, false));
        }
        this.A0A.setPadding(AbstractC2383pv.A0c, 0, 0, 0);
        AbstractC2426qc.A0L(this.A0A);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(15);
        this.A0A.setLayoutParams(layoutParams);
    }

    private void A05() {
        this.A04 = new C2649uD(this.A0B, true);
        this.A04.A05(1308622847, -1, 255, false);
        this.A04.setCountdownTextSize((int) (AbstractC2385px.A02 * 15.0f));
        this.A04.setVisibility(8);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(A0D, A0D);
        layoutParams.addRule(13);
        this.A09.addView(this.A04, layoutParams);
    }

    private void A06() {
        this.A03 = new TextView(this.A0B);
        this.A03.setTextColor(-1);
        this.A03.setTextSize(14.0f);
        if (Build.VERSION.SDK_INT >= 28) {
            this.A03.setTypeface(Typeface.create(Typeface.SANS_SERIF, Sdk.SDKError.Reason.DNS_OVER_HTTP_FAILED_VALUE, false));
        } else {
            this.A03.setTypeface(Typeface.DEFAULT_BOLD);
        }
        this.A03.setShadowLayer(2.0f, 1.0f, 1.0f, -16777216);
        this.A03.setVisibility(8);
        this.A03.setPadding(AbstractC2383pv.A0c, 0, AbstractC2383pv.A0c, 0);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
        layoutParams.gravity = 16;
        this.A08.addView(this.A03, 0, layoutParams);
    }

    private void A07(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        this.A0A.setText(str);
        this.A0A.setVisibility(0);
        ImageView imageView = this.A07;
        int i5 = AbstractC2383pv.A0y;
        int i11 = AbstractC2383pv.A0y;
        int i12 = AbstractC2383pv.A0y;
        String[] strArr = A0C;
        if (strArr[0].charAt(24) != strArr[6].charAt(24)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0C;
        strArr2[1] = "AZx3si48BrJIzI6lxarAMnuTy1jTylGn";
        strArr2[7] = "jJOuKs0IpXdaj5Qo3UCZMDuYZwm2lMwx";
        imageView.setPadding(0, i5, i11, i12);
        this.A09.setBackground(this.A06);
    }

    public final void A08() {
        if (this.A04 != null) {
            this.A04.A02();
        }
    }

    public final void A09() {
        if (this.A04 != null) {
            C2649uD c2649uD = this.A04;
            String[] strArr = A0C;
            if (strArr[1].charAt(13) == strArr[7].charAt(13)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0C;
            strArr2[4] = "sI3SeYbT8wRhKF2d6rzgQUgbiMyMiEih";
            strArr2[2] = "5PHiyS0s9LvMufB4gTB8mVsnJdFfCX5C";
            c2649uD.A03();
        }
    }

    public final void A0A(int i5, int i11) {
        A01();
        A00();
        setVisibility(0);
        this.A09.setBackground(null);
        this.A07.setVisibility(4);
        this.A0A.setVisibility(8);
        if (this.A03 != null) {
            this.A03.setVisibility(8);
        }
        if (this.A04 != null) {
            float progress = ((i11 - i5) * 100.0f) / i11;
            this.A04.A04(progress, i5);
            this.A04.setVisibility(0);
        }
    }

    public final void A0B(LA la2) {
        this.A01 = la2;
        this.A02 = this.A01.A36().A00();
    }

    public final void A0C(boolean z11) {
        if (this.A03 == null) {
            return;
        }
        this.A03.setVisibility(z11 ? 0 : 8);
        setVisibility(z11 ? 0 : 4);
    }

    public final boolean A0D() {
        return (this.A00 == 2 || this.A00 == 4) ? false : true;
    }

    private EnumC2437qn getNtdIcon() {
        switch (this.A02) {
            case 1:
                EnumC2437qn actionEncodedImage = EnumC2437qn.ICON_SKIP;
                return actionEncodedImage;
            case 2:
                EnumC2437qn actionEncodedImage2 = EnumC2437qn.AD_NTD_CHEVRON_DOWN;
                return actionEncodedImage2;
            case 3:
            case 4:
            case 5:
            default:
                EnumC2437qn actionEncodedImage3 = EnumC2437qn.OTHER_SKIP;
                return actionEncodedImage3;
            case 6:
                EnumC2437qn actionEncodedImage4 = EnumC2437qn.AD_NTD_OPEN_APP_STORE;
                return actionEncodedImage4;
            case 7:
                EnumC2437qn actionEncodedImage5 = EnumC2437qn.AD_NTD_OPEN_BROWSER;
                return actionEncodedImage5;
        }
    }

    public int getToolbarActionMode() {
        return this.A00;
    }

    public void setActionClickListener(View.OnClickListener onClickListener) {
        setOnClickListener(onClickListener);
    }

    public void setCountdownText(String str) {
        A01();
        if (this.A03 != null) {
            this.A03.setText(str);
            this.A03.setVisibility(0);
        }
    }

    public void setInitialUnskippableSeconds(int i5) {
        if (i5 > 0) {
            setToolbarActionMode(2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x00ae  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00c1  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00ff  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0113  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void setToolbarActionMode(int i5) {
        EnumC2437qn ntdIcon;
        this.A0B.A0F().AHK(i5);
        this.A00 = i5;
        setVisibility(4);
        this.A0A.setVisibility(8);
        if (this.A01.A2Z()) {
            C2649uD c2649uD = this.A04;
            String[] strArr = A0C;
            if (strArr[0].charAt(24) == strArr[6].charAt(24)) {
                String[] strArr2 = A0C;
                strArr2[1] = "Zfh21neEYHGrqu6AehVHGLHZIiTgPzux";
                strArr2[7] = "LUYmK6n3EQhvaZrbcn1uq5zIxM57Ekrm";
                if (c2649uD != null) {
                    this.A04.setVisibility(8);
                }
                this.A07.setVisibility(0);
                this.A09.setBackground(this.A05);
                this.A07.setPadding(AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y);
                switch (i5) {
                    case 0:
                        ntdIcon = EnumC2437qn.NAV_CROSS;
                        setVisibility(0);
                        break;
                    case 1:
                        ntdIcon = EnumC2437qn.ICON_SKIP;
                        A07(this.A01.A36().A0A());
                        setVisibility(0);
                        break;
                    case 8:
                        ntdIcon = getNtdIcon();
                        A07(this.A01.A36().A06());
                        boolean zA2Z = this.A01.A2Z();
                        if (A0C[3].charAt(16) == '1') {
                            String[] strArr3 = A0C;
                            strArr3[1] = "kSspEgPHff5bTec2yY1OzwZgNUNGbpOv";
                            strArr3[7] = "8sBya8qMoblwRLZo0ZyILnJ6YfiCL582";
                            if (zA2Z) {
                                A0C(false);
                            }
                            setVisibility(0);
                            break;
                        }
                        break;
                    case 9:
                        ntdIcon = EnumC2437qn.OTHER_SKIP;
                        A07(this.A01.A36().A05());
                        setVisibility(0);
                        break;
                    default:
                        ntdIcon = EnumC2437qn.NAV_CROSS;
                        break;
                }
                this.A07.setImageBitmap(AbstractC2438qo.A01(ntdIcon));
                if (i5 != 1) {
                    AbstractC2426qc.A0H(1005, this.A07);
                    return;
                }
                if (i5 == 8) {
                    AbstractC2426qc.A0H(1009, this.A07);
                    return;
                }
                ImageView imageView = this.A07;
                String[] strArr4 = A0C;
                if (strArr4[0].charAt(24) == strArr4[6].charAt(24)) {
                    A0C[5] = "K9a8xkZfDY2e81FBiuSbRpEw5l9HcCeI";
                    AbstractC2426qc.A0H(1002, imageView);
                    return;
                }
            }
        } else {
            this.A09.setBackground(this.A05);
            this.A07.setPadding(AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y);
            switch (i5) {
                case 0:
                    break;
                case 1:
                    break;
                case 8:
                    break;
                case 9:
                    break;
            }
            this.A07.setImageBitmap(AbstractC2438qo.A01(ntdIcon));
            if (i5 != 1) {
            }
        }
        throw new RuntimeException();
    }
}
