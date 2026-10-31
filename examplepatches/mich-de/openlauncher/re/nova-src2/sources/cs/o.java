package cs;

import androidx.fragment.app.m0;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class o extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public p f47839t;

    /* renamed from: u, reason: collision with root package name */
    public m0 f47840u;

    /* renamed from: v, reason: collision with root package name */
    public String f47841v;

    /* renamed from: w, reason: collision with root package name */
    public String f47842w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f47843x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ p f47844y;

    /* renamed from: z, reason: collision with root package name */
    public int f47845z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(p pVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f47844y = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f47843x = obj;
        this.f47845z |= Integer.MIN_VALUE;
        return this.f47844y.d(null, null, null, this);
    }
}
