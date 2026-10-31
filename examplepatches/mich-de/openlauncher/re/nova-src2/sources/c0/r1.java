package c0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class r1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public n f18940t;

    /* renamed from: u, reason: collision with root package name */
    public i f18941u;

    /* renamed from: v, reason: collision with root package name */
    public Function1 f18942v;

    /* renamed from: w, reason: collision with root package name */
    public Ref.ObjectRef f18943w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f18944x;

    /* renamed from: y, reason: collision with root package name */
    public int f18945y;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f18944x = obj;
        this.f18945y |= Integer.MIN_VALUE;
        return s1.b(null, null, 0L, null, this);
    }
}
