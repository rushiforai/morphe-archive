package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class w60 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public x60 f11056a;

    /* renamed from: b, reason: collision with root package name */
    public String f11057b;

    /* renamed from: c, reason: collision with root package name */
    public String f11058c;

    /* renamed from: d, reason: collision with root package name */
    public d f11059d;

    /* renamed from: e, reason: collision with root package name */
    public long f11060e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f11061f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ x60 f11062g;

    /* renamed from: h, reason: collision with root package name */
    public int f11063h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w60(x60 x60Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11062g = x60Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11061f = obj;
        this.f11063h |= Integer.MIN_VALUE;
        return this.f11062g.a((String) null, (String) null, 0L, this);
    }
}
