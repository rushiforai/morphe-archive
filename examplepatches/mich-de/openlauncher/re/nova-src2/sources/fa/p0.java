package fa;

import android.content.ContentResolver;
import android.content.Context;
import android.os.Looper;
import com.google.android.gms.internal.measurement.ag;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import o9.c2;
import o9.g3;
import o9.h2;
import o9.t1;
import o9.z1;

/* loaded from: classes.dex */
public final class p0 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f54455a;

    /* renamed from: b, reason: collision with root package name */
    public final c2 f54456b;

    /* renamed from: c, reason: collision with root package name */
    public final q f54457c;

    /* renamed from: e, reason: collision with root package name */
    public final p f54459e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f54460f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f54461g;

    /* renamed from: i, reason: collision with root package name */
    public boolean f54463i;

    /* renamed from: h, reason: collision with root package name */
    public final ArrayList f54462h = new ArrayList();

    /* renamed from: d, reason: collision with root package name */
    public final ya.x f54458d = ya.j.f97147b;

    public p0(Context context, c2 c2Var, q qVar, boolean z11, boolean z12, p pVar) {
        this.f54455a = context;
        this.f54456b = c2Var;
        this.f54457c = qVar;
        this.f54460f = z11;
        this.f54461g = z12;
        this.f54459e = pVar;
    }

    public final void a(ga.e eVar, int i5, int i11, n30.a aVar, n30.a aVar2) {
        o(eVar, i5, i11, aVar, aVar2);
        ContentResolver contentResolver = this.f54455a.getContentResolver();
        eVar.f57289a = h2.a(contentResolver, "generate_new_item_id").getInt("value");
        l(new i0(eVar, 0));
        cl.n0 n0Var = new cl.n0(this, eVar, contentResolver, new Throwable().getStackTrace(), new ag(this), 2);
        Looper looperMyLooper = Looper.myLooper();
        ya.x xVar = ya.j.f97149d;
        if (looperMyLooper == xVar.f97215a.getLooper()) {
            n0Var.run();
        } else {
            xVar.execute(n0Var);
        }
    }

    public final void b(ga.e eVar, int i5, int i11, n30.a aVar, n30.a aVar2) {
        if (eVar.f57289a == -1) {
            a(eVar, i5, i11, aVar, aVar2);
        } else {
            k(eVar, i5, i11, aVar, aVar2);
        }
    }

    public final void c(int i5, ga.e eVar, StackTraceElement[] stackTraceElementArr) {
        int i11;
        int i12;
        ga.e eVar2 = (ga.e) this.f54457c.f54464a.get(i5);
        if (eVar2 == null || eVar == eVar2) {
            return;
        }
        boolean z11 = g3.f79854i;
        if (z11 || !(((eVar2 instanceof ga.j) && (eVar instanceof ga.j)) || ((eVar2 instanceof ga.c) && (eVar instanceof ga.c)))) {
            if (!z11 && (eVar2 instanceof ga.g) && (eVar instanceof ga.g) && ((ga.g) eVar2).f57310r == ((ga.g) eVar).f57310r && eVar2.f57289a == eVar.f57289a && eVar2.f57290b == eVar.f57290b && (i11 = eVar2.f57291c) == eVar.f57291c && eVar2.f57292d == eVar.f57292d) {
                if (eVar2.f57299k == eVar.f57299k && (i11 > 0 || i11 <= -200)) {
                    return;
                }
                if (eVar2.f57293e.equals(eVar.f57293e) && eVar2.f57294f.equals(eVar.f57294f) && eVar2.f57295g.equals(eVar.f57295g) && eVar2.f57296h.equals(eVar.f57296h)) {
                    return;
                }
            }
        } else if (eVar2.f57300l.toString().equals(eVar.f57300l.toString()) && (((eVar2.d() == null && eVar.d() == null) || eVar2.d().filterEquals(eVar.d())) && eVar2.f57289a == eVar.f57289a && eVar2.f57290b == eVar.f57290b && (i12 = eVar2.f57291c) == eVar.f57291c && eVar2.f57292d == eVar.f57292d)) {
            if (eVar2.f57299k == eVar.f57299k && (i12 > 0 || i12 <= -200)) {
                return;
            }
            if (eVar2.f57293e.equals(eVar.f57293e) && eVar2.f57294f.equals(eVar.f57294f) && eVar2.f57295g.equals(eVar.f57295g) && eVar2.f57296h.equals(eVar.f57296h)) {
                return;
            }
        }
        StringBuilder sb2 = new StringBuilder("item: ");
        sb2.append(eVar != null ? eVar.toString() : AbstractJsonLexerKt.NULL);
        sb2.append("modelItem: ");
        sb2.append(eVar2.toString());
        sb2.append("\nError: ItemInfo passed to checkItemInfo doesn't match original");
        RuntimeException runtimeException = new RuntimeException(sb2.toString());
        if (stackTraceElementArr == null) {
            throw runtimeException;
        }
        runtimeException.setStackTrace(stackTraceElementArr);
        throw runtimeException;
    }

    public final void d() {
        this.f54463i = false;
        ArrayList arrayList = this.f54462h;
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            ya.j.f97149d.execute((Runnable) it.next());
        }
        arrayList.clear();
    }

    public final void e(ga.e eVar) {
        f(Arrays.asList(eVar));
    }

    public final void f(Collection collection) {
        ag agVar = new ag(this);
        ea.b.a("ModelWriter", "removing items from db " + ((String) collection.stream().map(new aa.t(16)).collect(Collectors.joining(","))));
        l(new f10.o(collection, 4));
        i(new androidx.fragment.app.d(17, this, collection, agVar));
    }

    public final void g(ya.v vVar) {
        f((Collection) StreamSupport.stream(this.f54457c.f54464a.spliterator(), false).filter(new k0(vVar, 0)).collect(Collectors.toList()));
    }

    public final void h(ga.g gVar, ab.m mVar) {
        l(new f10.o(Collections.singleton(gVar), 4));
        if (gVar.f57310r == -103) {
            zy.c cVar = zy.c.f98823a;
            zy.c.i("ad_widget_removed", null);
        }
        if (mVar != null && !gVar.r0() && gVar.C0()) {
            i(new l0(0, mVar, gVar));
        }
        if (gVar.f57291c != -151) {
            e(gVar);
        }
    }

    public final void i(Runnable runnable) {
        if (this.f54463i) {
            this.f54462h.add(runnable);
        } else {
            ya.j.f97149d.execute(runnable);
        }
    }

    public final void j(ga.e eVar, int i5, int i11, n30.a aVar, n30.a aVar2, n30.b bVar, n30.b bVar2) {
        ea.b.b("ModelWriter", "modifyItemInDatabase " + eVar, new Exception());
        o(eVar, i5, i11, aVar, aVar2);
        eVar.f57295g = bVar;
        eVar.f57296h = bVar2;
        l(new i0(eVar, 1));
        i(new n0(this, eVar, new g0(this, eVar, 2)));
    }

    public final void k(ga.e eVar, int i5, int i11, n30.a aVar, n30.a aVar2) {
        o(eVar, i5, i11, aVar, aVar2);
        l(new i0(eVar, 1));
        i(new n0(this, eVar, new g0(this, eVar, 0)));
    }

    public final void l(z1 z1Var) {
        if (this.f54459e == null) {
            return;
        }
        this.f54458d.execute(new ae.c(29, this, z1Var));
    }

    public final void m() {
        if (this.f54463i) {
            return;
        }
        ArrayList arrayList = this.f54462h;
        arrayList.isEmpty();
        arrayList.clear();
        this.f54463i = true;
    }

    public final void n(ga.e eVar) {
        l(new i0(eVar, 1));
        ya.j.f97149d.execute(new n0(this, eVar, new g0(this, eVar, 1)));
    }

    public final void o(ga.e eVar, int i5, int i11, n30.a aVar, n30.a aVar2) {
        eVar.f57291c = i5;
        eVar.f57293e = aVar;
        eVar.f57294f = aVar2;
        eVar.f57292d = i11;
        if (i5 == -101) {
            eVar.f57299k = (int) (this.f54460f ? (t1.a(this.f54455a).f80278k - aVar2.a()) - 1.0f : aVar.a());
        }
    }
}
