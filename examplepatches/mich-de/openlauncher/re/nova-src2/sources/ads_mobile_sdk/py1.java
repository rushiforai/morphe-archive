package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class py1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f8414a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f8415b;

    /* renamed from: c, reason: collision with root package name */
    public th3 f8416c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f8417d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ xy1 f8418e;

    /* renamed from: f, reason: collision with root package name */
    public int f8419f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public py1(xy1 xy1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8418e = xy1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8417d = obj;
        this.f8419f |= Integer.MIN_VALUE;
        return xy1.a(this.f8418e, null, null, this);
    }
}
