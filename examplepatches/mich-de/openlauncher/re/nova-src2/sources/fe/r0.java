package fe;

import android.net.Uri;
import java.util.List;

/* loaded from: classes3.dex */
public final class r0 {

    /* renamed from: a, reason: collision with root package name */
    public final Uri f54973a;

    /* renamed from: b, reason: collision with root package name */
    public final List f54974b;

    /* renamed from: c, reason: collision with root package name */
    public final xk.v0 f54975c;

    public r0(Uri uri, q1 q1Var, List list, xk.v0 v0Var) {
        this.f54973a = uri;
        this.f54974b = list;
        this.f54975c = v0Var;
        xk.s0 s0VarL = xk.v0.l();
        for (int i5 = 0; i5 < v0Var.size(); i5++) {
            ((t0) v0Var.get(i5)).getClass();
            s0VarL.a(new t0());
        }
        s0VarL.f();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r0)) {
            return false;
        }
        r0 r0Var = (r0) obj;
        if (!this.f54973a.equals(r0Var.f54973a)) {
            return false;
        }
        int i5 = wf.v.f94376a;
        return wf.v.a(null, null) && this.f54974b.equals(r0Var.f54974b) && this.f54975c.equals(r0Var.f54975c);
    }

    public final int hashCode() {
        return (this.f54975c.hashCode() + ((this.f54974b.hashCode() + (this.f54973a.hashCode() * 923521)) * 961)) * 31;
    }
}
