package defpackage;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class co6 implements l55, Serializable {
    private final int arity;

    public co6(int i) {
        this.arity = i;
    }

    @Override // defpackage.l55
    public int getArity() {
        return this.arity;
    }

    public String toString() {
        String strJ = n1b.a.j(this);
        strJ.getClass();
        return strJ;
    }
}
