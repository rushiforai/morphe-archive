package defpackage;

import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b15 extends k7 {
    public final /* synthetic */ AtomicReference a;

    public b15(AtomicReference atomicReference) {
        this.a = atomicReference;
    }

    @Override // defpackage.k7
    public final void a(Object obj, z6 z6Var) {
        k7 k7Var = (k7) this.a.get();
        if (k7Var != null) {
            k7Var.a(obj, z6Var);
        } else {
            ygf.f("Operation cannot be started before fragment is in created state");
        }
    }
}
