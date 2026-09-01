package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o42 implements anb, y88 {
    public final anb a;
    public final y88 b;
    public ib2 c;
    public Throwable d;
    public final n42 e;

    public o42(anb anbVar) {
        a98 a98Var = new a98();
        anbVar.getClass();
        this.a = anbVar;
        this.b = a98Var;
        this.e = new n42(this);
    }

    @Override // defpackage.anb
    public final gnb B0(String str) {
        str.getClass();
        n42 n42Var = this.e;
        if (n42Var == null) {
            return this.a.B0(str);
        }
        Object objH = n42Var.h(str);
        objH.getClass();
        return new m42((gnb) objH);
    }

    @Override // java.lang.AutoCloseable
    public final void close() throws Exception {
        n42 n42Var = this.e;
        if (n42Var != null) {
            n42Var.n(-1);
        }
        this.a.close();
    }

    @Override // defpackage.y88
    public final void f(Object obj) {
        this.b.f(obj);
    }

    @Override // defpackage.anb
    public final boolean k0() {
        return this.a.k0();
    }

    @Override // defpackage.y88
    public final Object m(n92 n92Var, Object obj) {
        return this.b.m(n92Var, null);
    }

    public final void p(StringBuilder sb) {
        int i;
        if (this.c == null && this.d == null) {
            sb.append("\t\tStatus: Free connection");
            sb.append('\n');
        } else {
            sb.append("\t\tStatus: Acquired connection");
            sb.append('\n');
            ib2 ib2Var = this.c;
            if (ib2Var != null) {
                sb.append("\t\tCoroutine: " + ib2Var);
                sb.append('\n');
            }
            Throwable th = this.d;
            if (th != null) {
                sb.append("\t\tAcquired:");
                sb.append('\n');
                Iterator it2 = bu1.s0(muc.f0(kyd.h0(th)), 1).iterator();
                while (it2.hasNext()) {
                    sb.append("\t\t" + ((String) it2.next()));
                    sb.append('\n');
                }
            }
        }
        if (this.e != null) {
            StringBuilder sb2 = new StringBuilder("\t\tPrepared Statement Cache Size: ");
            n42 n42Var = this.e;
            synchronized (((uob) n42Var.g)) {
                i = n42Var.c;
            }
            sb2.append(i);
            sb.append(sb2.toString());
            sb.append('\n');
        }
    }

    public final String toString() {
        return this.a.toString();
    }
}
