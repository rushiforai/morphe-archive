package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zxf extends ayf {
    public final transient int g;
    public final transient int h;
    public final /* synthetic */ ayf i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zxf(ayf ayfVar, int i, int i2) {
        super(3);
        this.i = ayfVar;
        this.g = i;
        this.h = i2;
    }

    @Override // java.util.List
    public final Object get(int i) {
        jq7.x(i, this.h);
        return this.i.get(i + this.g);
    }

    @Override // defpackage.ogf
    public final int r() {
        return this.i.t() + this.g + this.h;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.h;
    }

    @Override // defpackage.ogf
    public final int t() {
        return this.i.t() + this.g;
    }

    @Override // defpackage.ogf
    public final Object[] w() {
        return this.i.w();
    }

    @Override // defpackage.ayf, java.util.List
    /* JADX INFO: renamed from: z */
    public final ayf subList(int i, int i2) {
        jq7.A(i, i2, this.h);
        int i3 = this.g;
        return this.i.subList(i + i3, i2 + i3);
    }
}
