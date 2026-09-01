package sprig.b;

import android.app.Activity;
import java.lang.ref.WeakReference;
import sprig.b.g;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class m implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ m(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                g.k.a((Activity) obj);
                break;
            default:
                g.l.a((WeakReference) obj);
                break;
        }
    }
}
