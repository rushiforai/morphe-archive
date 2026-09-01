package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fof extends tpf {
    public final transient tpf g;

    public fof(tpf tpfVar) {
        super(1);
        this.g = tpfVar;
    }

    @Override // defpackage.tpf, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return this.g.contains(obj);
    }

    @Override // java.util.List
    public final Object get(int i) {
        tpf tpfVar = this.g;
        ek7.S(i, tpfVar.size());
        return tpfVar.get((tpfVar.size() - 1) - i);
    }

    @Override // defpackage.tpf, java.util.List
    public final int indexOf(Object obj) {
        int iLastIndexOf = this.g.lastIndexOf(obj);
        if (iLastIndexOf >= 0) {
            return (r1.size() - 1) - iLastIndexOf;
        }
        return -1;
    }

    @Override // defpackage.tpf, java.util.List
    public final int lastIndexOf(Object obj) {
        int iIndexOf = this.g.indexOf(obj);
        if (iIndexOf >= 0) {
            return (r1.size() - 1) - iIndexOf;
        }
        return -1;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.g.size();
    }

    @Override // defpackage.tpf
    public final tpf y() {
        return this.g;
    }

    @Override // defpackage.tpf, java.util.List
    /* JADX INFO: renamed from: z */
    public final tpf subList(int i, int i2) {
        tpf tpfVar = this.g;
        ek7.V(i, i2, tpfVar.size());
        return tpfVar.subList(tpfVar.size() - i2, tpfVar.size() - i).y();
    }
}
