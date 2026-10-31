package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class yt2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public lu2 f12278a;

    /* renamed from: b, reason: collision with root package name */
    public d f12279b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f12280c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f12281d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ lu2 f12282e;

    /* renamed from: f, reason: collision with root package name */
    public int f12283f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yt2(lu2 lu2Var, Continuation continuation) {
        super(continuation);
        this.f12282e = lu2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12281d = obj;
        this.f12283f |= Integer.MIN_VALUE;
        return this.f12282e.a(false, (Continuation) this);
    }
}
