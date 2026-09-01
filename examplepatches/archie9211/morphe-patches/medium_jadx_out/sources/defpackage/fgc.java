package defpackage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fgc implements n22, Iterable, th6 {
    public int b;
    public int d;
    public int e;
    public boolean g;
    public int h;
    public HashMap j;
    public k68 k;
    public int[] a = new int[0];
    public Object[] c = new Object[0];
    public final Object f = new Object();
    public ArrayList i = new ArrayList();

    public final int d(k65 k65Var) {
        if (this.g) {
            b22.a("Use active SlotWriter to determine anchor location instead");
        }
        if (!k65Var.a()) {
            xx9.a("Anchor refers to a group that was removed");
        }
        return k65Var.a;
    }

    public final void f() {
        this.j = new HashMap();
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new yg5(this, 0, this.b);
    }

    public final egc m() {
        if (this.g) {
            ygf.f("Cannot read while a writer is pending");
            return null;
        }
        this.e++;
        return new egc(this);
    }

    public final igc p() {
        if (this.g) {
            b22.a("Cannot start a writer when another writer is pending");
        }
        if (this.e > 0) {
            b22.a("Cannot start a writer when a reader is pending");
        }
        this.g = true;
        this.h++;
        return new igc(this);
    }

    public final boolean q(k65 k65Var) {
        int iC;
        return k65Var.a() && (iC = hgc.c(this.i, k65Var.a, this.b)) >= 0 && g76.L(this.i.get(iC), k65Var);
    }

    public final r65 r(int i) {
        int i2;
        ArrayList arrayList;
        int iC;
        HashMap map = this.j;
        if (map != null) {
            if (this.g) {
                b22.a("use active SlotWriter to crate an anchor for location instead");
            }
            k65 k65Var = (i < 0 || i >= (i2 = this.b) || (iC = hgc.c((arrayList = this.i), i, i2)) < 0) ? null : (k65) arrayList.get(iC);
            if (k65Var != null) {
                return (r65) map.get(k65Var);
            }
        }
        return null;
    }
}
