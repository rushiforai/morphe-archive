package com.facebook.ads.redexgen.X;

import android.view.View;
import android.view.animation.AlphaAnimation;
import com.facebook.ads.internal.api.BuildConfigApi;
import com.facebook.ads.internal.settings.AdInternalSettings;

/* renamed from: com.facebook.ads.redexgen.X.4v, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C06514v extends G2<C1539c2> implements InterfaceC2091l6 {
    public static String[] A02 = {"iVby5wy6H7l4dzY0Hld0xs9tuHtnGk", "Nr0U5YnFPaRVMsCPPiWFbDdqiRS3TX59", "NmHEOi9mcJk9OQjZmIqLk3AYwOx5ICK3", "j6OxXppfxNxejmkkIb10P2S2ED13bfax", "YxA", "okdCTGqDBxOQkU", "XAA3rxsPdfTGxXL8JCFSxOB2RupP9g", "Mu"};
    public C0958Hi A00;
    public boolean A01;

    public C06514v(C1539c2 c1539c2, C0958Hi c0958Hi) {
        super(c1539c2);
        this.A00 = c0958Hi;
        this.A01 = false;
    }

    private void A00(int i5) {
        if (!this.A01) {
            this.A00.A0F().A4L(i5);
        }
        String[] strArr = A02;
        if (strArr[0].length() != strArr[6].length()) {
            throw new RuntimeException();
        }
        A02[1] = "k6Oe58jhR2JQ133LIP7LsY5lW6eco9l5";
        this.A01 = true;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        C1539c2 c1539c2A08 = A08();
        int iIntValue = 0;
        if (c1539c2A08 == null) {
            A00(0);
            return;
        }
        View view = c1539c2A08.A0C;
        AbstractC1540c3 abstractC1540c3 = (AbstractC1540c3) c1539c2A08.A0E.get();
        int i5 = 1;
        boolean z11 = view == null;
        if (!z11 && abstractC1540c3 != null) {
            C1537c0 c1537c0A0E = C1539c2.A0E(view, c1539c2A08.A0A, this.A00);
            if (c1537c0A0E.A04()) {
                C1539c2.A05(c1539c2A08);
            } else {
                c1539c2A08.A00 = 0;
            }
            boolean z12 = c1539c2A08.A00 > c1539c2A08.A09;
            boolean wasViewable = c1539c2A08.A05 != null && c1539c2A08.A05.A04();
            if (z12 || !c1537c0A0E.A04()) {
                c1539c2A08.A05 = c1537c0A0E;
            }
            String strValueOf = String.valueOf(c1537c0A0E.A01());
            synchronized (c1539c2A08) {
                if (c1539c2A08.A06.containsKey(strValueOf)) {
                    iIntValue = ((Integer) c1539c2A08.A06.get(strValueOf)).intValue();
                }
                c1539c2A08.A06.put(strValueOf, Integer.valueOf(iIntValue + 1));
            }
            if (z12 && !wasViewable) {
                this.A01 = true;
                c1539c2A08.A03 = System.currentTimeMillis();
                if (c1539c2A08.A07) {
                    this.A00.A0F().A4M();
                }
                abstractC1540c3.A03();
                if (BuildConfigApi.isDebug() && AdInternalSettings.isVisibleAnimation()) {
                    AlphaAnimation alphaAnimation = new AlphaAnimation(1.0f, 0.0f);
                    alphaAnimation.setDuration(500L);
                    view.startAnimation(alphaAnimation);
                }
                if (!c1539c2A08.A0F) {
                    return;
                }
            } else if (!z12 && wasViewable) {
                this.A01 = true;
                if (c1539c2A08.A07) {
                    this.A00.A0F().A3o(c1537c0A0E.A02());
                }
                abstractC1540c3.A00();
            } else {
                abstractC1540c3.A02();
                if (!this.A01 && c1539c2A08.A07) {
                    this.A00.A0F().A4K(c1537c0A0E.A02());
                }
                this.A01 = true;
            }
            if (!c1539c2A08.A08 && c1539c2A08.A04 != null) {
                c1539c2A08.A0B.postDelayed(c1539c2A08.A04, c1539c2A08.A02);
                return;
            }
            return;
        }
        if (c1539c2A08.A07) {
            if (!z11) {
                i5 = 2;
            }
            A00(i5);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2091l6
    public final C0958Hi A7M() {
        return this.A00;
    }
}
