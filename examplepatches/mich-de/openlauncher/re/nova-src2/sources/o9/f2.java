package o9;

import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.pm.LauncherActivityInfo;
import android.content.pm.LauncherApps;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteStatement;
import android.os.Process;
import android.os.UserHandle;
import android.text.TextUtils;
import android.util.Log;
import com.amplitude.core.events.Plan;
import com.android.launcher3.LauncherProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;
import java.util.Iterator;
import java.util.regex.Pattern;

/* loaded from: classes.dex */
public final class f2 extends ya.d0 implements g {

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ int f79830h = 0;

    /* renamed from: b, reason: collision with root package name */
    public final Context f79831b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f79832c;

    /* renamed from: d, reason: collision with root package name */
    public int f79833d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f79834e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f79835f;

    /* renamed from: g, reason: collision with root package name */
    public int f79836g;

    public f2(Context context, String str, boolean z11) {
        super(context, str, 38);
        this.f79833d = -1;
        this.f79836g = -1;
        this.f79831b = context;
        this.f79832c = z11;
    }

    public static f2 a(Context context, String str, boolean z11) throws SQLException {
        if (str == null) {
            str = ((z0) z0.f80267w.h(context)).o;
        }
        f2 f2Var = new f2(context, str, z11);
        if (!bh.g.k0(f2Var.getReadableDatabase(), "favorites")) {
            Log.e("LauncherProvider", "Tables are missing after onCreate has been called. Trying to recreate");
            SQLiteDatabase writableDatabase = f2Var.getWritableDatabase();
            ((ja.h) ja.h.f69294h.h(f2Var.f79831b)).d(Process.myUserHandle());
            g2.a(writableDatabase, true, "favorites");
        }
        f2Var.f79835f = bh.g.k0(f2Var.getReadableDatabase(), "hotseat_restore_backup");
        if (f2Var.f79833d == -1) {
            f2Var.f79833d = LauncherProvider.e(f2Var.getWritableDatabase(), "SELECT MAX(%1$s) FROM %2$s", "_id", "favorites");
        }
        if (f2Var.f79836g == -1) {
            f2Var.f79836g = LauncherProvider.e(f2Var.getWritableDatabase(), "SELECT MAX(%1$s) FROM %2$s", "_id", "customIcons");
        }
        return f2Var;
    }

    public final void b(SQLiteDatabase sQLiteDatabase) {
        la.a aVar = new la.a(sQLiteDatabase);
        try {
            bh.g.O(sQLiteDatabase, "favorites");
            bh.g.O(sQLiteDatabase, "workspaceScreens");
            onCreate(sQLiteDatabase);
            aVar.a();
            aVar.close();
        } catch (Throwable th2) {
            try {
                aVar.close();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    public final int c() {
        int i5 = this.f79833d;
        if (i5 < 0) {
            throw new RuntimeException("Error: max item id was not initialized");
        }
        int i11 = i5 + 1;
        this.f79833d = i11;
        return i11;
    }

    public final String d() {
        if (TextUtils.equals(getDatabaseName(), "nova.db")) {
            return "EMPTY_DATABASE_CREATED";
        }
        return "EMPTY_DATABASE_CREATED@" + getDatabaseName();
    }

    public final void e(SQLiteDatabase sQLiteDatabase) {
        ab.m mVar = new ab.m(this.f79831b, null);
        try {
            int[] appWidgetIds = mVar.getAppWidgetIds();
            ya.r rVarE = ya.r.e(bh.g.h0(false, sQLiteDatabase, "appWidgetId", "itemType=4", null));
            rVarE.c(((Integer) e10.y2.f51877a.G().l()).intValue());
            for (int i5 : appWidgetIds) {
                if (!rVarE.d(i5)) {
                    try {
                        ea.b.a("LauncherProvider", "Deleting invalid widget " + i5);
                        mVar.deleteAppWidgetId(i5);
                    } catch (RuntimeException unused) {
                    }
                }
            }
        } catch (IncompatibleClassChangeError e3) {
            Log.e("LauncherProvider", "getAppWidgetIds not supported", e3);
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onCreate(SQLiteDatabase sQLiteDatabase) throws SQLException {
        this.f79833d = 1;
        this.f79836g = 0;
        UserHandle userHandleMyUserHandle = Process.myUserHandle();
        x7.c cVar = ja.h.f69294h;
        Context context = this.f79831b;
        ((ja.h) cVar.h(context)).d(userHandleMyUserHandle);
        g2.a(sQLiteDatabase, false, "favorites");
        try {
            uy.o0.a(sQLiteDatabase, context);
        } catch (Exception e3) {
            e3.printStackTrace();
        }
        try {
            ex.i.p(sQLiteDatabase);
        } catch (Exception e11) {
            e11.printStackTrace();
        }
        try {
            c00.g.a(sQLiteDatabase);
        } catch (Exception e12) {
            e12.printStackTrace();
        }
        this.f79833d = LauncherProvider.e(sQLiteDatabase, "SELECT MAX(%1$s) FROM %2$s", "_id", "favorites");
        z0 z0Var = (z0) z0.f80267w.h(context);
        int i5 = z0Var.f80269b;
        int i11 = z0Var.f80268a;
        int i12 = z0Var.f80278k;
        ContentValues contentValues = new ContentValues();
        contentValues.put("_id", (Integer) (-1));
        contentValues.put("itemType", (Integer) (-1));
        contentValues.put("rank", (Integer) 38);
        contentValues.put("spanX", Integer.valueOf(i5));
        contentValues.put("spanY", Integer.valueOf(i11));
        contentValues.put("screen", Integer.valueOf(i12));
        contentValues.put("options", (Integer) 0);
        sQLiteDatabase.insert("favorites", null, contentValues);
        if (this.f79832c) {
            return;
        }
        Pattern pattern = g3.f79846a;
        context.getApplicationContext().getSharedPreferences("com.android.launcher3.prefs", 0).edit().putBoolean(d(), true).commit();
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onDowngrade(SQLiteDatabase sQLiteDatabase, int i5, int i11) {
        try {
            fa.t.d(this.f79831b.getFileStreamPath("downgrade_schema.json")).c(sQLiteDatabase, i5, i11);
        } catch (Exception unused) {
            b(sQLiteDatabase);
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onOpen(SQLiteDatabase sQLiteDatabase) throws IOException, SQLException {
        super.onOpen(sQLiteDatabase);
        Context context = this.f79831b;
        File fileStreamPath = context.getFileStreamPath("downgrade_schema.json");
        if (!fileStreamPath.exists()) {
            ja.h hVar = (ja.h) ja.h.f69294h.h(context);
            Iterator it = hVar.f().iterator();
            while (it.hasNext()) {
                sQLiteDatabase.execSQL("update favorites set intent = replace(intent, ';l.profile=" + hVar.d((UserHandle) it.next()) + ";', ';') where itemType = 0;");
            }
        }
        try {
            if (fa.t.d(fileStreamPath).f54485a >= 38) {
                return;
            }
        } catch (Exception unused) {
        }
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(fileStreamPath);
            try {
                InputStream inputStreamOpenRawResource = context.getResources().openRawResource(2131951622);
                try {
                    ya.l0.b(inputStreamOpenRawResource, fileOutputStream);
                    if (inputStreamOpenRawResource != null) {
                        inputStreamOpenRawResource.close();
                    }
                    fileOutputStream.close();
                } finally {
                }
            } finally {
            }
        } catch (IOException e3) {
            Log.e("DbDowngradeHelper", "Error writing schema file", e3);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:107:0x0204  */
    /* JADX WARN: Type inference failed for: r21v0, types: [int] */
    /* JADX WARN: Type inference failed for: r21v1 */
    /* JADX WARN: Type inference failed for: r21v15 */
    /* JADX WARN: Type inference failed for: r21v2 */
    /* JADX WARN: Type inference failed for: r21v3 */
    /* JADX WARN: Type inference failed for: r21v4 */
    /* JADX WARN: Unreachable blocks removed: 2, instructions: 5 */
    @Override // android.database.sqlite.SQLiteOpenHelper
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onUpgrade(SQLiteDatabase sQLiteDatabase, int i5, int i11) throws Throwable {
        char c11;
        String str;
        String str2;
        la.a aVar;
        int i12;
        long j11;
        long j12;
        long j13;
        Cursor cursorRawQuery;
        long j14;
        long j15;
        Context context = this.f79831b;
        if (i5 <= 28) {
            k10.e.e(sQLiteDatabase, context);
            c11 = 29;
        } else {
            c11 = i5;
        }
        switch (c11) {
            case 29:
                sQLiteDatabase.execSQL("DELETE FROM favorites WHERE container == -102");
            case 30:
                sQLiteDatabase.execSQL("UPDATE drawer_groups SET tabColor = 262914 WHERE tabColor = 0 OR tabColor = -1");
            case 31:
                LauncherApps launcherApps = (LauncherApps) context.getSystemService(LauncherApps.class);
                UserHandle userHandleMyUserHandle = Process.myUserHandle();
                try {
                    la.a aVar2 = new la.a(sQLiteDatabase);
                    try {
                        i5 = -1;
                        j11 = -1;
                        i5 = -1;
                        try {
                            aVar = aVar2;
                            str = "LauncherProvider";
                            str2 = "_id";
                            try {
                                Cursor cursorQuery = sQLiteDatabase.query("favorites", new String[]{"_id", "intent"}, "itemType=1 AND profileId=" + ((ja.h) ja.h.f69294h.h(context)).d(Process.myUserHandle()), null, null, null, null);
                                try {
                                    SQLiteStatement sQLiteStatementCompileStatement = sQLiteDatabase.compileStatement("UPDATE favorites SET itemType=0 WHERE _id=?");
                                    try {
                                        SQLiteStatement sQLiteStatementCompileStatement2 = sQLiteDatabase.compileStatement("DELETE FROM favorites WHERE _id = ?");
                                        try {
                                            int columnIndexOrThrow = cursorQuery.getColumnIndexOrThrow(str2);
                                            int columnIndexOrThrow2 = cursorQuery.getColumnIndexOrThrow("intent");
                                            while (cursorQuery.moveToNext()) {
                                                String string = cursorQuery.getString(columnIndexOrThrow2);
                                                if (string == null) {
                                                    mc0.d.f76206a.n("Deleting shortcut with no intent", new Object[0]);
                                                    i12 = columnIndexOrThrow2;
                                                    sQLiteStatementCompileStatement2.bindLong(1, cursorQuery.getInt(columnIndexOrThrow));
                                                    sQLiteStatementCompileStatement2.executeUpdateDelete();
                                                } else {
                                                    i12 = columnIndexOrThrow2;
                                                    try {
                                                        Intent uri = Intent.parseUri(string, 0);
                                                        if (x7.e.y(uri)) {
                                                            Iterator<LauncherActivityInfo> it = launcherApps.getActivityList(uri.getComponent().getPackageName(), userHandleMyUserHandle).iterator();
                                                            while (true) {
                                                                if (!it.hasNext()) {
                                                                    break;
                                                                } else if (it.next().getComponentName().equals(uri.getComponent())) {
                                                                    sQLiteStatementCompileStatement.bindLong(1, cursorQuery.getInt(columnIndexOrThrow));
                                                                    sQLiteStatementCompileStatement.executeUpdateDelete();
                                                                }
                                                            }
                                                        }
                                                    } catch (URISyntaxException e3) {
                                                        Log.e(str, "Unable to parse intent", e3);
                                                    }
                                                }
                                                columnIndexOrThrow2 = i12;
                                            }
                                            aVar.a();
                                            if (sQLiteStatementCompileStatement2 != null) {
                                                sQLiteStatementCompileStatement2.close();
                                            }
                                            if (sQLiteStatementCompileStatement != null) {
                                                sQLiteStatementCompileStatement.close();
                                            }
                                            cursorQuery.close();
                                            aVar.close();
                                        } finally {
                                        }
                                    } catch (Throwable th2) {
                                        if (sQLiteStatementCompileStatement == null) {
                                            throw th2;
                                        }
                                        try {
                                            sQLiteStatementCompileStatement.close();
                                            throw th2;
                                        } catch (Throwable th3) {
                                            th2.addSuppressed(th3);
                                            throw th2;
                                        }
                                    }
                                } finally {
                                }
                            } catch (Throwable th4) {
                                th = th4;
                                Throwable th5 = th;
                                try {
                                    aVar.close();
                                    throw th5;
                                } catch (Throwable th6) {
                                    th5.addSuppressed(th6);
                                    throw th5;
                                }
                            }
                        } catch (Throwable th7) {
                            th = th7;
                            aVar = aVar2;
                            str = "LauncherProvider";
                            str2 = "_id";
                        }
                    } catch (SQLException e11) {
                        e = e11;
                        Log.w(str, "Error deduping shortcuts", e);
                        j11 = i5;
                        z0 z0Var = (z0) z0.f80267w.h(context);
                        int i13 = z0Var.f80269b;
                        int i14 = z0Var.f80268a;
                        int i15 = z0Var.f80278k;
                        int version = sQLiteDatabase.getVersion();
                        ContentValues contentValues = new ContentValues();
                        contentValues.put(str2, (Integer) (-1));
                        contentValues.put("itemType", (Integer) (-1));
                        contentValues.put("rank", Integer.valueOf(version));
                        contentValues.put("spanX", Integer.valueOf(i13));
                        contentValues.put("spanY", Integer.valueOf(i14));
                        contentValues.put("screen", Integer.valueOf(i15));
                        contentValues.put("options", (Integer) 0);
                        sQLiteDatabase.insertWithOnConflict("favorites", null, contentValues, 5);
                        j12 = j11;
                        sQLiteDatabase.execSQL("ALTER TABLE favorites ADD COLUMN customIconLoadedState TEXT");
                        sQLiteDatabase.execSQL("ALTER TABLE customIcons ADD COLUMN flags INTEGER NOT NULL DEFAULT 0");
                        j13 = j12;
                        sQLiteDatabase.execSQL("ALTER TABLE drawer_groups ADD COLUMN customIconSource TEXT");
                        sQLiteDatabase.execSQL("ALTER TABLE drawer_groups ADD COLUMN customIconLoadedState TEXT");
                        sQLiteDatabase.execSQL("ALTER TABLE drawer_groups ADD COLUMN flags INTEGER NOT NULL DEFAULT 0");
                        cursorRawQuery = sQLiteDatabase.rawQuery("SELECT _id, icon FROM drawer_groups WHERE icon IS NOT NULL", null);
                        if (cursorRawQuery.getCount() > 0) {
                        }
                        cursorRawQuery.close();
                        j14 = j13;
                        sQLiteDatabase.execSQL("UPDATE favorites SET novaFlags = (novaFlags | 64) WHERE itemType = 6 AND customIconSource is not null");
                        j15 = j14;
                        la.a aVar3 = new la.a(sQLiteDatabase);
                        try {
                            sQLiteDatabase.execSQL("ALTER TABLE favorites ADD COLUMN appWidgetSource INTEGER NOT NULL DEFAULT " + j15 + ";");
                            aVar3.a();
                            aVar3.close();
                            sQLiteDatabase.execSQL("ALTER TABLE drawer_groups  ADD COLUMN category_id TEXT");
                            return;
                        } finally {
                        }
                    }
                } catch (SQLException e12) {
                    e = e12;
                    str = "LauncherProvider";
                    str2 = "_id";
                    i5 = -1;
                }
                z0 z0Var2 = (z0) z0.f80267w.h(context);
                int i132 = z0Var2.f80269b;
                int i142 = z0Var2.f80268a;
                int i152 = z0Var2.f80278k;
                int version2 = sQLiteDatabase.getVersion();
                ContentValues contentValues2 = new ContentValues();
                contentValues2.put(str2, (Integer) (-1));
                contentValues2.put("itemType", (Integer) (-1));
                contentValues2.put("rank", Integer.valueOf(version2));
                contentValues2.put("spanX", Integer.valueOf(i132));
                contentValues2.put("spanY", Integer.valueOf(i142));
                contentValues2.put("screen", Integer.valueOf(i152));
                contentValues2.put("options", (Integer) 0);
                sQLiteDatabase.insertWithOnConflict("favorites", null, contentValues2, 5);
                j12 = j11;
                try {
                    sQLiteDatabase.execSQL("ALTER TABLE favorites ADD COLUMN customIconLoadedState TEXT");
                    sQLiteDatabase.execSQL("ALTER TABLE customIcons ADD COLUMN flags INTEGER NOT NULL DEFAULT 0");
                    j13 = j12;
                } catch (Exception e13) {
                    mc0.d.b(e13);
                    j13 = j12;
                }
                try {
                    sQLiteDatabase.execSQL("ALTER TABLE drawer_groups ADD COLUMN customIconSource TEXT");
                    sQLiteDatabase.execSQL("ALTER TABLE drawer_groups ADD COLUMN customIconLoadedState TEXT");
                    sQLiteDatabase.execSQL("ALTER TABLE drawer_groups ADD COLUMN flags INTEGER NOT NULL DEFAULT 0");
                } catch (Exception e14) {
                    mc0.d.b(e14);
                }
                cursorRawQuery = sQLiteDatabase.rawQuery("SELECT _id, icon FROM drawer_groups WHERE icon IS NOT NULL", null);
                if (cursorRawQuery.getCount() > 0) {
                    this.f79836g = LauncherProvider.e(sQLiteDatabase, "SELECT MAX(%1$s) FROM %2$s", str2, "customIcons");
                    int columnIndexOrThrow3 = cursorRawQuery.getColumnIndexOrThrow(str2);
                    int columnIndexOrThrow4 = cursorRawQuery.getColumnIndexOrThrow("icon");
                    while (cursorRawQuery.moveToNext()) {
                        int i16 = cursorRawQuery.getInt(columnIndexOrThrow3);
                        byte[] blob = cursorRawQuery.getBlob(columnIndexOrThrow4);
                        ContentValues contentValues3 = new ContentValues();
                        int i17 = this.f79836g + 1;
                        this.f79836g = i17;
                        contentValues3.put(str2, Integer.valueOf(i17));
                        contentValues3.putNull(Plan.AMP_PLAN_SOURCE);
                        contentValues3.put("icon", blob);
                        contentValues3.putNull("adaptivefg");
                        long jInsert = sQLiteDatabase.insert("customIcons", null, contentValues3);
                        if (jInsert != j13) {
                            ContentValues contentValues4 = new ContentValues();
                            contentValues4.putNull("icon");
                            contentValues4.put("customIconSource", "icontheme_content_table://com.teslacoilsw.launcher.settings/customIcons/" + jInsert);
                            sQLiteDatabase.update("drawer_groups", contentValues4, "_id = ?", new String[]{Integer.toString(i16)});
                        }
                    }
                }
                cursorRawQuery.close();
                j14 = j13;
                sQLiteDatabase.execSQL("UPDATE favorites SET novaFlags = (novaFlags | 64) WHERE itemType = 6 AND customIconSource is not null");
                j15 = j14;
                try {
                    la.a aVar32 = new la.a(sQLiteDatabase);
                    sQLiteDatabase.execSQL("ALTER TABLE favorites ADD COLUMN appWidgetSource INTEGER NOT NULL DEFAULT " + j15 + ";");
                    aVar32.a();
                    aVar32.close();
                    try {
                        sQLiteDatabase.execSQL("ALTER TABLE drawer_groups  ADD COLUMN category_id TEXT");
                        return;
                    } catch (Exception e15) {
                        mc0.d.b(e15);
                        return;
                    }
                } catch (SQLException e16) {
                    Log.e(str, e16.getMessage(), e16);
                    break;
                }
                break;
            case ' ':
                str = "LauncherProvider";
                str2 = "_id";
                j11 = -1;
                z0 z0Var22 = (z0) z0.f80267w.h(context);
                int i1322 = z0Var22.f80269b;
                int i1422 = z0Var22.f80268a;
                int i1522 = z0Var22.f80278k;
                int version22 = sQLiteDatabase.getVersion();
                ContentValues contentValues22 = new ContentValues();
                contentValues22.put(str2, (Integer) (-1));
                contentValues22.put("itemType", (Integer) (-1));
                contentValues22.put("rank", Integer.valueOf(version22));
                contentValues22.put("spanX", Integer.valueOf(i1322));
                contentValues22.put("spanY", Integer.valueOf(i1422));
                contentValues22.put("screen", Integer.valueOf(i1522));
                contentValues22.put("options", (Integer) 0);
                sQLiteDatabase.insertWithOnConflict("favorites", null, contentValues22, 5);
                j12 = j11;
                sQLiteDatabase.execSQL("ALTER TABLE favorites ADD COLUMN customIconLoadedState TEXT");
                sQLiteDatabase.execSQL("ALTER TABLE customIcons ADD COLUMN flags INTEGER NOT NULL DEFAULT 0");
                j13 = j12;
                sQLiteDatabase.execSQL("ALTER TABLE drawer_groups ADD COLUMN customIconSource TEXT");
                sQLiteDatabase.execSQL("ALTER TABLE drawer_groups ADD COLUMN customIconLoadedState TEXT");
                sQLiteDatabase.execSQL("ALTER TABLE drawer_groups ADD COLUMN flags INTEGER NOT NULL DEFAULT 0");
                cursorRawQuery = sQLiteDatabase.rawQuery("SELECT _id, icon FROM drawer_groups WHERE icon IS NOT NULL", null);
                if (cursorRawQuery.getCount() > 0) {
                }
                cursorRawQuery.close();
                j14 = j13;
                sQLiteDatabase.execSQL("UPDATE favorites SET novaFlags = (novaFlags | 64) WHERE itemType = 6 AND customIconSource is not null");
                j15 = j14;
                la.a aVar322 = new la.a(sQLiteDatabase);
                sQLiteDatabase.execSQL("ALTER TABLE favorites ADD COLUMN appWidgetSource INTEGER NOT NULL DEFAULT " + j15 + ";");
                aVar322.a();
                aVar322.close();
                sQLiteDatabase.execSQL("ALTER TABLE drawer_groups  ADD COLUMN category_id TEXT");
                return;
            case '!':
                str = "LauncherProvider";
                str2 = "_id";
                j12 = -1;
                sQLiteDatabase.execSQL("ALTER TABLE favorites ADD COLUMN customIconLoadedState TEXT");
                sQLiteDatabase.execSQL("ALTER TABLE customIcons ADD COLUMN flags INTEGER NOT NULL DEFAULT 0");
                j13 = j12;
                sQLiteDatabase.execSQL("ALTER TABLE drawer_groups ADD COLUMN customIconSource TEXT");
                sQLiteDatabase.execSQL("ALTER TABLE drawer_groups ADD COLUMN customIconLoadedState TEXT");
                sQLiteDatabase.execSQL("ALTER TABLE drawer_groups ADD COLUMN flags INTEGER NOT NULL DEFAULT 0");
                cursorRawQuery = sQLiteDatabase.rawQuery("SELECT _id, icon FROM drawer_groups WHERE icon IS NOT NULL", null);
                if (cursorRawQuery.getCount() > 0) {
                }
                cursorRawQuery.close();
                j14 = j13;
                sQLiteDatabase.execSQL("UPDATE favorites SET novaFlags = (novaFlags | 64) WHERE itemType = 6 AND customIconSource is not null");
                j15 = j14;
                la.a aVar3222 = new la.a(sQLiteDatabase);
                sQLiteDatabase.execSQL("ALTER TABLE favorites ADD COLUMN appWidgetSource INTEGER NOT NULL DEFAULT " + j15 + ";");
                aVar3222.a();
                aVar3222.close();
                sQLiteDatabase.execSQL("ALTER TABLE drawer_groups  ADD COLUMN category_id TEXT");
                return;
            case '\"':
                str = "LauncherProvider";
                str2 = "_id";
                j13 = -1;
                sQLiteDatabase.execSQL("ALTER TABLE drawer_groups ADD COLUMN customIconSource TEXT");
                sQLiteDatabase.execSQL("ALTER TABLE drawer_groups ADD COLUMN customIconLoadedState TEXT");
                sQLiteDatabase.execSQL("ALTER TABLE drawer_groups ADD COLUMN flags INTEGER NOT NULL DEFAULT 0");
                cursorRawQuery = sQLiteDatabase.rawQuery("SELECT _id, icon FROM drawer_groups WHERE icon IS NOT NULL", null);
                if (cursorRawQuery.getCount() > 0) {
                }
                cursorRawQuery.close();
                j14 = j13;
                sQLiteDatabase.execSQL("UPDATE favorites SET novaFlags = (novaFlags | 64) WHERE itemType = 6 AND customIconSource is not null");
                j15 = j14;
                la.a aVar32222 = new la.a(sQLiteDatabase);
                sQLiteDatabase.execSQL("ALTER TABLE favorites ADD COLUMN appWidgetSource INTEGER NOT NULL DEFAULT " + j15 + ";");
                aVar32222.a();
                aVar32222.close();
                sQLiteDatabase.execSQL("ALTER TABLE drawer_groups  ADD COLUMN category_id TEXT");
                return;
            case '#':
                str = "LauncherProvider";
                j14 = -1;
                sQLiteDatabase.execSQL("UPDATE favorites SET novaFlags = (novaFlags | 64) WHERE itemType = 6 AND customIconSource is not null");
                j15 = j14;
                la.a aVar322222 = new la.a(sQLiteDatabase);
                sQLiteDatabase.execSQL("ALTER TABLE favorites ADD COLUMN appWidgetSource INTEGER NOT NULL DEFAULT " + j15 + ";");
                aVar322222.a();
                aVar322222.close();
                sQLiteDatabase.execSQL("ALTER TABLE drawer_groups  ADD COLUMN category_id TEXT");
                return;
            case '$':
                str = "LauncherProvider";
                j15 = -1;
                la.a aVar3222222 = new la.a(sQLiteDatabase);
                sQLiteDatabase.execSQL("ALTER TABLE favorites ADD COLUMN appWidgetSource INTEGER NOT NULL DEFAULT " + j15 + ";");
                aVar3222222.a();
                aVar3222222.close();
                sQLiteDatabase.execSQL("ALTER TABLE drawer_groups  ADD COLUMN category_id TEXT");
                return;
            case '%':
            case '&':
                sQLiteDatabase.execSQL("ALTER TABLE drawer_groups  ADD COLUMN category_id TEXT");
                return;
            default:
                str = "LauncherProvider";
                Log.w(str, "Destroying all old data.");
                b(sQLiteDatabase);
                return;
        }
    }
}
