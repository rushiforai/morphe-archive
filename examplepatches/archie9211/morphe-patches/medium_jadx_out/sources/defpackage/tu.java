package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tu implements xu {
    public final qu a;
    public final qu b;

    public tu(qu quVar, qu quVar2) {
        this.a = quVar;
        this.b = quVar2;
    }

    @Override // defpackage.xu
    public final List a0() {
        throw new UnsupportedOperationException("Cannot call getKeyframes on AnimatableSplitDimensionPathValue.");
    }

    @Override // defpackage.xu
    public final boolean b0() {
        return this.a.b0() && this.b.b0();
    }

    @Override // defpackage.xu
    public final rn0 w() {
        return new qlc(this.a.w(), this.b.w());
    }
}
