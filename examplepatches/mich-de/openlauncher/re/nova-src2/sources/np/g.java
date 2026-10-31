package np;

import com.novalauncher.novalytics.ReportSubmitWork;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class g extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public d f78512t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f78513u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ ReportSubmitWork f78514v;

    /* renamed from: w, reason: collision with root package name */
    public int f78515w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(ReportSubmitWork reportSubmitWork, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f78514v = reportSubmitWork;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f78513u = obj;
        this.f78515w |= Integer.MIN_VALUE;
        return this.f78514v.doWork(this);
    }
}
