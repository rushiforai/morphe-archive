package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kgg extends mgg {
    public final transient int c;
    public final transient int d;
    public final /* synthetic */ mgg e;

    public kgg(mgg mggVar, int i, int i2) {
        this.e = mggVar;
        this.c = i;
        this.d = i2;
    }

    @Override // defpackage.agg
    public final Object[] e() {
        return this.e.e();
    }

    @Override // defpackage.agg
    public final int f() {
        return this.e.f() + this.c;
    }

    @Override // java.util.List
    public final Object get(int i) {
        jq7.z(i, this.d);
        return this.e.get(i + this.c);
    }

    @Override // defpackage.agg
    public final int m() {
        return this.e.f() + this.c + this.d;
    }

    @Override // defpackage.mgg, java.util.List
    /* JADX INFO: renamed from: r */
    public final mgg subList(int i, int i2) {
        jq7.D(i, i2, this.d);
        int i3 = this.c;
        return this.e.subList(i + i3, i2 + i3);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.d;
    }
}
