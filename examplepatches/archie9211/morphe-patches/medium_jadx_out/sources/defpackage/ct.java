package defpackage;

import android.view.Choreographer;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ct implements Choreographer.FrameCallback, Runnable {
    public final /* synthetic */ dt a;

    public ct(dt dtVar) {
        this.a = dtVar;
    }

    @Override // android.view.Choreographer.FrameCallback
    public final void doFrame(long j) {
        this.a.d.removeCallbacks(this);
        this.a.J0();
        dt dtVar = this.a;
        synchronized (dtVar.e) {
            if (dtVar.j) {
                dtVar.j = false;
                ArrayList arrayList = dtVar.g;
                dtVar.g = dtVar.h;
                dtVar.h = arrayList;
                int size = arrayList.size();
                for (int i = 0; i < size; i++) {
                    ((Choreographer.FrameCallback) arrayList.get(i)).doFrame(j);
                }
                arrayList.clear();
            }
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.a.J0();
        dt dtVar = this.a;
        synchronized (dtVar.e) {
            if (dtVar.g.isEmpty()) {
                dtVar.c.removeFrameCallback(this);
                dtVar.j = false;
            }
        }
    }
}
