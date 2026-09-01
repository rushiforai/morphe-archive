package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wv6 implements ht6 {
    public final pw6 a;

    public wv6(pw6 pw6Var) {
        this.a = pw6Var;
    }

    @Override // defpackage.ht6
    public final int a() {
        return this.a.g().l;
    }

    @Override // defpackage.ht6
    public final int b() {
        return ((lw6) bu1.H0(this.a.g().m)).a;
    }

    @Override // defpackage.ht6
    public final int c() {
        int i;
        pw6 pw6Var = this.a;
        int size = 0;
        if (pw6Var.g().m.isEmpty()) {
            return 0;
        }
        jw6 jw6VarG = pw6Var.g();
        jw6 jw6Var = kw6.a;
        hw8 hw8Var = jw6VarG.u;
        hw8 hw8Var2 = hw8.Vertical;
        long j = jw6VarG.n;
        int i2 = (int) (hw8Var == hw8Var2 ? j & 4294967295L : j >> 32);
        jw6 jw6VarG2 = pw6Var.g();
        List list = jw6VarG2.m;
        if (!list.isEmpty()) {
            int size2 = list.size();
            int i3 = 0;
            while (size < size2) {
                lw6 lw6Var = (lw6) list.get(size);
                i3 += (int) (jw6VarG2.u == hw8.Vertical ? lw6Var.s & 4294967295L : lw6Var.s >> 32);
                size++;
            }
            size = (i3 / list.size()) + jw6VarG2.s;
        }
        if (size != 0 && (i = i2 / size) >= 1) {
            return i;
        }
        return 1;
    }

    @Override // defpackage.ht6
    public final boolean d() {
        return !this.a.g().m.isEmpty();
    }

    @Override // defpackage.ht6
    public final int e() {
        return ((h49) this.a.c.d).g();
    }
}
