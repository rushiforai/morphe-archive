package jg;

import java.util.Arrays;
import sg.w;

/* loaded from: classes3.dex */
public final class b implements qg.b {

    /* renamed from: c, reason: collision with root package name */
    public static final b f69555c;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f69556a;

    /* renamed from: b, reason: collision with root package name */
    public final String f69557b;

    static {
        c10.a aVar = new c10.a(22, (byte) 0);
        aVar.f19149c = Boolean.FALSE;
        f69555c = new b(aVar);
    }

    public b(c10.a aVar) {
        this.f69556a = ((Boolean) aVar.f19149c).booleanValue();
        this.f69557b = (String) aVar.f19148b;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return w.k(null, null) && this.f69556a == bVar.f69556a && w.k(this.f69557b, bVar.f69557b);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{null, Boolean.valueOf(this.f69556a), this.f69557b});
    }
}
