package r80;

import android.app.AppOpsManager;
import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.PackageManager;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import nova.branch.engage.sesame_lite.internal.AppUsageUpdater;
import nova.branch.engage.sesame_lite.internal.DB;
import nova.branch.engage.sesame_lite.internal.DataImporters;
import nova.branch.engage.sesame_lite.internal.Pkgs;
import nova.branch.engage.sesame_lite.internal.Prefs;
import nova.branch.engage.sesame_lite.internal.SesameLiteImpl;
import nova.branch.engage.sesame_lite.internal.State;
import t70.m0;
import t70.y0;

/* loaded from: classes.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ i f85682a = new i();

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(m mVar, ContinuationImpl continuationImpl) {
        h hVar;
        Context applicationContext;
        Pkgs pkgs;
        m mVar2;
        Context context;
        Prefs prefs;
        DB db2;
        m mVar3 = mVar;
        if (continuationImpl instanceof h) {
            hVar = (h) continuationImpl;
            int i5 = hVar.A;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hVar.A = i5 - Integer.MIN_VALUE;
            } else {
                hVar = new h(this, continuationImpl);
            }
        }
        Object obj = hVar.f85680y;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hVar.A;
        if (i11 == 0) {
            ResultKt.b(obj);
            State.INSTANCE.setLog(mVar3.f85695b);
            applicationContext = mVar3.f85694a.getApplicationContext();
            Intrinsics.d(applicationContext);
            pkgs = new Pkgs(applicationContext);
            hVar.f85675t = mVar3;
            hVar.f85676u = applicationContext;
            hVar.f85677v = pkgs;
            hVar.A = 1;
            if (pkgs.refreshDefaultPackages(hVar) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            DB db3 = hVar.f85679x;
            Prefs prefs2 = hVar.f85678w;
            pkgs = hVar.f85677v;
            Context context2 = hVar.f85676u;
            mVar2 = hVar.f85675t;
            ResultKt.b(obj);
            db2 = db3;
            prefs = prefs2;
            context = context2;
            Pkgs pkgs2 = pkgs;
            Intrinsics.d(context);
            vm.c cVar = mVar2.f85696c;
            vm.c cVar2 = mVar2.f85696c;
            AppUsageUpdater appUsageUpdater = new AppUsageUpdater(context, db2, prefs, cVar);
            ContentResolver contentResolver = context.getContentResolver();
            Intrinsics.f(contentResolver, "getContentResolver(...)");
            PackageManager packageManager = context.getPackageManager();
            Intrinsics.f(packageManager, "getPackageManager(...)");
            Prefs prefs3 = prefs;
            DB db4 = db2;
            DataImporters dataImporters = new DataImporters(context, db4, prefs3, pkgs2, contentResolver, packageManager, appUsageUpdater, cVar2);
            Object systemService = context.getSystemService((Class<Object>) AppOpsManager.class);
            Intrinsics.f(systemService, "getSystemService(...)");
            ContentResolver contentResolver2 = context.getContentResolver();
            Intrinsics.f(contentResolver2, "getContentResolver(...)");
            return new SesameLiteImpl(context, prefs3, pkgs2, db4, dataImporters, appUsageUpdater, (AppOpsManager) systemService, contentResolver2, true, cVar2);
        }
        Pkgs pkgs3 = hVar.f85677v;
        Context context3 = hVar.f85676u;
        m mVar4 = hVar.f85675t;
        ResultKt.b(obj);
        applicationContext = context3;
        pkgs = pkgs3;
        mVar3 = mVar4;
        Intrinsics.d(applicationContext);
        Prefs prefs4 = new Prefs(applicationContext, pkgs);
        String string = prefs4.getString("db_name", "__ssml.db");
        DB db5 = new DB(applicationContext.getDatabasePath(string != null ? string : "__ssml.db"));
        a80.e eVar = y0.f88884a;
        a80.d dVar = a80.d.f488c;
        e20.c cVar3 = new e20.c(db5, null, 14);
        hVar.f85675t = mVar3;
        hVar.f85676u = applicationContext;
        hVar.f85677v = pkgs;
        hVar.f85678w = prefs4;
        hVar.f85679x = db5;
        hVar.A = 2;
        if (m0.y(dVar, cVar3, hVar) != coroutineSingletons) {
            mVar2 = mVar3;
            context = applicationContext;
            prefs = prefs4;
            db2 = db5;
            Pkgs pkgs22 = pkgs;
            Intrinsics.d(context);
            vm.c cVar4 = mVar2.f85696c;
            vm.c cVar22 = mVar2.f85696c;
            AppUsageUpdater appUsageUpdater2 = new AppUsageUpdater(context, db2, prefs, cVar4);
            ContentResolver contentResolver3 = context.getContentResolver();
            Intrinsics.f(contentResolver3, "getContentResolver(...)");
            PackageManager packageManager2 = context.getPackageManager();
            Intrinsics.f(packageManager2, "getPackageManager(...)");
            Prefs prefs32 = prefs;
            DB db42 = db2;
            DataImporters dataImporters2 = new DataImporters(context, db42, prefs32, pkgs22, contentResolver3, packageManager2, appUsageUpdater2, cVar22);
            Object systemService2 = context.getSystemService((Class<Object>) AppOpsManager.class);
            Intrinsics.f(systemService2, "getSystemService(...)");
            ContentResolver contentResolver22 = context.getContentResolver();
            Intrinsics.f(contentResolver22, "getContentResolver(...)");
            return new SesameLiteImpl(context, prefs32, pkgs22, db42, dataImporters2, appUsageUpdater2, (AppOpsManager) systemService2, contentResolver22, true, cVar22);
        }
        return coroutineSingletons;
    }
}
