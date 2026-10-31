package zw;

import java.io.Serializable;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final Function0 f98790a = yw.d.f97672a;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof d) && Intrinsics.b(this.f98790a, ((d) obj).f98790a);
    }

    public final int hashCode() {
        return this.f98790a.hashCode();
    }

    public final String toString() {
        return "HCaptchaInternalConfig(htmlProvider=" + this.f98790a + ")";
    }
}
