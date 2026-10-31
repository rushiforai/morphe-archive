package wx;

import android.content.Context;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Context f94877t;

    /* renamed from: u, reason: collision with root package name */
    public String f94878u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f94879v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ e f94880w;

    /* renamed from: x, reason: collision with root package name */
    public int f94881x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(e eVar, Continuation continuation) {
        super(continuation);
        this.f94880w = eVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f94879v = obj;
        this.f94881x |= Integer.MIN_VALUE;
        return this.f94880w.execute(null, null, false, this);
    }
}
