package bm;

import ab.e0;
import b00.z0;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final String f18063a;

    /* renamed from: b, reason: collision with root package name */
    public final Set f18064b;

    /* renamed from: c, reason: collision with root package name */
    public final Set f18065c;

    /* renamed from: d, reason: collision with root package name */
    public final int f18066d;

    /* renamed from: e, reason: collision with root package name */
    public final int f18067e;

    /* renamed from: f, reason: collision with root package name */
    public final e f18068f;

    /* renamed from: g, reason: collision with root package name */
    public final Set f18069g;

    public b(String str, Set set, Set set2, int i5, int i11, e eVar, Set set3) {
        this.f18063a = str;
        this.f18064b = Collections.unmodifiableSet(set);
        this.f18065c = Collections.unmodifiableSet(set2);
        this.f18066d = i5;
        this.f18067e = i11;
        this.f18068f = eVar;
        this.f18069g = Collections.unmodifiableSet(set3);
    }

    public static a a(r rVar) {
        return new a(rVar, new r[0]);
    }

    public static a b(Class cls) {
        return new a(cls, new Class[0]);
    }

    public static b c(Object obj, Class cls, Class... clsArr) {
        HashSet hashSet = new HashSet();
        HashSet hashSet2 = new HashSet();
        HashSet hashSet3 = new HashSet();
        hashSet.add(r.a(cls));
        for (Class cls2 : clsArr) {
            e0.q(cls2, "Null interface");
            hashSet.add(r.a(cls2));
        }
        return new b(null, new HashSet(hashSet), new HashSet(hashSet2), 0, 0, new z0(obj, 1), hashSet3);
    }

    public final String toString() {
        return "Component<" + Arrays.toString(this.f18064b.toArray()) + ">{" + this.f18066d + ", type=" + this.f18067e + ", deps=" + Arrays.toString(this.f18065c.toArray()) + "}";
    }
}
