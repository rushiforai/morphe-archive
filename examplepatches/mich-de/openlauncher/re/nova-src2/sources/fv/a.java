package fv;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public i f56084t;

    /* renamed from: u, reason: collision with root package name */
    public String f56085u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f56086v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ i f56087w;

    /* renamed from: x, reason: collision with root package name */
    public int f56088x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(i iVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56087w = iVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56086v = obj;
        this.f56088x |= Integer.MIN_VALUE;
        Object objA = this.f56087w.a(null, null, false, this);
        return objA == CoroutineSingletons.f71806a ? objA : new Result(objA);
    }
}
