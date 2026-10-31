package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class uj extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public xj f10357a;

    /* renamed from: b, reason: collision with root package name */
    public String f10358b;

    /* renamed from: c, reason: collision with root package name */
    public String f10359c;

    /* renamed from: d, reason: collision with root package name */
    public d f10360d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f10361e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ xj f10362f;

    /* renamed from: g, reason: collision with root package name */
    public int f10363g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uj(xj xjVar, Continuation continuation) {
        super(continuation);
        this.f10362f = xjVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10361e = obj;
        this.f10363g |= Integer.MIN_VALUE;
        return xj.a(this.f10362f, null, null, this);
    }
}
