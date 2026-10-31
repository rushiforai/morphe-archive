package fe;

import android.net.Uri;
import java.util.Collections;
import java.util.List;
import xk.r2;

/* loaded from: classes3.dex */
public final class u0 implements e {

    /* renamed from: g, reason: collision with root package name */
    public static final ep.c f54992g;

    /* renamed from: a, reason: collision with root package name */
    public final String f54993a;

    /* renamed from: b, reason: collision with root package name */
    public final r0 f54994b;

    /* renamed from: c, reason: collision with root package name */
    public final q0 f54995c;

    /* renamed from: d, reason: collision with root package name */
    public final w0 f54996d;

    /* renamed from: e, reason: collision with root package name */
    public final o0 f54997e;

    /* renamed from: f, reason: collision with root package name */
    public final s0 f54998f;

    static {
        m0 m0Var = new m0();
        xk.l0 l0Var = xk.v0.f96030b;
        r2 r2Var = r2.f96007e;
        List list = Collections.EMPTY_LIST;
        r2 r2Var2 = r2.f96007e;
        s0 s0Var = s0.f54981c;
        new o0(m0Var);
        new q0(-9223372036854775807L, -9223372036854775807L, -9223372036854775807L, -3.4028235E38f, -3.4028235E38f);
        w0 w0Var = w0.G;
        f54992g = new ep.c(8);
    }

    public u0(String str, o0 o0Var, r0 r0Var, q0 q0Var, w0 w0Var, s0 s0Var) {
        this.f54993a = str;
        this.f54994b = r0Var;
        this.f54995c = q0Var;
        this.f54996d = w0Var;
        this.f54997e = o0Var;
        this.f54998f = s0Var;
    }

    public static u0 a(String str) {
        m0 m0Var = new m0();
        xk.l0 l0Var = xk.v0.f96030b;
        r2 r2Var = r2.f96007e;
        List list = Collections.EMPTY_LIST;
        r2 r2Var2 = r2.f96007e;
        s0 s0Var = s0.f54981c;
        Uri uri = Uri.parse(str);
        return new u0(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, new o0(m0Var), uri != null ? new r0(uri, null, list, r2Var2) : null, new q0(-9223372036854775807L, -9223372036854775807L, -9223372036854775807L, -3.4028235E38f, -3.4028235E38f), w0.G, s0Var);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u0)) {
            return false;
        }
        u0 u0Var = (u0) obj;
        return wf.v.a(this.f54993a, u0Var.f54993a) && this.f54997e.equals(u0Var.f54997e) && wf.v.a(this.f54994b, u0Var.f54994b) && this.f54995c.equals(u0Var.f54995c) && wf.v.a(this.f54996d, u0Var.f54996d) && wf.v.a(this.f54998f, u0Var.f54998f);
    }

    public final int hashCode() {
        int iHashCode = this.f54993a.hashCode() * 31;
        r0 r0Var = this.f54994b;
        return this.f54998f.hashCode() + ((this.f54996d.hashCode() + ((this.f54997e.hashCode() + ((this.f54995c.hashCode() + ((iHashCode + (r0Var != null ? r0Var.hashCode() : 0)) * 31)) * 31)) * 31)) * 31);
    }
}
