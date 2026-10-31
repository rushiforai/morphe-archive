package rg;

import java.util.Arrays;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final int f85852a;

    /* renamed from: b, reason: collision with root package name */
    public final ab.c0 f85853b;

    /* renamed from: c, reason: collision with root package name */
    public final qg.b f85854c;

    /* renamed from: d, reason: collision with root package name */
    public final String f85855d;

    public a(ab.c0 c0Var, qg.b bVar, String str) {
        this.f85853b = c0Var;
        this.f85854c = bVar;
        this.f85855d = str;
        this.f85852a = Arrays.hashCode(new Object[]{c0Var, bVar, str});
    }

    public final boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return sg.w.k(this.f85853b, aVar.f85853b) && sg.w.k(this.f85854c, aVar.f85854c) && sg.w.k(this.f85855d, aVar.f85855d);
    }

    public final int hashCode() {
        return this.f85852a;
    }
}
