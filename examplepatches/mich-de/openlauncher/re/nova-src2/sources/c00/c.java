package c00;

import java.util.Objects;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c extends ga.e implements Comparable {

    /* renamed from: r, reason: collision with root package name */
    public String f19042r;

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        c cVar = (c) obj;
        if (cVar == null) {
            return 1;
        }
        int i5 = this.f57292d;
        int i11 = cVar.f57292d;
        return i5 != i11 ? Intrinsics.h(i5, i11) : !Intrinsics.b(this.f57294f, cVar.f57294f) ? -Float.compare(this.f57294f.a(), cVar.f57294f.a()) : Float.compare(this.f57293e.a(), cVar.f57293e.a());
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !c.class.equals(obj.getClass())) {
            return false;
        }
        return Intrinsics.b(this.f19042r, ((c) obj).f19042r);
    }

    public final int hashCode() {
        return Objects.hash(this.f19042r);
    }
}
