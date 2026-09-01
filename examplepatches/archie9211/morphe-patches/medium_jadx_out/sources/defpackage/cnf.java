package defpackage;

import com.google.android.recaptcha.internal.zzagd;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.RandomAccess;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class cnf implements Cloneable {
    public final fnf a;
    public fnf b;

    public cnf(fnf fnfVar) {
        this.a = fnfVar;
        if (fnfVar.u()) {
            ay0.e("Default instance must be immutable.");
            throw null;
        }
        this.b = fnfVar.g();
    }

    public static void a(int i, List list) {
        int size = list.size() - i;
        StringBuilder sb = new StringBuilder(String.valueOf(size).length() + 26);
        sb.append("Element at index ");
        sb.append(size);
        sb.append(" is null.");
        String string = sb.toString();
        int size2 = list.size();
        while (true) {
            size2--;
            if (size2 < i) {
                throw new NullPointerException(string);
            }
            list.remove(size2);
        }
    }

    public static void b(List list, List list2) {
        if (list instanceof nof) {
            list2.addAll(list);
            return;
        }
        int size = list.size();
        if (list2 instanceof ArrayList) {
            ((ArrayList) list2).ensureCapacity(list2.size() + size);
        } else if (list2 instanceof qof) {
            qof qofVar = (qof) list2;
            int i = qofVar.c + size;
            int length = qofVar.b.length;
            if (i > length) {
                if (length != 0) {
                    while (length < i) {
                        length = wgd.n(length, 3, 2, 1, 10);
                    }
                    qofVar.b = Arrays.copyOf(qofVar.b, length);
                } else {
                    qofVar.b = new Object[Math.max(i, 10)];
                }
            }
        }
        int size2 = list2.size();
        if (!(list instanceof RandomAccess)) {
            for (Object obj : list) {
                if (obj == null) {
                    a(size2, list2);
                    throw null;
                }
                list2.add(obj);
            }
            return;
        }
        int size3 = list.size();
        for (int i2 = 0; i2 < size3; i2++) {
            Object obj2 = list.get(i2);
            if (obj2 == null) {
                a(size2, list2);
                throw null;
            }
            list2.add(obj2);
        }
    }

    public final void c() {
        if (this.b.u()) {
            return;
        }
        d();
    }

    public final Object clone() {
        cnf cnfVar = (cnf) this.a.t(5);
        boolean zU = this.b.u();
        fnf fnfVar = this.b;
        if (zU) {
            fnfVar.getClass();
            pof.c.a(fnfVar.getClass()).a(fnfVar);
            fnfVar.f();
            fnfVar = this.b;
        }
        cnfVar.b = fnfVar;
        return cnfVar;
    }

    public final void d() {
        fnf fnfVarG = this.a.g();
        pof.c.a(fnfVarG.getClass()).c(fnfVarG, this.b);
        this.b = fnfVarG;
    }

    public final fnf e() {
        boolean zU = this.b.u();
        fnf fnfVar = this.b;
        if (zU) {
            fnfVar.getClass();
            pof.c.a(fnfVar.getClass()).a(fnfVar);
            fnfVar.f();
            fnfVar = this.b;
        }
        fnfVar.getClass();
        if (fnf.q(fnfVar, true)) {
            return fnfVar;
        }
        throw new zzagd();
    }

    public final void g(fnf fnfVar) {
        if (this.a.equals(fnfVar)) {
            return;
        }
        if (!this.b.u()) {
            d();
        }
        fnf fnfVar2 = this.b;
        pof.c.a(fnfVar2.getClass()).c(fnfVar2, fnfVar);
    }
}
