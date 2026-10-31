package v70;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;

/* loaded from: classes.dex */
public final class u extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Function0 f92198t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f92199u;

    /* renamed from: v, reason: collision with root package name */
    public int f92200v;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f92199u = obj;
        this.f92200v |= Integer.MIN_VALUE;
        return v.a(null, null, this);
    }
}
