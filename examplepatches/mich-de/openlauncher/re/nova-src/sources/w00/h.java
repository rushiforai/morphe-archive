package w00;

import ninja.sesame.lib.bridge.v1.IntegrationOnComplete;
import r10.p0;

/* loaded from: classes4.dex */
public final /* synthetic */ class h implements IntegrationOnComplete {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f93517a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ z f93518b;

    public /* synthetic */ h(z zVar, int i5) {
        this.f93517a = i5;
        this.f93518b = zVar;
    }

    @Override // ninja.sesame.lib.bridge.v1.IntegrationOnComplete
    public final void onComplete(boolean z11) {
        switch (this.f93517a) {
            case 0:
                z zVar = this.f93518b;
                zVar.f93630g.setValue(Boolean.valueOf(z11));
                zVar.b(p0.f85207d, z11);
                break;
            default:
                this.f93518b.f93630g.setValue(Boolean.valueOf(z11));
                break;
        }
    }
}
