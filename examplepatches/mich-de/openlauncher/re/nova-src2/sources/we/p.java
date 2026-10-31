package we;

import android.text.TextUtils;
import b.c0;

/* loaded from: classes3.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public final String f94298a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f94299b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f94300c;

    public p(String str, boolean z11, boolean z12) {
        this.f94298a = str;
        this.f94299b = z11;
        this.f94300c = z12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || obj.getClass() != p.class) {
            return false;
        }
        p pVar = (p) obj;
        return TextUtils.equals(this.f94298a, pVar.f94298a) && this.f94299b == pVar.f94299b && this.f94300c == pVar.f94300c;
    }

    public final int hashCode() {
        return ((c0.e(31, 31, this.f94298a) + (this.f94299b ? 1231 : 1237)) * 31) + (this.f94300c ? 1231 : 1237);
    }
}
