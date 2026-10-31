package com.moloco.sdk.internal.publisher;

import com.moloco.sdk.internal.publisher.w;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final /* synthetic */ class f0 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f37103a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ w f37104b;

    public /* synthetic */ f0(w wVar, int i5) {
        this.f37103a = i5;
        this.f37104b = wVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f37103a) {
            case 0:
                return w.k(this.f37104b);
            case 1:
                return w.g.a(this.f37104b);
            case 2:
                return w.g.b(this.f37104b);
            default:
                return w.g.c(this.f37104b);
        }
    }
}
