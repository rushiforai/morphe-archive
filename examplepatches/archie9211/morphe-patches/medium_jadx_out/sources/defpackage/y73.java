package defpackage;

import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class y73 implements t73 {
    public final m3f d;
    public int f;
    public int g;
    public m3f a = null;
    public boolean b = false;
    public boolean c = false;
    public x73 e = x73.UNKNOWN;
    public int h = 1;
    public ye3 i = null;
    public boolean j = false;
    public final ArrayList k = new ArrayList();
    public final ArrayList l = new ArrayList();

    public y73(m3f m3fVar) {
        this.d = m3fVar;
    }

    @Override // defpackage.t73
    public final void a(t73 t73Var) {
        ArrayList<y73> arrayList = this.l;
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            if (!((y73) it2.next()).j) {
                return;
            }
        }
        this.c = true;
        m3f m3fVar = this.a;
        if (m3fVar != null) {
            m3fVar.a(this);
        }
        if (this.b) {
            this.d.a(this);
            return;
        }
        y73 y73Var = null;
        int i = 0;
        for (y73 y73Var2 : arrayList) {
            if (!(y73Var2 instanceof ye3)) {
                i++;
                y73Var = y73Var2;
            }
        }
        if (y73Var != null && i == 1 && y73Var.j) {
            ye3 ye3Var = this.i;
            if (ye3Var != null) {
                if (!ye3Var.j) {
                    return;
                } else {
                    this.f = this.h * ye3Var.g;
                }
            }
            d(y73Var.g + this.f);
        }
        m3f m3fVar2 = this.a;
        if (m3fVar2 != null) {
            m3fVar2.a(this);
        }
    }

    public final void b(m3f m3fVar) {
        this.k.add(m3fVar);
        if (this.j) {
            m3fVar.a(m3fVar);
        }
    }

    public final void c() {
        this.l.clear();
        this.k.clear();
        this.j = false;
        this.g = 0;
        this.c = false;
        this.b = false;
    }

    public void d(int i) {
        if (this.j) {
            return;
        }
        this.j = true;
        this.g = i;
        for (t73 t73Var : this.k) {
            t73Var.a(t73Var);
        }
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.d.b.j0);
        sb.append(":");
        sb.append(this.e);
        sb.append("(");
        sb.append(this.j ? Integer.valueOf(this.g) : "unresolved");
        sb.append(") <t=");
        sb.append(this.l.size());
        sb.append(":d=");
        sb.append(this.k.size());
        sb.append(">");
        return sb.toString();
    }
}
