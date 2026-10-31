package y40;

import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class k extends ie.a {

    @NotNull
    public static final j Companion = new j();

    /* renamed from: d, reason: collision with root package name */
    public static final k f96673d = new k(3);

    /* renamed from: c, reason: collision with root package name */
    public final int f96674c;

    public k(int i5) {
        super(1, 3);
        this.f96674c = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof k) && this.f96674c == ((k) obj).f96674c;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f96674c);
    }

    @Override // ie.a
    public final int n() {
        return this.f96674c;
    }

    @Override // ie.a
    public final String toString() {
        return a2.c.m(new StringBuilder("SuggestedLinksContainerConfig(rowCount="), this.f96674c, ')');
    }
}
