package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u90 implements s7a {
    public final int a;
    public final r7a b;

    public u90(int i, r7a r7aVar) {
        this.a = i;
        this.b = r7aVar;
    }

    @Override // java.lang.annotation.Annotation
    public final Class annotationType() {
        return s7a.class;
    }

    @Override // java.lang.annotation.Annotation
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s7a)) {
            return false;
        }
        s7a s7aVar = (s7a) obj;
        return this.a == s7aVar.tag() && this.b.equals(s7aVar.intEncoding());
    }

    @Override // java.lang.annotation.Annotation
    public final int hashCode() {
        return (14552422 ^ this.a) + (this.b.hashCode() ^ 2041407134);
    }

    @Override // defpackage.s7a
    public final r7a intEncoding() {
        return this.b;
    }

    @Override // defpackage.s7a
    public final int tag() {
        return this.a;
    }

    @Override // java.lang.annotation.Annotation
    public final String toString() {
        return "@com.google.firebase.encoders.proto.Protobuf(tag=" + this.a + "intEncoding=" + this.b + ')';
    }
}
