package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xqd extends rh8 {
    public final uz0 f;
    public enc g;

    public xqd(vsb vsbVar, lz1 lz1Var, m73 m73Var) {
        super(vsbVar, lz1Var, m73Var);
        this.f = pwd.e(Integer.MAX_VALUE, 6, null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static vqd e(uz0 uz0Var) {
        vqd vqdVar = null;
        nzb nzbVarF = vn7.F(new i05(new l48(uz0Var, 1), 0 == true ? 1 : 0, 2));
        while (nzbVarF.hasNext()) {
            vqd vqdVarA = (vqd) nzbVarF.next();
            if (vqdVar != null) {
                vqdVarA = vqdVar.a(vqdVarA);
            }
            vqdVar = vqdVarA;
        }
        return vqdVar;
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x00d6, code lost:
    
        if (r16.b.invoke(r0, r6) == r7) goto L25;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(defpackage.vsb r17, defpackage.vqd r18, defpackage.p92 r19) {
        /*
            Method dump skipped, instruction units count: 220
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xqd.c(vsb, vqd, p92):java.lang.Object");
    }

    public final boolean d(lb9 lb9Var) {
        boolean z;
        boolean z2;
        boolean z3;
        uz0 uz0Var;
        vsb vsbVar;
        rb9 rb9Var = (rb9) bu1.z0(lb9Var.a);
        if (rb9Var != null) {
            List list = rb9Var.m;
            if (list == null) {
                list = ey3.a;
            }
            int size = list.size();
            int i = 0;
            z3 = false;
            while (true) {
                uz0Var = this.f;
                vsbVar = this.a;
                if (i >= size) {
                    break;
                }
                un5 un5Var = (un5) list.get(i);
                long j = un5Var.d ^ (-9223372034707292160L);
                if (!(vsbVar.i(vsbVar.e(j)) == 0.0f)) {
                    z3 = !(uz0Var.e(new vqd(j, un5Var.a, false)) instanceof jk1) || z3;
                }
                i++;
            }
            z = true;
            z2 = false;
            long j2 = rb9Var.l ^ (-9223372034707292160L);
            boolean z4 = lb9Var.f == 12;
            if (!(vsbVar.i(vsbVar.e(j2)) == 0.0f) || z4) {
                if (!(uz0Var.e(new vqd(j2, rb9Var.b, z4)) instanceof jk1) || z3) {
                    z3 = true;
                }
            }
            return (!z3 || this.d) ? z : z2;
        }
        z = true;
        z2 = false;
        z3 = z2;
        if (z3) {
        }
    }
}
