package h0;

import c0.n;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class j extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public float f58749t;

    /* renamed from: u, reason: collision with root package name */
    public n f58750u;

    /* renamed from: v, reason: collision with root package name */
    public Ref.FloatRef f58751v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f58752w;

    /* renamed from: x, reason: collision with root package name */
    public int f58753x;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f58752w = obj;
        this.f58753x |= Integer.MIN_VALUE;
        return l.a(null, 0.0f, null, null, null, this);
    }
}
