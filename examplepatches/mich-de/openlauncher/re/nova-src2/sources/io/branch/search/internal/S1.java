package io.branch.search.internal;

import io.branch.search.internal.P1;

/* loaded from: classes4.dex */
public final class S1 implements P1.c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ P1 f63315a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f63316b = "SyncLockGAID";

    public S1(P1 p12) {
        this.f63315a = p12;
    }

    @Override // io.branch.search.internal.P1.c
    public final void a() {
        this.f63315a.C.remove(this.f63316b);
        this.f63315a.g();
    }
}
