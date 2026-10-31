package com.amplitude;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* renamed from: com.amplitude.d4, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0426d4 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public AbstractC0499p4 f20545a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f20546b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ G3 f20547c;

    /* renamed from: d, reason: collision with root package name */
    public int f20548d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0426d4(G3 g32, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f20547c = g32;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f20546b = obj;
        this.f20548d |= Integer.MIN_VALUE;
        return AbstractC0499p4.a(this.f20547c, null, null, this);
    }
}
