package c3;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.os.Binder;
import android.os.Process;
import com.google.android.gms.internal.measurement.v6;

/* loaded from: classes.dex */
public final class a1 implements q3.m {

    /* renamed from: a, reason: collision with root package name */
    public Context f19206a;

    public /* synthetic */ a1(Context context) {
        this.f19206a = context;
    }

    public td.j a() {
        Context context = this.f19206a;
        if (context == null) {
            throw new IllegalStateException(Context.class.getCanonicalName() + " must be set");
        }
        td.j jVar = new td.j();
        jVar.f88988a = vd.a.a(td.m.f88996a);
        v6 v6Var = new v6(context, 22);
        jVar.f88989b = v6Var;
        jVar.f88990c = vd.a.a(new ab.c0(6, v6Var, new vm.c(v6Var, 23)));
        v6 v6Var2 = jVar.f88989b;
        int i5 = 4;
        jVar.f88991d = new v6(v6Var2, i5);
        w60.a aVarA = vd.a.a(new ab.c0(2, jVar.f88991d, vd.a.a(new vm.c(v6Var2, i5))));
        jVar.f88992e = aVarA;
        o2.f fVar = new o2.f(21);
        v6 v6Var3 = jVar.f88989b;
        i50.c cVar = new i50.c(17, v6Var3, aVarA, fVar);
        w60.a aVar = jVar.f88988a;
        w60.a aVar2 = jVar.f88990c;
        qp.i iVar = new qp.i(aVar, aVar2, cVar, aVarA, aVarA);
        ae.l lVar = new ae.l();
        lVar.f12771a = v6Var3;
        lVar.f12772b = aVar2;
        lVar.f12773c = aVarA;
        lVar.f12777g = cVar;
        lVar.f12774d = aVar;
        lVar.f12775e = aVarA;
        lVar.f12776f = aVarA;
        jVar.f88993f = vd.a.a(new i50.c(12, iVar, lVar, new x7.n(aVar, aVarA, cVar, aVarA)));
        return jVar;
    }

    public ApplicationInfo b(int i5, String str) {
        return this.f19206a.getPackageManager().getApplicationInfo(str, i5);
    }

    public PackageInfo c(int i5, String str) {
        return this.f19206a.getPackageManager().getPackageInfo(str, i5);
    }

    public boolean d() {
        Context context = this.f19206a;
        if (Binder.getCallingUid() == Process.myUid()) {
            return zg.a.M(context);
        }
        String nameForUid = context.getPackageManager().getNameForUid(Binder.getCallingUid());
        if (nameForUid != null) {
            return context.getPackageManager().isInstantApp(nameForUid);
        }
        return false;
    }
}
