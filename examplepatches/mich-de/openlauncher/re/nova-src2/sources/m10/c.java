package m10;

import android.content.Context;
import java.time.Duration;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Context f75801t;

    /* renamed from: u, reason: collision with root package name */
    public Duration f75802u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f75803v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ br.c f75804w;

    /* renamed from: x, reason: collision with root package name */
    public int f75805x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(br.c cVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f75804w = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75803v = obj;
        this.f75805x |= Integer.MIN_VALUE;
        return this.f75804w.k(null, null, null, this);
    }
}
