package t70;

import java.util.Iterator;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class f extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Iterator f88789t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f88790u;

    /* renamed from: v, reason: collision with root package name */
    public int f88791v;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88790u = obj;
        this.f88791v |= Integer.MIN_VALUE;
        return m0.r(null, this);
    }
}
