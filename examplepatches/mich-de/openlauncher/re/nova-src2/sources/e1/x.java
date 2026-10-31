package e1;

import kotlin.coroutines.jvm.internal.BaseContinuationImpl;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class x extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public v2.b f51408t;

    /* renamed from: u, reason: collision with root package name */
    public w0 f51409u;

    /* renamed from: v, reason: collision with root package name */
    public Ref.BooleanRef f51410v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f51411w;

    /* renamed from: x, reason: collision with root package name */
    public int f51412x;

    public x(BaseContinuationImpl baseContinuationImpl) {
        super(baseContinuationImpl);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f51411w = obj;
        this.f51412x |= Integer.MIN_VALUE;
        return b0.b(null, null, null, null, this);
    }
}
