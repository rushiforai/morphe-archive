package ud;

import java.util.ArrayList;
import java.util.Arrays;
import nx.l;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final Iterable f90791a;

    /* renamed from: b, reason: collision with root package name */
    public final byte[] f90792b;

    public a(ArrayList arrayList, byte[] bArr) {
        this.f90791a = arrayList;
        this.f90792b = bArr;
    }

    public static l a() {
        return new l();
    }

    public final Iterable b() {
        return this.f90791a;
    }

    public final byte[] c() {
        return this.f90792b;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof a) {
            a aVar = (a) obj;
            if (this.f90791a.equals(aVar.f90791a) && Arrays.equals(this.f90792b, aVar.f90792b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return ((this.f90791a.hashCode() ^ 1000003) * 1000003) ^ Arrays.hashCode(this.f90792b);
    }

    public final String toString() {
        return "BackendRequest{events=" + this.f90791a + ", extras=" + Arrays.toString(this.f90792b) + "}";
    }
}
