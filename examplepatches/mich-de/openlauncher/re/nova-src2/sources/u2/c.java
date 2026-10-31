package u2;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import x7.h;

/* loaded from: classes2.dex */
public final class c extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f90440t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ h f90441u;

    /* renamed from: v, reason: collision with root package name */
    public int f90442v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f90441u = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f90440t = obj;
        this.f90442v |= Integer.MIN_VALUE;
        return this.f90441u.g(0L, this);
    }
}
