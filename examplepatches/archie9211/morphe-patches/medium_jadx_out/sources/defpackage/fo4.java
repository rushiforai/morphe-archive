package defpackage;

import kotlinx.coroutines.flow.internal.ChildCancelledException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class fo4 extends frb {
    @Override // defpackage.db6
    public final boolean w(Throwable th) {
        if (th instanceof ChildCancelledException) {
            return true;
        }
        return k(th);
    }
}
