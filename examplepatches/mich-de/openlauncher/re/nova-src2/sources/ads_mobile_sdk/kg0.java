package ads_mobile_sdk;

import c80.d;
import java.util.Map;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class kg0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f5727a;

    /* renamed from: b, reason: collision with root package name */
    public tx0 f5728b;

    /* renamed from: c, reason: collision with root package name */
    public Map f5729c;

    /* renamed from: d, reason: collision with root package name */
    public d f5730d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f5731e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ lg0 f5732f;

    /* renamed from: g, reason: collision with root package name */
    public int f5733g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public kg0(lg0 lg0Var, Continuation continuation) {
        super(continuation);
        this.f5732f = lg0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5731e = obj;
        this.f5733g |= Integer.MIN_VALUE;
        return this.f5732f.a(null, null, this);
    }
}
