package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function3;

/* loaded from: classes2.dex */
public final class ok2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f7958a;

    /* renamed from: b, reason: collision with root package name */
    public Object f7959b;

    /* renamed from: c, reason: collision with root package name */
    public Object f7960c;

    /* renamed from: d, reason: collision with root package name */
    public Function3 f7961d;

    /* renamed from: e, reason: collision with root package name */
    public d f7962e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f7963f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ fl2 f7964g;

    /* renamed from: h, reason: collision with root package name */
    public int f7965h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ok2(fl2 fl2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7964g = fl2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7963f = obj;
        this.f7965h |= Integer.MIN_VALUE;
        return this.f7964g.a(null, null, null, this);
    }
}
