package defpackage;

import android.view.KeyEvent;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hk6 {
    public final KeyEvent a;

    public final boolean equals(Object obj) {
        if (obj instanceof hk6) {
            return g76.L(this.a, ((hk6) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "KeyEvent(nativeKeyEvent=" + this.a + ')';
    }
}
