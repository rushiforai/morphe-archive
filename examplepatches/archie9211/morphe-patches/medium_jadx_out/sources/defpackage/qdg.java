package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qdg extends mk7 {
    @Override // defpackage.mk7
    public final void K(meg megVar, meg megVar2) {
        megVar.b = megVar2;
    }

    @Override // defpackage.mk7
    public final void L(meg megVar, Thread thread) {
        megVar.a = thread;
    }

    @Override // defpackage.mk7
    public final boolean N(ggg gggVar, k6g k6gVar, k6g k6gVar2) {
        synchronized (gggVar) {
            try {
                if (gggVar.b != k6gVar) {
                    return false;
                }
                gggVar.b = k6gVar2;
                return true;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    @Override // defpackage.mk7
    public final boolean O(ggg gggVar, Object obj, Object obj2) {
        synchronized (gggVar) {
            try {
                if (gggVar.a != obj) {
                    return false;
                }
                gggVar.a = obj2;
                return true;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    @Override // defpackage.mk7
    public final boolean P(ggg gggVar, meg megVar, meg megVar2) {
        synchronized (gggVar) {
            try {
                if (gggVar.c != megVar) {
                    return false;
                }
                gggVar.c = megVar2;
                return true;
            } catch (Throwable th) {
                throw th;
            }
        }
    }
}
