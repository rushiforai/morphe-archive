package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e5f extends d5f {
    @Override // defpackage.c5f, defpackage.rr7
    public final boolean A() {
        return (this.d.getSystemBarsAppearance() & 8) != 0;
    }

    @Override // defpackage.c5f, defpackage.rr7
    public final void B(boolean z) {
        this.d.setSystemBarsAppearance(z ? 16 : 0, 16);
    }

    @Override // defpackage.c5f, defpackage.rr7
    public final void C(boolean z) {
        this.d.setSystemBarsAppearance(z ? 8 : 0, 8);
    }
}
