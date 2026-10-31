package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class qb extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public sb f8542a;

    /* renamed from: b, reason: collision with root package name */
    public d f8543b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f8544c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ sb f8545d;

    /* renamed from: e, reason: collision with root package name */
    public int f8546e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qb(sb sbVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8545d = sbVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8544c = obj;
        this.f8546e |= Integer.MIN_VALUE;
        return this.f8545d.a(this);
    }
}
