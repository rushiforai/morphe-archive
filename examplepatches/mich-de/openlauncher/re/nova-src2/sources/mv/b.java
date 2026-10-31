package mv;

import com.stripe.android.core.exception.APIException;
import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76821t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ g f76822u;

    /* renamed from: v, reason: collision with root package name */
    public int f76823v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(g gVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76822u = gVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws APIException {
        this.f76821t = obj;
        this.f76823v |= Integer.MIN_VALUE;
        Object objC = this.f76822u.c(null, null, null, null, this);
        return objC == CoroutineSingletons.f71806a ? objC : new Result(objC);
    }
}
