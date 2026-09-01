package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class an3 implements mzb, en3 {
    public final mzb a;
    public final int b;

    public an3(mzb mzbVar, int i) {
        mzbVar.getClass();
        this.a = mzbVar;
        this.b = i;
        if (i >= 0) {
            return;
        }
        ywb.g(ev6.u("count must be non-negative, but was ", i, '.'));
        throw null;
    }

    @Override // defpackage.en3
    public final mzb a(int i) {
        int i2 = this.b + i;
        return i2 < 0 ? new an3(this, i) : new an3(this.a, i2);
    }

    @Override // defpackage.mzb
    public final Iterator iterator() {
        return new zm3(this);
    }

    @Override // defpackage.en3
    public final mzb take() {
        int i = this.b;
        int i2 = i + 10;
        return i2 < 0 ? new gfd(this) : new evc(this.a, i, i2);
    }
}
