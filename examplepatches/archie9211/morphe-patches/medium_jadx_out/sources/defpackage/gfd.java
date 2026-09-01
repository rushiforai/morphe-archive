package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gfd implements mzb, en3 {
    public final mzb a;

    public gfd(mzb mzbVar) {
        this.a = mzbVar;
    }

    @Override // defpackage.en3
    public final mzb a(int i) {
        return i >= 10 ? my3.a : new evc(this.a, i, 10);
    }

    @Override // defpackage.mzb
    public final Iterator iterator() {
        return new zm3(this);
    }

    @Override // defpackage.en3
    public final mzb take() {
        return this;
    }
}
