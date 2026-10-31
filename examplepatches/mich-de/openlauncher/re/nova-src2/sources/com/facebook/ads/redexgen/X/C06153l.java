package com.facebook.ads.redexgen.X;

import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.3l, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C06153l extends C0V implements InterfaceC05620n<AnonymousClass22> {
    public final /* synthetic */ C8 A00;
    public final /* synthetic */ C0819By A01;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C06153l(C0819By c0819By, C8 c82) {
        super(0);
        this.A01 = c0819By;
        this.A00 = c82;
    }

    private final void A00() {
        int iA0R = this.A01.A0R();
        if (iA0R == -1) {
            return;
        }
        this.A00.A0B.AB1(Integer.valueOf(iA0R));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC05620n
    public final /* bridge */ /* synthetic */ AnonymousClass22 AB0() {
        A00();
        return AnonymousClass22.A01;
    }
}
