package com.moloco.sdk.internal.publisher;

import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final /* synthetic */ class e0 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f37092a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ n f37093b;

    public /* synthetic */ e0(n nVar, int i5) {
        this.f37092a = i5;
        this.f37093b = nVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f37092a) {
            case 0:
                return n.l(this.f37093b);
            case 1:
                return n.m(this.f37093b);
            case 2:
                return n.n(this.f37093b);
            default:
                return n.o(this.f37093b);
        }
    }
}
