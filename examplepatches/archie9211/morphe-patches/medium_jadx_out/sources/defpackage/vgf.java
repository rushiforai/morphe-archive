package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vgf implements khf {
    public static final Object c = new Object();
    public volatile khf a;
    public volatile Object b;

    public static vgf a(khf khfVar) {
        if (khfVar instanceof vgf) {
            return (vgf) khfVar;
        }
        vgf vgfVar = new vgf();
        vgfVar.b = c;
        vgfVar.a = khfVar;
        return vgfVar;
    }

    @Override // defpackage.khf
    public final Object y() {
        Object objY;
        Object obj = this.b;
        Object obj2 = c;
        if (obj != obj2) {
            return obj;
        }
        synchronized (this) {
            try {
                objY = this.b;
                if (objY == obj2) {
                    objY = this.a.y();
                    Object obj3 = this.b;
                    if (obj3 != obj2 && obj3 != objY) {
                        throw new IllegalStateException("Scoped provider was invoked recursively returning different results: " + obj3 + " & " + objY + ". This is likely due to a circular dependency.");
                    }
                    this.b = objY;
                    this.a = null;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return objY;
    }
}
