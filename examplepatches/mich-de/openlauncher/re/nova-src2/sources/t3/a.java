package t3;

import java.util.Locale;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final Locale f88509a;

    public a(Locale locale) {
        this.f88509a = locale;
    }

    public final boolean equals(Object obj) {
        if (obj == null || !(obj instanceof a)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        return Intrinsics.b(this.f88509a.toLanguageTag(), ((a) obj).f88509a.toLanguageTag());
    }

    public final int hashCode() {
        return this.f88509a.toLanguageTag().hashCode();
    }

    public final String toString() {
        return this.f88509a.toLanguageTag();
    }
}
