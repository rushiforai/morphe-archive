package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fyd implements gyd {
    public final Object a;
    public final boolean b;

    public fyd(Object obj, boolean z) {
        this.a = obj;
        this.b = z;
    }

    @Override // defpackage.gyd
    public final boolean a() {
        return this.b;
    }

    @Override // defpackage.upc
    public final Object getValue() {
        return this.a;
    }
}
