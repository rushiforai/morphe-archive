package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* renamed from: com.facebook.ads.redexgen.X.Dt, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0866Dt implements InterfaceC2599tP {
    public static String[] A01 = {"HeXYzzVHXgk6bgJjKy0", "rKmN", b.f42142b, "O3tf7rTF477MZ7pUh006k648oTogFZzz", "Dpar4kyY9ug2odYA0ztHjvNWX", "5qWRdhNhGKqpzdTHSrV6Tlitnd6", "OKu9IEVMVe0hYjCZAxwwuQcwxiigaAgU", "HFf4"};
    public final /* synthetic */ C1J A00;

    public C0866Dt(C1J c1j) {
        this.A00 = c1j;
    }

    public /* synthetic */ C0866Dt(C1J c1j, C0868Dv c0868Dv) {
        this(c1j);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGC(String str) throws SecurityException {
        if (this.A00.A03 != null) {
            this.A00.A03.setUrl(str);
        }
        if (this.A00.A04 != null) {
            this.A00.A04.setVisibility(8);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGE(String str) {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGf(int i5) {
        if (this.A00.A04 != null) {
            C1J c1j = this.A00;
            if (A01[2].length() != 0) {
                throw new RuntimeException();
            }
            A01[2] = b.f42142b;
            c1j.A04.setProgress(i5);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGi(String str) {
        if (this.A00.A03 != null) {
            this.A00.A03.setTitle(str);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGl() {
        this.A00.A0C.AHs();
    }
}
