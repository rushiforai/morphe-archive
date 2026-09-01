package defpackage;

import android.content.Context;
import android.util.Log;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.ListIterator;
import java.util.Set;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@rc8("dialog")
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Ljb3;", "Lsc8;", "Lhb3;", "navigation-fragment_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class jb3 extends sc8 {
    public final Context c;
    public final f25 d;
    public final LinkedHashSet e = new LinkedHashSet();
    public final ywa f = new ywa(3, this);
    public final LinkedHashMap g = new LinkedHashMap();

    public jb3(Context context, f25 f25Var) {
        this.c = context;
        this.d = f25Var;
    }

    @Override // defpackage.sc8
    public final va8 a() {
        return new hb3(this);
    }

    @Override // defpackage.sc8
    public final void d(List list, ob8 ob8Var, w6 w6Var) {
        f25 f25Var = this.d;
        if (f25Var.N()) {
            Log.i("DialogFragmentNavigator", "Ignoring navigate() call: FragmentManager has already saved its state");
            return;
        }
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            ba8 ba8Var = (ba8) it2.next();
            k(ba8Var).c0(f25Var, ba8Var.f);
            ba8 ba8Var2 = (ba8) bu1.I0((List) b().e.a.getValue());
            boolean zP0 = bu1.p0((Iterable) b().f.a.getValue(), ba8Var2);
            b().i(ba8Var);
            if (ba8Var2 != null && !zP0) {
                b().c(ba8Var2);
            }
        }
    }

    @Override // defpackage.sc8
    public final void e(ga8 ga8Var) {
        ky6 ky6Var;
        this.a = ga8Var;
        this.b = true;
        Iterator it2 = ((List) ga8Var.e.a.getValue()).iterator();
        while (true) {
            boolean zHasNext = it2.hasNext();
            f25 f25Var = this.d;
            if (!zHasNext) {
                f25Var.o.add(new o25() { // from class: gb3
                    @Override // defpackage.o25
                    public final void a(f25 f25Var2, j15 j15Var) {
                        f25Var2.getClass();
                        jb3 jb3Var = this.a;
                        LinkedHashSet linkedHashSet = jb3Var.e;
                        String str = j15Var.y;
                        pwd.w(linkedHashSet);
                        if (linkedHashSet.remove(str)) {
                            j15Var.O.a(jb3Var.f);
                        }
                        LinkedHashMap linkedHashMap = jb3Var.g;
                        pwd.y(linkedHashMap).remove(j15Var.y);
                    }
                });
                return;
            }
            ba8 ba8Var = (ba8) it2.next();
            fb3 fb3Var = (fb3) f25Var.D(ba8Var.f);
            if (fb3Var == null || (ky6Var = fb3Var.O) == null) {
                this.e.add(ba8Var.f);
            } else {
                ky6Var.a(this.f);
            }
        }
    }

    @Override // defpackage.sc8
    public final void f(ba8 ba8Var) {
        String str = ba8Var.f;
        f25 f25Var = this.d;
        if (f25Var.N()) {
            Log.i("DialogFragmentNavigator", "Ignoring onLaunchSingleTop() call: FragmentManager has already saved its state");
            return;
        }
        fb3 fb3Var = (fb3) this.g.get(str);
        if (fb3Var == null) {
            j15 j15VarD = f25Var.D(str);
            fb3Var = j15VarD instanceof fb3 ? (fb3) j15VarD : null;
        }
        if (fb3Var != null) {
            fb3Var.O.b(this.f);
            fb3Var.Y();
        }
        k(ba8Var).c0(f25Var, str);
        ga8 ga8VarB = b();
        List list = (List) ga8VarB.e.a.getValue();
        ListIterator listIterator = list.listIterator(list.size());
        while (listIterator.hasPrevious()) {
            ba8 ba8Var2 = (ba8) listIterator.previous();
            if (ba8Var2.f.equals(str)) {
                xpc xpcVar = ga8VarB.c;
                xpcVar.m(null, qo7.w(qo7.w((Set) xpcVar.getValue(), ba8Var2), ba8Var));
                ga8VarB.d(ba8Var);
                return;
            }
        }
        ywb.h("List contains no element matching the predicate.");
    }

    @Override // defpackage.sc8
    public final void i(ba8 ba8Var, boolean z) {
        f25 f25Var = this.d;
        if (f25Var.N()) {
            Log.i("DialogFragmentNavigator", "Ignoring popBackStack() call: FragmentManager has already saved its state");
            return;
        }
        List list = (List) b().e.a.getValue();
        int iIndexOf = list.indexOf(ba8Var);
        Iterator it2 = bu1.Y0(list.subList(iIndexOf, list.size())).iterator();
        while (it2.hasNext()) {
            j15 j15VarD = f25Var.D(((ba8) it2.next()).f);
            if (j15VarD != null) {
                ((fb3) j15VarD).Y();
            }
        }
        l(iIndexOf, ba8Var, z);
    }

    public final fb3 k(ba8 ba8Var) {
        va8 va8Var = ba8Var.b;
        va8Var.getClass();
        hb3 hb3Var = (hb3) va8Var;
        String str = hb3Var.g;
        if (str == null) {
            ygf.f("DialogFragment class was not set");
            return null;
        }
        char cCharAt = str.charAt(0);
        Context context = this.c;
        if (cCharAt == '.') {
            str = context.getPackageName() + str;
        }
        w15 w15VarF = this.d.F();
        context.getClassLoader();
        j15 j15VarA = w15VarF.a(str);
        j15VarA.getClass();
        if (fb3.class.isAssignableFrom(j15VarA.getClass())) {
            fb3 fb3Var = (fb3) j15VarA;
            fb3Var.V(ba8Var.h.a());
            fb3Var.O.a(this.f);
            this.g.put(ba8Var.f, fb3Var);
            return fb3Var;
        }
        StringBuilder sb = new StringBuilder("Dialog destination ");
        String str2 = hb3Var.g;
        if (str2 != null) {
            ywb.g(ka1.v(sb, str2, " is not an instance of DialogFragment"));
            return null;
        }
        ygf.f("DialogFragment class was not set");
        return null;
    }

    public final void l(int i, ba8 ba8Var, boolean z) {
        ba8 ba8Var2 = (ba8) bu1.A0(i - 1, (List) b().e.a.getValue());
        boolean zP0 = bu1.p0((Iterable) b().f.a.getValue(), ba8Var2);
        b().f(ba8Var, z);
        if (ba8Var2 == null || zP0) {
            return;
        }
        b().c(ba8Var2);
    }
}
