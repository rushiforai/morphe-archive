package pp;

import b.u4;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class k {

    @NotNull
    public static final j Companion = new j();

    /* renamed from: a, reason: collision with root package name */
    public final int f82753a;

    /* renamed from: b, reason: collision with root package name */
    public final int f82754b;

    /* renamed from: c, reason: collision with root package name */
    public final int f82755c;

    /* renamed from: d, reason: collision with root package name */
    public final int f82756d;

    public /* synthetic */ k(int i5, int i11, int i12, int i13, int i14) {
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, i.f82752a.getDescriptor());
        }
        this.f82753a = i11;
        this.f82754b = i12;
        this.f82755c = i13;
        this.f82756d = i14;
    }

    public final int a() {
        return this.f82756d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k)) {
            return false;
        }
        k kVar = (k) obj;
        return this.f82753a == kVar.f82753a && this.f82754b == kVar.f82754b && this.f82755c == kVar.f82755c && this.f82756d == kVar.f82756d;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f82756d) + u4.a(this.f82755c, u4.a(this.f82754b, Integer.hashCode(this.f82753a) * 31, 31), 31);
    }

    public final String toString() {
        StringBuilder sbT = b.c0.t(this.f82753a, "DisplayedResults(apps=", ", contacts=", this.f82754b, ", shortcuts=");
        sbT.append(this.f82755c);
        sbT.append(", micros=");
        sbT.append(this.f82756d);
        sbT.append(")");
        return sbT.toString();
    }

    public k(int i5, int i11, int i12, int i13) {
        this.f82753a = i5;
        this.f82754b = i11;
        this.f82755c = i12;
        this.f82756d = i13;
    }
}
