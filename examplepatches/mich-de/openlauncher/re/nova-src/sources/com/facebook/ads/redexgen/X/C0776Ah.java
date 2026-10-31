package com.facebook.ads.redexgen.X;

import android.view.View;
import android.view.ViewPropertyAnimator;

/* renamed from: com.facebook.ads.redexgen.X.Ah, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0776Ah implements InterfaceC1636db {
    public static String[] A05 = {"hBpWhHnhmL5X5T638nUqTTajkmWXq0Jo", "NpDFSQumXtRd9HWL09JYgYkJkV27cWXf", "AxBlHN1IgfTmgBmsQuewVQ8cZkGbRxm7", "auJ8KOWij5XUc2OVh7MwLzJgAA213fGo", "l76sAXRLIUx67IYksgmFi2YoLkAbbgnJ", "1g5g87wiu8KgxwL4MK6lukjj0pQl5xRt", "P6OmLQzTnVk1JPGEjhdY9fnbkCpMcnWe", "QfRSCgXdOTNJYzcBVbNAL0t7GjPIPusf"};
    public ViewPropertyAnimator A00;
    public EnumC1637dc A01 = EnumC1637dc.A05;
    public final int A02;
    public final View A03;
    public final boolean A04;

    public C0776Ah(View view, int i5, boolean z11) {
        this.A02 = i5;
        this.A03 = view;
        this.A04 = z11;
    }

    private void A04(boolean z11) {
        this.A01 = EnumC1637dc.A04;
        if (this.A04) {
            AbstractC2426qc.A0M(this.A03);
        }
        String[] strArr = A05;
        if (strArr[4].charAt(27) != strArr[2].charAt(27)) {
            throw new RuntimeException();
        }
        A05[0] = "iTCONHrR5nymrEIlx0VHUpGctJrwflIU";
        if (!z11) {
            this.A03.setAlpha(1.0f);
            this.A01 = EnumC1637dc.A03;
        } else {
            this.A00 = this.A03.animate().alpha(1.0f).setDuration(this.A02).setListener(new C1611dC(this));
        }
    }

    private void A05(boolean z11) {
        this.A01 = EnumC1637dc.A06;
        if (z11) {
            this.A00 = this.A03.animate().alpha(0.0f).setDuration(this.A02).setListener(new C1607d8(this));
            return;
        }
        View view = this.A03;
        if (A05[3].charAt(11) != 'U') {
            throw new RuntimeException();
        }
        A05[1] = "Va1KnH22vapH99C3A8HUoUYkLtllReKa";
        view.setAlpha(0.0f);
        this.A01 = EnumC1637dc.A05;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1636db
    public final void A4b(boolean z11, boolean z12) {
        if (z12) {
            A05(z11);
        } else {
            A04(z11);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1636db
    public final EnumC1637dc A9o() {
        return this.A01;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1636db
    public final void cancel() {
        this.A03.clearAnimation();
        if (this.A00 != null) {
            this.A00.cancel();
        }
    }
}
