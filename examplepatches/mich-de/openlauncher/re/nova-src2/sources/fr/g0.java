package fr;

import com.stripe.android.core.exception.APIException;
import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class g0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public dr.a f55623t;

    /* renamed from: u, reason: collision with root package name */
    public i f55624u;

    /* renamed from: v, reason: collision with root package name */
    public dr.b f55625v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f55626w;

    /* renamed from: x, reason: collision with root package name */
    public int f55627x;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws APIException {
        this.f55626w = obj;
        this.f55627x |= Integer.MIN_VALUE;
        Object objE = h0.e(null, null, null, null, this);
        return objE == CoroutineSingletons.f71806a ? objE : new Result(objE);
    }
}
