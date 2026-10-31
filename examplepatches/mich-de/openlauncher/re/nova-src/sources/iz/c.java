package iz;

import a80.m;
import x7.f;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public int f68417a;

    public c(int i5) {
        this.f68417a = i5;
    }

    public final boolean a() {
        return f.I(this.f68417a, 1);
    }

    public final boolean b() {
        return f.I(this.f68417a, 2);
    }

    public final boolean c() {
        return f.I(this.f68417a, 64);
    }

    public final boolean d() {
        return f.I(this.f68417a, 32);
    }

    public final boolean e() {
        return f.I(this.f68417a, 8);
    }

    public final boolean f() {
        return f.I(this.f68417a, 4);
    }

    public final int g(int i5, boolean z11) {
        if (z11) {
            return i5 | this.f68417a;
        }
        return (~i5) & this.f68417a;
    }

    public final void h(boolean z11) {
        if (e() != z11) {
            ea.b.b("NovaFlags", m.i("Setting overlap flag '", "'", z11), new Exception());
        }
        this.f68417a = g(8, z11);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("NovaFlags(");
        if (f.I(this.f68417a, 1)) {
            sb2.append("noPadding");
        }
        if (a()) {
            sb2.append(" customIcon");
        }
        if (b()) {
            sb2.append(" customTitle");
        }
        if (f.I(this.f68417a, 16)) {
            sb2.append(" appOnSdcard");
        }
        if (f()) {
            sb2.append(" swipeToOpen");
        }
        if (e()) {
            sb2.append(" overlap");
        }
        if (d()) {
            sb2.append(" dontReshape");
        }
        if (c()) {
            sb2.append(" dontBadge");
        }
        if (f.I(this.f68417a, 128)) {
            sb2.append(" drawerGroupDisabled");
        }
        if (f.I(this.f68417a, 256)) {
            sb2.append(" drawerGroupHasPromptedToEnable");
        }
        sb2.append(")");
        return sb2.toString();
    }
}
