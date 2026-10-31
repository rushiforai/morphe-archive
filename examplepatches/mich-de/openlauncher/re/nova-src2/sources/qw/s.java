package qw;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class s extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public v f84400t;

    /* renamed from: u, reason: collision with root package name */
    public String f84401u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f84402v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ v f84403w;

    /* renamed from: x, reason: collision with root package name */
    public int f84404x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s(v vVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f84403w = vVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f84402v = obj;
        this.f84404x |= Integer.MIN_VALUE;
        Object objC = v.c(this.f84403w, null, 0, 0, this);
        return objC == CoroutineSingletons.f71806a ? objC : new Result(objC);
    }
}
