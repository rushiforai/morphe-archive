package defpackage;

import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class fv7 implements ev7 {
    @Override // defpackage.ev7
    public Collection a(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        return ey3.a;
    }

    @Override // defpackage.ev7
    public Set b() {
        Collection collectionE = e(p83.p, xx.D);
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        for (Object obj : collectionE) {
            if (obj instanceof bec) {
                n98 name = ((bec) obj).getName();
                name.getClass();
                linkedHashSet.add(name);
            }
        }
        return linkedHashSet;
    }

    @Override // defpackage.ev7
    public Set c() {
        return null;
    }

    @Override // defpackage.ev7
    public co1 d(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        return null;
    }

    @Override // defpackage.ev7
    public Collection e(p83 p83Var, x45 x45Var) {
        p83Var.getClass();
        return ey3.a;
    }

    @Override // defpackage.ev7
    public Collection f(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        return ey3.a;
    }

    @Override // defpackage.ev7
    public Set g() {
        Collection collectionE = e(p83.q, xx.D);
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        for (Object obj : collectionE) {
            if (obj instanceof bec) {
                n98 name = ((bec) obj).getName();
                name.getClass();
                linkedHashSet.add(name);
            }
        }
        return linkedHashSet;
    }
}
