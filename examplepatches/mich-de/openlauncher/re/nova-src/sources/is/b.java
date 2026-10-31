package is;

import com.stripe.android.link.LinkActivityResult;

/* loaded from: classes4.dex */
public final class b implements d {

    /* renamed from: a, reason: collision with root package name */
    public final LinkActivityResult.Completed f68016a;

    public b(LinkActivityResult.Completed completed) {
        this.f68016a = completed;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof b) && this.f68016a.equals(((b) obj).f68016a);
    }

    public final int hashCode() {
        return this.f68016a.hashCode();
    }

    public final String toString() {
        return "Completed(linkActivityResult=" + this.f68016a + ")";
    }
}
