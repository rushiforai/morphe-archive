package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class p4 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public f5 f8084a;

    /* renamed from: b, reason: collision with root package name */
    public d f8085b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f8086c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ f5 f8087d;

    /* renamed from: e, reason: collision with root package name */
    public int f8088e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p4(f5 f5Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8087d = f5Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8086c = obj;
        this.f8088e |= Integer.MIN_VALUE;
        return f5.g(this.f8087d, this);
    }
}
