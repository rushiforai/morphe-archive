package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class c4 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public th3 f1652a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f1653b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f1654c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ f5 f1655d;

    /* renamed from: e, reason: collision with root package name */
    public int f1656e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c4(f5 f5Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1655d = f5Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1654c = obj;
        this.f1656e |= Integer.MIN_VALUE;
        return this.f1655d.a(null, null, this);
    }
}
