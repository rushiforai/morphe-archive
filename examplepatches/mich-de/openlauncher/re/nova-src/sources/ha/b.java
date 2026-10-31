package ha;

import java.util.HashSet;

/* loaded from: classes2.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public String f59564a;

    /* renamed from: b, reason: collision with root package name */
    public final HashSet f59565b = new HashSet();

    public final void a(String str) {
        this.f59565b.add(str);
    }

    public final boolean b() {
        return this.f59565b.isEmpty();
    }

    public final void c(String str) {
        this.f59565b.remove(str);
    }

    public final void d(String str) {
        this.f59564a = str;
    }
}
