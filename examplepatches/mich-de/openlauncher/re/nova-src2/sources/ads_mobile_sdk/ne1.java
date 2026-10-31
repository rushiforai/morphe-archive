package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class ne1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public re1 f7540a;

    /* renamed from: b, reason: collision with root package name */
    public d f7541b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f7542c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ re1 f7543d;

    /* renamed from: e, reason: collision with root package name */
    public int f7544e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ne1(re1 re1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7543d = re1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7542c = obj;
        this.f7544e |= Integer.MIN_VALUE;
        return this.f7543d.d(this);
    }
}
