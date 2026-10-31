package x1;

import android.os.Trace;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import p1.a2;
import p1.z1;
import z.a1;
import z.b1;
import z.o0;
import z.p0;

/* loaded from: classes.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public Set f94962a;

    /* renamed from: b, reason: collision with root package name */
    public a2.f f94963b;

    /* renamed from: c, reason: collision with root package name */
    public final r1.e f94964c;

    /* renamed from: d, reason: collision with root package name */
    public p0 f94965d;

    /* renamed from: e, reason: collision with root package name */
    public r1.e f94966e;

    /* renamed from: f, reason: collision with root package name */
    public final r1.e f94967f;

    /* renamed from: g, reason: collision with root package name */
    public final r1.e f94968g;

    /* renamed from: h, reason: collision with root package name */
    public p0 f94969h;

    /* renamed from: i, reason: collision with root package name */
    public o0 f94970i;

    /* renamed from: j, reason: collision with root package name */
    public ArrayList f94971j;

    /* renamed from: k, reason: collision with root package name */
    public a1 f94972k;

    public l() {
        r1.e eVar = new r1.e(new a2[16]);
        this.f94964c = eVar;
        p0 p0Var = b1.f97745a;
        this.f94965d = new p0();
        this.f94966e = eVar;
        this.f94967f = new r1.e(new Object[16]);
        this.f94968g = new r1.e(new Function0[16]);
    }

    public static final boolean f(a2 a2Var, r1.e eVar) {
        Object[] objArr = eVar.f85077a;
        int i5 = eVar.f85079c;
        for (int i11 = 0; i11 < i5; i11++) {
            z1 z1Var = ((a2) objArr[i11]).f81381a;
            if (z1Var instanceof h) {
                r1.e eVarB = ((h) z1Var).b();
                if (eVarB.j(a2Var) || f(a2Var, eVarB)) {
                    return true;
                }
            }
        }
        return false;
    }

    public final void a() {
        this.f94962a = null;
        this.f94963b = null;
        r1.e eVar = this.f94964c;
        eVar.g();
        this.f94965d.e();
        this.f94966e = eVar;
        this.f94967f.g();
        this.f94968g.g();
        this.f94969h = null;
        this.f94970i = null;
        this.f94971j = null;
    }

    public final void b() {
        Set set = this.f94962a;
        if (set == null || set.isEmpty()) {
            return;
        }
        Trace.beginSection("Compose:abandons");
        try {
            Iterator it = set.iterator();
            while (it.hasNext()) {
                z1 z1Var = (z1) it.next();
                it.remove();
                z1Var.g();
            }
            Unit unit = Unit.f71706a;
            Trace.endSection();
        } catch (Throwable th2) {
            Trace.endSection();
            throw th2;
        }
    }

    public final void c() {
        Set set = this.f94962a;
        if (set == null) {
            return;
        }
        this.f94972k = null;
        r1.e eVar = this.f94967f;
        if (eVar.f85079c != 0) {
            Trace.beginSection("Compose:onForgotten");
            try {
                p0 p0Var = this.f94969h;
                int i5 = eVar.f85079c;
                while (true) {
                    i5--;
                    if (-1 >= i5) {
                        break;
                    }
                    Object obj = eVar.f85077a[i5];
                    try {
                        if (obj instanceof a2) {
                            z1 z1Var = ((a2) obj).f81381a;
                            set.remove(z1Var);
                            z1Var.i();
                        }
                        if (obj instanceof p1.k) {
                            if (p0Var == null || !p0Var.a(obj)) {
                                ((p1.k) obj).onDeactivate();
                            } else {
                                ((p1.k) obj).onRelease();
                            }
                        }
                        Unit unit = Unit.f71706a;
                    } catch (Throwable th2) {
                        a2.f fVar = this.f94963b;
                        if (fVar != null) {
                            ((a2.i) fVar).a(obj, th2);
                        }
                        throw th2;
                    }
                }
                Unit unit2 = Unit.f71706a;
            } catch (Throwable th3) {
                throw th3;
            }
        }
        r1.e eVar2 = this.f94964c;
        if (eVar2.f85079c != 0) {
            Trace.beginSection("Compose:onRemembered");
            try {
                Set set2 = this.f94962a;
                if (set2 != null) {
                    Object[] objArr = eVar2.f85077a;
                    int i11 = eVar2.f85079c;
                    for (int i12 = 0; i12 < i11; i12++) {
                        a2 a2Var = (a2) objArr[i12];
                        z1 z1Var2 = a2Var.f81381a;
                        set2.remove(z1Var2);
                        try {
                            z1Var2.a();
                            Unit unit3 = Unit.f71706a;
                        } catch (Throwable th4) {
                            a2.f fVar2 = this.f94963b;
                            if (fVar2 != null) {
                                ((a2.i) fVar2).a(a2Var, th4);
                            }
                            throw th4;
                        }
                    }
                }
                Unit unit4 = Unit.f71706a;
            } finally {
                Trace.endSection();
            }
        }
    }

    public final void d() {
        r1.e eVar = this.f94968g;
        if (eVar.f85079c != 0) {
            Trace.beginSection("Compose:sideeffects");
            try {
                Object[] objArr = eVar.f85077a;
                int i5 = eVar.f85079c;
                for (int i11 = 0; i11 < i5; i11++) {
                    ((Function0) objArr[i11]).invoke();
                }
                eVar.g();
                Unit unit = Unit.f71706a;
                Trace.endSection();
            } catch (Throwable th2) {
                Trace.endSection();
                throw th2;
            }
        }
    }

    public final void e(a2 a2Var) {
        if (this.f94965d.a(a2Var)) {
            this.f94965d.l(a2Var);
            if (!this.f94966e.j(a2Var)) {
                r1.e eVar = this.f94964c;
                if (!eVar.j(a2Var)) {
                    f(a2Var, eVar);
                }
            }
            Set set = this.f94962a;
            if (set == null) {
                return;
            } else {
                set.add(a2Var.f81381a);
            }
        }
        a1 a1Var = this.f94972k;
        if (a1Var == null || !a1Var.a(a2Var)) {
            this.f94967f.b(a2Var);
        }
    }

    public final void g(Set set, a2.i iVar) {
        a();
        this.f94962a = set;
        this.f94963b = iVar;
    }
}
