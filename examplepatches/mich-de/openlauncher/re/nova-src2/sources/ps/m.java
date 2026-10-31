package ps;

import b.c9;
import com.stripe.android.core.strings.ResolvableString;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f82931a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f82932b;

    /* renamed from: c, reason: collision with root package name */
    public final ResolvableString f82933c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f82934d;

    public m(boolean z11, boolean z12, ResolvableString resolvableString, boolean z13) {
        this.f82931a = z11;
        this.f82932b = z12;
        this.f82933c = resolvableString;
        this.f82934d = z13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m)) {
            return false;
        }
        m mVar = (m) obj;
        return this.f82931a == mVar.f82931a && this.f82932b == mVar.f82932b && Intrinsics.b(this.f82933c, mVar.f82933c) && this.f82934d == mVar.f82934d;
    }

    public final int hashCode() {
        int iF = c9.f(Boolean.hashCode(this.f82931a) * 31, 31, this.f82932b);
        ResolvableString resolvableString = this.f82933c;
        return Boolean.hashCode(this.f82934d) + ((iF + (resolvableString == null ? 0 : resolvableString.hashCode())) * 31);
    }

    public final String toString() {
        return "LinkAppBarState(showHeader=" + this.f82931a + ", canNavigateBack=" + this.f82932b + ", title=" + this.f82933c + ", isElevated=" + this.f82934d + ")";
    }
}
