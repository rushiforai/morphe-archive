package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class evc implements mzb, en3 {
    public final mzb a;
    public final int b;
    public final int c;

    public evc(mzb mzbVar, int i, int i2) {
        mzbVar.getClass();
        this.a = mzbVar;
        this.b = i;
        this.c = i2;
        if (i < 0) {
            ywb.g(b09.w(i, "startIndex should be non-negative, but is "));
            throw null;
        }
        if (i2 < 0) {
            ywb.g(b09.w(i2, "endIndex should be non-negative, but is "));
            throw null;
        }
        if (i2 >= i) {
            return;
        }
        ywb.g(ev6.v("endIndex should be not less than startIndex, but was ", i2, i, " < "));
        throw null;
    }

    @Override // defpackage.en3
    public final mzb a(int i) {
        int i2 = this.c;
        int i3 = this.b;
        return i >= i2 - i3 ? my3.a : new evc(this.a, i3 + i, i2);
    }

    @Override // defpackage.mzb
    public final Iterator iterator() {
        return new u75(this);
    }

    @Override // defpackage.en3
    public final mzb take() {
        int i = this.c;
        int i2 = this.b;
        if (10 >= i - i2) {
            return this;
        }
        return new evc(this.a, i2, i2 + 10);
    }
}
