package com.facebook.ads.redexgen.X;

import kotlin.Metadata;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class CB implements InterfaceC2373pl {
    public final /* synthetic */ long A00;
    public final /* synthetic */ C2141lu A01;

    public CB(C2141lu c2141lu, long j11) {
        this.A01 = c2141lu;
        this.A00 = j11;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2373pl
    public final void AGc(long j11) {
        C0781Am c0781Am = this.A01.A0D;
        if (c0781Am != null) {
            c0781Am.A09((int) (this.A00 + j11));
        }
    }
}
