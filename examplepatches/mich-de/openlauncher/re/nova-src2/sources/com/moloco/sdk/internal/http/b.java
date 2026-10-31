package com.moloco.sdk.internal.http;

import c50.g;
import com.moloco.sdk.internal.services.C2962j;
import com.moloco.sdk.internal.services.x;
import h50.f;
import kotlin.jvm.functions.Function1;
import o50.n;

/* loaded from: classes.dex */
public final /* synthetic */ class b implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f36401a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ C2962j f36402b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ x f36403c;

    public /* synthetic */ b(C2962j c2962j, x xVar, int i5) {
        this.f36401a = i5;
        this.f36402b = c2962j;
        this.f36403c = xVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f36401a) {
            case 0:
                return a.a(this.f36402b, this.f36403c, (f) obj);
            case 1:
                return a.a(this.f36402b, this.f36403c, (g) obj);
            default:
                return a.a(this.f36402b, this.f36403c, (n) obj);
        }
    }
}
