package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class dl2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public fl2 f2560a;

    /* renamed from: b, reason: collision with root package name */
    public d f2561b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f2562c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ fl2 f2563d;

    /* renamed from: e, reason: collision with root package name */
    public int f2564e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dl2(fl2 fl2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2563d = fl2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2562c = obj;
        this.f2564e |= Integer.MIN_VALUE;
        return this.f2563d.s(this);
    }
}
