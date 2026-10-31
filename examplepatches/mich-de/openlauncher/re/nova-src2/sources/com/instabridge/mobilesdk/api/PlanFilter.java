package com.instabridge.mobilesdk.api;

import a5.i;
import com.instabridge.mobilesdk.Plan;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\bæ\u0080\u0001\u0018\u0000 \u00062\u00020\u0001:\u0001\u0006J\u001c\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003H&¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/api/PlanFilter;", b.f42142b, "apply", b.f42142b, "Lcom/instabridge/mobilesdk/Plan;", "plans", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface PlanFilter {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = Companion.$$INSTANCE;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/instabridge/mobilesdk/api/PlanFilter$Companion;", b.f42142b, "<init>", "()V", "Identity", "Lcom/instabridge/mobilesdk/api/PlanFilter;", "getIdentity", "()Lcom/instabridge/mobilesdk/api/PlanFilter;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        static final /* synthetic */ Companion $$INSTANCE = new Companion();

        @NotNull
        private static final PlanFilter Identity = new i(7);

        private Companion() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final List Identity$lambda$0(List it) {
            Intrinsics.g(it, "it");
            return it;
        }

        @NotNull
        public final PlanFilter getIdentity() {
            return Identity;
        }
    }

    @NotNull
    List<Plan> apply(@NotNull List<Plan> plans);
}
