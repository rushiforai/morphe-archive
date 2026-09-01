package j$.util.stream;

import java.util.Comparator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class z5 extends h5 {
    public final Comparator b;
    public boolean c;

    public z5(l5 l5Var, Comparator comparator) {
        super(l5Var);
        this.b = comparator;
    }

    @Override // j$.util.stream.h5, j$.util.stream.l5
    public final boolean e() {
        this.c = true;
        return false;
    }
}
