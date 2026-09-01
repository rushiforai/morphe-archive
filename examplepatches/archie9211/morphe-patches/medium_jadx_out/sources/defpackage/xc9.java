package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xc9 extends wc9 {
    public final Object c;

    public xc9() {
        super(12);
        this.c = new Object();
    }

    @Override // defpackage.wc9
    public final Object a() {
        Object objA;
        synchronized (this.c) {
            objA = super.a();
        }
        return objA;
    }

    @Override // defpackage.wc9
    public final boolean c(Object obj) {
        boolean zC;
        synchronized (this.c) {
            zC = super.c(obj);
        }
        return zC;
    }
}
