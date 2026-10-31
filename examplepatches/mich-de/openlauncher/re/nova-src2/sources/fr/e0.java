package fr;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public dr.a f55600t;

    /* renamed from: u, reason: collision with root package name */
    public i f55601u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f55602v;

    /* renamed from: w, reason: collision with root package name */
    public int f55603w;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55602v = obj;
        this.f55603w |= Integer.MIN_VALUE;
        Object objC = h0.c(null, null, null, this);
        return objC == CoroutineSingletons.f71806a ? objC : new Result(objC);
    }
}
