package com.amplitude.android.sessionreplay.config;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0016\u0018\u0000 \u00072\u00020\u0001:\u0001\u0007B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\b"}, d2 = {"Lcom/amplitude/android/sessionreplay/config/RecordLogLevel;", b.f42142b, "rawValue", b.f42142b, "(Ljava/lang/String;)V", "getRawValue", "()Ljava/lang/String;", k.O, "session-replay_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public class RecordLogLevel {
    private final String rawValue;

    /* renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    private static final RecordLogLevel Error = new RecordLogLevel("error");
    private static final RecordLogLevel Warn = new RecordLogLevel("warn");
    private static final RecordLogLevel Log = new RecordLogLevel("log");

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u0011\u0010\u0003\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006R\u0011\u0010\u0007\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\u0006R\u0011\u0010\t\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u0006¨\u0006\u000b"}, d2 = {"Lcom/amplitude/android/sessionreplay/config/RecordLogLevel$Companion;", b.f42142b, "()V", k.f40331e, "Lcom/amplitude/android/sessionreplay/config/RecordLogLevel;", "getError", "()Lcom/amplitude/android/sessionreplay/config/RecordLogLevel;", "Log", "getLog", "Warn", "getWarn", "session-replay_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public final RecordLogLevel getError() {
            return RecordLogLevel.Error;
        }

        public final RecordLogLevel getLog() {
            return RecordLogLevel.Log;
        }

        public final RecordLogLevel getWarn() {
            return RecordLogLevel.Warn;
        }

        private Companion() {
        }
    }

    public RecordLogLevel(String rawValue) {
        Intrinsics.g(rawValue, "rawValue");
        this.rawValue = rawValue;
    }

    public final String getRawValue() {
        return this.rawValue;
    }
}
