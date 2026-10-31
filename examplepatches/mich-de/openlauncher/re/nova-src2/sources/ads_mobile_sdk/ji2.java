package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class ji2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ni2 f5248a;

    /* renamed from: b, reason: collision with root package name */
    public d f5249b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f5250c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ ni2 f5251d;

    /* renamed from: e, reason: collision with root package name */
    public int f5252e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ji2(ni2 ni2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5251d = ni2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5250c = obj;
        this.f5252e |= Integer.MIN_VALUE;
        return this.f5251d.g(this);
    }
}
