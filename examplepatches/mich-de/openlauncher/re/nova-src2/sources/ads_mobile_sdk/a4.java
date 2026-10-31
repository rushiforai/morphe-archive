package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class a4 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public f5 f825a;

    /* renamed from: b, reason: collision with root package name */
    public d f826b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f827c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ f5 f828d;

    /* renamed from: e, reason: collision with root package name */
    public int f829e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a4(f5 f5Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f828d = f5Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f827c = obj;
        this.f829e |= Integer.MIN_VALUE;
        return f5.d(this.f828d, this);
    }
}
