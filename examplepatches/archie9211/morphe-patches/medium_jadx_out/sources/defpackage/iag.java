package defpackage;

import android.os.Process;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class iag {
    public static final HashMap a;

    static {
        new HashSet(Arrays.asList("native", "unity"));
        a = new HashMap();
        ev6.s(Process.myUid(), Process.myPid(), "UID: [", "]  PID: [", "] ").concat("PlayCoreVersion");
    }
}
