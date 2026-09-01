package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kx3 implements jx3 {
    public final int a;
    public int b = -1;
    public int c = -1;

    public kx3(int i) {
        this.a = i;
    }

    @Override // defpackage.jx3
    public final boolean i(CharSequence charSequence, int i, int i2, byd bydVar) {
        int i3 = this.a;
        if (i > i3 || i3 >= i2) {
            return i2 <= i3;
        }
        this.b = i;
        this.c = i2;
        return false;
    }

    @Override // defpackage.jx3
    public final Object d() {
        return this;
    }
}
