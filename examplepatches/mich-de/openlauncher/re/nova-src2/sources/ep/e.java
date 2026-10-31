package ep;

import b.u4;
import cp.a0;
import cp.z;
import java.lang.reflect.Modifier;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes4.dex */
public final class e implements a0, Cloneable {

    /* renamed from: c, reason: collision with root package name */
    public static final e f52864c;

    /* renamed from: a, reason: collision with root package name */
    public List f52865a;

    /* renamed from: b, reason: collision with root package name */
    public List f52866b;

    static {
        e eVar = new e();
        List list = Collections.EMPTY_LIST;
        eVar.f52865a = list;
        eVar.f52866b = list;
        f52864c = eVar;
    }

    @Override // cp.a0
    public final z a(cp.m mVar, jp.a aVar) {
        Class cls = aVar.f69629a;
        boolean zC = c(cls, true);
        boolean zC2 = c(cls, false);
        if (zC || zC2) {
            return new d(this, zC2, zC, mVar, aVar);
        }
        return null;
    }

    public final boolean c(Class cls, boolean z11) {
        if (!z11 && !Enum.class.isAssignableFrom(cls)) {
            g90.k kVar = hp.c.f59955a;
            if (!Modifier.isStatic(cls.getModifiers()) && (cls.isAnonymousClass() || cls.isLocalClass())) {
                return true;
            }
        }
        Iterator it = (z11 ? this.f52865a : this.f52866b).iterator();
        if (it.hasNext()) {
            throw u4.e(it);
        }
        return false;
    }

    public final Object clone() {
        try {
            return (e) super.clone();
        } catch (CloneNotSupportedException e3) {
            throw new AssertionError(e3);
        }
    }
}
