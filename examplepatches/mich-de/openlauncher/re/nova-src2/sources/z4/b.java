package z4;

import je.f;

/* loaded from: classes2.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final String f98202a;

    /* renamed from: b, reason: collision with root package name */
    public final f f98203b;

    public b(String str, f fVar) {
        this.f98202a = str;
        this.f98203b = fVar;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return bVar.f98202a.equals(this.f98202a) && bVar.f98203b.equals(this.f98203b);
    }

    public final int hashCode() {
        return this.f98202a.hashCode() ^ this.f98203b.hashCode();
    }

    public final String toString() {
        return "Pair{" + ((Object) this.f98202a) + " " + this.f98203b + "}";
    }
}
