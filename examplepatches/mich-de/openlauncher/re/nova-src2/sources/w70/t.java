package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class t extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f94016t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ b00.o f94017u;

    /* renamed from: v, reason: collision with root package name */
    public int f94018v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t(b00.o oVar, Continuation continuation) {
        super(continuation);
        this.f94017u = oVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f94016t = obj;
        this.f94018v |= Integer.MIN_VALUE;
        return this.f94017u.emit(null, this);
    }
}
