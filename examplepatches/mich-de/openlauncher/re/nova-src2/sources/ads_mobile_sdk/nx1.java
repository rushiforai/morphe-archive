package ads_mobile_sdk;

import java.util.Map;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class nx1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ox1 f7715a;

    /* renamed from: b, reason: collision with root package name */
    public Map f7716b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f7717c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ ox1 f7718d;

    /* renamed from: e, reason: collision with root package name */
    public int f7719e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nx1(ox1 ox1Var, Continuation continuation) {
        super(continuation);
        this.f7718d = ox1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7717c = obj;
        this.f7719e |= Integer.MIN_VALUE;
        return this.f7718d.a(null, null, this);
    }
}
