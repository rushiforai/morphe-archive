package h0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final class c extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Function1 f58721t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f58722u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ h f58723v;

    /* renamed from: w, reason: collision with root package name */
    public int f58724w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f58723v = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f58722u = obj;
        this.f58724w |= Integer.MIN_VALUE;
        return this.f58723v.c(null, 0.0f, null, this);
    }
}
