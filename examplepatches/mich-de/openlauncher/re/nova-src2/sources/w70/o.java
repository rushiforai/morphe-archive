package w70;

import java.util.Iterator;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes5.dex */
public final class o extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f93964t;

    /* renamed from: u, reason: collision with root package name */
    public int f93965u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ e20.i0 f93966v;

    /* renamed from: w, reason: collision with root package name */
    public n f93967w;

    /* renamed from: x, reason: collision with root package name */
    public Iterator f93968x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(e20.i0 i0Var, Continuation continuation) {
        super(continuation);
        this.f93966v = i0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93964t = obj;
        this.f93965u |= Integer.MIN_VALUE;
        return this.f93966v.collect(null, this);
    }
}
