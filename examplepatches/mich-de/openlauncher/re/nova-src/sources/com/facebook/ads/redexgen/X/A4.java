package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class A4 implements InterfaceC1321Wg {
    public final /* synthetic */ A7 A00;

    public A4(final A7 val$separatorMatcher) {
        this.A00 = val$separatorMatcher;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Type inference failed for: r0v0, types: [com.facebook.ads.redexgen.X.4l] */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1321Wg
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final C06414l ABT(final C1319We splitter, final CharSequence toSplit) {
        return new A3(splitter, toSplit) { // from class: com.facebook.ads.redexgen.X.4l
            @Override // com.facebook.ads.redexgen.X.A3
            public final int A04(int separatorPosition) {
                return separatorPosition + 1;
            }

            @Override // com.facebook.ads.redexgen.X.A3
            public final int A05(int start) {
                return this.A00.A00.A08(this.A03, start);
            }
        };
    }
}
