package g0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final class w extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public v2.b f56737t;

    /* renamed from: u, reason: collision with root package name */
    public Function1 f56738u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f56739v;

    /* renamed from: w, reason: collision with root package name */
    public int f56740w;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56739v = obj;
        this.f56740w |= Integer.MIN_VALUE;
        return x.c(null, 0L, null, this);
    }
}
