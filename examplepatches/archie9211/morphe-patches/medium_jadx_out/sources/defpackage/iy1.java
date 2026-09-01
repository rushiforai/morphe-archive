package defpackage;

import j$.util.DesugarCollections;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iy1 {
    public final String a;
    public final Set b;
    public final Set c;
    public final int d;
    public final int e;
    public final dz1 f;
    public final Set g;

    public iy1(String str, Set set, Set set2, int i, int i2, dz1 dz1Var, Set set3) {
        this.a = str;
        this.b = DesugarCollections.unmodifiableSet(set);
        this.c = DesugarCollections.unmodifiableSet(set2);
        this.d = i;
        this.e = i2;
        this.f = dz1Var;
        this.g = DesugarCollections.unmodifiableSet(set3);
    }

    public static hy1 a(rqa rqaVar) {
        return new hy1(rqaVar, new rqa[0]);
    }

    public static hy1 b(Class cls) {
        return new hy1(cls, new Class[0]);
    }

    public static iy1 c(Object obj, Class cls, Class... clsArr) {
        HashSet hashSet = new HashSet();
        HashSet hashSet2 = new HashSet();
        HashSet hashSet3 = new HashSet();
        hashSet.add(rqa.a(cls));
        for (Class cls2 : clsArr) {
            aq7.l("Null interface", cls2);
            hashSet.add(rqa.a(cls2));
        }
        return new iy1(null, new HashSet(hashSet), new HashSet(hashSet2), 0, 0, new gy1(1, obj), hashSet3);
    }

    public final String toString() {
        return "Component<" + Arrays.toString(this.b.toArray()) + ">{" + this.d + ", type=" + this.e + ", deps=" + Arrays.toString(this.c.toArray()) + "}";
    }
}
