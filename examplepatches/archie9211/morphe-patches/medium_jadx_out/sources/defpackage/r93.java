package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class r93 extends g0 {
    public final /* synthetic */ int c = 1;
    public final u67 d;
    public final /* synthetic */ f0 e;

    /* JADX WARN: Illegal instructions before constructor call */
    public r93(s93 s93Var) {
        this.e = s93Var;
        sj0 sj0Var = s93Var.l;
        super(((i93) sj0Var.a).a);
        x67 x67Var = ((i93) sj0Var.a).a;
        m93 m93Var = new m93(s93Var, 6);
        x67Var.getClass();
        this.d = new u67(x67Var, m93Var);
    }

    @Override // defpackage.g0, defpackage.zvd
    public final co1 a() {
        int i = this.c;
        f0 f0Var = this.e;
        switch (i) {
            case 0:
                return (s93) f0Var;
            default:
                return (cs6) f0Var;
        }
    }

    @Override // defpackage.zvd
    public final boolean c() {
        switch (this.c) {
        }
        return true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:103:0x024d  */
    /* JADX WARN: Removed duplicated region for block: B:104:0x0261  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x0264  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x0269  */
    /* JADX WARN: Removed duplicated region for block: B:111:0x0272  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x02a9  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0088  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0108  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x011b  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x01e1  */
    /* JADX WARN: Type inference failed for: r4v10, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r4v12, types: [java.util.Collection] */
    /* JADX WARN: Type inference failed for: r4v29 */
    @Override // defpackage.z2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.util.Collection f() throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 906
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.r93.f():java.util.Collection");
    }

    @Override // defpackage.zvd
    public final List getParameters() {
        switch (this.c) {
        }
        return (List) this.d.invoke();
    }

    @Override // defpackage.z2
    public final uob h() {
        switch (this.c) {
            case 0:
                break;
            default:
                Object obj = ((cs6) this.e).j.b;
                break;
        }
        return uob.h;
    }

    @Override // defpackage.g0
    /* JADX INFO: renamed from: m */
    public final y28 a() {
        int i = this.c;
        f0 f0Var = this.e;
        switch (i) {
            case 0:
                return (s93) f0Var;
            default:
                return (cs6) f0Var;
        }
    }

    public final String toString() {
        int i = this.c;
        f0 f0Var = this.e;
        switch (i) {
            case 0:
                String str = ((s93) f0Var).getName().a;
                str.getClass();
                return str;
            default:
                String strB = ((cs6) f0Var).getName().b();
                strB.getClass();
                return strB;
        }
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public r93(cs6 cs6Var) {
        this.e = cs6Var;
        n0c n0cVar = cs6Var.j;
        super(((k96) n0cVar.b).a);
        this.d = new u67(((k96) n0cVar.b).a, new bs6(cs6Var, 2));
    }
}
