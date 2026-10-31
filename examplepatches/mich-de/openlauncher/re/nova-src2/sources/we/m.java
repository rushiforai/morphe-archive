package we;

import android.media.metrics.LogSessionId;

/* loaded from: classes3.dex */
public abstract class m {
    public static void a(h hVar, ge.m mVar) {
        ge.l lVar = mVar.f57443a;
        lVar.getClass();
        LogSessionId logSessionId = lVar.f57442a;
        LogSessionId unused = LogSessionId.LOG_SESSION_ID_NONE;
        if (logSessionId.equals(LogSessionId.LOG_SESSION_ID_NONE)) {
            return;
        }
        hVar.f94246b.setString("log-session-id", logSessionId.getStringId());
    }
}
