package m1;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class i extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f75693t;

    /* renamed from: u, reason: collision with root package name */
    public int f75694u;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75693t = obj;
        this.f75694u |= Integer.MIN_VALUE;
        return androidx.compose.material3.internal.a.a(null, null, this);
    }
}
