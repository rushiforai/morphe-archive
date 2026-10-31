package com.facebook.ads.redexgen.X;

import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.3n, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C06173n extends C0V implements InterfaceC05620n<AnonymousClass22> {
    public final /* synthetic */ int A00;
    public final /* synthetic */ CL A01;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C06173n(int i5, CL cl2) {
        super(0);
        this.A00 = i5;
        this.A01 = cl2;
    }

    private final void A00() {
        if (this.A00 == 0) {
            this.A01.A08.A0U();
        }
        C1539c2 c1539c2 = this.A01.A01;
        if (c1539c2 != null) {
            c1539c2.A0U();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC05620n
    public final /* bridge */ /* synthetic */ AnonymousClass22 AB0() {
        A00();
        return AnonymousClass22.A01;
    }
}
