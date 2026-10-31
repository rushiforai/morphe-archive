package es;

import com.stripe.android.link.LinkActivityResult;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public as.p f52936t;

    /* renamed from: u, reason: collision with root package name */
    public LinkActivityResult f52937u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f52938v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ as.p f52939w;

    /* renamed from: x, reason: collision with root package name */
    public int f52940x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(as.p pVar, Continuation continuation) {
        super(continuation);
        this.f52939w = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f52938v = obj;
        this.f52940x |= Integer.MIN_VALUE;
        return this.f52939w.a(null, this);
    }
}
