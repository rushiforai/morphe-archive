package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a5a {
    public final ArrayList a = new ArrayList();
    public final l6d b;
    public b36 c;
    public b36 d;
    public int e;
    public boolean f;

    public a5a(l6d l6dVar, ArrayList arrayList) {
        b36 b36Var = b36.e;
        this.c = b36Var;
        this.d = b36Var;
        a(arrayList, false);
        a(arrayList, true);
        ArrayList arrayList2 = l6dVar.b;
        if (!arrayList2.contains(this)) {
            arrayList2.add(this);
            b36 b36Var2 = l6dVar.c;
            b36 b36Var3 = l6dVar.d;
            this.c = b36Var2;
            this.d = b36Var3;
            c();
            b(l6dVar.e);
        }
        this.b = l6dVar;
    }

    public final void a(List list, boolean z) {
        int size = list.size();
        for (int i = 0; i < size; i++) {
            ev1 ev1Var = (ev1) list.get(i);
            ev1Var.getClass();
            if (true == z) {
                a5a a5aVar = ev1Var.c;
                if (a5aVar != null) {
                    throw new IllegalStateException(ev1Var + " (" + (i + 1) + "/" + size + ") is already controlled by " + a5aVar + " but is still added to " + this);
                }
                ev1Var.c = this;
                this.a.add(ev1Var);
            }
        }
    }

    public final void b(int i) {
        ArrayList arrayList = this.a;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            ev1 ev1Var = (ev1) arrayList.get(size);
            if (!ev1Var.d && ev1Var.e != i) {
                ev1Var.e = i;
                throw null;
            }
        }
    }

    public final void c() {
        ArrayList arrayList = this.a;
        int size = arrayList.size() - 1;
        if (size < 0) {
            return;
        }
        ev1 ev1Var = (ev1) arrayList.get(size);
        b36 b36Var = this.c;
        b36 b36Var2 = this.d;
        ev1Var.a = b36Var;
        ev1Var.b = b36Var2;
        throw null;
    }
}
