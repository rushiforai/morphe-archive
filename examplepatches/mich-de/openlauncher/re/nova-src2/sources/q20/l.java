package q20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class l extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public p f83491t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f83492u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ p f83493v;

    /* renamed from: w, reason: collision with root package name */
    public int f83494w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(p pVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f83493v = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f83492u = obj;
        this.f83494w |= Integer.MIN_VALUE;
        return this.f83493v.f(0, null, this);
    }
}
