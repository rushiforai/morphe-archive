package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.content.res.ColorStateList;
import android.view.View;

/* loaded from: assets/audience_network/classes.dex */
public final class JT implements InterfaceC1832go {
    private C1833gp A00(InterfaceC1831gn interfaceC1831gn) {
        return (C1833gp) interfaceC1831gn.A7o();
    }

    public final void A01(InterfaceC1831gn interfaceC1831gn) {
        if (!interfaceC1831gn.AA4()) {
            interfaceC1831gn.AL3(0, 0, 0, 0);
            return;
        }
        float fA94 = A94(interfaceC1831gn);
        float fA9U = A9U(interfaceC1831gn);
        float elevation = AbstractC1835gr.A00(fA94, fA9U, interfaceC1831gn.A9T());
        int vPadding = (int) Math.ceil(elevation);
        float elevation2 = AbstractC1835gr.A01(fA94, fA9U, interfaceC1831gn.A9T());
        int iCeil = (int) Math.ceil(elevation2);
        interfaceC1831gn.AL3(vPadding, iCeil, vPadding, iCeil);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1832go
    public final ColorStateList A7b(InterfaceC1831gn interfaceC1831gn) {
        return A00(interfaceC1831gn).A05();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1832go
    public final float A8W(InterfaceC1831gn interfaceC1831gn) {
        return interfaceC1831gn.A7p().getElevation();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1832go
    public final float A94(InterfaceC1831gn interfaceC1831gn) {
        return A00(interfaceC1831gn).A03();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1832go
    public final float A9A(InterfaceC1831gn interfaceC1831gn) {
        return A9U(interfaceC1831gn) * 2.0f;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1832go
    public final float A9B(InterfaceC1831gn interfaceC1831gn) {
        return A9U(interfaceC1831gn) * 2.0f;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1832go
    public final float A9U(InterfaceC1831gn interfaceC1831gn) {
        return A00(interfaceC1831gn).A04();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1832go
    public final void AAs() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1832go
    public final void AAu(InterfaceC1831gn interfaceC1831gn, Context context, ColorStateList colorStateList, float f11, float f12, float f13) {
        C1833gp background = new C1833gp(colorStateList, f11);
        interfaceC1831gn.AKc(background);
        View view = interfaceC1831gn.A7p();
        view.setClipToOutline(true);
        view.setElevation(f12);
        AKp(interfaceC1831gn, f13);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1832go
    public final void AEQ(InterfaceC1831gn interfaceC1831gn) {
        AKp(interfaceC1831gn, A94(interfaceC1831gn));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1832go
    public final void AGY(InterfaceC1831gn interfaceC1831gn) {
        AKp(interfaceC1831gn, A94(interfaceC1831gn));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1832go
    public final void AKb(InterfaceC1831gn interfaceC1831gn, ColorStateList colorStateList) {
        A00(interfaceC1831gn).A08(colorStateList);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1832go
    public final void AKh(InterfaceC1831gn interfaceC1831gn, float f11) {
        interfaceC1831gn.A7p().setElevation(f11);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1832go
    public final void AKp(InterfaceC1831gn interfaceC1831gn, float f11) {
        A00(interfaceC1831gn).A07(f11, interfaceC1831gn.AA4(), interfaceC1831gn.A9T());
        A01(interfaceC1831gn);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1832go
    public final void AL1(InterfaceC1831gn interfaceC1831gn, float f11) {
        A00(interfaceC1831gn).A06(f11);
    }
}
