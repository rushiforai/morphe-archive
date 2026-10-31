package e00;

import ninja.sesame.lib.bridge.v1.IntegrationOnComplete;

/* loaded from: classes4.dex */
public final /* synthetic */ class s1 implements fi.f, IntegrationOnComplete {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f50958a;

    @Override // fi.f
    public void i(Exception exc) {
        this.f50958a.setValue("Error: " + exc.getMessage());
    }

    @Override // ninja.sesame.lib.bridge.v1.IntegrationOnComplete
    public void onComplete(boolean z11) {
        this.f50958a.setValue(Boolean.valueOf(z11));
    }
}
