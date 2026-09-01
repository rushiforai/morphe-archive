package defpackage;

import android.graphics.Path;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r3c implements l59, nn0, v72 {
    public final boolean b;
    public final rc7 c;
    public final a4c d;
    public boolean e;
    public final Path a = new Path();
    public final ru f = new ru(2);

    public r3c(rc7 rc7Var, tn0 tn0Var, k4c k4cVar) {
        this.b = k4cVar.d;
        this.c = rc7Var;
        a4c a4cVar = new a4c((List) k4cVar.c.b);
        this.d = a4cVar;
        tn0Var.d(a4cVar);
        a4cVar.a(this);
    }

    @Override // defpackage.nn0
    public final void a() {
        this.e = false;
        this.c.invalidateSelf();
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0029  */
    @Override // defpackage.v72
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void b(java.util.List r6, java.util.List r7) {
        /*
            r5 = this;
            r7 = 0
            r0 = 0
        L2:
            r1 = r6
            java.util.ArrayList r1 = (java.util.ArrayList) r1
            int r2 = r1.size()
            if (r0 >= r2) goto L41
            java.lang.Object r1 = r1.get(r0)
            v72 r1 = (defpackage.v72) r1
            boolean r2 = r1 instanceof defpackage.ntd
            if (r2 == 0) goto L29
            r2 = r1
            ntd r2 = (defpackage.ntd) r2
            s4c r3 = r2.c
            s4c r4 = defpackage.s4c.SIMULTANEOUSLY
            if (r3 != r4) goto L29
            ru r1 = r5.f
            java.util.ArrayList r1 = r1.b
            r1.add(r2)
            r2.d(r5)
            goto L3e
        L29:
            boolean r2 = r1 instanceof defpackage.emb
            if (r2 == 0) goto L3e
            if (r7 != 0) goto L34
            java.util.ArrayList r7 = new java.util.ArrayList
            r7.<init>()
        L34:
            emb r1 = (defpackage.emb) r1
            rn0 r2 = r1.b
            r2.a(r5)
            r7.add(r1)
        L3e:
            int r0 = r0 + 1
            goto L2
        L41:
            a4c r5 = r5.d
            r5.j = r7
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.r3c.b(java.util.List, java.util.List):void");
    }

    @Override // defpackage.l59
    public final Path h() {
        boolean z = this.e;
        a4c a4cVar = this.d;
        Path path = this.a;
        if (z) {
            a4cVar.getClass();
            return path;
        }
        path.reset();
        if (this.b) {
            this.e = true;
            return path;
        }
        Path path2 = (Path) a4cVar.d();
        if (path2 == null) {
            return path;
        }
        path.set(path2);
        path.setFillType(Path.FillType.EVEN_ODD);
        this.f.e(path);
        this.e = true;
        return path;
    }
}
