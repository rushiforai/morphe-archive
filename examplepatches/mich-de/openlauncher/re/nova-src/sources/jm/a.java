package jm;

/* loaded from: classes3.dex */
public final class a implements e {

    /* renamed from: c, reason: collision with root package name */
    public final int f69595c;

    public a(int i5) {
        this.f69595c = i5;
    }

    @Override // java.lang.annotation.Annotation
    public final Class annotationType() {
        return e.class;
    }

    @Override // java.lang.annotation.Annotation
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        if (this.f69595c != ((a) ((e) obj)).f69595c) {
            return false;
        }
        Object obj2 = d.f69597a;
        return obj2.equals(obj2);
    }

    @Override // java.lang.annotation.Annotation
    public final int hashCode() {
        return (14552422 ^ this.f69595c) + (d.f69597a.hashCode() ^ 2041407134);
    }

    @Override // java.lang.annotation.Annotation
    public final String toString() {
        return "@com.google.firebase.encoders.proto.Protobuf(tag=" + this.f69595c + "intEncoding=" + d.f69597a + ')';
    }
}
