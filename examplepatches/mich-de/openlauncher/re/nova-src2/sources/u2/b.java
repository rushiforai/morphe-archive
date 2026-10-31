package u2;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import x7.h;

/* loaded from: classes2.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f90437t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ h f90438u;

    /* renamed from: v, reason: collision with root package name */
    public int f90439v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f90438u = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f90437t = obj;
        this.f90439v |= Integer.MIN_VALUE;
        return this.f90438u.f(0L, 0L, this);
    }
}
