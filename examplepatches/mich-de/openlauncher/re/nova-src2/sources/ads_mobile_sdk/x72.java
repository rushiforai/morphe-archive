package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function3;

/* loaded from: classes.dex */
public final class x72 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f11615a;

    /* renamed from: b, reason: collision with root package name */
    public Object f11616b;

    /* renamed from: c, reason: collision with root package name */
    public Function3 f11617c;

    /* renamed from: d, reason: collision with root package name */
    public d f11618d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f11619e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ i82 f11620f;

    /* renamed from: g, reason: collision with root package name */
    public int f11621g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x72(i82 i82Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11620f = i82Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11619e = obj;
        this.f11621g |= Integer.MIN_VALUE;
        return this.f11620f.a((String) null, (Function3) null, this);
    }
}
