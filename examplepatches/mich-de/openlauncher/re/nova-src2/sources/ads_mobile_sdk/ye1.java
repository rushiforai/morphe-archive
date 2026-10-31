package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class ye1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f12014a;

    /* renamed from: b, reason: collision with root package name */
    public Object f12015b;

    /* renamed from: c, reason: collision with root package name */
    public Ref.BooleanRef f12016c;

    /* renamed from: d, reason: collision with root package name */
    public c80.a f12017d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f12018e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ of1 f12019f;

    /* renamed from: g, reason: collision with root package name */
    public int f12020g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ye1(of1 of1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12019f = of1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12018e = obj;
        this.f12020g |= Integer.MIN_VALUE;
        return this.f12019f.a((pi.c) null, this);
    }
}
