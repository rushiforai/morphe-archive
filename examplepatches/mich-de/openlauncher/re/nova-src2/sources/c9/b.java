package c9;

import h6.u;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public u f19854t;

    /* renamed from: u, reason: collision with root package name */
    public Ref.ObjectRef f19855u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f19856v;

    /* renamed from: w, reason: collision with root package name */
    public int f19857w;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f19856v = obj;
        this.f19857w |= Integer.MIN_VALUE;
        return d.a(null, this);
    }
}
