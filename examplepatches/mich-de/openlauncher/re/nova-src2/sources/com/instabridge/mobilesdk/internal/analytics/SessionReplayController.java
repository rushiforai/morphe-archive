package com.instabridge.mobilesdk.internal.analytics;

import b70.h;
import b70.k;
import com.instabridge.mobilesdk.api.AnalyticsSink;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0006\n\u0002\b\u0002\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0016\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\fJ\u000e\u0010\r\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\nR\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\u000e"}, d2 = {"Lcom/instabridge/mobilesdk/internal/analytics/SessionReplayController;", b.f42142b, "<init>", "()V", "EVENT_START", b.f42142b, "EVENT_STOP", "start", b.f42142b, "sink", "Lcom/instabridge/mobilesdk/api/AnalyticsSink;", "sampleRate", b.f42142b, "stop", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class SessionReplayController {
    public static final int $stable = 0;

    @NotNull
    public static final String EVENT_START = "mobile_sdk_session_replay_start";

    @NotNull
    public static final String EVENT_STOP = "mobile_sdk_session_replay_stop";

    @NotNull
    public static final SessionReplayController INSTANCE = new SessionReplayController();

    private SessionReplayController() {
    }

    public final void start(@NotNull AnalyticsSink sink, double sampleRate) {
        Intrinsics.g(sink, "sink");
        sink.track(EVENT_START, k.e0(new Pair("sample_rate", Double.valueOf(sampleRate))));
    }

    public final void stop(@NotNull AnalyticsSink sink) {
        Intrinsics.g(sink, "sink");
        sink.track(EVENT_STOP, h.f17594a);
    }
}
