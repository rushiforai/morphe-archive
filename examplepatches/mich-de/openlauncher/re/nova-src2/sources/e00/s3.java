package e00;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class s3 {

    /* renamed from: a, reason: collision with root package name */
    public final List f50968a;

    public final boolean equals(Object obj) {
        if (obj instanceof s3) {
            return Intrinsics.b(this.f50968a, ((s3) obj).f50968a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f50968a.hashCode();
    }

    public final String toString() {
        return "LicenseInfo(list=" + this.f50968a + ")";
    }
}
