package bm;

/* loaded from: classes.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public final Class f18107a;

    /* renamed from: b, reason: collision with root package name */
    public final Class f18108b;

    public r(Class cls, Class cls2) {
        this.f18107a = cls;
        this.f18108b = cls2;
    }

    public static r a(Class cls) {
        return new r(q.class, cls);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || r.class != obj.getClass()) {
            return false;
        }
        r rVar = (r) obj;
        if (this.f18108b.equals(rVar.f18108b)) {
            return this.f18107a.equals(rVar.f18107a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f18107a.hashCode() + (this.f18108b.hashCode() * 31);
    }

    public final String toString() {
        Class cls = this.f18108b;
        Class cls2 = this.f18107a;
        if (cls2 == q.class) {
            return cls.getName();
        }
        return "@" + cls2.getName() + " " + cls.getName();
    }
}
