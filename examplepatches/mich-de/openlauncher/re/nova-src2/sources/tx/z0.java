package tx;

import android.content.Context;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class z0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Context f90082t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f90083u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ d1 f90084v;

    /* renamed from: w, reason: collision with root package name */
    public int f90085w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z0(d1 d1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f90084v = d1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f90083u = obj;
        this.f90085w |= Integer.MIN_VALUE;
        return this.f90084v.b(null, this);
    }
}
