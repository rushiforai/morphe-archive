package rv;

import com.google.android.gms.internal.measurement.ag;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public ag f86387t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f86388u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ ag f86389v;

    /* renamed from: w, reason: collision with root package name */
    public int f86390w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(ag agVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f86389v = agVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f86388u = obj;
        this.f86390w |= Integer.MIN_VALUE;
        return this.f86389v.g(this);
    }
}
