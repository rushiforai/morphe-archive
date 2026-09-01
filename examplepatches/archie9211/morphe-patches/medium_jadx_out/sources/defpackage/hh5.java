package defpackage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicLongArray;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hh5 extends jud {
    public final /* synthetic */ int a;
    public final jud b;

    public /* synthetic */ hh5(jud judVar, int i) {
        this.a = i;
        this.b = judVar;
    }

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        int i = this.a;
        jud judVar = this.b;
        switch (i) {
            case 0:
                gd6Var.getClass();
                ArrayList arrayList = new ArrayList();
                gd6Var.f();
                while (gd6Var.hasNext()) {
                    arrayList.add(judVar.b(gd6Var));
                }
                gd6Var.D();
                return bu1.v0(arrayList);
            case 1:
                gd6Var.getClass();
                return judVar.b(gd6Var);
            case 2:
                ArrayList arrayList2 = new ArrayList();
                gd6Var.f();
                while (gd6Var.hasNext()) {
                    arrayList2.add(Long.valueOf(((Number) judVar.b(gd6Var)).longValue()));
                }
                gd6Var.D();
                int size = arrayList2.size();
                AtomicLongArray atomicLongArray = new AtomicLongArray(size);
                for (int i2 = 0; i2 < size; i2++) {
                    atomicLongArray.set(i2, ((Long) arrayList2.get(i2)).longValue());
                }
                return atomicLongArray;
            default:
                return new AtomicLong(((Number) judVar.b(gd6Var)).longValue());
        }
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        int i = this.a;
        jud judVar = this.b;
        switch (i) {
            case 0:
                List list = (List) obj;
                yd6Var.getClass();
                if (list == null) {
                    return;
                }
                yd6Var.m();
                Iterator it2 = list.iterator();
                while (it2.hasNext()) {
                    judVar.c(yd6Var, it2.next());
                }
                yd6Var.D();
                return;
            case 1:
                yd6Var.getClass();
                boolean z = yd6Var.k;
                yd6Var.k = true;
                try {
                    judVar.c(yd6Var, obj);
                    return;
                } finally {
                    yd6Var.k = z;
                }
            case 2:
                AtomicLongArray atomicLongArray = (AtomicLongArray) obj;
                yd6Var.m();
                int length = atomicLongArray.length();
                for (int i2 = 0; i2 < length; i2++) {
                    judVar.c(yd6Var, Long.valueOf(atomicLongArray.get(i2)));
                }
                yd6Var.D();
                return;
            default:
                judVar.c(yd6Var, Long.valueOf(((AtomicLong) obj).get()));
                return;
        }
    }
}
