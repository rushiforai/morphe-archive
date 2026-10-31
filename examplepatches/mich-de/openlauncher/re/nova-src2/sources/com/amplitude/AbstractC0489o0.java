package com.amplitude;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: com.amplitude.o0, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public abstract class AbstractC0489o0 implements t70.j0 {

    /* renamed from: a, reason: collision with root package name */
    public FunctionReferenceImpl f20697a;

    /* renamed from: b, reason: collision with root package name */
    public K3 f20698b;

    /* renamed from: c, reason: collision with root package name */
    public final C0515t0 f20699c;

    /* renamed from: d, reason: collision with root package name */
    public final CoroutineContext f20700d;

    /* renamed from: e, reason: collision with root package name */
    public final t70.c0 f20701e;

    /* renamed from: f, reason: collision with root package name */
    public volatile boolean f20702f;

    /* JADX WARN: Multi-variable type inference failed */
    public AbstractC0489o0(int i5, Function1 function1, K3 k32, t70.a2 mainDispatcher, t70.c0 workerDispatcher) {
        C0515t0 c0515t0 = new C0515t0(i5);
        Intrinsics.g(mainDispatcher, "mainDispatcher");
        Intrinsics.g(workerDispatcher, "workerDispatcher");
        this.f20697a = (FunctionReferenceImpl) function1;
        this.f20698b = k32;
        this.f20699c = c0515t0;
        this.f20700d = mainDispatcher.plus(t70.m0.d());
        this.f20701e = workerDispatcher.f0(1, null);
    }

    public abstract void a();

    public abstract String b();

    public abstract boolean c();

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return this.f20700d;
    }

    public final void handleEmbeddedViewEvent(String event) {
        Intrinsics.g(event, "event");
        t70.m0.t(this, this.f20701e, null, new C0483n0(this, event, null), 2);
    }
}
