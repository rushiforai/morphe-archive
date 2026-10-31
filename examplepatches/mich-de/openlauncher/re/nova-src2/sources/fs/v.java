package fs;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class v extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f55840t;

    /* renamed from: u, reason: collision with root package name */
    public int f55841u;

    /* renamed from: v, reason: collision with root package name */
    public w70.n f55842v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ as.p f55843w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v(as.p pVar, Continuation continuation) {
        super(continuation);
        this.f55843w = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55840t = obj;
        this.f55841u |= Integer.MIN_VALUE;
        return this.f55843w.emit(null, this);
    }
}
