package e10;

import android.content.Context;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class u0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Context f51835t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f51836u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ w0 f51837v;

    /* renamed from: w, reason: collision with root package name */
    public int f51838w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u0(w0 w0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f51837v = w0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f51836u = obj;
        this.f51838w |= Integer.MIN_VALUE;
        return this.f51837v.a(null, this);
    }
}
