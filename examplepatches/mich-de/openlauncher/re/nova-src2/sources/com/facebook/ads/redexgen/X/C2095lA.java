package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.content.ContextWrapper;
import java.util.concurrent.atomic.AtomicReference;

/* renamed from: com.facebook.ads.redexgen.X.lA, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2095lA extends ContextWrapper {
    public final InterfaceC2097lC A00;
    public final AtomicReference<String> A01;

    public C2095lA(Context context, InterfaceC2097lC interfaceC2097lC) {
        super(context.getApplicationContext());
        this.A01 = new AtomicReference<>();
        this.A00 = interfaceC2097lC;
    }

    public final InterfaceC1644dj A00(C2095lA c2095lA) {
        return this.A00.A8n(c2095lA);
    }

    public final InterfaceC2090l3 A01() {
        return this.A00.A7r();
    }

    public final C0957Hh A02() {
        return this.A00.A9c(this);
    }

    public final InterfaceC2096lB A03() {
        return this.A00.A7e(this);
    }

    public final InterfaceC2098lD A04() {
        return this.A00.A8Y(this);
    }

    public final InterfaceC2100lF A05() {
        return this.A00.A9b(this);
    }

    public final InterfaceC2101lG A06() {
        return this.A00.A9s();
    }

    public final InterfaceC2112lR A07() {
        return this.A00.A8M(this);
    }

    public final InterfaceC2125le A08() {
        return this.A00.A8O(this);
    }

    public final C2156mA A09() {
        return this.A00.A9j();
    }

    public final InterfaceC2224nG A0A() {
        return this.A00.A7N(A02());
    }

    public final InterfaceC2236nS A0B() {
        return this.A00.A9d(A02());
    }

    public final String A0C() {
        return this.A01.get();
    }

    public final void A0D(String str) {
        this.A01.set(str);
    }
}
