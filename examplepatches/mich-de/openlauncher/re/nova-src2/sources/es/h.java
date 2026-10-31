package es;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class h extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public com.stripe.android.link.l f52950t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f52951u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.link.l f52952v;

    /* renamed from: w, reason: collision with root package name */
    public int f52953w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(com.stripe.android.link.l lVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f52952v = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f52951u = obj;
        this.f52953w |= Integer.MIN_VALUE;
        Object objE = com.stripe.android.link.l.e(this.f52952v, null, this);
        return objE == CoroutineSingletons.f71806a ? objE : new Result(objE);
    }
}
