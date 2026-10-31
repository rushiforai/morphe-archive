package g0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class s1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public h2 f56687t;

    /* renamed from: u, reason: collision with root package name */
    public Ref.FloatRef f56688u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f56689v;

    /* renamed from: w, reason: collision with root package name */
    public int f56690w;

    public s1(ContinuationImpl continuationImpl) {
        super(continuationImpl);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56689v = obj;
        this.f56690w |= Integer.MIN_VALUE;
        return androidx.compose.foundation.gestures.a.a(null, 0L, this);
    }
}
