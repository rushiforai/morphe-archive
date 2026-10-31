package com.amplitude;

import io.flutter.plugin.common.BinaryMessenger;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class B0 extends AbstractC0489o0 {

    /* renamed from: g, reason: collision with root package name */
    public final int f20184g;

    /* renamed from: h, reason: collision with root package name */
    public final A f20185h;

    /* JADX WARN: Illegal instructions before constructor call */
    public B0(D0 d02, K3 k32) {
        int iA = AbstractC0484n1.a();
        a80.e eVar = t70.y0.f88884a;
        u70.d mainDispatcher = y70.o.f96819a;
        a80.e workerDispatcher = t70.y0.f88884a;
        Intrinsics.g(mainDispatcher, "mainDispatcher");
        Intrinsics.g(workerDispatcher, "workerDispatcher");
        super(iA, d02, k32, mainDispatcher, workerDispatcher);
        this.f20184g = iA;
        this.f20185h = new A(this, mainDispatcher);
    }

    @Override // com.amplitude.AbstractC0489o0
    public final void a() {
        this.f20702f = false;
        t70.m0.j(this.f20700d);
        C0515t0.a(this.f20699c);
        K3 k32 = this.f20698b;
        if (k32 != null) {
            k32.a(new C0545z0(this));
        }
        A a11 = this.f20185h;
        a11.getClass();
        a11.a(AbstractC0534x.a("stop", null, null));
        BinaryMessenger binaryMessenger = a11.f20178c;
        if (binaryMessenger != null) {
            t70.m0.t(a11.f20176a, a11.f20177b, null, new C0544z(binaryMessenger, null, null), 2);
        }
        a11.f20179d = null;
        a11.f20178c = null;
    }

    @Override // com.amplitude.AbstractC0489o0
    public final String b() {
        return "FlutterView";
    }

    @Override // com.amplitude.AbstractC0489o0
    public final boolean c() {
        return this.f20185h.f20178c != null;
    }
}
