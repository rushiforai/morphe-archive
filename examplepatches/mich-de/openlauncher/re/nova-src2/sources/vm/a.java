package vm;

import b.c0;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f92851a;

    /* renamed from: b, reason: collision with root package name */
    public final String f92852b;

    public a(String str, String str2) {
        this.f92851a = str;
        if (str2 == null) {
            throw new NullPointerException("Null version");
        }
        this.f92852b = str2;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof a) {
            a aVar = (a) obj;
            if (this.f92851a.equals(aVar.f92851a) && this.f92852b.equals(aVar.f92852b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return ((this.f92851a.hashCode() ^ 1000003) * 1000003) ^ this.f92852b.hashCode();
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("LibraryVersion{libraryName=");
        sb2.append(this.f92851a);
        sb2.append(", version=");
        return c0.q(sb2, this.f92852b, "}");
    }
}
