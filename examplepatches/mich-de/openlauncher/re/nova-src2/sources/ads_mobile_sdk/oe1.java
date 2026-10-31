package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class oe1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public re1 f7866a;

    /* renamed from: b, reason: collision with root package name */
    public d f7867b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f7868c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ re1 f7869d;

    /* renamed from: e, reason: collision with root package name */
    public int f7870e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public oe1(re1 re1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7869d = re1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7868c = obj;
        this.f7870e |= Integer.MIN_VALUE;
        return this.f7869d.e(this);
    }
}
