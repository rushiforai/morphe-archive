package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class b82 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public i82 f1320a;

    /* renamed from: b, reason: collision with root package name */
    public d f1321b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f1322c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ i82 f1323d;

    /* renamed from: e, reason: collision with root package name */
    public int f1324e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b82(i82 i82Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1323d = i82Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1322c = obj;
        this.f1324e |= Integer.MIN_VALUE;
        return i82.c(this.f1323d, this);
    }
}
