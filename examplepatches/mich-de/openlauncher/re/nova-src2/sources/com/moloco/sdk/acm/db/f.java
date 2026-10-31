package com.moloco.sdk.acm.db;

import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function1;

/* loaded from: classes3.dex */
public final /* synthetic */ class f implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f36058a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e f36059b;

    public /* synthetic */ f(e eVar, int i5) {
        this.f36058a = i5;
        this.f36059b = eVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f36058a) {
            case 0:
                return this.f36059b.e((Continuation) obj);
            default:
                return this.f36059b.f((Continuation) obj);
        }
    }
}
