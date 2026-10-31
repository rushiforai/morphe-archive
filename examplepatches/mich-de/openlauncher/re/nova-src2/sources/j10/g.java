package j10;

import android.content.Context;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class g extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Context f68608t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f68609u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ h f68610v;

    /* renamed from: w, reason: collision with root package name */
    public int f68611w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(h hVar, Continuation continuation) {
        super(continuation);
        this.f68610v = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f68609u = obj;
        this.f68611w |= Integer.MIN_VALUE;
        return h.a(this.f68610v, null, this);
    }
}
