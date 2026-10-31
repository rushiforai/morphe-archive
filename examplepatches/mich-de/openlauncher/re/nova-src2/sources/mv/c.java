package mv;

import com.stripe.android.core.exception.APIException;
import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76824t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ g f76825u;

    /* renamed from: v, reason: collision with root package name */
    public int f76826v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(g gVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76825u = gVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws APIException {
        this.f76824t = obj;
        this.f76826v |= Integer.MIN_VALUE;
        Object objF = this.f76825u.f(null, null, this);
        return objF == CoroutineSingletons.f71806a ? objF : new Result(objF);
    }
}
