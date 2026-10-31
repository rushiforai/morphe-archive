package com.facebook.ads.internal.view;

import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import com.facebook.ads.redexgen.X.AbstractC2385px;
import com.facebook.ads.redexgen.X.AbstractC2426qc;
import com.facebook.ads.redexgen.X.AbstractC2452r2;
import com.facebook.ads.redexgen.X.AbstractC2675ud;
import com.facebook.ads.redexgen.X.C0958Hi;
import com.facebook.ads.redexgen.X.C1744fN;
import com.facebook.ads.redexgen.X.C1756fZ;
import com.facebook.ads.redexgen.X.C1765fi;
import com.facebook.ads.redexgen.X.C2232nO;
import com.facebook.ads.redexgen.X.C2329p0;
import com.facebook.ads.redexgen.X.C2450r0;
import com.facebook.ads.redexgen.X.C2496rk;
import com.facebook.ads.redexgen.X.C2505rt;
import com.facebook.ads.redexgen.X.EnumC2437qn;
import com.facebook.ads.redexgen.X.InterfaceC2451r1;
import com.facebook.ads.redexgen.X.InterfaceC2459r9;
import com.facebook.ads.redexgen.X.ViewOnClickListenerC0884El;
import com.facebook.ads.redexgen.X.ViewOnClickListenerC2469rJ;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class FullScreenAdToolbar extends AbstractC2452r2 {
    public static byte[] A0B;
    public static String[] A0C = {"elaUgpg", "xyZ5KhWZZkOCw26QnbyRE89VYXYHkT38", "j2Hg99bd5kkvFLrtwtqoGvtE7T", "FtK0h2Y990QReQxCoMrwn7Y", "09p430KvfvIa5D7TMMbG57be7BWhVuc0", "4K9Dg6G4rdQDm1ubILJxRl9GbBVTjarc", "MQsbPX4", "ODYsITK"};
    public static final int A0D;
    public static final int A0E;
    public static final int A0F;
    public static final int A0G;
    public static final int A0H;
    public C2450r0 A00;
    public InterfaceC2451r1 A01;
    public InterfaceC2451r1 A02;
    public C2496rk A03;
    public boolean A04;
    public boolean A05;
    public final RelativeLayout A06;
    public final C2232nO A07;
    public final InterfaceC2459r9 A08;
    public final C2505rt A09;
    public final C2329p0 A0A;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0B, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 113);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A0B = new byte[]{-26, 15, 18, 22, 8, -61, -28, 7, 56, 75, 86, 85, 88, 90, 6, 39, 74, 77, 72, 72, 69, 59, 58, 75};
    }

    static {
        A03();
        A0D = (int) (AbstractC2385px.A02 * 10.0f);
        A0H = (int) (AbstractC2385px.A02 * 16.0f);
        A0F = A0H - A0D;
        A0G = (A0H * 2) - A0D;
        A0E = (int) (AbstractC2385px.A02 * 4.0f);
    }

    public FullScreenAdToolbar(C0958Hi c0958Hi, InterfaceC2459r9 interfaceC2459r9, C2232nO c2232nO, int i5, int i11, boolean z11) {
        super(c0958Hi);
        this.A01 = null;
        this.A04 = true;
        this.A05 = z11;
        this.A08 = interfaceC2459r9;
        this.A07 = c2232nO;
        setGravity(16);
        this.A09 = new C2505rt(c0958Hi, i5, z11);
        this.A09.setContentDescription(A02(0, 8, 50));
        this.A09.setActionClickListener(new ViewOnClickListenerC2469rJ(this));
        if (!this.A05) {
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
            layoutParams.setMargins(A0F, A0F, A0G, A0F);
            addView(this.A09, layoutParams);
            this.A06 = new RelativeLayout(c0958Hi);
            LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(0, -2);
            layoutParams2.weight = 1.0f;
            this.A0A = new C2329p0(c0958Hi);
            AbstractC2426qc.A0H(1006, this.A0A);
            LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(-2, -2);
            layoutParams3.gravity = 17;
            this.A0A.setLayoutParams(layoutParams3);
            this.A06.addView(this.A0A);
            addView(this.A06, layoutParams2);
            if (i11 != -1) {
                A0G(c0958Hi, i11);
                return;
            }
            return;
        }
        if (i11 != -1) {
            A0G(c0958Hi, i11);
        }
        this.A06 = new RelativeLayout(c0958Hi);
        LinearLayout.LayoutParams layoutParams4 = new LinearLayout.LayoutParams(0, -2);
        layoutParams4.weight = 1.0f;
        this.A0A = new C2329p0(c0958Hi);
        AbstractC2426qc.A0H(1006, this.A0A);
        LinearLayout.LayoutParams layoutParams5 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams5.gravity = 17;
        this.A0A.setLayoutParams(layoutParams5);
        this.A06.addView(this.A0A);
        addView(this.A06, layoutParams4);
        LinearLayout.LayoutParams layoutParams6 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams6.setMargins(0, A0H / 2, A0H / 2, A0H / 2);
        addView(this.A09, layoutParams6);
    }

    private void A04(View view, boolean z11) {
        if (view == null) {
            return;
        }
        view.setVisibility(z11 ? 0 : 8);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public final void A08() {
        super.A08();
        if (this.A00 != null) {
            this.A00.setVisibility(8);
        }
        if (this.A03 != null) {
            this.A03.setVisibility(8);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public final void A09() {
        this.A09.A04();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public final void A0A() {
        if (this.A01 != null) {
            this.A02 = this.A01;
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public final void A0B() {
        this.A01 = getToolbarListener();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public final void A0C(float f11, int i5) {
        this.A09.A05(f11, i5);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public final void A0D(C1744fN c1744fN, boolean z11) {
        boolean z12 = this.A04;
        int iA05 = c1744fN.A05(z12);
        this.A0A.A02(c1744fN.A0B(z12), iA05);
        boolean z13 = this.A05;
        String strA02 = A02(8, 9, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE);
        if (!z13) {
            if (this.A00 != null) {
                this.A00.setIconColors(iA05);
                this.A00.setContentDescription(strA02);
            }
        } else if (this.A03 != null) {
            this.A03.setIconColors(iA05);
            this.A03.setContentDescription(strA02);
        }
        this.A09.A06(c1744fN, z12, z11);
        if (z12) {
            GradientDrawable gradientDrawable = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{-1778384896, 0});
            gradientDrawable.setCornerRadius(0.0f);
            AbstractC2426qc.A0W(this, gradientDrawable);
            boolean fullScreenEnabled = this.A05;
            setReportingViewColor(!fullScreenEnabled ? this.A00 : this.A03);
            return;
        }
        AbstractC2426qc.A0O(this, 0);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public final boolean A0E() {
        return this.A09.A07();
    }

    public final void A0F(C1756fZ c1756fZ, String str, int i5) {
        this.A09.setInitialUnskippableSeconds(i5);
        if (this.A05) {
            if (this.A03 != null) {
                this.A03.setAdDetails(c1756fZ, str, this.A07, this.A08);
                return;
            }
            return;
        }
        C2450r0 c2450r0 = this.A00;
        if (A0C[4].charAt(4) != '3') {
            throw new RuntimeException();
        }
        A0C[5] = "bHmrpXXD4QhMP5hP38hyOXYLbga8TEOt";
        if (c2450r0 == null) {
            return;
        }
        this.A00.setAdDetails(c1756fZ, str, this.A07, this.A08);
    }

    public final void A0G(C0958Hi c0958Hi, int i5) {
        if (this.A00 != null) {
            AbstractC2426qc.A0K(this.A00);
            this.A00.removeAllViews();
        }
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -1);
        if (!this.A05) {
            this.A00 = new C2450r0(c0958Hi, i5);
            layoutParams.setMargins(0, A0H / 2, A0H / 2, A0H / 2);
            addView(this.A00, layoutParams);
        } else {
            this.A03 = new C2496rk(c0958Hi);
            layoutParams.setMargins(A0F, A0F, A0G, A0F);
            addView(this.A03, layoutParams);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public int getToolbarActionMode() {
        return this.A09.getToolbarActionMode();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public int getToolbarHeight() {
        return AbstractC2452r2.A00;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public InterfaceC2451r1 getToolbarListener() {
        return this.A02;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setAdReportingVisible(boolean z11) {
        A04(!this.A05 ? this.A00 : this.A03, z11);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setCTAClickListener(View.OnClickListener onClickListener) {
        this.A0A.setOnClickListener(onClickListener);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setCTAClickListener(ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        this.A0A.setOnClickListener(AbstractC2675ud.A03(viewOnClickListenerC0884El, A02(17, 7, 104)));
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setFullscreen(boolean z11) {
        this.A04 = z11;
    }

    public void setOnlyPageDetails(C1756fZ c1756fZ) {
        if (c1756fZ != null) {
            this.A0A.setPageDetails(c1756fZ);
        } else {
            this.A0A.A01();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setPageDetails(C1756fZ c1756fZ, String str, int i5, C1765fi c1765fi) {
        this.A09.setInitialUnskippableSeconds(i5);
        this.A09.setNTDStyle(c1765fi.A00());
        this.A09.setNTDText(c1765fi.A06());
        this.A0A.setPageDetails(c1756fZ);
        if (this.A05) {
            if (this.A03 != null) {
                this.A03.setAdDetails(c1756fZ, str, this.A07, this.A08);
            }
        } else {
            if (this.A00 == null) {
                return;
            }
            this.A00.setAdDetails(c1756fZ, str, this.A07, this.A08);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setPageDetailsVisible(boolean z11) {
        this.A06.removeAllViews();
        if (z11) {
            RelativeLayout relativeLayout = this.A06;
            C2329p0 c2329p0 = this.A0A;
            if (A0C[4].charAt(4) != '3') {
                throw new RuntimeException();
            }
            String[] strArr = A0C;
            strArr[2] = "uYrc95dj4mq6YR3RipRhNZPjST";
            strArr[3] = "ufyXPPKrvmASdIniU0CJIS9";
            relativeLayout.addView(c2329p0);
        }
        C2505rt c2505rt = this.A09;
        String[] strArr2 = A0C;
        if (strArr2[2].length() == strArr2[3].length()) {
            c2505rt.setToolbarMessageEnabled(!z11);
        } else {
            A0C[1] = "RoBBOPMqmB8G6B1FErbRchWOJuWn3pgq";
            c2505rt.setToolbarMessageEnabled(!z11);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setProgress(float f11) {
        this.A09.setProgress(f11);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setProgressClickListener(View.OnClickListener onClickListener) {
        this.A09.setProgressClickListener(onClickListener);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setProgressImage(EnumC2437qn enumC2437qn) {
        this.A09.setProgressImage(enumC2437qn);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setProgressImmediate(float f11) {
        this.A09.setProgressImmediate(f11);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setProgressSpinnerInvisible(boolean z11) {
        this.A09.setProgressSpinnerInvisible(z11);
    }

    private void setReportingViewColor(View view) {
        if (view != null) {
            AbstractC2426qc.A0T(view, 0, -16777216, A0E);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setSkipIconSuppressed(boolean z11) {
        this.A09.setSkipIconSuppressed(z11);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setToolbarActionMessage(String str) {
        this.A09.setToolbarMessage(str);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setToolbarActionMode(int i5) {
        this.A09.setToolbarActionMode(i5);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setToolbarListener(InterfaceC2451r1 interfaceC2451r1) {
        this.A02 = interfaceC2451r1;
    }
}
