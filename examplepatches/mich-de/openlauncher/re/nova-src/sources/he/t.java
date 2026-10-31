package he;

import android.media.AudioTrack;
import android.media.metrics.LogSessionId;

/* loaded from: classes3.dex */
public abstract class t {
    public static void a(AudioTrack audioTrack, ge.m mVar) {
        ge.l lVar = mVar.f57443a;
        lVar.getClass();
        LogSessionId logSessionId = lVar.f57442a;
        LogSessionId unused = LogSessionId.LOG_SESSION_ID_NONE;
        if (logSessionId.equals(LogSessionId.LOG_SESSION_ID_NONE)) {
            return;
        }
        audioTrack.setLogSessionId(logSessionId);
    }
}
