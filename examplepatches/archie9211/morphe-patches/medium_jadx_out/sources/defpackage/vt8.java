package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vt8 extends x7f {
    @Override // defpackage.x7f
    public final y7f b() {
        if (!this.a || !this.c.j.d) {
            return new wt8(this.b, this.c, this.d);
        }
        ay0.e("Cannot set backoff criteria on an idle mode job");
        return null;
    }

    @Override // defpackage.x7f
    public final x7f c() {
        return this;
    }
}
