package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class juf extends upf {
    public final transient int g;
    public final transient int h;
    public final /* synthetic */ upf i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public juf(upf upfVar, int i, int i2) {
        super(2);
        this.i = upfVar;
        this.g = i;
        this.h = i2;
    }

    @Override // java.util.List
    public final Object get(int i) {
        ok7.L(i, this.h);
        return this.i.get(i + this.g);
    }

    @Override // defpackage.ogf
    public final int p() {
        return this.i.r() + this.g + this.h;
    }

    @Override // defpackage.ogf
    public final int r() {
        return this.i.r() + this.g;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.h;
    }

    @Override // defpackage.ogf
    public final Object[] w() {
        return this.i.w();
    }

    @Override // defpackage.upf, java.util.List
    /* JADX INFO: renamed from: y */
    public final upf subList(int i, int i2) {
        ok7.M(i, i2, this.h);
        int i3 = this.g;
        return (upf) this.i.subList(i + i3, i2 + i3);
    }
}
