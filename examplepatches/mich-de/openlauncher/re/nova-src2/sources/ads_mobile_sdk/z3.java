package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class z3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public f5 f12431a;

    /* renamed from: b, reason: collision with root package name */
    public d f12432b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f12433c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ f5 f12434d;

    /* renamed from: e, reason: collision with root package name */
    public int f12435e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z3(f5 f5Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12434d = f5Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12433c = obj;
        this.f12435e |= Integer.MIN_VALUE;
        return f5.c(this.f12434d, this);
    }
}
