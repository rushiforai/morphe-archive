package defpackage;

import java.util.Iterator;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class j52 implements mzb {
    public final AtomicReference a;

    public j52(mzb mzbVar) {
        this.a = new AtomicReference(mzbVar);
    }

    @Override // defpackage.mzb
    public final Iterator iterator() {
        mzb mzbVar = (mzb) this.a.getAndSet(null);
        if (mzbVar != null) {
            return mzbVar.iterator();
        }
        ygf.f("This sequence can be consumed only once.");
        return null;
    }
}
