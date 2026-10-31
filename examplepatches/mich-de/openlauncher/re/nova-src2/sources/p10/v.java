package p10;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class v extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public y f81936t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f81937u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ y f81938v;

    /* renamed from: w, reason: collision with root package name */
    public int f81939w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v(y yVar, Continuation continuation) {
        super(continuation);
        this.f81938v = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f81937u = obj;
        this.f81939w |= Integer.MIN_VALUE;
        return this.f81938v.c(this);
    }
}
