package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class dp extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ep f2576a;

    /* renamed from: b, reason: collision with root package name */
    public double f2577b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f2578c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f2579d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ ep f2580e;

    /* renamed from: f, reason: collision with root package name */
    public int f2581f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dp(ep epVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2580e = epVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2579d = obj;
        this.f2581f |= Integer.MIN_VALUE;
        return ep.a(this.f2580e, null, 0.0d, false, this);
    }
}
