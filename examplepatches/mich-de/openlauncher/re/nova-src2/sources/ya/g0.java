package ya;

import android.os.UserHandle;
import android.text.TextUtils;
import java.util.Objects;

/* loaded from: classes.dex */
public final class g0 {

    /* renamed from: a, reason: collision with root package name */
    public String f97138a;

    /* renamed from: b, reason: collision with root package name */
    public int f97139b;

    /* renamed from: c, reason: collision with root package name */
    public UserHandle f97140c;

    /* renamed from: d, reason: collision with root package name */
    public int f97141d;

    public g0(String str, UserHandle userHandle) {
        c(-1, userHandle, str);
    }

    public static g0 a(ga.e eVar) {
        if (eVar.i() == null) {
            return null;
        }
        return new g0(eVar.i().getPackageName(), eVar.o);
    }

    public static g0 b(ga.h hVar) {
        int i5;
        return (!TextUtils.isEmpty(hVar.f57319x) || (i5 = hVar.f57320y) == -1) ? new g0(hVar.f57319x, hVar.o) : new g0(i5, hVar.o);
    }

    public final void c(int i5, UserHandle userHandle, String str) {
        this.f97138a = str;
        this.f97139b = i5;
        this.f97140c = userHandle;
        this.f97141d = Objects.hash(str, Integer.valueOf(i5), userHandle);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof g0)) {
            return false;
        }
        g0 g0Var = (g0) obj;
        return Objects.equals(this.f97138a, g0Var.f97138a) && this.f97139b == g0Var.f97139b && Objects.equals(this.f97140c, g0Var.f97140c);
    }

    public final int hashCode() {
        return this.f97141d;
    }

    public final String toString() {
        return this.f97138a + "#" + this.f97140c + ",category=" + this.f97139b;
    }

    public g0(int i5, UserHandle userHandle) {
        c(i5, userHandle, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
    }
}
