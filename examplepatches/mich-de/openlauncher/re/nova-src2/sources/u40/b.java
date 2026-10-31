package u40;

import android.app.AppOpsManager;
import android.content.Context;
import android.content.pm.PackageManager;
import io.branch.engage.sesame_lite.internal.AppUsageUpdater;
import io.branch.engage.sesame_lite.internal.DB;
import io.branch.engage.sesame_lite.internal.DataImporters;
import io.branch.engage.sesame_lite.internal.Prefs;
import io.branch.engage.sesame_lite.internal.SesameLiteImpl;
import io.branch.engage.sesame_lite.internal.State;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;
import t70.y0;

/* loaded from: classes4.dex */
public final class b implements j, l {

    /* renamed from: a, reason: collision with root package name */
    public static final b f90562a = new b();

    /* renamed from: b, reason: collision with root package name */
    public static final b f90563b = new b();

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ b f90564c = new b();

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(i iVar, ContinuationImpl continuationImpl) {
        e eVar;
        Context context;
        Prefs prefs;
        DB db2;
        if (continuationImpl instanceof e) {
            eVar = (e) continuationImpl;
            int i5 = eVar.f90583z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f90583z = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(this, continuationImpl);
            }
        }
        Object obj = eVar.f90581x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.f90583z;
        if (i11 == 0) {
            ResultKt.b(obj);
            State.INSTANCE.setLog(iVar.f90593b);
            context = iVar.f90592a.getApplicationContext();
            Intrinsics.f(context, "context");
            Prefs prefs2 = new Prefs(context);
            String string = prefs2.getString("db_name", "__ssml.db");
            DB db3 = new DB(context.getDatabasePath(string != null ? string : "__ssml.db"));
            a80.e eVar2 = y0.f88884a;
            a80.d dVar = a80.d.f488c;
            iv.b bVar = new iv.b(db3, null, 25);
            eVar.f90577t = iVar;
            eVar.f90578u = context;
            eVar.f90579v = prefs2;
            eVar.f90580w = db3;
            eVar.f90583z = 1;
            if (m0.y(dVar, bVar, eVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            prefs = prefs2;
            db2 = db3;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            DB db4 = eVar.f90580w;
            Prefs prefs3 = eVar.f90579v;
            context = eVar.f90578u;
            i iVar2 = eVar.f90577t;
            ResultKt.b(obj);
            db2 = db4;
            iVar = iVar2;
            prefs = prefs3;
        }
        Context context2 = context;
        Intrinsics.f(context2, "context");
        AppUsageUpdater appUsageUpdater = new AppUsageUpdater(context2, db2, prefs, iVar.f90594c);
        PackageManager packageManager = context2.getPackageManager();
        Intrinsics.f(packageManager, "context.packageManager");
        DataImporters dataImporters = new DataImporters(context2, db2, prefs, packageManager, appUsageUpdater, iVar.f90594c);
        Object systemService = context2.getSystemService((Class<Object>) AppOpsManager.class);
        Intrinsics.f(systemService, "context.getSystemService…ppOpsManager::class.java)");
        return new SesameLiteImpl(context2, prefs, db2, dataImporters, appUsageUpdater, (AppOpsManager) systemService, true, iVar.f90594c);
    }

    @Override // u40.j
    public void debug(String str, String msg) {
        Intrinsics.g(msg, "msg");
    }

    @Override // u40.j
    public void error(String str, String msg) {
        Intrinsics.g(msg, "msg");
    }

    @Override // u40.l
    public k getLevel() {
        return k.f90595a;
    }

    @Override // u40.l
    public /* bridge */ /* synthetic */ j getWriter() {
        return f90562a;
    }

    @Override // u40.j
    public void warn(String str, String msg) {
        Intrinsics.g(msg, "msg");
    }

    @Override // u40.j
    public void error(String str, Throwable th2) {
    }

    @Override // u40.j
    public void error(String str, Throwable th2, String msg) {
        Intrinsics.g(msg, "msg");
    }
}
