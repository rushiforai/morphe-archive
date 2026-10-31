package bn;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class n0 {

    /* renamed from: a, reason: collision with root package name */
    public static final n0 f18251a = new n0();

    /* renamed from: b, reason: collision with root package name */
    public static final vm.c f18252b;

    static {
        im.d dVar = new im.d();
        dVar.a(m0.class, g.f18189a);
        dVar.a(v0.class, h.f18200a);
        dVar.a(l.class, e.f18178a);
        dVar.a(b.class, d.f18160a);
        dVar.a(a.class, c.f18139a);
        dVar.a(d0.class, f.f18184a);
        dVar.f61648d = true;
        f18252b = new vm.c(dVar, 14);
    }

    public static b a(ul.g gVar) throws PackageManager.NameNotFoundException {
        gVar.a();
        Context context = gVar.f91320a;
        Intrinsics.f(context, "getApplicationContext(...)");
        String packageName = context.getPackageName();
        PackageInfo packageInfo = context.getPackageManager().getPackageInfo(packageName, 0);
        String strValueOf = Build.VERSION.SDK_INT >= 28 ? String.valueOf(packageInfo.getLongVersionCode()) : String.valueOf(packageInfo.versionCode);
        gVar.a();
        String str = gVar.f91322c.f91336b;
        Intrinsics.f(str, "getApplicationId(...)");
        String MODEL = Build.MODEL;
        Intrinsics.f(MODEL, "MODEL");
        String RELEASE = Build.VERSION.RELEASE;
        Intrinsics.f(RELEASE, "RELEASE");
        w wVar = w.f18303b;
        Intrinsics.d(packageName);
        String str2 = packageInfo.versionName;
        String str3 = str2 == null ? strValueOf : str2;
        String MANUFACTURER = Build.MANUFACTURER;
        Intrinsics.f(MANUFACTURER, "MANUFACTURER");
        gVar.a();
        d0 d0VarZ = bh.g.Z(context);
        gVar.a();
        return new b(str, new a(packageName, str3, strValueOf, d0VarZ, bh.g.U(context)));
    }
}
