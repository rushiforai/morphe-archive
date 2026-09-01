package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vxf extends ayf {
    public final transient ayf g;

    public vxf(ayf ayfVar) {
        super(3);
        this.g = ayfVar;
    }

    @Override // defpackage.ayf, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return this.g.contains(obj);
    }

    @Override // java.util.List
    public final Object get(int i) {
        ayf ayfVar = this.g;
        jq7.x(i, ayfVar.size());
        return ayfVar.get((ayfVar.size() - 1) - i);
    }

    @Override // defpackage.ayf, java.util.List
    public final int indexOf(Object obj) {
        int iLastIndexOf = this.g.lastIndexOf(obj);
        if (iLastIndexOf >= 0) {
            return (r1.size() - 1) - iLastIndexOf;
        }
        return -1;
    }

    @Override // defpackage.ayf, java.util.List
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

    @Override // defpackage.ayf
    public final ayf y() {
        return this.g;
    }

    @Override // defpackage.ayf, java.util.List
    /* JADX INFO: renamed from: z */
    public final ayf subList(int i, int i2) {
        ayf ayfVar = this.g;
        jq7.A(i, i2, ayfVar.size());
        return ayfVar.subList(ayfVar.size() - i2, ayfVar.size() - i).y();
    }
}
