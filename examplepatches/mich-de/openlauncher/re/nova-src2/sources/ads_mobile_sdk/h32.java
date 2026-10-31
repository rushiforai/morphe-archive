package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class h32 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f4200a;

    /* renamed from: b, reason: collision with root package name */
    public Object f4201b;

    /* renamed from: c, reason: collision with root package name */
    public th3 f4202c;

    /* renamed from: d, reason: collision with root package name */
    public th3 f4203d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f4204e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ p32 f4205f;

    /* renamed from: g, reason: collision with root package name */
    public int f4206g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h32(p32 p32Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4205f = p32Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4204e = obj;
        this.f4206g |= Integer.MIN_VALUE;
        return this.f4205f.a((ti.p) null, this);
    }
}
