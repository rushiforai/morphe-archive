package com.facebook.ads.redexgen.X;

import java.io.File;

/* loaded from: assets/audience_network/classes.dex */
public final class NO implements InterfaceC1615dG<File> {
    @Override // com.facebook.ads.redexgen.X.InterfaceC1615dG
    public final C1614dF<File> A4N(File file, InterfaceC1633dY interfaceC1633dY) {
        if (file.exists()) {
            return new C1614dF<>(true, file);
        }
        return new C1614dF<>(false, null);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1615dG
    public final void A5m(File file, InterfaceC1633dY interfaceC1633dY) {
    }
}
