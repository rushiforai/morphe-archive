package d00;

import com.instabridge.mobilesdk.MobileFlowResult;
import com.instabridge.mobilesdk.Plan;
import com.instabridge.mobilesdk.api.FlowEventListener;

/* loaded from: classes4.dex */
public final class m implements FlowEventListener {

    /* renamed from: a, reason: collision with root package name */
    public static final m f48704a = new m();

    @Override // com.instabridge.mobilesdk.api.FlowEventListener
    public final void onEsimInstalled(String str) {
        FlowEventListener.DefaultImpls.onEsimInstalled(this, str);
    }

    @Override // com.instabridge.mobilesdk.api.FlowEventListener
    public final void onFlowExit(MobileFlowResult mobileFlowResult) {
        FlowEventListener.DefaultImpls.onFlowExit(this, mobileFlowResult);
    }

    @Override // com.instabridge.mobilesdk.api.FlowEventListener
    public final void onPlanSelected(Plan plan) {
        FlowEventListener.DefaultImpls.onPlanSelected(this, plan);
    }

    @Override // com.instabridge.mobilesdk.api.FlowEventListener
    public final void onPurchaseCompleted(long j11) {
        FlowEventListener.DefaultImpls.onPurchaseCompleted(this, j11);
    }

    @Override // com.instabridge.mobilesdk.api.FlowEventListener
    public final void onSignedIn(long j11) {
        n.b(j11);
    }

    @Override // com.instabridge.mobilesdk.api.FlowEventListener
    public final void onStepChanged(String str) {
        FlowEventListener.DefaultImpls.onStepChanged(this, str);
    }
}
