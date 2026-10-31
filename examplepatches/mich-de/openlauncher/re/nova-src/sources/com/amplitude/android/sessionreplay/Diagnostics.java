package com.amplitude.android.sessionreplay;

import com.amplitude.C0446h0;
import com.amplitude.core.events.Plan;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0003\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\u00020\u0001:\u0003\u000f\u0012\u0013B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u001d\u0010\t\u001a\u00020\b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\t\u0010\nJ\u001d\u0010\t\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\t\u0010\fJ\u000f\u0010\r\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\r\u0010\u000eR\u0014\u0010\u0010\u001a\u00020\u000f8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010\u0011¨\u0006\u0014"}, d2 = {"Lcom/amplitude/android/sessionreplay/Diagnostics;", b.f42142b, "<init>", "()V", b.f42142b, "throwable", b.f42142b, Plan.AMP_PLAN_SOURCE, b.f42142b, "trackError", "(Ljava/lang/Throwable;Ljava/lang/String;)V", PglCryptUtils.KEY_MESSAGE, "(Ljava/lang/String;Ljava/lang/String;)V", "getLastError", "()Ljava/lang/String;", "Lcom/amplitude/h0;", "diagnosticsData", "Lcom/amplitude/h0;", "com/amplitude/i0", "com/amplitude/j0", "session-replay_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class Diagnostics {
    public static final Diagnostics INSTANCE = new Diagnostics();
    private static final C0446h0 diagnosticsData = new C0446h0();

    private Diagnostics() {
    }

    public final String getLastError() {
        return diagnosticsData.f20592a;
    }

    public final void trackError(Throwable throwable, String source) {
        Intrinsics.g(throwable, "throwable");
        Intrinsics.g(source, "source");
        diagnosticsData.a(throwable, source);
    }

    public final void trackError(String message, String source) {
        Intrinsics.g(message, "message");
        Intrinsics.g(source, "source");
        diagnosticsData.a(message, source);
    }
}
