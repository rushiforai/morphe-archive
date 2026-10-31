package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class v4 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public f5 f10564a;

    /* renamed from: b, reason: collision with root package name */
    public Object f10565b;

    /* renamed from: c, reason: collision with root package name */
    public Object f10566c;

    /* renamed from: d, reason: collision with root package name */
    public d f10567d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f10568e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ f5 f10569f;

    /* renamed from: g, reason: collision with root package name */
    public int f10570g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v4(f5 f5Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10569f = f5Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10568e = obj;
        this.f10570g |= Integer.MIN_VALUE;
        f5.b(this.f10569f, this);
        return CoroutineSingletons.f71806a;
    }
}
