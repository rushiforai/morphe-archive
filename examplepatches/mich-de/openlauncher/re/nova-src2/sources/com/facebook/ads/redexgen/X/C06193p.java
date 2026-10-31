package com.facebook.ads.redexgen.X;

import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.3p, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C06193p extends C0V implements InterfaceC05620n<AnonymousClass22> {
    public final /* synthetic */ int A00;
    public final /* synthetic */ CP A01;
    public final /* synthetic */ C2278oA A02;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C06193p(CP cp2, C2278oA c2278oA, int i5) {
        super(0);
        this.A01 = cp2;
        this.A02 = c2278oA;
        this.A00 = i5;
    }

    private final void A00() {
        this.A01.A08.AB2(this.A02.A03(), Integer.valueOf(this.A00), Integer.valueOf(this.A01.A07.size()));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC05620n
    public final /* bridge */ /* synthetic */ AnonymousClass22 AB0() {
        A00();
        return AnonymousClass22.A01;
    }
}
