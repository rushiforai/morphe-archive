package com.facebook.ads.redexgen.X;

import java.io.Serializable;

/* renamed from: com.facebook.ads.redexgen.X.gZ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1818gZ implements Serializable {
    public C1817gY A00;
    public C1817gY A01;

    public C1818gZ() {
        this(0.5d, 0.5d);
    }

    public C1818gZ(double d5) {
        this(d5, 0.5d);
    }

    public C1818gZ(double d5, double d11) {
        this.A00 = new C1817gY(d5);
        this.A01 = new C1817gY(d11);
        A02();
    }

    public final C1817gY A00() {
        return this.A00;
    }

    public final C1817gY A01() {
        return this.A01;
    }

    public final void A02() {
        this.A00.A07();
        this.A01.A07();
    }

    public final void A03() {
        this.A00.A08();
        this.A01.A08();
    }

    public final void A04(double d5, double d11) {
        this.A00.A09(d5, d11);
    }

    public final void A05(double d5, double d11) {
        this.A01.A09(d5, d11);
    }
}
