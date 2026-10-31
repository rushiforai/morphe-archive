package mv;

import com.stripe.android.core.exception.APIException;
import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76830t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ g f76831u;

    /* renamed from: v, reason: collision with root package name */
    public int f76832v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(g gVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76831u = gVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws APIException {
        this.f76830t = obj;
        this.f76832v |= Integer.MIN_VALUE;
        Object objI = this.f76831u.i(null, null, null, null, null, null, null, this);
        return objI == CoroutineSingletons.f71806a ? objI : new Result(objI);
    }
}
