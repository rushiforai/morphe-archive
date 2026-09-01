package defpackage;

import java.util.concurrent.atomic.AtomicReference;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xpc extends m2 implements bo4, f65, vpc, j78 {
    public static final /* synthetic */ long f = m80.a.objectFieldOffset(xpc.class.getDeclaredField("_state$volatile"));
    private volatile /* synthetic */ Object _state$volatile;
    public int e;

    public xpc(Object obj) {
        this._state$volatile = obj;
    }

    @Override // defpackage.j78, defpackage.do4
    public final Object a(Object obj, n92 n92Var) {
        l(obj);
        return c1e.a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:70:0x0082, code lost:
    
        if (r15 != r1) goto L33;
     */
    /* JADX WARN: Path cross not found for [B:41:0x009a, B:43:0x00a0], limit reached: 70 */
    /* JADX WARN: Path cross not found for [B:43:0x00a0, B:41:0x009a], limit reached: 70 */
    /* JADX WARN: Path cross not found for [B:43:0x00a0, B:51:0x00bb], limit reached: 70 */
    /* JADX WARN: Path cross not found for [B:63:0x00ff, B:64:0x0100], limit reached: 70 */
    /* JADX WARN: Removed duplicated region for block: B:35:0x008c A[Catch: all -> 0x0036, TryCatch #0 {all -> 0x0036, blocks: (B:14:0x0032, B:33:0x0082, B:35:0x008c, B:38:0x0093, B:39:0x0097, B:41:0x009a, B:51:0x00bb, B:54:0x00cb, B:55:0x00e7, B:61:0x00f7, B:58:0x00ee, B:60:0x00f4, B:43:0x00a0, B:47:0x00a7, B:21:0x0047, B:24:0x0050, B:32:0x0073, B:27:0x005e, B:29:0x0062), top: B:68:0x0022 }] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x009a A[Catch: all -> 0x0036, TryCatch #0 {all -> 0x0036, blocks: (B:14:0x0032, B:33:0x0082, B:35:0x008c, B:38:0x0093, B:39:0x0097, B:41:0x009a, B:51:0x00bb, B:54:0x00cb, B:55:0x00e7, B:61:0x00f7, B:58:0x00ee, B:60:0x00f4, B:43:0x00a0, B:47:0x00a7, B:21:0x0047, B:24:0x0050, B:32:0x0073, B:27:0x005e, B:29:0x0062), top: B:68:0x0022 }] */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00a6  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00ba  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00ca  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00cb A[Catch: all -> 0x0036, TryCatch #0 {all -> 0x0036, blocks: (B:14:0x0032, B:33:0x0082, B:35:0x008c, B:38:0x0093, B:39:0x0097, B:41:0x009a, B:51:0x00bb, B:54:0x00cb, B:55:0x00e7, B:61:0x00f7, B:58:0x00ee, B:60:0x00f4, B:43:0x00a0, B:47:0x00a7, B:21:0x0047, B:24:0x0050, B:32:0x0073, B:27:0x005e, B:29:0x0062), top: B:68:0x0022 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:53:0x00ca -> B:33:0x0082). Please report as a decompilation issue!!! */
    @Override // defpackage.bo4
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.do4 r14, defpackage.n92 r15) {
        /*
            Method dump skipped, instruction units count: 263
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xpc.b(do4, n92):java.lang.Object");
    }

    @Override // defpackage.f65
    public final bo4 c(ib2 ib2Var, int i, nz0 nz0Var) {
        return (((i < 0 || i >= 2) && i != -2) || nz0Var != nz0.DROP_OLDEST) ? k40.Y(this, ib2Var, i, nz0Var) : this;
    }

    @Override // defpackage.m2
    public final n2 e() {
        return new ypc();
    }

    @Override // defpackage.m2
    public final n2[] f() {
        return new ypc[2];
    }

    @Override // defpackage.j78
    public final void g() {
        throw new UnsupportedOperationException("MutableStateFlow.resetReplayCache is not supported");
    }

    @Override // defpackage.vpc
    public final Object getValue() {
        d1g d1gVar = flb.i;
        Object objectVolatile = m80.a.getObjectVolatile(this, f);
        if (objectVolatile == d1gVar) {
            return null;
        }
        return objectVolatile;
    }

    @Override // defpackage.j78
    public final boolean h(Object obj) {
        l(obj);
        return true;
    }

    public final boolean k(Object obj, Object obj2) {
        d1g d1gVar = flb.i;
        if (obj == null) {
            obj = d1gVar;
        }
        if (obj2 == null) {
            obj2 = d1gVar;
        }
        return m(obj, obj2);
    }

    public final void l(Object obj) {
        if (obj == null) {
            obj = flb.i;
        }
        m(null, obj);
    }

    public final boolean m(Object obj, Object obj2) {
        int i;
        n2[] n2VarArr;
        d1g d1gVar;
        synchronized (this) {
            Unsafe unsafe = m80.a;
            long j = f;
            Object objectVolatile = unsafe.getObjectVolatile(this, j);
            if (obj != null && !g76.L(objectVolatile, obj)) {
                return false;
            }
            if (g76.L(objectVolatile, obj2)) {
                return true;
            }
            unsafe.putObjectVolatile(this, j, obj2);
            int i2 = this.e;
            if ((i2 & 1) != 0) {
                this.e = i2 + 2;
                return true;
            }
            int i3 = i2 + 1;
            this.e = i3;
            n2[] n2VarArr2 = this.a;
            while (true) {
                ypc[] ypcVarArr = (ypc[]) n2VarArr2;
                if (ypcVarArr != null) {
                    for (ypc ypcVar : ypcVarArr) {
                        if (ypcVar != null) {
                            AtomicReference atomicReference = ypcVar.a;
                            while (true) {
                                Object obj3 = atomicReference.get();
                                if (obj3 != null && obj3 != (d1gVar = vv2.l)) {
                                    d1g d1gVar2 = vv2.k;
                                    if (obj3 != d1gVar2) {
                                        while (!atomicReference.compareAndSet(obj3, d1gVar2)) {
                                            if (atomicReference.get() != obj3) {
                                                break;
                                            }
                                        }
                                        ((x51) obj3).resumeWith(c1e.a);
                                        break;
                                    }
                                    while (!atomicReference.compareAndSet(obj3, d1gVar)) {
                                        if (atomicReference.get() != obj3) {
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                synchronized (this) {
                    i = this.e;
                    if (i == i3) {
                        this.e = i3 + 1;
                        return true;
                    }
                    n2VarArr = this.a;
                }
                n2VarArr2 = n2VarArr;
                i3 = i;
            }
        }
    }
}
