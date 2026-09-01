package defpackage;

import android.content.BroadcastReceiver;
import android.content.IntentFilter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w57 {
    public final IntentFilter a;
    public final BroadcastReceiver b;
    public boolean c;
    public boolean d;

    public w57(BroadcastReceiver broadcastReceiver, IntentFilter intentFilter) {
        this.a = intentFilter;
        this.b = broadcastReceiver;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(128);
        sb.append("Receiver{");
        sb.append(this.b);
        sb.append(" filter=");
        sb.append(this.a);
        if (this.d) {
            sb.append(" DEAD");
        }
        sb.append("}");
        return sb.toString();
    }
}
