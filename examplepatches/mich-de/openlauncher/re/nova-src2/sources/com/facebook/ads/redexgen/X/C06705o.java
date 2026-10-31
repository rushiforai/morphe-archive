package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import com.facebook.ads.internal.adapters.datamodels.AdInfo;
import com.facebook.ads.internal.view.FullScreenAdToolbar;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.5o, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C06705o extends AbstractC0905Fg {
    public static byte[] A0C;
    public static String[] A0D = {"hEO5MspmmQwWZDjfO9hYkGtE8t8ljCUN", "895GOd6GqHS2SDNwtQvAqIE", "zBXblOu1CdgXx49mdyV8flA", "GxqIbNjcrUQMSJiuMkyJv1mwkudVYaGP", "be3ZgXhlaup3yXbKLr41yKjcTusIQNjx", "HLi8FTj59ZkYUe8FmXrpO0CEflvtIm0o", "7bereGXxKpIS6kk2UNHV0kt11i4QSfeP", "LRvrjmvhZNKPrr4qRukG9JYrfPQqD7wd"};
    public static final int A0E;
    public static final int A0F;
    public static final int A0G;
    public static final int A0H;
    public static final int A0I;
    public static final int A0J;
    public int A00;
    public int A01;
    public LinearLayout A02;
    public C2086kz A03;
    public C06243u A04;
    public C2660uO A05;
    public C0823Cc A06;
    public AbstractC1540c3 A07;
    public C1539c2 A08;
    public String A09;
    public List<C2314ol> A0A;
    public final C2417qT A0B;

    public static String A0J(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0C, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A0D;
            if (strArr[0].charAt(22) != strArr[6].charAt(22)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0D;
            strArr2[5] = "I427OJiZERIl1pgFYs7VIJxgJMuHqTWY";
            strArr2[4] = "m1VK8a3APoHjuOOKlTc7gi9yCeUy6Tbh";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 74);
            i13++;
        }
    }

    public static void A0L() {
        A0C = new byte[]{100, 102, 117, 104, 114, 116, 98, 107, 0, 24, 26, 3};
    }

    static {
        A0L();
        A0F = (int) (AbstractC2385px.A02 * 48.0f);
        A0G = AbstractC2383pv.A0y;
        A0H = (int) (AbstractC2385px.A02 * 8.0f);
        A0J = (int) (AbstractC2385px.A02 * 56.0f);
        A0E = (int) (AbstractC2385px.A02 * 48.0f);
        A0I = (int) (AbstractC2385px.A02 * 12.0f);
    }

    public C06705o(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, C2086kz c2086kz, InterfaceC2459r9 interfaceC2459r9, LA la2) {
        super(c0958Hi, interfaceC2224nG, interfaceC2459r9, la2);
        this.A0B = new C2417qT();
        if (la2 instanceof C07147g) {
            super.A09 = true;
            super.A08 = new C1814gV(c0958Hi, new FG(), this.A0D.A1u(), interfaceC2459r9);
        }
        this.A03 = c2086kz;
        if (Build.VERSION.SDK_INT >= 35) {
            setFitsSystemWindows(true);
        }
        this.A0E.A0F().AM1(A0J(0, 0, 93), getResources().getConfiguration().orientation, false, false, A0J(0, 8, 77));
    }

    private int A00() {
        return A0J + A0F + (A0G * 4) + (this.A0D.A3F() ? A0E : 0);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public EnumC1698ec A02(String str) {
        EnumC1698ec enumC1698ecA0E = EnumC1698ec.A08;
        if (this.A04 == null) {
            return enumC1698ecA0E;
        }
        CQ holder = (CQ) this.A04.A1I(this.A04.getLayoutManager().A38());
        if (holder != null && holder.A0w() != null) {
            enumC1698ecA0E = holder.A0w().A0E(str);
            if (holder.A0w().getCtaActionHelper().A07() == null) {
                holder.A0w().getCtaActionHelper().A09(new CV(this));
            }
        }
        return enumC1698ecA0E;
    }

    private final void A0M() {
        if (this.A02 != null) {
            this.A02.removeAllViews();
            this.A02 = null;
        }
        if (this.A04 != null) {
            this.A04.removeAllViews();
            this.A04.A1U();
            this.A04 = null;
        }
        if (this.A05 != null) {
            this.A05.removeAllViews();
            this.A05 = null;
        }
    }

    private final void A0N(int i5, Bundle bundle) throws IllegalStateException {
        int childWidth;
        int i11;
        int height;
        if (this.A0A != null && this.A0D != null && this.A09 != null) {
            this.A02 = new LinearLayout(getContext());
            if (i5 == 1) {
                this.A02.setGravity(17);
            } else {
                this.A02.setGravity(48);
            }
            this.A02.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
            this.A02.setOrientation(1);
            int i12 = AbstractC2385px.A04.widthPixels;
            int i13 = AbstractC2385px.A04.heightPixels;
            if (i5 == 1) {
                childWidth = Math.min(i12 - (A0G * 4), i13 / 2);
                i11 = (i12 - childWidth) / 8;
                height = i11 * 4;
            } else {
                childWidth = i13 - A00();
                i11 = A0G;
                height = i11 * 2;
                if (A0D[3].charAt(7) == 'c') {
                    A0D[3] = "33a9m0XcSM7ZjVpxQbOo2BFfYt51qxyV";
                }
                throw new RuntimeException();
            }
            this.A07 = new CW(this);
            this.A08 = new C1539c2(this, 1, new WeakReference(this.A07), this.A0E);
            C1539c2 c1539c2 = this.A08;
            int extraSpacing = this.A00;
            c1539c2.A0W(extraSpacing);
            C1539c2 c1539c22 = this.A08;
            int extraSpacing2 = this.A01;
            c1539c22.A0X(extraSpacing2);
            this.A04 = new C06243u(this.A0E);
            this.A04.setLayoutParams(new RelativeLayout.LayoutParams(-1, -2));
            this.A06 = new C0823Cc(this.A04, i5, this.A0A.size(), this.A08, bundle, false);
            this.A06.A0k(this.A0A);
            int extraSpacing3 = i11;
            int childSpacing = childWidth;
            this.A04.setAdapter(new CX(this.A0E, this.A0A, this.A0D, this.A0F, this.A03, this.A08, this.A0B, getAudienceNetworkListener(), this.A09, childSpacing, extraSpacing3, height, i5, this.A06, this.A0H));
            this.A04.A1o(this.A04.getOnScrollListener());
            if (i5 == 1) {
                A0P(this.A06);
            }
            this.A02.addView(this.A04);
            if (this.A05 != null) {
                this.A02.addView(this.A05);
            }
            boolean zA1z = C2203mv.A1z(this.A0E);
            String[] strArr = A0D;
            if (strArr[0].charAt(22) == strArr[6].charAt(22)) {
                String[] strArr2 = A0D;
                strArr2[2] = "aDPNGuTrfnUmeGhx8dEtLad";
                strArr2[1] = "oEJmwC7eMAbLdHre0yQkkMB";
                if (zA1z) {
                    this.A0E.A0B().AM7(this.A04, this.A0D.A37(), false);
                }
                A0k(this.A02, false, i5);
                return;
            }
            throw new RuntimeException();
        }
    }

    private void A0O(LA la2) {
        this.A09 = la2.A37();
        this.A00 = la2.A1J();
        this.A01 = la2.A1K();
        List<C1735fE> listA39 = la2.A39();
        List<AdInfo> adInfoList = new ArrayList<>(listA39.size());
        this.A0A = adInfoList;
        int i5 = 0;
        while (true) {
            int size = listA39.size();
            String[] strArr = A0D;
            String str = strArr[5];
            String str2 = strArr[4];
            int i11 = str.charAt(16);
            if (i11 == str2.charAt(16)) {
                throw new RuntimeException();
            }
            A0D[3] = "1AHb04hcylshFNuVFPVd0IA840Fx90m0";
            if (i5 < size) {
                C1735fE c1735fE = listA39.get(i5);
                List<C2314ol> list = this.A0A;
                int i12 = listA39.size();
                list.add(new C2314ol(i5, i12, c1735fE));
                i5++;
            } else {
                return;
            }
        }
    }

    private void A0P(C0823Cc c0823Cc) throws IllegalStateException {
        C7P c7p = new C7P();
        if (this.A04 != null) {
            this.A04.setOnFlingListener(null);
        }
        c7p.A0G(this.A04);
        c0823Cc.A0i(new CU(this));
        if (this.A0A != null && super.A07 != null) {
            this.A05 = new C2660uO(this.A0E, super.A07.A01(), this.A0A.size());
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, A0H);
            layoutParams.setMargins(0, A0I, 0, 0);
            this.A05.setLayoutParams(layoutParams);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0905Fg
    public final FullScreenAdToolbar A0g() {
        return new FullScreenAdToolbar(this.A0E, getAudienceNetworkListener(), this.A0G, 0, this.A0D.A2u(), false);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0905Fg
    public final void A0i() {
        EnumC1698ec enumC1698ecA02 = A02(A0J(8, 4, 57));
        if (this.A0D.A3H()) {
            return;
        }
        EnumC1698ec actionOutcome = EnumC1698ec.A08;
        if (enumC1698ecA02 != actionOutcome) {
            EnumC1698ec actionOutcome2 = EnumC1698ec.A05;
            if (enumC1698ecA02 != actionOutcome2) {
                A0r();
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0905Fg
    public final boolean A0q() {
        return false;
    }

    public final void A0r() {
        if (this.A0H.getToolbarActionMode() == 8) {
            this.A0H.setToolbarActionMode(2);
        }
        this.A0D.A3D(false);
        this.A0D.A32().A0N(-1);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void ABc(Intent intent, Bundle bundle, C1998jY c1998jY) throws IllegalStateException {
        A0l(c1998jY);
        if (this.A0D != null) {
            A0O(this.A0D);
        }
        A0N(c1998jY.A05().getResources().getConfiguration().orientation, bundle);
        c1998jY.A0A(new CT(this, c1998jY));
        if (this.A0D != null) {
            int iA04 = this.A0D.A32().A0I().A04();
            if (super.A09) {
                iA04 = this.A0D.A32().A0I().A03();
            }
            if (iA04 > 0) {
                A0j(iA04);
            }
            int unskippableSec = this.A0D.A32().A0I().A02();
            if (unskippableSec >= 0) {
                this.A0H.setToolbarActionMode(8);
            }
            if (this.A0D.A3R()) {
                this.A0H.setOnClickListener(new ViewOnClickListenerC2308of(this));
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0905Fg, com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AGF(boolean z11) {
        super.AGF(z11);
        if (this.A06 != null) {
            this.A06.A0U();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0905Fg, com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AGp(boolean z11) {
        super.AGp(z11);
        if (this.A06 != null) {
            C0823Cc c0823Cc = this.A06;
            if (A0D[3].charAt(7) != 'c') {
                throw new RuntimeException();
            }
            A0D[3] = "WQGRJtcc30lEWdH0kDQlnI6y1dvpEWXq";
            c0823Cc.A0W();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AKD(Bundle bundle) {
        if (this.A06 != null) {
            this.A06.A0f(bundle);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0905Fg
    public int getCloseButtonStyle() {
        return 0;
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) throws IllegalStateException {
        Bundle bundle = new Bundle();
        AKD(bundle);
        A0M();
        A0N(configuration.orientation, bundle);
        super.onConfigurationChanged(configuration);
        if (Build.VERSION.SDK_INT >= 35) {
            setFitsSystemWindows(true);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0905Fg, com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void onDestroy() {
        super.onDestroy();
        if (C2203mv.A1z(this.A0E)) {
            this.A0E.A0B().ALo(this.A04);
        }
        if (!TextUtils.isEmpty(this.A09)) {
            this.A0F.ABt(this.A09, new C2618ti().A05(this.A08).A04(this.A0B).A07());
        }
        A0M();
        if (this.A08 != null) {
            this.A08.A0V();
        }
        this.A08 = null;
        this.A07 = null;
        this.A0A = null;
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        this.A0B.A06(this.A0E, motionEvent, this, this);
        return super.onInterceptTouchEvent(motionEvent);
    }
}
