package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* renamed from: com.facebook.ads.redexgen.X.rt, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2505rt extends LinearLayout {
    public static String[] A0C = {"RdKbZKE5ShqjtspsYuId0BpVT", "jFs6Ox2yxsj", b.f42142b, "O0DGVMIkWcl", "ZjYxtVw01iwSMNXN0b17Jtyc9gHU9Z2d", "b1LSaO6GQJOSELIr8C99", b.f42142b, "wukZGaaSm"};
    public static final int A0D = (int) (AbstractC2385px.A02 * 15.0f);
    public static final int A0E = (int) (AbstractC2385px.A02 * 10.0f);
    public static final int A0F = (int) (AbstractC2385px.A02 * 44.0f);
    public int A00;
    public boolean A01;
    public boolean A02;
    public int A03;
    public String A04;
    public boolean A05;
    public boolean A06;
    public final ImageView A07;
    public final LinearLayout A08;
    public final TextView A09;
    public final C0958Hi A0A;
    public final C2649uD A0B;

    public C2505rt(C0958Hi c0958Hi, int i5, boolean z11) {
        super(c0958Hi);
        this.A01 = false;
        this.A02 = false;
        this.A04 = b.f42142b;
        this.A0A = c0958Hi;
        this.A05 = z11;
        this.A07 = new ImageView(c0958Hi);
        this.A07.setPadding(A0E, A0E, A0E, A0E);
        this.A0B = new C2649uD(c0958Hi, this.A05);
        this.A0B.setProgress(0.0f);
        this.A0B.setPadding(A0E, A0E, A0E, A0E);
        this.A09 = new TextView(c0958Hi);
        setOrientation(0);
        this.A08 = new LinearLayout(c0958Hi);
        this.A00 = i5;
        A01();
    }

    private void A00() {
        if (!this.A06) {
            return;
        }
        this.A09.setText(b.f42142b);
        this.A09.setVisibility(8);
        this.A06 = false;
    }

    private void A01() {
        setToolbarActionMode(this.A00);
        ViewGroup.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
        setGravity(17);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(A0F, A0F);
        AbstractC2426qc.A0b(this.A09, true, 16);
        this.A09.setTextColor(-1);
        this.A09.setVisibility(8);
        this.A08.addView(this.A07, layoutParams2);
        this.A08.addView(this.A0B, layoutParams2);
        addView(this.A08, layoutParams);
        LinearLayout.LayoutParams actionTextLayoutParams = new LinearLayout.LayoutParams(-2, -2);
        actionTextLayoutParams.gravity = 17;
        addView(this.A09, actionTextLayoutParams);
    }

    private void A02() {
        if (TextUtils.isEmpty(this.A04)) {
            return;
        }
        this.A09.setText(this.A04);
        this.A09.setVisibility(0);
        this.A06 = true;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A03() {
        int i5;
        int i11 = 0;
        boolean z11 = this.A00 == 2 || this.A00 == 6;
        C2649uD c2649uD = this.A0B;
        if (z11) {
            boolean isCountdownMode = this.A01;
            if (!isCountdownMode) {
                boolean isCountdownMode2 = this.A02;
                i5 = isCountdownMode2 ? 4 : 0;
            }
        } else {
            i5 = 8;
        }
        c2649uD.setVisibility(i5);
        if (this.A00 == 5) {
            i11 = 4;
        } else if (z11) {
            i11 = 8;
        }
        boolean isCountdownMode3 = this.A02;
        if (isCountdownMode3 && i11 == 0) {
            i11 = 8;
        }
        this.A07.setVisibility(i11);
        int actionIconVisibility = A0C[4].charAt(13);
        if (actionIconVisibility == 67) {
            throw new RuntimeException();
        }
        A0C[5] = "hK85U6OgwPHC";
    }

    public final void A04() {
        setVisibility(4);
    }

    public final void A05(float f11, int i5) {
        this.A0B.A04(f11, i5);
    }

    public final void A06(C1744fN c1744fN, boolean z11, boolean z12) {
        int iA05 = c1744fN.A05(z11);
        this.A0B.A05(AbstractC1841gx.A02(iA05, 77), iA05, 110, true);
        this.A07.setColorFilter(iA05);
        if (z12) {
            TextView textView = this.A09;
            int accentColor = AbstractC1841gx.A02(-1, 110);
            textView.setTextColor(accentColor);
            return;
        }
        this.A09.setTextColor(iA05);
    }

    public final boolean A07() {
        return !this.A09.getText().toString().isEmpty();
    }

    public final boolean A08() {
        return (this.A00 == 2 || this.A00 == 4) ? false : true;
    }

    private EnumC2437qn getNtdIcon() {
        switch (this.A03) {
            case 1:
                return EnumC2437qn.ICON_SKIP;
            case 2:
                return EnumC2437qn.AD_NTD_CHEVRON_DOWN;
            case 3:
            case 4:
            case 5:
            default:
                return EnumC2437qn.OTHER_SKIP;
            case 6:
                return EnumC2437qn.AD_NTD_OPEN_APP_STORE;
            case 7:
                return EnumC2437qn.AD_NTD_OPEN_BROWSER;
        }
    }

    public int getToolbarActionMode() {
        return this.A00;
    }

    public void setActionClickListener(View.OnClickListener onClickListener) {
        setOnClickListener(onClickListener);
    }

    public void setInitialUnskippableSeconds(int i5) {
        if (i5 > 0) {
            setToolbarActionMode(2);
        }
    }

    public void setNTDStyle(int i5) {
        this.A03 = i5;
        if (this.A00 == 8) {
            this.A07.setImageBitmap(AbstractC2438qo.A01(getNtdIcon()));
        }
    }

    public void setNTDText(String str) {
        this.A04 = str;
        if (this.A00 == 8) {
            A02();
        }
    }

    public void setProgress(float f11) {
        this.A0B.setProgressWithAnimation(f11);
    }

    public void setProgressClickListener(View.OnClickListener onClickListener) {
        this.A0B.setOnClickListener(onClickListener);
    }

    public void setProgressImage(EnumC2437qn enumC2437qn) {
        this.A0B.setImage(enumC2437qn);
    }

    public void setProgressImmediate(float f11) {
        this.A0B.clearAnimation();
        this.A0B.setProgress(f11);
    }

    public void setProgressSpinnerInvisible(boolean z11) {
        this.A01 = z11;
        A03();
    }

    public void setSkipIconSuppressed(boolean z11) {
        this.A02 = z11;
        A03();
    }

    public void setToolbarActionMode(int i5) {
        EnumC2437qn ntdIcon;
        this.A0A.A0F().AHK(i5);
        this.A00 = i5;
        A03();
        setVisibility(0);
        this.A07.setImageAlpha(255);
        this.A07.setPadding(A0E, A0E, A0E, A0E);
        if (i5 != 8) {
            A00();
        }
        switch (i5) {
            case 0:
                ntdIcon = EnumC2437qn.CROSS;
                break;
            case 1:
                if (!this.A05) {
                    ntdIcon = EnumC2437qn.SKIP_ARROW;
                    break;
                } else {
                    ntdIcon = EnumC2437qn.REDESIGN_SKIP_ICON;
                    break;
                }
            case 2:
            default:
                ntdIcon = EnumC2437qn.CROSS;
                break;
            case 3:
                ntdIcon = EnumC2437qn.MINIMIZE_ARROW;
                break;
            case 4:
                ntdIcon = EnumC2437qn.CROSS;
                this.A07.setVisibility(8);
                setVisibility(8);
                break;
            case 5:
                ntdIcon = EnumC2437qn.CROSS;
                break;
            case 6:
                ntdIcon = EnumC2437qn.CROSS;
                break;
            case 7:
                ntdIcon = EnumC2437qn.CROSS;
                this.A07.setImageAlpha(110);
                this.A07.setPadding(A0D, A0D, A0D, A0D);
                break;
            case 8:
                ntdIcon = getNtdIcon();
                if (A0C[4].charAt(13) != 'C') {
                    String[] strArr = A0C;
                    strArr[6] = b.f42142b;
                    strArr[2] = b.f42142b;
                    A02();
                    break;
                } else {
                    throw new RuntimeException();
                }
        }
        this.A07.setImageBitmap(AbstractC2438qo.A01(ntdIcon));
        if (i5 == 1) {
            AbstractC2426qc.A0H(1005, this.A07);
            setVisibility(0);
        } else if (i5 == 8) {
            AbstractC2426qc.A0H(1009, this.A07);
            setVisibility(0);
        } else {
            AbstractC2426qc.A0H(1002, this.A07);
        }
    }

    public void setToolbarMessage(String str) {
        this.A09.setText(str);
        this.A09.setVisibility(TextUtils.isEmpty(str) ? 8 : 0);
        this.A06 = false;
    }

    public void setToolbarMessageEnabled(boolean z11) {
        this.A09.setVisibility(z11 ? 0 : 4);
    }
}
