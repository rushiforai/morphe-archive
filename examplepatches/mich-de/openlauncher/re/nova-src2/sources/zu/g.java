package zu;

import hv.t3;
import kotlin.Unit;
import kotlin.coroutines.Continuation;

/* loaded from: classes4.dex */
public final class g implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f98607a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ m f98608b;

    public /* synthetic */ g(m mVar, int i5) {
        this.f98607a = i5;
        this.f98608b = mVar;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        switch (this.f98607a) {
            case 0:
                this.f98608b.f98625q.invoke(new t3(((Boolean) obj).booleanValue(), 3));
                break;
            default:
                this.f98608b.n.invoke((r) obj);
                break;
        }
        return Unit.f71706a;
    }
}
