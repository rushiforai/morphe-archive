package h50;

import java.util.Iterator;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class z extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public l50.b f59320t;

    /* renamed from: u, reason: collision with root package name */
    public Iterator f59321u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f59322v;

    /* renamed from: w, reason: collision with root package name */
    public int f59323w;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f59322v = obj;
        this.f59323w |= Integer.MIN_VALUE;
        return b0.b(null, null, this);
    }
}
