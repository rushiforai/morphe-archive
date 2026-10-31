package ae;

import ads_mobile_sdk.ew1;
import android.content.ComponentName;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Process;
import android.util.Base64;
import android.view.MotionEvent;
import b20.o;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.android.storage.AndroidStorageContextV1;
import com.amplitude.android.storage.AndroidStorageContextV2;
import com.amplitude.android.utilities.AndroidStorage;
import com.amplitude.core.diagnostics.DiagnosticsClient;
import com.amplitude.core.diagnostics.DiagnosticsClientProvider;
import com.google.android.gms.tasks.Task;
import com.google.firebase.crashlytics.internal.common.SessionReportingCoordinator;
import com.google.firebase.crashlytics.internal.common.Utils;
import com.google.firebase.crashlytics.internal.concurrency.CrashlyticsWorker;
import com.teslacoilsw.launcher.preferences.AdaptiveIconSettingsActivity;
import com.teslacoilsw.launcher.preferences.SettingsActivityLegacy;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView;
import com.teslacoilsw.launcher.util.NamedIntent;
import cw.c0;
import e00.b4;
import e10.a3;
import e10.l2;
import e10.y2;
import ep.p;
import ep.u;
import f10.n;
import fa.h0;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.CountDownLatch;
import kotlin.jvm.functions.Function1;
import l1.a2;
import o9.t1;

/* loaded from: classes3.dex */
public final /* synthetic */ class i implements ce.a, fi.g, fi.f, DiagnosticsClientProvider, fi.c, mb0.b, d9.i, mb0.e, p {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f12761a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f12762b;

    public /* synthetic */ i(Object obj, int i5) {
        this.f12761a = i5;
        this.f12762b = obj;
    }

    @Override // ep.p
    public Object a() {
        int i5 = this.f12761a;
        Object obj = this.f12762b;
        switch (i5) {
            case 26:
                Class cls = (Class) obj;
                try {
                    return u.f52903a.a(cls);
                } catch (Exception e3) {
                    throw new RuntimeException("Unable to create instance of " + cls + ". Registering an InstanceCreator or a TypeAdapter for this type, or adding a no-args constructor may fix this problem.", e3);
                }
            default:
                Constructor constructor = (Constructor) obj;
                try {
                    return constructor.newInstance(null);
                } catch (IllegalAccessException e11) {
                    g90.k kVar = hp.c.f59955a;
                    throw new RuntimeException("Unexpected IllegalAccessException occurred (Gson 2.13.1). Certain ReflectionAccessFilter features require Java >= 9 to work correctly. If you are not using ReflectionAccessFilter, report this to the Gson maintainers.", e11);
                } catch (InstantiationException e12) {
                    throw new RuntimeException("Failed to invoke constructor '" + hp.c.b(constructor) + "' with no args", e12);
                } catch (InvocationTargetException e13) {
                    throw new RuntimeException("Failed to invoke constructor '" + hp.c.b(constructor) + "' with no args", e13.getCause());
                }
        }
    }

    @Override // mb0.b
    /* renamed from: b, reason: collision with other method in class */
    public void mo5b(Object obj) {
        int i5 = this.f12761a;
        Object obj2 = this.f12762b;
        switch (i5) {
            case 18:
                int i11 = AdaptiveIconSettingsActivity.C;
                ((b4) obj2).invoke(obj);
                break;
            case 24:
                ComponentName componentName = SettingsActivityLegacy.A;
                ((c0) obj2).invoke(obj);
                break;
            default:
                int i12 = FancyPrefView.J;
                ((n) obj2).invoke(obj);
                break;
        }
    }

    public void c(MotionEvent motionEvent) {
        ((ew1) this.f12762b).onTouch(null, motionEvent);
    }

    @Override // d9.i
    public void d(d9.c cVar) {
        int i5 = this.f12761a;
        int i11 = 0;
        Object obj = this.f12762b;
        switch (i5) {
            case 19:
                ya.j.f97149d.execute(new h0(((t1) t1.f80131h.h((AdaptiveIconSettingsActivity) obj)).f80133b.g(false, false, null), i11));
                AdaptiveIconSettingsActivity.c0();
                break;
            case 25:
                SettingsActivityLegacy settingsActivityLegacy = (SettingsActivityLegacy) obj;
                ComponentName componentName = SettingsActivityLegacy.A;
                SharedPreferences.Editor editorEdit = a3.f51435a.f51545a.edit();
                y2.f51877a.getClass();
                editorEdit.putString(y2.p0().d(), new NamedIntent(settingsActivityLegacy.getString(2132019010), mx.c0.APP_SEARCH.b(), Process.myUserHandle()).e(settingsActivityLegacy)).apply();
                break;
            default:
                ((d9.c[]) obj)[0] = cVar;
                break;
        }
    }

    @Override // com.amplitude.core.diagnostics.DiagnosticsClientProvider
    public DiagnosticsClient get() {
        switch (this.f12761a) {
            case 8:
                return AndroidStorageContextV1.createAndroidStorage$lambda$0((AndroidStorageContextV1) this.f12762b);
            case 9:
                return AndroidStorageContextV2.createAndroidStorage$lambda$0((AndroidStorageContextV2) this.f12762b);
            default:
                return AndroidStorage.lambda$1$lambda$0((DiagnosticsClient) this.f12762b);
        }
    }

    @Override // fi.f
    public void i(Exception exc) {
        ((Function1) this.f12762b).invoke(exc);
    }

    @Override // ce.a
    public Object l() {
        SQLiteDatabase sQLiteDatabaseA;
        Cursor cursorRawQuery;
        int i5 = this.f12761a;
        int i11 = 1;
        Object obj = this.f12762b;
        switch (i5) {
            case 0:
                be.k kVar = (be.k) ((be.c) ((com.google.android.gms.internal.consent_sdk.d) obj).f32034i);
                sQLiteDatabaseA = kVar.a();
                sQLiteDatabaseA.beginTransaction();
                try {
                    sQLiteDatabaseA.compileStatement("DELETE FROM log_event_dropped").execute();
                    sQLiteDatabaseA.compileStatement("UPDATE global_log_event_state SET last_metrics_upload_ms=" + kVar.f17848b.getTime()).execute();
                    sQLiteDatabaseA.setTransactionSuccessful();
                    return null;
                } finally {
                }
            case 1:
                be.k kVar2 = (be.k) ((be.c) obj);
                kVar2.getClass();
                int i12 = wd.a.f94185e;
                a2 a2Var = new a2();
                a2Var.f73007a = null;
                a2Var.f73008b = new ArrayList();
                a2Var.f73009c = null;
                a2Var.f73010d = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                HashMap map = new HashMap();
                sQLiteDatabaseA = kVar2.a();
                sQLiteDatabaseA.beginTransaction();
                try {
                    wd.a aVar = (wd.a) be.k.l(sQLiteDatabaseA.rawQuery("SELECT log_source, reason, events_dropped_count FROM log_event_dropped", new String[0]), new be.f(i11, kVar2, map, a2Var));
                    sQLiteDatabaseA.setTransactionSuccessful();
                    return aVar;
                } finally {
                }
            case 2:
                be.k kVar3 = (be.k) ((be.d) obj);
                long time = kVar3.f17848b.getTime() - kVar3.f17850d.f17829d;
                sQLiteDatabaseA = kVar3.a();
                sQLiteDatabaseA.beginTransaction();
                try {
                    String[] strArr = {String.valueOf(time)};
                    cursorRawQuery = sQLiteDatabaseA.rawQuery("SELECT COUNT(*), transport_name FROM events WHERE timestamp_ms < ? GROUP BY transport_name", strArr);
                    while (cursorRawQuery.moveToNext()) {
                        try {
                            kVar3.e(cursorRawQuery.getInt(0), wd.c.MESSAGE_TOO_OLD, cursorRawQuery.getString(1));
                        } finally {
                        }
                    }
                    cursorRawQuery.close();
                    int iDelete = sQLiteDatabaseA.delete(DatabaseConstants.EVENT_TABLE_NAME, "timestamp_ms < ?", strArr);
                    sQLiteDatabaseA.setTransactionSuccessful();
                    sQLiteDatabaseA.endTransaction();
                    return Integer.valueOf(iDelete);
                } finally {
                }
            default:
                x7.h hVar = (x7.h) obj;
                sQLiteDatabaseA = ((be.k) ((be.d) hVar.f95138c)).a();
                sQLiteDatabaseA.beginTransaction();
                try {
                    cursorRawQuery = sQLiteDatabaseA.rawQuery("SELECT distinct t._id, t.backend_name, t.priority, t.extras FROM transport_contexts AS t, events AS e WHERE e.context_id = t._id", new String[0]);
                    try {
                        ArrayList arrayList = new ArrayList();
                        while (cursorRawQuery.moveToNext()) {
                            x7.u uVarA = td.i.a();
                            uVarA.v(cursorRawQuery.getString(1));
                            uVarA.f95210c = ee.a.b(cursorRawQuery.getInt(2));
                            String string = cursorRawQuery.getString(3);
                            uVarA.f95209b = string == null ? null : Base64.decode(string, 0);
                            arrayList.add(uVarA.d());
                        }
                        cursorRawQuery.close();
                        sQLiteDatabaseA.setTransactionSuccessful();
                        sQLiteDatabaseA.endTransaction();
                        Iterator it = arrayList.iterator();
                        while (it.hasNext()) {
                            ((x7.u) hVar.f95139d).t((td.i) it.next(), 1, false);
                        }
                        return null;
                    } finally {
                    }
                } finally {
                }
        }
    }

    @Override // fi.g
    public void onSuccess(Object obj) {
        int i5 = this.f12761a;
        Object obj2 = this.f12762b;
        switch (i5) {
            case 5:
                ((o) obj2).invoke(obj);
                break;
            case 15:
                ((a1.g) obj2).invoke(obj);
                break;
            case 16:
                ((a1.g) obj2).invoke(obj);
                break;
            case 17:
                ((a1.g) obj2).invoke(obj);
                break;
            case 22:
                ((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.stream.e) obj2).invoke(obj);
                break;
            default:
                ComponentName componentName = SettingsActivityLegacy.A;
                ((b4) obj2).invoke(obj);
                break;
        }
    }

    @Override // fi.c
    public Object then(Task task) {
        switch (this.f12761a) {
            case 11:
                return Boolean.valueOf(((SessionReportingCoordinator) this.f12762b).onReportSendComplete(task));
            case 12:
                return Utils.lambda$awaitEvenIfOnMainThread$0((CountDownLatch) this.f12762b, task);
            default:
                return CrashlyticsWorker.lambda$submitTaskOnSuccess$5((fi.i) this.f12762b, task);
        }
    }

    @Override // mb0.e
    public Object b(Object obj) {
        switch (this.f12761a) {
            case 20:
                return ((l2) this.f12762b).invoke(obj);
            default:
                return (Boolean) ((l2) this.f12762b).invoke(obj);
        }
    }
}
