package ga;

import android.content.ComponentName;
import android.content.Intent;
import android.net.Uri;
import android.os.Process;
import android.os.UserHandle;
import da.k;
import da.l;
import da.m;
import da.n;
import da.p;
import da.r;
import da.s;
import da.t;
import da.u;
import da.v;
import fa.p0;
import java.util.Optional;
import o9.g2;
import o9.m4;
import w20.o;

/* loaded from: classes.dex */
public class e {

    /* renamed from: b, reason: collision with root package name */
    public int f57290b;

    /* renamed from: e, reason: collision with root package name */
    public n30.a f57293e;

    /* renamed from: f, reason: collision with root package name */
    public n30.a f57294f;

    /* renamed from: g, reason: collision with root package name */
    public n30.b f57295g;

    /* renamed from: h, reason: collision with root package name */
    public n30.b f57296h;

    /* renamed from: i, reason: collision with root package name */
    public n30.b f57297i;

    /* renamed from: j, reason: collision with root package name */
    public n30.b f57298j;

    /* renamed from: k, reason: collision with root package name */
    public int f57299k;

    /* renamed from: l, reason: collision with root package name */
    public CharSequence f57300l;

    /* renamed from: m, reason: collision with root package name */
    public CharSequence f57301m;
    public ComponentName n;
    public UserHandle o;

    /* renamed from: p, reason: collision with root package name */
    public int f57302p;

    /* renamed from: q, reason: collision with root package name */
    public iz.c f57303q;

    /* renamed from: a, reason: collision with root package name */
    public int f57289a = -1;

    /* renamed from: c, reason: collision with root package name */
    public int f57291c = -1;

    /* renamed from: d, reason: collision with root package name */
    public int f57292d = -1;

    public e() {
        n30.a aVar = n30.a.f77776b;
        this.f57293e = aVar;
        this.f57294f = aVar;
        n30.b bVar = n30.b.f77779c;
        this.f57295g = bVar;
        this.f57296h = bVar;
        this.f57297i = bVar;
        this.f57298j = bVar;
        this.f57299k = 0;
        this.f57302p = 0;
        this.f57303q = new iz.c(0);
        this.o = Process.myUserHandle();
    }

    public void C(ya.b bVar) {
        if (m4.f79999gp.d(this.f57292d)) {
            throw new RuntimeException("Screen id should not be extra empty screen: " + this.f57292d);
        }
        b0(bVar);
        bVar.d(this.o);
    }

    public void a(e eVar) {
        this.f57289a = eVar.f57289a;
        this.f57300l = eVar.f57300l;
        this.f57293e = eVar.f57293e;
        this.f57294f = eVar.f57294f;
        this.f57295g = eVar.f57295g;
        this.f57296h = eVar.f57296h;
        this.f57297i = eVar.f57297i;
        this.f57298j = eVar.f57298j;
        this.f57299k = eVar.f57299k;
        this.f57292d = eVar.f57292d;
        this.f57290b = eVar.f57290b;
        this.f57291c = eVar.f57291c;
        this.o = eVar.o;
        this.f57301m = eVar.f57301m;
        this.n = eVar.i();
        this.f57303q = eVar.f57303q;
    }

    public void a0(CharSequence charSequence, p0 p0Var) {
        this.f57300l = charSequence;
    }

    public String b() {
        String strValueOf;
        da.d dVarQ;
        StringBuilder sb2 = new StringBuilder("id=");
        sb2.append(this.f57289a);
        sb2.append(" type=");
        int i5 = this.f57290b;
        Uri uri = g2.f79844a;
        switch (i5) {
            case 0:
                strValueOf = "APP";
                break;
            case 1:
                strValueOf = "SHORTCUT";
                break;
            case 2:
                strValueOf = "FOLDER";
                break;
            case 3:
            default:
                strValueOf = String.valueOf(i5);
                break;
            case 4:
                strValueOf = "WIDGET";
                break;
            case 5:
                strValueOf = "CUSTOMWIDGET";
                break;
            case 6:
                strValueOf = "DEEPSHORTCUT";
                break;
            case 7:
                strValueOf = "TASK";
                break;
            case 8:
                strValueOf = "QSB";
                break;
        }
        sb2.append(strValueOf);
        sb2.append(" container=");
        int i11 = this.f57291c;
        if (i11 == -200) {
            da.c cVarR = da.d.r();
            cVarR.d(v.f());
            dVarQ = (da.d) cVarR.build();
        } else if (i11 != -114) {
            switch (i11) {
                case -109:
                    da.c cVarR2 = da.d.r();
                    cVarR2.k(p.f());
                    dVarQ = (da.d) cVarR2.build();
                    break;
                case -108:
                    da.c cVarR3 = da.d.r();
                    cVarR3.i(m.f());
                    dVarQ = (da.d) cVarR3.build();
                    break;
                case -107:
                    da.c cVarR4 = da.d.r();
                    cVarR4.j(n.f());
                    dVarQ = (da.d) cVarR4.build();
                    break;
                case -106:
                    da.c cVarR5 = da.d.r();
                    cVarR5.h(l.f());
                    dVarQ = (da.d) cVarR5.build();
                    break;
                case -105:
                    da.c cVarR6 = da.d.r();
                    cVarR6.n(s.f());
                    dVarQ = (da.d) cVarR6.build();
                    break;
                case -104:
                    da.c cVarR7 = da.d.r();
                    cVarR7.c(da.b.f());
                    dVarQ = (da.d) cVarR7.build();
                    break;
                case -103:
                    da.c cVarR8 = da.d.r();
                    da.i iVarG = da.j.g();
                    iVarG.c(this.f57292d);
                    cVarR8.f(iVarG);
                    dVarQ = (da.d) cVarR8.build();
                    break;
                case -102:
                    da.c cVarR9 = da.d.r();
                    cVarR9.g(k.f());
                    dVarQ = (da.d) cVarR9.build();
                    break;
                case -101:
                    da.c cVarR10 = da.d.r();
                    da.g gVarF = da.h.f();
                    gVarF.c(this.f57292d);
                    cVarR10.e(gVarF);
                    dVarQ = (da.d) cVarR10.build();
                    break;
                case -100:
                    da.c cVarR11 = da.d.r();
                    t tVarH = u.h();
                    tVarH.c(this.f57293e.a());
                    tVarH.d(this.f57294f.a());
                    tVarH.e(this.f57292d);
                    cVarR11.o(tVarH);
                    dVarQ = (da.d) cVarR11.build();
                    break;
                default:
                    dVarQ = da.d.q();
                    break;
            }
        } else {
            da.c cVarR12 = da.d.r();
            cVarR12.m(r.f());
            dVarQ = (da.d) cVarR12.build();
        }
        sb2.append(dVarQ);
        sb2.append(" targetComponent=");
        sb2.append(i());
        sb2.append(" screen=");
        sb2.append(this.f57292d);
        sb2.append(" cell(");
        sb2.append(this.f57293e);
        sb2.append(", ");
        sb2.append(this.f57294f);
        sb2.append(") span(");
        sb2.append(this.f57295g);
        sb2.append(" × ");
        sb2.append(this.f57296h);
        sb2.append(") minSpan(");
        sb2.append(this.f57297i);
        sb2.append(" × ");
        sb2.append(this.f57298j);
        sb2.append(") rank=");
        sb2.append(this.f57299k);
        sb2.append(" user=");
        sb2.append(this.o);
        sb2.append(" title=");
        sb2.append((Object) o.b(this.f57300l));
        return sb2.toString();
    }

    public void b0(ya.b bVar) {
        bVar.h(Integer.valueOf(this.f57290b), "itemType");
        bVar.h(Integer.valueOf(this.f57291c), "container");
        bVar.h(Integer.valueOf(this.f57292d), "screen");
        bVar.j("cellX", Float.valueOf(this.f57293e.a()));
        bVar.j("cellY", Float.valueOf(this.f57294f.a()));
        bVar.j("spanX", Float.valueOf(this.f57295g.a()));
        bVar.j("spanY", Float.valueOf(this.f57296h.a()));
        bVar.h(Integer.valueOf(this.f57299k), "rank");
        bVar.h(Integer.valueOf(this.f57302p), "zOrder");
        bVar.f(this.f57303q);
    }

    public Intent d() {
        return null;
    }

    public ComponentName i() {
        return (ComponentName) Optional.ofNullable(d()).map(new fa.n(10)).orElse(this.n);
    }

    public final String l() {
        ComponentName componentNameI = i();
        Intent intentD = d();
        if (componentNameI != null) {
            return componentNameI.getPackageName();
        }
        if (intentD != null) {
            return intentD.getPackage();
        }
        return null;
    }

    public boolean m() {
        return false;
    }

    public e p() {
        e eVar = new e();
        eVar.a(this);
        return eVar;
    }

    public final String toString() {
        return getClass().getSimpleName() + "(" + b() + ")";
    }
}
