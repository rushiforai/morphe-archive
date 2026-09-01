package defpackage;

import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class l04 extends fv7 {
    public final r67 b;
    public final r67 c;
    public final u67 d;
    public final /* synthetic */ m04 e;

    public l04(m04 m04Var, x67 x67Var) {
        int i = 0;
        if (x67Var == null) {
            h(0);
            throw null;
        }
        this.e = m04Var;
        this.b = x67Var.b(new k04(this, i));
        this.c = x67Var.b(new k04(this, 1));
        this.d = new u67(x67Var, new v2(13, this));
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static /* synthetic */ void h(int r13) {
        /*
            Method dump skipped, instruction units count: 346
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.l04.h(int):void");
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Collection a(n98 n98Var, ng8 ng8Var) {
        if (n98Var == null) {
            h(5);
            throw null;
        }
        if (ng8Var != null) {
            return (Collection) this.b.invoke(n98Var);
        }
        h(6);
        throw null;
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Set b() {
        Set set = (Set) this.e.i.invoke();
        if (set != null) {
            return set;
        }
        h(17);
        throw null;
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Set c() {
        Set set = Collections.EMPTY_SET;
        if (set != null) {
            return set;
        }
        h(18);
        throw null;
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Collection e(p83 p83Var, x45 x45Var) {
        if (p83Var == null) {
            h(13);
            throw null;
        }
        Collection collection = (Collection) this.d.invoke();
        if (collection != null) {
            return collection;
        }
        h(15);
        throw null;
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Collection f(n98 n98Var, ng8 ng8Var) {
        if (n98Var == null) {
            h(1);
            throw null;
        }
        if (ng8Var != null) {
            return (Collection) this.c.invoke(n98Var);
        }
        h(2);
        throw null;
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Set g() {
        Set set = (Set) this.e.i.invoke();
        if (set != null) {
            return set;
        }
        h(19);
        throw null;
    }

    public final ev7 i() {
        ev7 ev7VarH = ((mn6) ((z2) this.e.n()).b().iterator().next()).H();
        if (ev7VarH != null) {
            return ev7VarH;
        }
        h(9);
        throw null;
    }

    public final LinkedHashSet j(n98 n98Var, Collection collection) {
        if (collection == null) {
            h(11);
            throw null;
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        cx8.c.h(n98Var, collection, Collections.EMPTY_SET, this.e, new p93(linkedHashSet, 1));
        return linkedHashSet;
    }
}
