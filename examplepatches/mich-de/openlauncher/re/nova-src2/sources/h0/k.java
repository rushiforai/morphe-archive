package h0;

import c0.n;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class k extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public float f58754t;

    /* renamed from: u, reason: collision with root package name */
    public float f58755u;

    /* renamed from: v, reason: collision with root package name */
    public n f58756v;

    /* renamed from: w, reason: collision with root package name */
    public Ref.FloatRef f58757w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f58758x;

    /* renamed from: y, reason: collision with root package name */
    public int f58759y;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f58758x = obj;
        this.f58759y |= Integer.MIN_VALUE;
        return l.b(null, 0.0f, 0.0f, null, null, null, this);
    }
}
