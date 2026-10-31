package sg;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class l implements qg.b {

    /* renamed from: b, reason: collision with root package name */
    public static final l f87447b = new l(null);

    /* renamed from: a, reason: collision with root package name */
    public final String f87448a;

    public /* synthetic */ l(String str) {
        this.f87448a = str;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof l) {
            return w.k(this.f87448a, ((l) obj).f87448a);
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f87448a});
    }
}
