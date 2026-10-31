package fv;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public k f56089t;

    /* renamed from: u, reason: collision with root package name */
    public j f56090u;

    /* renamed from: v, reason: collision with root package name */
    public String f56091v;

    /* renamed from: w, reason: collision with root package name */
    public Object f56092w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f56093x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ i f56094y;

    /* renamed from: z, reason: collision with root package name */
    public int f56095z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(i iVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56094y = iVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56093x = obj;
        this.f56095z |= Integer.MIN_VALUE;
        Object objB = this.f56094y.b(null, null, null, this);
        return objB == CoroutineSingletons.f71806a ? objB : new Result(objB);
    }
}
