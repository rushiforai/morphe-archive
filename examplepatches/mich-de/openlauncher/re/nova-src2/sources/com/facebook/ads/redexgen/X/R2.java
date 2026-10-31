package com.facebook.ads.redexgen.X;

import android.media.AudioTrack;
import android.media.metrics.LogSessionId;

/* loaded from: assets/audience_network/classes.dex */
public final class R2 {
    public static void A00(AudioTrack audioTrack, QD qd2) {
        LogSessionId logSessionIdA00 = qd2.A00();
        LogSessionId logSessionId = LogSessionId.LOG_SESSION_ID_NONE;
        if (!logSessionIdA00.equals(logSessionId)) {
            audioTrack.setLogSessionId(logSessionIdA00);
        }
    }
}
