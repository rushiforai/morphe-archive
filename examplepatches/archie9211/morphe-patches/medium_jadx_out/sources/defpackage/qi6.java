package defpackage;

import java.lang.reflect.Type;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class qi6 implements Type {
    public final Type[] a;
    public final int b;

    public qi6(Type[] typeArr) {
        this.a = typeArr;
        this.b = Arrays.hashCode(typeArr);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof qi6) {
            return Arrays.equals(this.a, ((qi6) obj).a);
        }
        return false;
    }

    @Override // java.lang.reflect.Type
    public final String getTypeName() {
        return k80.D0(this.a, ", ", "[", "]", null, 56);
    }

    public final int hashCode() {
        return this.b;
    }

    public final String toString() {
        return getTypeName();
    }
}
