package defpackage;

import android.text.TextUtils;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class bc2 {
    public final AtomicInteger a = new AtomicInteger(0);

    public bc2() {
        if (TextUtils.isEmpty("SESSION_REPLAY_EXPORT")) {
            ay0.e("resourceName cannot be empty or null!");
            throw null;
        }
    }
}
