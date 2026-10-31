package gv;

import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class i0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public List f57874t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f57875u;

    /* renamed from: v, reason: collision with root package name */
    public int f57876v;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f57875u = obj;
        this.f57876v |= Integer.MIN_VALUE;
        return j0.a(null, null, false, null, this);
    }
}
