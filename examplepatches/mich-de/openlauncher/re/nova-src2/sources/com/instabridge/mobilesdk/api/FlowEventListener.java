package com.instabridge.mobilesdk.api;

import com.instabridge.mobilesdk.MobileFlowResult;
import com.instabridge.mobilesdk.Plan;
import com.instabridge.mobilesdk.api.FlowEventListener;
import com.instabridge.mobilesdk.internal.data.EsimInstallStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\bf\u0018\u0000 \u00132\u00020\u0001:\u0001\u0013J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016J\u0010\u0010\u0006\u001a\u00020\u00032\u0006\u0010\u0007\u001a\u00020\bH\u0016J\u0010\u0010\t\u001a\u00020\u00032\u0006\u0010\n\u001a\u00020\u000bH\u0016J\u0010\u0010\f\u001a\u00020\u00032\u0006\u0010\r\u001a\u00020\u0005H\u0016J\u0010\u0010\u000e\u001a\u00020\u00032\u0006\u0010\u000f\u001a\u00020\u0010H\u0016J\u0010\u0010\u0011\u001a\u00020\u00032\u0006\u0010\u0012\u001a\u00020\u000bH\u0016¨\u0006\u0014"}, d2 = {"Lcom/instabridge/mobilesdk/api/FlowEventListener;", b.f42142b, "onStepChanged", b.f42142b, "stepName", b.f42142b, "onPlanSelected", "plan", "Lcom/instabridge/mobilesdk/Plan;", "onPurchaseCompleted", "packageId", b.f42142b, "onEsimInstalled", EsimInstallStore.KEY_ICCID, "onFlowExit", "result", "Lcom/instabridge/mobilesdk/MobileFlowResult;", "onSignedIn", "userId", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface FlowEventListener {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = Companion.$$INSTANCE;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/instabridge/mobilesdk/api/FlowEventListener$Companion;", b.f42142b, "<init>", "()V", "Noop", "Lcom/instabridge/mobilesdk/api/FlowEventListener;", "getNoop", "()Lcom/instabridge/mobilesdk/api/FlowEventListener;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        static final /* synthetic */ Companion $$INSTANCE = new Companion();

        @NotNull
        private static final FlowEventListener Noop = new FlowEventListener() { // from class: com.instabridge.mobilesdk.api.FlowEventListener$Companion$Noop$1
            @Override // com.instabridge.mobilesdk.api.FlowEventListener
            public void onEsimInstalled(String str) {
                FlowEventListener.DefaultImpls.onEsimInstalled(this, str);
            }

            @Override // com.instabridge.mobilesdk.api.FlowEventListener
            public void onFlowExit(MobileFlowResult mobileFlowResult) {
                FlowEventListener.DefaultImpls.onFlowExit(this, mobileFlowResult);
            }

            @Override // com.instabridge.mobilesdk.api.FlowEventListener
            public void onPlanSelected(Plan plan) {
                FlowEventListener.DefaultImpls.onPlanSelected(this, plan);
            }

            @Override // com.instabridge.mobilesdk.api.FlowEventListener
            public void onPurchaseCompleted(long j11) {
                FlowEventListener.DefaultImpls.onPurchaseCompleted(this, j11);
            }

            @Override // com.instabridge.mobilesdk.api.FlowEventListener
            public void onSignedIn(long j11) {
                FlowEventListener.DefaultImpls.onSignedIn(this, j11);
            }

            @Override // com.instabridge.mobilesdk.api.FlowEventListener
            public void onStepChanged(String str) {
                FlowEventListener.DefaultImpls.onStepChanged(this, str);
            }
        };

        private Companion() {
        }

        @NotNull
        public final FlowEventListener getNoop() {
            return Noop;
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    public static final class DefaultImpls {
        public static void onEsimInstalled(@NotNull FlowEventListener flowEventListener, @NotNull String iccid) {
            Intrinsics.g(iccid, "iccid");
        }

        public static void onFlowExit(@NotNull FlowEventListener flowEventListener, @NotNull MobileFlowResult result) {
            Intrinsics.g(result, "result");
        }

        public static void onPlanSelected(@NotNull FlowEventListener flowEventListener, @NotNull Plan plan) {
            Intrinsics.g(plan, "plan");
        }

        public static void onPurchaseCompleted(@NotNull FlowEventListener flowEventListener, long j11) {
        }

        public static void onSignedIn(@NotNull FlowEventListener flowEventListener, long j11) {
        }

        public static void onStepChanged(@NotNull FlowEventListener flowEventListener, @NotNull String stepName) {
            Intrinsics.g(stepName, "stepName");
        }
    }

    void onEsimInstalled(@NotNull String iccid);

    void onFlowExit(@NotNull MobileFlowResult result);

    void onPlanSelected(@NotNull Plan plan);

    void onPurchaseCompleted(long packageId);

    void onSignedIn(long userId);

    void onStepChanged(@NotNull String stepName);
}
