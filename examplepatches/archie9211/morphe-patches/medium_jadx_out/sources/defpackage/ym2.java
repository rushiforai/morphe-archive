package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ym2 implements f8a {
    public final int a;

    public ym2(int i) {
        this.a = i;
    }

    @Override // defpackage.g8a
    public final Object get() {
        int i = this.a;
        if (i == 0) {
            return new hjb();
        }
        if (i == 1) {
            return new ft8();
        }
        throw new AssertionError(i);
    }
}
