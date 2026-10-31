package d00;

import android.content.Context;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class u extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Context f48712t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f48713u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ y f48714v;

    /* renamed from: w, reason: collision with root package name */
    public int f48715w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f48714v = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f48713u = obj;
        this.f48715w |= Integer.MIN_VALUE;
        return this.f48714v.c(null, this);
    }
}
