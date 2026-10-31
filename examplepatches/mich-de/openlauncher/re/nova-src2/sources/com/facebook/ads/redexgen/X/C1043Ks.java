package com.facebook.ads.redexgen.X;

import com.facebook.ads.AdError;
import java.util.EnumSet;

/* renamed from: com.facebook.ads.redexgen.X.Ks, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1043Ks implements InterfaceC1767fk {
    public final /* synthetic */ int A00;
    public final /* synthetic */ LA A01;
    public final /* synthetic */ C1048Kz A02;
    public final /* synthetic */ InterfaceC1767fk A03;
    public final /* synthetic */ C1768fl A04;
    public final /* synthetic */ C0958Hi A05;
    public final /* synthetic */ EnumSet A06;

    public C1043Ks(C1768fl c1768fl, C0958Hi c0958Hi, LA la2, C1048Kz c1048Kz, int i5, InterfaceC1767fk interfaceC1767fk, EnumSet enumSet) {
        this.A04 = c1768fl;
        this.A05 = c0958Hi;
        this.A01 = la2;
        this.A02 = c1048Kz;
        this.A00 = i5;
        this.A03 = interfaceC1767fk;
        this.A06 = enumSet;
    }

    private final void A00() {
        if (this.A00 + 1 >= this.A02.A2v()) {
            return;
        }
        this.A04.A0A(this.A05, this.A06, this.A02, this.A02.A2z(this.A00 + 1), this.A00 + 1, this.A03);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1767fk
    public final void ADk(AdError adError) {
        if (this.A00 == 0) {
            this.A03.ADk(adError);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1767fk
    public final void ADl() {
        this.A05.A01().AKW(this.A01.A37(), this.A02.A30());
        if (this.A00 == this.A02.A2x()) {
            this.A03.ADl();
        }
        A00();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1767fk
    public final void AIm() {
        if (this.A00 == 0) {
            this.A03.AIm();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1767fk
    public final void ALr() {
        if (this.A00 == 0) {
            this.A03.ALr();
        }
    }
}
