package j$.util.stream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class c5 extends d5 {
    @Override // j$.util.stream.a
    public final boolean M() {
        return false;
    }

    @Override // j$.util.stream.g
    public final g unordered() {
        return !y6.ORDERED.k(this.f) ? this : new z4(this, y6.r);
    }
}
