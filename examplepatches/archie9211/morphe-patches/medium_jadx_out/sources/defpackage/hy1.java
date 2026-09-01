package defpackage;

import java.util.Collections;
import java.util.HashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hy1 {
    public String a = null;
    public final HashSet b;
    public final HashSet c;
    public int d;
    public int e;
    public dz1 f;
    public final HashSet g;

    public hy1(Class cls, Class... clsArr) {
        HashSet hashSet = new HashSet();
        this.b = hashSet;
        this.c = new HashSet();
        this.d = 0;
        this.e = 0;
        this.g = new HashSet();
        hashSet.add(rqa.a(cls));
        for (Class cls2 : clsArr) {
            aq7.l("Null interface", cls2);
            this.b.add(rqa.a(cls2));
        }
    }

    public final void a(s73 s73Var) {
        if (this.b.contains(s73Var.a)) {
            ay0.e("Components are not allowed to depend on interfaces they themselves provide.");
        } else {
            this.c.add(s73Var);
        }
    }

    public final iy1 b() {
        if (this.f != null) {
            return new iy1(this.a, new HashSet(this.b), new HashSet(this.c), this.d, this.e, this.f, this.g);
        }
        ygf.f("Missing required property: factory.");
        return null;
    }

    public final void c(int i) {
        if (this.d == 0) {
            this.d = i;
        } else {
            ygf.f("Instantiation type has already been set.");
        }
    }

    public hy1(rqa rqaVar, rqa... rqaVarArr) {
        HashSet hashSet = new HashSet();
        this.b = hashSet;
        this.c = new HashSet();
        this.d = 0;
        this.e = 0;
        this.g = new HashSet();
        hashSet.add(rqaVar);
        for (rqa rqaVar2 : rqaVarArr) {
            aq7.l("Null interface", rqaVar2);
        }
        Collections.addAll(this.b, rqaVarArr);
    }
}
