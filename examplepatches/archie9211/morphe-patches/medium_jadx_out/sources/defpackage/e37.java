package defpackage;

import java.util.concurrent.atomic.AtomicBoolean;
import sprig.b.g;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class e37 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ AtomicBoolean b;

    public /* synthetic */ e37(AtomicBoolean atomicBoolean, int i) {
        this.a = i;
        this.b = atomicBoolean;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        AtomicBoolean atomicBoolean = this.b;
        switch (i) {
            case 0:
                atomicBoolean.set(true);
                break;
            case 1:
                atomicBoolean.set(true);
                break;
            default:
                g.a(atomicBoolean);
                break;
        }
    }
}
