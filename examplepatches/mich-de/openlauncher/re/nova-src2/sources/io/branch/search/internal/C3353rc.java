package io.branch.search.internal;

import android.content.Context;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.rc, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3353rc extends Lambda implements Function0<u40.h> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Context f65644a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ C3269mc f65645b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3353rc(Context context, C3269mc c3269mc) {
        super(0);
        this.f65644a = context;
        this.f65645b = c3269mc;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return (u40.h) t70.m0.u(EmptyCoroutineContext.f71803a, new C3337qc(this.f65644a, this.f65645b, null));
    }
}
