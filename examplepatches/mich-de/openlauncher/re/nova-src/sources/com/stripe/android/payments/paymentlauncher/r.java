package com.stripe.android.payments.paymentlauncher;

import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import vt.n0;

/* loaded from: classes4.dex */
public final class r implements nu.a {

    /* renamed from: a, reason: collision with root package name */
    public final n0 f44416a;

    /* renamed from: b, reason: collision with root package name */
    public final n0 f44417b;

    /* renamed from: c, reason: collision with root package name */
    public final j.c f44418c;

    /* renamed from: d, reason: collision with root package name */
    public final Integer f44419d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f44420e;

    /* renamed from: f, reason: collision with root package name */
    public final Set f44421f;

    public r(n0 n0Var, n0 n0Var2, j.c hostActivityLauncher, Integer num, boolean z11, Set productUsage) {
        Intrinsics.g(hostActivityLauncher, "hostActivityLauncher");
        Intrinsics.g(productUsage, "productUsage");
        this.f44416a = n0Var;
        this.f44417b = n0Var2;
        this.f44418c = hostActivityLauncher;
        this.f44419d = num;
        this.f44420e = z11;
        this.f44421f = productUsage;
    }
}
