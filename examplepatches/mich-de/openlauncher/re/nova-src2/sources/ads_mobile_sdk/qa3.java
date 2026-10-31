package ads_mobile_sdk;

import java.util.Map;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class qa3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ra3 f8537a;

    /* renamed from: b, reason: collision with root package name */
    public Map f8538b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f8539c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ ra3 f8540d;

    /* renamed from: e, reason: collision with root package name */
    public int f8541e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qa3(ra3 ra3Var, Continuation continuation) {
        super(continuation);
        this.f8540d = ra3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8539c = obj;
        this.f8541e |= Integer.MIN_VALUE;
        return this.f8540d.a(null, null, this);
    }
}
