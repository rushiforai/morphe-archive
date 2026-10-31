package y40;

import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class i extends ie.a {

    @NotNull
    public static final h Companion = new h();

    /* renamed from: c, reason: collision with root package name */
    public final int f96671c;

    /* renamed from: d, reason: collision with root package name */
    public final int f96672d;

    public i(int i5, int i11) {
        super(1, 3);
        this.f96671c = i5;
        this.f96672d = i11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        return this.f96671c == iVar.f96671c && this.f96672d == iVar.f96672d;
    }

    @Override // ie.a
    public final int g() {
        return this.f96672d;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f96672d) + (Integer.hashCode(this.f96671c) * 31);
    }

    @Override // ie.a
    public final int n() {
        return this.f96671c;
    }

    @Override // ie.a
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SuggestedInstallsContainerConfig(rowCount=");
        sb2.append(this.f96671c);
        sb2.append(", itemsPerRow=");
        return a2.c.m(sb2, this.f96672d, ')');
    }
}
