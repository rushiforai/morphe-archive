package y20;

import android.net.Uri;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements d {

    /* renamed from: a, reason: collision with root package name */
    public final Uri f96593a;

    public b(Uri uri) {
        this.f96593a = uri;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof b) && Intrinsics.b(this.f96593a, ((b) obj).f96593a);
    }

    public final int hashCode() {
        return this.f96593a.hashCode();
    }

    public final String toString() {
        return "Uri(uri=" + this.f96593a + ")";
    }
}
