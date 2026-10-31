package f1;

/* loaded from: classes2.dex */
public final class b2 {

    /* renamed from: a, reason: collision with root package name */
    public final x1.e f53401a;

    public b2(x1.e eVar) {
        this.f53401a = eVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof b2) && this.f53401a.equals(((b2) obj).f53401a);
    }

    public final int hashCode() {
        return this.f53401a.hashCode();
    }

    public final String toString() {
        return "FadeInFadeOutAnimationItem(key=null, transition=" + this.f53401a + ')';
    }
}
