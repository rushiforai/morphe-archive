package defpackage;

import android.os.Handler;
import android.os.Looper;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class tjf extends Handler {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tjf(Looper looper, int i) {
        super(looper);
        switch (i) {
            case 4:
                super(looper);
                Looper.getMainLooper();
                break;
            default:
                Looper.getMainLooper();
                break;
        }
    }
}
