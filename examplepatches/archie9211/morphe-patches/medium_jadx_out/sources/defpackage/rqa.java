package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rqa {
    public final Class a;
    public final Class b;

    public rqa(Class cls, Class cls2) {
        this.a = cls;
        this.b = cls2;
    }

    public static rqa a(Class cls) {
        return new rqa(qqa.class, cls);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || rqa.class != obj.getClass()) {
            return false;
        }
        rqa rqaVar = (rqa) obj;
        if (this.b.equals(rqaVar.b)) {
            return this.a.equals(rqaVar.a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode() + (this.b.hashCode() * 31);
    }

    public final String toString() {
        Class cls = this.b;
        Class cls2 = this.a;
        if (cls2 == qqa.class) {
            return cls.getName();
        }
        return "@" + cls2.getName() + " " + cls.getName();
    }
}
