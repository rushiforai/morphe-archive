package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lrb {
    public final m45 a;
    public final m45 b;

    public lrb(m45 m45Var, m45 m45Var2) {
        this.a = m45Var;
        this.b = m45Var2;
    }

    public final String toString() {
        return "ScrollAxisRange(value=" + ((Number) this.a.invoke()).floatValue() + ", maxValue=" + ((Number) this.b.invoke()).floatValue() + ", reverseScrolling=false)";
    }
}
