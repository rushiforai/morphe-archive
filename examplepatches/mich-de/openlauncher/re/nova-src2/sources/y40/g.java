package y40;

import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class g extends ie.a {

    @NotNull
    public static final f Companion = new f();

    /* renamed from: e, reason: collision with root package name */
    public static final g f96668e = new g(2, 5);

    /* renamed from: c, reason: collision with root package name */
    public final int f96669c;

    /* renamed from: d, reason: collision with root package name */
    public final int f96670d;

    public g(int i5, int i11) {
        super(i11, 3);
        this.f96669c = i5;
        this.f96670d = i11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return this.f96669c == gVar.f96669c && this.f96670d == gVar.f96670d;
    }

    @Override // ie.a
    public final int g() {
        return this.f96670d;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f96670d) + (Integer.hashCode(this.f96669c) * 31);
    }

    @Override // ie.a
    public final int n() {
        return this.f96669c;
    }

    @Override // ie.a
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SuggestedAppsContainerConfig(rowCount=");
        sb2.append(this.f96669c);
        sb2.append(", itemsPerRow=");
        return a2.c.m(sb2, this.f96670d, ')');
    }
}
