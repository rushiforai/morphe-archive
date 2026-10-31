package o80;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.LauncherApps;
import android.database.Cursor;
import android.os.Parcel;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.TreeSet;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicInteger;
import ninja.sesame.lib.bridge.v1.IntegrationOnComplete;
import ninja.sesame.lib.bridge.v1.SesameInitOnComplete;
import ninja.sesame.lib.bridge.v1.ShortcutType;
import ninja.sesame.lib.bridge.v1.access.IntegrationActivity;

/* loaded from: classes5.dex */
public abstract class i {

    /* renamed from: d, reason: collision with root package name */
    public static d f79736d;

    /* renamed from: a, reason: collision with root package name */
    public static final AtomicInteger f79733a = new AtomicInteger(0);

    /* renamed from: b, reason: collision with root package name */
    public static g f79734b = null;

    /* renamed from: c, reason: collision with root package name */
    public static p80.c f79735c = null;

    /* renamed from: e, reason: collision with root package name */
    public static final ExecutorService f79737e = Executors.newSingleThreadExecutor();

    /* renamed from: f, reason: collision with root package name */
    public static final ExecutorService f79738f = Executors.newFixedThreadPool(6, new c(0));

    public static ArrayList a(int i5, String str, boolean z11) {
        ArrayList arrayList = new ArrayList();
        if (f() && a.f79714a) {
            try {
                return ((p80.a) f79735c).X(i5, str, z11 ? new String[]{ShortcutType.DEEP_LINK, ShortcutType.TEMP_DEEP_LINK, ShortcutType.CONTACT} : new String[]{ShortcutType.DEEP_LINK, ShortcutType.CONTACT});
            } catch (Throwable th2) {
                t2.c.m(th2);
            }
        }
        return arrayList;
    }

    public static void b(Context context, int i5, int i11, int i12, int i13) {
        try {
            String str = i5 + "," + i11 + "," + i12 + "," + i13;
            if (vh.a.f92769e == null) {
                if (vh.a.f92768d == null) {
                    vh.a.f92768d = context.getSharedPreferences("sesame_lib_prefs", 0);
                }
                vh.a.f92769e = vh.a.f92768d.edit();
            }
            vh.a.f92769e.putString("customIntegrationDialogParams", str).commit();
        } catch (Throwable th2) {
            t2.c.m(th2);
        }
    }

    public static void c(Context context, String str) {
        if (f() && a.f79714a) {
            new h(context, str).executeOnExecutor(f79737e, new Void[0]);
        }
    }

    public static void d(Context context, SesameInitOnComplete sesameInitOnComplete) {
        try {
            Context applicationContext = context.getApplicationContext();
            b.f79718b = applicationContext.getPackageName() + ".sesame-lib.icons";
            if (vh.a.f92768d == null) {
                vh.a.f92768d = applicationContext.getSharedPreferences("sesame_lib_prefs", 0);
            }
            a.f79714a = vh.a.f92768d.getBoolean("isIntegrationEnabled", false);
            try {
                f79734b = new g(applicationContext, sesameInitOnComplete);
                if (!applicationContext.bindService(new Intent().setComponent(new ComponentName("ninja.sesame.app.edge", "ninja.sesame.lib.bridge.v1_1.SesameConnect")), f79734b, 1) && sesameInitOnComplete != null) {
                    sesameInitOnComplete.onDisconnect();
                }
            } catch (Throwable th2) {
                t2.c.m(th2);
            }
            try {
                LauncherApps launcherApps = (LauncherApps) applicationContext.getSystemService("launcherapps");
                if (launcherApps != null) {
                    d dVar = f79736d;
                    if (dVar != null) {
                        try {
                            launcherApps.unregisterCallback(dVar);
                        } catch (Throwable unused) {
                        }
                    }
                    d dVar2 = new d(applicationContext);
                    f79736d = dVar2;
                    launcherApps.registerCallback(dVar2);
                }
            } catch (Throwable th3) {
                t2.c.m(th3);
            }
        } catch (Throwable th4) {
            t2.c.m(th4);
        }
    }

    public static void e(Context context, boolean z11, IntegrationOnComplete integrationOnComplete) {
        try {
            if (vh.a.f92769e == null) {
                if (vh.a.f92768d == null) {
                    vh.a.f92768d = context.getSharedPreferences("sesame_lib_prefs", 0);
                }
                vh.a.f92769e = vh.a.f92768d.edit();
            }
            vh.a.f92769e.putBoolean("isIntegrationEnabled", z11).commit();
            a.f79714a = z11;
            a.f79716c = integrationOnComplete;
            Intent intent = new Intent(context, (Class<?>) IntegrationActivity.class);
            intent.setAction("ninja.sesame.app.action.ENABLE_INTEGRATION");
            intent.putExtra("package", context.getPackageName());
            intent.putExtra("isIntegrationEnabled", z11);
            if (!(context instanceof Activity)) {
                intent.addFlags(268435456);
            }
            context.startActivity(intent);
        } catch (Throwable th2) {
            t2.c.m(th2);
        }
    }

    public static boolean f() {
        try {
            return f79735c != null;
        } catch (Throwable th2) {
            t2.c.m(th2);
            return false;
        }
    }

    public static void g() {
        p80.c cVar;
        try {
            if (f() && a.f79714a && (cVar = f79735c) != null) {
                p80.a aVar = (p80.a) cVar;
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken("ninja.sesame.lib.bridge.v1_1.ISesameConnect");
                    aVar.f82455a.transact(6, parcelObtain, parcelObtain2, 0);
                    parcelObtain2.readException();
                    ArrayList<String> arrayListCreateStringArrayList = parcelObtain2.createStringArrayList();
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                    TreeSet treeSet = a.f79715b;
                    treeSet.clear();
                    treeSet.addAll(arrayListCreateStringArrayList);
                } catch (Throwable th2) {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                    throw th2;
                }
            }
        } catch (Throwable th3) {
            t2.c.m(th3);
        }
    }

    public static boolean h(Context context) {
        Cursor cursor = null;
        try {
            String packageName = context.getPackageName();
            Cursor cursorQuery = context.getContentResolver().query(b.f79717a.buildUpon().appendQueryParameter("package", packageName).build(), null, null, null, null);
            if (cursorQuery != null && cursorQuery.moveToNext()) {
                String string = cursorQuery.getString(cursorQuery.getColumnIndex("package"));
                if (TextUtils.equals(packageName, string)) {
                    boolean z11 = Boolean.parseBoolean(cursorQuery.getString(cursorQuery.getColumnIndex("enabled")));
                    if (!cursorQuery.isClosed()) {
                        try {
                            cursorQuery.close();
                        } catch (Throwable unused) {
                        }
                    }
                    return z11;
                }
                t2.c.l("Sesame returned unexpected integration package: ctxPkg=%s, resultPkg=%s", packageName, string);
                if (!cursorQuery.isClosed()) {
                    try {
                        cursorQuery.close();
                    } catch (Throwable unused2) {
                    }
                    return false;
                }
            } else if (cursorQuery != null && !cursorQuery.isClosed()) {
                try {
                    cursorQuery.close();
                } catch (Throwable unused3) {
                }
                return false;
            }
        } catch (Throwable th2) {
            try {
                t2.c.m(th2);
                if (0 != 0 && !cursor.isClosed()) {
                    try {
                        cursor.close();
                    } catch (Throwable unused4) {
                    }
                }
            } finally {
            }
        }
        return false;
    }
}
