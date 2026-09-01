package defpackage;

import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class voa extends AtomicBoolean implements sh3 {
    public final jn8 a;
    public final woa b;

    public voa(jn8 jn8Var, woa woaVar) {
        this.a = jn8Var;
        this.b = woaVar;
    }

    @Override // defpackage.sh3
    public final void dispose() {
        if (compareAndSet(false, true)) {
            this.b.F0(this);
        }
    }
}
