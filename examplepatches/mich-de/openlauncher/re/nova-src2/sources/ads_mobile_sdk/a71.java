package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class a71 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public b71 f880a;

    /* renamed from: b, reason: collision with root package name */
    public d f881b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f882c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ b71 f883d;

    /* renamed from: e, reason: collision with root package name */
    public int f884e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a71(b71 b71Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f883d = b71Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f882c = obj;
        this.f884e |= Integer.MIN_VALUE;
        return this.f883d.c(this);
    }
}
