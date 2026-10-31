package ads_mobile_sdk;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import w70.v0;

/* loaded from: classes.dex */
public final class ps1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f8372a;

    /* renamed from: b, reason: collision with root package name */
    public int f8373b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ v0 f8374c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ps1(v0 v0Var, Continuation continuation) {
        super(continuation);
        this.f8374c = v0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8372a = obj;
        this.f8373b |= Integer.MIN_VALUE;
        return this.f8374c.emit(null, this);
    }
}
