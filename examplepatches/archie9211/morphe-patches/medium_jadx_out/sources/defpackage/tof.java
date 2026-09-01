package defpackage;

import android.util.Log;
import java.util.HashMap;
import java.util.concurrent.ScheduledExecutorService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tof {
    public final ScheduledExecutorService a;

    static {
        String[] strArr = {"SmsRetrieverHelper"};
        if (strArr.length != 0) {
            StringBuilder sb = new StringBuilder();
            sb.append('[');
            for (String str : strArr) {
                if (sb.length() > 1) {
                    sb.append(",");
                }
                sb.append(str);
            }
            sb.append("] ");
        }
        for (int i = 2; i <= 7 && !Log.isLoggable("FirebaseAuth", i); i++) {
        }
    }

    public tof(ScheduledExecutorService scheduledExecutorService) {
        new HashMap();
        this.a = scheduledExecutorService;
    }
}
