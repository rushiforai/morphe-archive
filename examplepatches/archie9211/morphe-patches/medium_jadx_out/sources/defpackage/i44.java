package defpackage;

import java.lang.reflect.Modifier;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i44 implements kud, Cloneable {
    public static final i44 c = new i44();
    public final List a;
    public final List b;

    public i44() {
        List list = Collections.EMPTY_LIST;
        this.a = list;
        this.b = list;
    }

    @Override // defpackage.kud
    public final jud a(ch5 ch5Var, kxd kxdVar) {
        Class clsC = kxdVar.c();
        boolean zB = b(clsC, true);
        boolean zB2 = b(clsC, false);
        if (zB || zB2) {
            return new h44(this, zB2, zB, ch5Var, kxdVar);
        }
        return null;
    }

    public final boolean b(Class cls, boolean z) {
        if (!z && !Enum.class.isAssignableFrom(cls)) {
            to7 to7Var = w1b.a;
            if (!Modifier.isStatic(cls.getModifiers()) && (cls.isAnonymousClass() || cls.isLocalClass())) {
                return true;
            }
        }
        Iterator it2 = (z ? this.a : this.b).iterator();
        if (it2.hasNext()) {
            throw ev6.q(it2);
        }
        return false;
    }

    public final Object clone() {
        try {
            return (i44) super.clone();
        } catch (CloneNotSupportedException e) {
            ay0.d(e);
            return null;
        }
    }
}
