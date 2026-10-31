package com.facebook.ads.redexgen.X;

import android.util.SparseBooleanArray;
import java.lang.ref.WeakReference;
import java.util.Iterator;
import java.util.List;

/* loaded from: assets/audience_network/classes.dex */
public final class C1 extends AbstractC1978jE {
    public static String[] A08 = {"FXqlzRGtImhOdfWqCRyac46PuEORcVHh", "tin0mHuxCmVFWzwOygyTfmqlJ9Mzxl7D", "VABdh0TJ2eWi98wNTSIP5bEHQKFvO8pS", "n", "wryP", "p7AsImouYb7XdSCXwl9kOcdMHl7Wlu5Y", "TIzINHzpeOxuFps4upXK4j08MllXArTc", "oGk0V5WwsqztiP1ME5WI8pfP"};
    public C1750fT A00;
    public AbstractC1540c3 A01;
    public C1539c2 A02;
    public final SparseBooleanArray A03;
    public final C0958Hi A04;
    public final AbstractC06635h A05;
    public final C1539c2 A06;
    public final boolean A07;

    public C1(AbstractC06635h abstractC06635h, SparseBooleanArray sparseBooleanArray, C1539c2 c1539c2, C0958Hi c0958Hi, C1750fT c1750fT, boolean z11) {
        super(abstractC06635h);
        this.A04 = c0958Hi;
        this.A05 = abstractC06635h;
        this.A03 = sparseBooleanArray;
        this.A06 = c1539c2;
        this.A00 = c1750fT;
        this.A07 = z11;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x000c */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A05(InterfaceC2224nG interfaceC2224nG, C2417qT c2417qT, String str, List<C1962iy> list) {
        boolean z11 = false;
        final boolean z12 = false;
        Iterator<C1962iy> it = list.iterator();
        while (hasUnloggedCard) {
            C1962iy next = it.next();
            boolean hasUnloggedCard = this.A03.get(next.A02());
            if (!hasUnloggedCard) {
                z11 = true;
            }
            if (next.A02() == 0) {
                z12 = true;
            }
            if (z11 && z12) {
                break;
            }
        }
        if (!z11) {
            return;
        }
        if (this.A02 != null) {
            this.A02.A0V();
            this.A02 = null;
        }
        this.A01 = new C2(this, str, list, c2417qT, interfaceC2224nG);
        this.A02 = new C1539c2(this.A05, 10, new WeakReference(this.A01), this.A04);
        this.A02.A0Y(false);
        this.A02.A0W(100);
        this.A02.A0X(100);
        this.A05.setOnAssetsLoadedListener(new InterfaceC2749vp() { // from class: com.facebook.ads.redexgen.X.C3
            @Override // com.facebook.ads.redexgen.X.InterfaceC2749vp
            public final void ADv() {
                this.A00.A0x(z12);
            }
        });
    }

    public final void A0w(InterfaceC1959iv interfaceC1959iv, int i5, InterfaceC2224nG interfaceC2224nG, C2086kz c2086kz, C2417qT c2417qT, String str) {
        this.A05.A1u(this.A04, interfaceC1959iv);
        this.A05.setTag(-1593835536, Integer.valueOf(i5));
        this.A05.A1p();
        List<C1962iy> listA7q = interfaceC1959iv.A7q();
        if (listA7q != null && !listA7q.isEmpty()) {
            Iterator<C1962iy> it = listA7q.iterator();
            while (it.hasNext()) {
                this.A05.A1v(it.next().A08());
            }
            A05(interfaceC2224nG, c2417qT, str, listA7q);
        }
    }

    public final /* synthetic */ void A0x(boolean z11) {
        if (z11) {
            C1539c2 c1539c2 = this.A06;
            if (A08[3].length() != 1) {
                throw new RuntimeException();
            }
            A08[3] = "M";
            c1539c2.A0U();
        }
        if (this.A02 != null) {
            this.A02.A0U();
        }
    }
}
