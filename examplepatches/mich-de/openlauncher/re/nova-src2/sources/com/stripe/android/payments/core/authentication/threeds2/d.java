package com.stripe.android.payments.core.authentication.threeds2;

import com.stripe.android.payments.core.authentication.threeds2.Stripe3ds2TransactionContract;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d implements e {

    /* renamed from: a, reason: collision with root package name */
    public final j.c f44327a;

    public d(j.c launcher) {
        Intrinsics.g(launcher, "launcher");
        this.f44327a = launcher;
    }

    @Override // ww.b
    public final void a(Object obj) {
        this.f44327a.a((Stripe3ds2TransactionContract.Args) obj, null);
    }
}
