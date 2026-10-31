package t5;

import java.io.Serializable;
import java.util.Iterator;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class d extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Serializable f88555t;

    /* renamed from: u, reason: collision with root package name */
    public Iterator f88556u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f88557v;

    /* renamed from: w, reason: collision with root package name */
    public int f88558w;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88557v = obj;
        this.f88558w |= Integer.MIN_VALUE;
        return f.a(null, null, this);
    }
}
