package ay;

import android.content.Context;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Context f15739t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f15740u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ io.sentry.hints.i f15741v;

    /* renamed from: w, reason: collision with root package name */
    public int f15742w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(io.sentry.hints.i iVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f15741v = iVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f15740u = obj;
        this.f15742w |= Integer.MIN_VALUE;
        return this.f15741v.c(null, null, this);
    }
}
