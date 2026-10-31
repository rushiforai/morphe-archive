package com.facebook.ads.redexgen.X;

import com.facebook.ads.AdError;

/* renamed from: com.facebook.ads.redexgen.X.Ko, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1039Ko implements InterfaceC2050kO {
    public static String[] A05 = {"SGxBKOT0PnlxeQ2jGccieZy3bFeI", "1PQaT", "uVEahNbfwTxCxKVGO7p", "rVPhbhRBlKfAg8fviAhE", "2ov", "KrP87Bn8e271VzBAE5Wi", "4No2VIB7eIWgh7ub8hExBeYUcY", "mEjh"};
    public final /* synthetic */ LA A00;
    public final /* synthetic */ InterfaceC1767fk A01;
    public final /* synthetic */ C1768fl A02;
    public final /* synthetic */ C0958Hi A03;
    public final /* synthetic */ boolean A04;

    public C1039Ko(C1768fl c1768fl, C0958Hi c0958Hi, boolean z11, LA la2, InterfaceC1767fk interfaceC1767fk) {
        this.A02 = c1768fl;
        this.A03 = c0958Hi;
        this.A04 = z11;
        this.A00 = la2;
        this.A01 = interfaceC1767fk;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2050kO
    public final void ADt() {
        if (C2203mv.A1q(this.A03) && this.A04) {
            this.A02.A02.add(M1.A01(this.A03, this.A00, 1, new C1041Kq(this)));
            return;
        }
        InterfaceC1767fk interfaceC1767fk = this.A01;
        if (A05[2].length() != 19) {
            throw new RuntimeException();
        }
        String[] strArr = A05;
        strArr[5] = "X6BBoGIR5wPjpoFUlFYz";
        strArr[3] = "SlUPa0nBeexeGnx3tyWk";
        interfaceC1767fk.ADl();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2050kO
    public final void ADu() {
        this.A01.ADk(AdError.CACHE_ERROR);
    }
}
