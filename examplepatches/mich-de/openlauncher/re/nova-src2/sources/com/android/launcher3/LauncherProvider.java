package com.android.launcher3;

import aa.v;
import ab.m;
import android.app.backup.BackupManager;
import android.appwidget.AppWidgetManager;
import android.content.ComponentName;
import android.content.ContentProvider;
import android.content.ContentProviderOperation;
import android.content.ContentProviderResult;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.pm.ProviderInfo;
import android.content.res.Resources;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteQueryBuilder;
import android.database.sqlite.SQLiteStatement;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.Process;
import android.os.UserManager;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.Log;
import android.util.Xml;
import b.c0;
import bh.g;
import com.android.launcher3.LauncherProvider;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import e10.y2;
import e10.z2;
import ea.b;
import h6.c1;
import java.io.ByteArrayOutputStream;
import java.io.FileDescriptor;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Locale;
import java.util.concurrent.TimeUnit;
import java.util.function.Supplier;
import kotlin.NotImplementedError;
import la.a;
import mx.g0;
import o9.c2;
import o9.f0;
import o9.f2;
import o9.g3;
import o9.j;
import o9.t1;
import o9.z0;
import org.xmlpull.v1.XmlPullParser;
import ya.l0;
import ya.p;

/* loaded from: classes.dex */
public class LauncherProvider extends ContentProvider {

    /* renamed from: d, reason: collision with root package name */
    public static final long f20962d = TimeUnit.SECONDS.toMillis(30);

    /* renamed from: e, reason: collision with root package name */
    public static final Object f20963e = new Object();

    /* renamed from: a, reason: collision with root package name */
    public f2 f20964a;

    /* renamed from: b, reason: collision with root package name */
    public String f20965b;

    /* renamed from: c, reason: collision with root package name */
    public long f20966c = 0;

    public static int c(f2 f2Var, SQLiteDatabase sQLiteDatabase, String str, ContentValues contentValues) {
        long jInsert;
        if (contentValues == null) {
            throw new RuntimeException("Error: attempting to insert null values");
        }
        if ("allapps".equalsIgnoreCase(str)) {
            jInsert = sQLiteDatabase.replace(str, null, contentValues);
        } else {
            if (!"drawer_groups".equals(str) && !"appgroups".equals(str)) {
                if (!contentValues.containsKey("_id")) {
                    throw new RuntimeException("Error: attempting to add item without specifying an id");
                }
                f2Var.getClass();
                f2Var.f79833d = Math.max(contentValues.getAsInteger("_id").intValue(), f2Var.f79833d);
            }
            jInsert = sQLiteDatabase.insert(str, null, contentValues);
        }
        return (int) jInsert;
    }

    public static int e(SQLiteDatabase sQLiteDatabase, String str, Object... objArr) throws Throwable {
        String message;
        int i5 = 0;
        try {
            SQLiteStatement sQLiteStatementCompileStatement = sQLiteDatabase.compileStatement(String.format(Locale.ENGLISH, str, objArr));
            try {
                int iLongForQuery = (int) DatabaseUtils.longForQuery(sQLiteStatementCompileStatement, null);
                try {
                    if (iLongForQuery == -1) {
                        if (sQLiteStatementCompileStatement == null) {
                            return 0;
                        }
                        sQLiteStatementCompileStatement.close();
                        return 0;
                    }
                    if (iLongForQuery >= 0) {
                        if (sQLiteStatementCompileStatement != null) {
                            sQLiteStatementCompileStatement.close();
                        }
                        return iLongForQuery;
                    }
                    try {
                        throw new RuntimeException("Error: could not query max id, got " + iLongForQuery);
                    } catch (Throwable th2) {
                        th = th2;
                        i5 = iLongForQuery;
                        if (sQLiteStatementCompileStatement != null) {
                            try {
                                sQLiteStatementCompileStatement.close();
                            } catch (Throwable th3) {
                                th.addSuppressed(th3);
                            }
                        }
                        throw th;
                    }
                } catch (IllegalArgumentException e3) {
                    e = e3;
                    i5 = iLongForQuery;
                    message = e.getMessage();
                    if (message.contains("re-open") || !message.contains("already-closed")) {
                        throw e;
                    }
                    return i5;
                }
            } catch (Throwable th4) {
                th = th4;
            }
        } catch (IllegalArgumentException e11) {
            e = e11;
            message = e.getMessage();
            if (message.contains("re-open")) {
            }
            throw e;
        }
    }

    public static void h() {
        t1 t1VarD;
        if (Binder.getCallingPid() == Process.myPid() || (t1VarD = t1.d()) == null) {
            return;
        }
        t1VarD.f80133b.d();
    }

    public final synchronized void a() {
        if (this.f20964a == null) {
            this.f20964a = f2.a(getContext(), null, false);
            z2.D0(getContext(), this.f20964a);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0042  */
    @Override // android.content.ContentProvider
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final ContentProviderResult[] applyBatch(ArrayList arrayList) {
        boolean z11;
        a();
        a aVar = new a(this.f20964a.getWritableDatabase());
        try {
            int size = arrayList.size();
            ContentProviderResult[] contentProviderResultArr = new ContentProviderResult[size];
            boolean z12 = false;
            for (int i5 = 0; i5 < size; i5++) {
                ContentProviderOperation contentProviderOperation = (ContentProviderOperation) arrayList.get(i5);
                contentProviderResultArr[i5] = contentProviderOperation.apply(this, contentProviderResultArr, i5);
                if (contentProviderOperation.isInsert() || contentProviderOperation.isDelete()) {
                    Integer num = contentProviderResultArr[i5].count;
                    z11 = num != null && num.intValue() > 0;
                }
                z12 |= z11;
            }
            if (z12) {
                f(aVar.b());
            }
            aVar.a();
            h();
            aVar.close();
            return contentProviderResultArr;
        } catch (Throwable th2) {
            try {
                aVar.close();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    public final j b(m mVar) throws IOException {
        Context context = getContext();
        String string = !TextUtils.isEmpty(this.f20965b) ? this.f20965b : Settings.Secure.getString(context.getContentResolver(), "launcher3.layout.provider");
        if (TextUtils.isEmpty(string)) {
            return null;
        }
        ProviderInfo providerInfoResolveContentProvider = context.getPackageManager().resolveContentProvider(string, 0);
        if (providerInfoResolveContentProvider == null) {
            Log.e("LauncherProvider", "No provider found for authority " + string);
            return null;
        }
        z0 z0Var = (z0) z0.f80267w.h(context);
        try {
            InputStream inputStreamOpenInputStream = context.getContentResolver().openInputStream(new Uri.Builder().scheme("content").authority(string).path("launcher_layout").appendQueryParameter("version", "1").appendQueryParameter("gridWidth", Integer.toString(z0Var.f80269b)).appendQueryParameter("gridHeight", Integer.toString(z0Var.f80268a)).appendQueryParameter("hotseatSize", Integer.toString(z0Var.f80278k)).build());
            try {
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                l0.b(inputStreamOpenInputStream, byteArrayOutputStream);
                String str = new String(byteArrayOutputStream.toByteArray());
                XmlPullParser xmlPullParserNewPullParser = Xml.newPullParser();
                xmlPullParserNewPullParser.setInput(new StringReader(str));
                j jVar = new j(context, mVar, this.f20964a, context.getPackageManager().getResourcesForApplication(providerInfoResolveContentProvider.applicationInfo), new v(xmlPullParserNewPullParser, 3), "workspace");
                if (inputStreamOpenInputStream == null) {
                    return jVar;
                }
                inputStreamOpenInputStream.close();
                return jVar;
            } finally {
            }
        } catch (Exception e3) {
            Log.e("LauncherProvider", "Error getting layout stream from: " + string, e3);
            return null;
        }
    }

    @Override // android.content.ContentProvider
    public final int bulkInsert(Uri uri, ContentValues[] contentValuesArr) {
        String str;
        a();
        if (uri.getPathSegments().size() == 1) {
            str = uri.getPathSegments().get(0);
        } else {
            if (uri.getPathSegments().size() != 2) {
                throw new IllegalArgumentException(c1.p(uri, "Invalid URI: "));
            }
            String str2 = uri.getPathSegments().get(0);
            ContentUris.parseId(uri);
            str = str2;
        }
        SQLiteDatabase writableDatabase = this.f20964a.getWritableDatabase();
        a aVar = new a(writableDatabase);
        try {
            int length = contentValuesArr.length;
            for (int i5 = 0; i5 < length; i5++) {
                contentValuesArr[i5].put("modified", Long.valueOf(System.currentTimeMillis()));
                if (c(this.f20964a, writableDatabase, str, contentValuesArr[i5]) < 0) {
                    aVar.close();
                    return 0;
                }
            }
            f(writableDatabase);
            aVar.a();
            aVar.close();
            h();
            return contentValuesArr.length;
        } catch (Throwable th2) {
            try {
                aVar.close();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Finally extract failed */
    @Override // android.content.ContentProvider
    public final Bundle call(String str, final String str2, Bundle bundle) {
        final int i5;
        final int i11;
        final int i12;
        p pVar;
        a aVar;
        c10.a aVarO;
        Resources resourcesV;
        int identifier;
        if (Binder.getCallingUid() == Process.myUid()) {
            a();
            str.getClass();
            i5 = 2;
            i11 = 1;
            i12 = 0;
            switch (str) {
                case "delete_empty_folders":
                    Bundle bundle2 = new Bundle();
                    SQLiteDatabase writableDatabase = this.f20964a.getWritableDatabase();
                    try {
                        aVar = new a(writableDatabase);
                    } catch (SQLException e3) {
                        Log.e("LauncherProvider", e3.getMessage(), e3);
                        pVar = new p();
                    }
                    try {
                        pVar = g.h0(false, writableDatabase, "_id", "itemType = 2 AND intent is null AND _id NOT IN (SELECT container FROM favorites)", null);
                        if (!pVar.isEmpty()) {
                            writableDatabase.delete("favorites", g3.e(pVar), null);
                        }
                        aVar.a();
                        aVar.close();
                        bundle2.putIntArray("value", pVar.q());
                        return bundle2;
                    } catch (Throwable th2) {
                        try {
                            aVar.close();
                            throw th2;
                        } catch (Throwable th3) {
                            th2.addSuppressed(th3);
                            throw th2;
                        }
                    }
                case "remove_ghost_widgets":
                    f2 f2Var = this.f20964a;
                    f2Var.e(f2Var.getWritableDatabase());
                    return null;
                case "restore_backup_table":
                    long jCurrentTimeMillis = System.currentTimeMillis();
                    if (jCurrentTimeMillis - this.f20966c > f20962d) {
                        this.f20966c = jCurrentTimeMillis;
                        Context context = getContext();
                        f2 f2Var2 = this.f20964a;
                        BackupManager backupManager = new BackupManager(getContext());
                        SQLiteDatabase writableDatabase2 = f2Var2.getWritableDatabase();
                        try {
                            a aVar2 = new a(writableDatabase2);
                            try {
                                z2.E0(backupManager, context, writableDatabase2, f2Var2);
                                aVar2.a();
                                aVar2.close();
                                break;
                            } finally {
                            }
                        } catch (Exception e11) {
                            b.c("Failed to restore db", e11);
                            break;
                        }
                    }
                    break;
                case "generate_new_item_id":
                    Bundle bundle3 = new Bundle();
                    bundle3.putInt("value", this.f20964a.c());
                    return bundle3;
                case "generate_new_screen_id":
                    Bundle bundle4 = new Bundle();
                    f2 f2Var3 = this.f20964a;
                    int i13 = f2.f79830h;
                    bundle4.putInt("value", e(f2Var3.getWritableDatabase(), "SELECT MAX(%1$s) FROM %2$s WHERE %3$s = %4$d AND %1$s >= 0", "screen", "favorites", "container", -100) + 1);
                    return bundle4;
                case "prep_for_preview":
                    Bundle bundle5 = new Bundle();
                    bundle5.putBoolean("value", g(str2, "favorites_preview", new Supplier() { // from class: o9.e2
                        @Override // java.util.function.Supplier
                        public final Object get() {
                            Object obj = LauncherProvider.f20963e;
                            return f2.a(this.f79817a.getContext(), str2, true);
                        }
                    }, new Supplier(this) { // from class: o9.d2

                        /* renamed from: b, reason: collision with root package name */
                        public final /* synthetic */ LauncherProvider f79807b;

                        {
                            this.f79807b = this;
                        }

                        @Override // java.util.function.Supplier
                        public final Object get() {
                            int i14 = i5;
                            LauncherProvider launcherProvider = this.f79807b;
                            switch (i14) {
                                case 0:
                                    return launcherProvider.f20964a;
                                case 1:
                                    Object obj = LauncherProvider.f20963e;
                                    return f2.a(launcherProvider.getContext(), null, true);
                                default:
                                    return launcherProvider.f20964a;
                            }
                        }
                    }));
                    return bundle5;
                case "clear_empty_db_flag":
                    g3.l(getContext()).edit().remove(this.f20964a.d()).commit();
                    return null;
                case "switch_database":
                    if (!TextUtils.equals(str2, this.f20964a.getDatabaseName())) {
                        f2 f2Var4 = this.f20964a;
                        if (bundle == null || !bundle.containsKey("KEY_LAYOUT_PROVIDER_AUTHORITY")) {
                            this.f20965b = null;
                        } else {
                            this.f20965b = bundle.getString("KEY_LAYOUT_PROVIDER_AUTHORITY");
                        }
                        this.f20964a = f2.a(getContext(), str2, false);
                        f2Var4.close();
                        t1 t1VarD = t1.d();
                        if (t1VarD != null) {
                            t1VarD.f80133b.d();
                            return null;
                        }
                    }
                    break;
                case "desktop_grid_from_db":
                    return new Bundle();
                case "restore_hotseat_table":
                    f2 f2Var5 = this.f20964a;
                    f2Var5.f79835f = g.k0(f2Var5.getReadableDatabase(), "hotseat_restore_backup");
                    return null;
                case "load_default_favorites":
                    synchronized (this) {
                        try {
                            if (g3.l(getContext()).getBoolean(this.f20964a.d(), false)) {
                                f2 f2Var6 = this.f20964a;
                                f2Var6.getClass();
                                m mVar = new m(f2Var6.f79831b, null);
                                j jVarB = b(mVar);
                                Context context2 = g0.f77088a;
                                boolean zO = g0.o();
                                if (jVarB == null && zO) {
                                    jVarB = j.c(getContext(), mVar, this.f20964a);
                                }
                                if (jVarB == null && zO && (aVarO = c10.a.o(getContext().getPackageManager())) != null && aVarO.x() && (identifier = (resourcesV = aVarO.v()).getIdentifier("partner_default_layout", "xml", aVarO.u())) != 0) {
                                    jVarB = new f0(getContext(), mVar, this.f20964a, resourcesV, identifier);
                                }
                                if (jVarB == null) {
                                    i11 = 0;
                                }
                                if (jVarB == null) {
                                    jVarB = d(mVar);
                                }
                                f2 f2Var7 = this.f20964a;
                                f2Var7.b(f2Var7.getWritableDatabase());
                                f2 f2Var8 = this.f20964a;
                                SQLiteDatabase writableDatabase3 = f2Var8.getWritableDatabase();
                                int iH = jVarB.h(writableDatabase3, new p());
                                f2Var8.f79833d = e(writableDatabase3, "SELECT MAX(%1$s) FROM %2$s", "_id", "favorites");
                                if (iH <= 0 && i11 != 0) {
                                    f2 f2Var9 = this.f20964a;
                                    f2Var9.b(f2Var9.getWritableDatabase());
                                    f2 f2Var10 = this.f20964a;
                                    SQLiteDatabase writableDatabase4 = f2Var10.getWritableDatabase();
                                    d(mVar).h(writableDatabase4, new p());
                                    f2Var10.f79833d = e(writableDatabase4, "SELECT MAX(%1$s) FROM %2$s", "_id", "favorites");
                                }
                                g3.l(getContext()).edit().remove(this.f20964a.d()).commit();
                            }
                        } finally {
                        }
                    }
                    return null;
                case "get_empty_db_flag":
                    Bundle bundle6 = new Bundle();
                    bundle6.putBoolean("value", g3.l(getContext()).getBoolean(this.f20964a.d(), false));
                    return bundle6;
                case "update_current_open_helper":
                    Bundle bundle7 = new Bundle();
                    bundle7.putBoolean("value", g(((z0) z0.f80267w.h(getContext())).o, "favorites_tmp", new Supplier(this) { // from class: o9.d2

                        /* renamed from: b, reason: collision with root package name */
                        public final /* synthetic */ LauncherProvider f79807b;

                        {
                            this.f79807b = this;
                        }

                        @Override // java.util.function.Supplier
                        public final Object get() {
                            int i14 = i12;
                            LauncherProvider launcherProvider = this.f79807b;
                            switch (i14) {
                                case 0:
                                    return launcherProvider.f20964a;
                                case 1:
                                    Object obj = LauncherProvider.f20963e;
                                    return f2.a(launcherProvider.getContext(), null, true);
                                default:
                                    return launcherProvider.f20964a;
                            }
                        }
                    }, new Supplier(this) { // from class: o9.d2

                        /* renamed from: b, reason: collision with root package name */
                        public final /* synthetic */ LauncherProvider f79807b;

                        {
                            this.f79807b = this;
                        }

                        @Override // java.util.function.Supplier
                        public final Object get() {
                            int i14 = i11;
                            LauncherProvider launcherProvider = this.f79807b;
                            switch (i14) {
                                case 0:
                                    return launcherProvider.f20964a;
                                case 1:
                                    Object obj = LauncherProvider.f20963e;
                                    return f2.a(launcherProvider.getContext(), null, true);
                                default:
                                    return launcherProvider.f20964a;
                            }
                        }
                    }));
                    return bundle7;
                case "refresh_backup_table":
                    f2 f2Var11 = this.f20964a;
                    f2Var11.f79834e = g.k0(f2Var11.getReadableDatabase(), "favorites_bakup");
                    return null;
                case "desktop_page_count":
                    Bundle bundle8 = new Bundle();
                    bundle8.putInt("value", ((Integer) y2.f51877a.x().l()).intValue());
                    return bundle8;
                case "new_db_transaction":
                    Bundle bundle9 = new Bundle();
                    bundle9.putBinder("value", new a(this.f20964a.getWritableDatabase()));
                    return bundle9;
                case "create_empty_db":
                    throw new NotImplementedError("METHOD_CREATE_EMPTY_DB");
            }
        }
        return null;
    }

    public final f0 d(m mVar) {
        int i5;
        z0 z0VarA = t1.a(getContext());
        return new f0(getContext(), mVar, this.f20964a, getContext().getResources(), (!((UserManager) getContext().getSystemService(UserManager.class)).isDemoUser() || (i5 = z0VarA.f80282q) == 0) ? z0VarA.f80281p : i5);
    }

    @Override // android.content.ContentProvider
    public final int delete(Uri uri, String str, String[] strArr) throws SQLException {
        String str2;
        a();
        if (uri.getPathSegments().size() == 1) {
            str2 = uri.getPathSegments().get(0);
        } else {
            if (uri.getPathSegments().size() != 2) {
                throw new IllegalArgumentException(c1.p(uri, "Invalid URI: "));
            }
            if (!TextUtils.isEmpty(str)) {
                throw new UnsupportedOperationException(c1.p(uri, "WHERE clause not supported: "));
            }
            str2 = uri.getPathSegments().get(0);
            str = "_id=" + ContentUris.parseId(uri);
            strArr = null;
        }
        SQLiteDatabase writableDatabase = this.f20964a.getWritableDatabase();
        if (Binder.getCallingPid() != Process.myPid() && "favorites".equalsIgnoreCase(str2)) {
            f2 f2Var = this.f20964a;
            f2Var.e(f2Var.getWritableDatabase());
        }
        int iDelete = writableDatabase.delete(str2, str, strArr);
        if (iDelete > 0) {
            if (!InneractiveMediationDefs.SHOW_HOUSE_AD_YES.equals(uri.getQueryParameter("keepBackupTable"))) {
                f(writableDatabase);
            }
            h();
        }
        return iDelete;
    }

    @Override // android.content.ContentProvider
    public final void dump(FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        t1 t1VarD = t1.d();
        if (t1VarD != null) {
            c2 c2Var = t1VarD.f80133b;
            if (c2Var.j()) {
                c2Var.b(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, printWriter, strArr);
            }
        }
    }

    public final void f(SQLiteDatabase sQLiteDatabase) throws SQLException {
        f2 f2Var = this.f20964a;
        if (f2Var.f79834e) {
            g.O(sQLiteDatabase, "favorites_bakup");
            f2Var.f79834e = false;
        }
        if (f2Var.f79835f) {
            g.O(sQLiteDatabase, "hotseat_restore_backup");
            f2Var.f79835f = false;
        }
    }

    public final synchronized boolean g(String str, String str2, Supplier supplier, Supplier supplier2) {
        if (TextUtils.equals(str, this.f20964a.getDatabaseName())) {
            return false;
        }
        f2 f2Var = (f2) supplier.get();
        this.f20964a = (f2) supplier2.get();
        g.H(f2Var.getReadableDatabase(), this.f20964a.getWritableDatabase(), str2, getContext());
        f2Var.close();
        return true;
    }

    @Override // android.content.ContentProvider
    public final String getType(Uri uri) {
        String str;
        String str2 = null;
        if (uri.getPathSegments().size() == 1) {
            str = uri.getPathSegments().get(0);
        } else {
            if (uri.getPathSegments().size() != 2) {
                throw new IllegalArgumentException(c1.p(uri, "Invalid URI: "));
            }
            if (!TextUtils.isEmpty(null)) {
                throw new UnsupportedOperationException(c1.p(uri, "WHERE clause not supported: "));
            }
            String str3 = uri.getPathSegments().get(0);
            str2 = "_id=" + ContentUris.parseId(uri);
            str = str3;
        }
        return TextUtils.isEmpty(str2) ? c0.k("vnd.android.cursor.dir/", str) : c0.k("vnd.android.cursor.item/", str);
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x00a1  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00bd  */
    @Override // android.content.ContentProvider
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Uri insert(Uri uri, ContentValues contentValues) throws SQLException {
        String str;
        int iC;
        a();
        if (uri.getPathSegments().size() == 1) {
            str = uri.getPathSegments().get(0);
        } else {
            if (uri.getPathSegments().size() != 2) {
                throw new IllegalArgumentException(c1.p(uri, "Invalid URI: "));
            }
            str = uri.getPathSegments().get(0);
            ContentUris.parseId(uri);
        }
        if (Binder.getCallingPid() != Process.myPid()) {
            contentValues.put("_id", Integer.valueOf(this.f20964a.c()));
            Integer asInteger = contentValues.getAsInteger("itemType");
            if (asInteger == null || asInteger.intValue() != 4 || contentValues.containsKey("appWidgetId")) {
                SQLiteDatabase writableDatabase = this.f20964a.getWritableDatabase();
                contentValues.put("modified", Long.valueOf(System.currentTimeMillis()));
                iC = c(this.f20964a, writableDatabase, str, contentValues);
                if (iC >= 0) {
                    f(writableDatabase);
                    Uri uriWithAppendedId = ContentUris.withAppendedId(uri, iC);
                    h();
                    return uriWithAppendedId;
                }
            } else {
                AppWidgetManager appWidgetManager = AppWidgetManager.getInstance(getContext());
                ComponentName componentNameUnflattenFromString = ComponentName.unflattenFromString(contentValues.getAsString("appWidgetProvider"));
                if (componentNameUnflattenFromString != null) {
                    try {
                        f2 f2Var = this.f20964a;
                        f2Var.getClass();
                        m mVar = new m(f2Var.f79831b, null);
                        int iAllocateAppWidgetId = mVar.allocateAppWidgetId();
                        contentValues.put("appWidgetId", Integer.valueOf(iAllocateAppWidgetId));
                        if (!appWidgetManager.bindAppWidgetIdIfAllowed(iAllocateAppWidgetId, componentNameUnflattenFromString)) {
                            mVar.deleteAppWidgetId(iAllocateAppWidgetId);
                            return null;
                        }
                        SQLiteDatabase writableDatabase2 = this.f20964a.getWritableDatabase();
                        contentValues.put("modified", Long.valueOf(System.currentTimeMillis()));
                        iC = c(this.f20964a, writableDatabase2, str, contentValues);
                        if (iC >= 0) {
                        }
                    } catch (RuntimeException e3) {
                        Log.e("LauncherProvider", "Failed to initialize external widget", e3);
                        return null;
                    }
                }
            }
        }
        return null;
    }

    @Override // android.content.ContentProvider
    public final boolean onCreate() {
        g0.f77091d = this;
        Context applicationContext = getContext().getApplicationContext();
        ((MainProcessInitializer) l0.e(MainProcessInitializer.class, applicationContext, 2132018184)).a(applicationContext);
        return true;
    }

    @Override // android.content.ContentProvider
    public final Cursor query(Uri uri, String[] strArr, String str, String[] strArr2, String str2) {
        String str3;
        a();
        if (uri.getPathSegments().size() == 1) {
            str3 = uri.getPathSegments().get(0);
        } else {
            if (uri.getPathSegments().size() != 2) {
                throw new IllegalArgumentException(c1.p(uri, "Invalid URI: "));
            }
            if (!TextUtils.isEmpty(str)) {
                throw new UnsupportedOperationException(c1.p(uri, "WHERE clause not supported: "));
            }
            str3 = uri.getPathSegments().get(0);
            str = "_id=" + ContentUris.parseId(uri);
            strArr2 = null;
        }
        String str4 = str;
        String[] strArr3 = strArr2;
        SQLiteQueryBuilder sQLiteQueryBuilder = new SQLiteQueryBuilder();
        sQLiteQueryBuilder.setTables(str3);
        Cursor cursorQuery = sQLiteQueryBuilder.query(this.f20964a.getWritableDatabase(), strArr, str4, strArr3, null, null, str2);
        Bundle bundle = new Bundle();
        bundle.putString("db_name", this.f20964a.getDatabaseName());
        cursorQuery.setExtras(bundle);
        cursorQuery.setNotificationUri(getContext().getContentResolver(), uri);
        return cursorQuery;
    }

    @Override // android.content.ContentProvider
    public final int update(Uri uri, ContentValues contentValues, String str, String[] strArr) {
        String str2;
        a();
        if (uri.getPathSegments().size() == 1) {
            str2 = uri.getPathSegments().get(0);
        } else {
            if (uri.getPathSegments().size() != 2) {
                throw new IllegalArgumentException(c1.p(uri, "Invalid URI: "));
            }
            if (!TextUtils.isEmpty(str)) {
                throw new UnsupportedOperationException(c1.p(uri, "WHERE clause not supported: "));
            }
            String str3 = uri.getPathSegments().get(0);
            strArr = null;
            str = "_id=" + ContentUris.parseId(uri);
            str2 = str3;
        }
        contentValues.put("modified", Long.valueOf(System.currentTimeMillis()));
        int iUpdate = this.f20964a.getWritableDatabase().update(str2, contentValues, str, strArr);
        StringBuilder sbW = c0.w("update ", str2, " ", str, " ");
        sbW.append(strArr);
        sbW.append(" Values=");
        sbW.append(contentValues);
        b.a("LauncherProvider", sbW.toString());
        h();
        return iUpdate;
    }
}
