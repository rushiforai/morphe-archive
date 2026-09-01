package defpackage;

import java.io.Closeable;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e00 implements Closeable {
    public final c00 a;
    public final i32 b;
    public final se8 c;
    public final se8 d;
    public final ArrayList e;
    public final yl2 f;
    public final ArrayList g;
    public final boolean h = true;
    public final s44 i;
    public final Boolean j;
    public final he8 k;

    /* JADX WARN: Multi-variable type inference failed */
    public e00(c00 c00Var) {
        se8 t1fVar;
        this.a = c00Var;
        this.e = c00Var.c();
        this.f = c00Var.a.a();
        this.g = c00Var.i;
        int i = 1;
        this.i = c00Var.j;
        this.j = c00Var.k;
        Object[] objArr = 0;
        if (c00Var.l == null) {
            ygf.f("Apollo: 'serverUrl' is required");
            throw null;
        }
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        String str = c00Var.l;
        str.getClass();
        hf6 hf6Var = c00Var.m;
        hf6Var = hf6Var == null ? null : hf6Var;
        ArrayList arrayList3 = c00Var.g;
        arrayList.clear();
        arrayList.addAll(arrayList3);
        e1g e1gVar = new e1g(str);
        if (!arrayList2.isEmpty()) {
            arrayList.add(new ft5(i, arrayList2));
        }
        if (hf6Var == null) {
            tp8 tp8Var = (tp8) vp8.a.getValue();
            tp8Var.getClass();
            TimeUnit timeUnit = TimeUnit.MILLISECONDS;
            timeUnit.getClass();
            tp8Var.y = ggf.b(60000L, timeUnit);
            tp8Var.z = ggf.b(60000L, timeUnit);
            hf6Var = new hf6(new up8(tp8Var));
        }
        ms msVar = new ms();
        msVar.b = e1gVar;
        msVar.c = hf6Var;
        msVar.d = arrayList;
        msVar.a = false;
        msVar.e = new ft5(0, msVar);
        this.c = msVar;
        String str2 = c00Var.l;
        if (str2 == null) {
            t1fVar = msVar;
        } else {
            ArrayList arrayList4 = new ArrayList();
            lu luVar = new lu(str2, objArr == true ? 1 : 0, i);
            x50 x50Var = c00Var.n;
            x50 x50Var2 = x50Var != null ? x50Var : null;
            if (x50Var2 == null) {
                tp8 tp8Var2 = (tp8) vp8.a.getValue();
                tp8Var2.getClass();
                x50Var2 = new x50(new up8(tp8Var2));
            }
            t1fVar = new t1f(luVar, arrayList4, x50Var2, 60000L, new mya(10), null);
        }
        this.d = t1fVar;
        r13 r13Var = xg3.a;
        vz2 vz2Var = vz2.c;
        this.b = new i32(vz2Var, o7f.c(vz2Var));
        this.k = new he8(msVar, t1fVar);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        o7f.m(this.b.b, null);
        this.c.dispose();
        this.d.dispose();
    }
}
