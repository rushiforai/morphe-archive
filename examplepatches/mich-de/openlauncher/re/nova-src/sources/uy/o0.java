package uy;

import android.content.ContentValues;
import android.content.Context;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.provider.BaseColumns;

/* loaded from: classes.dex */
public abstract class o0 implements BaseColumns {

    /* renamed from: a, reason: collision with root package name */
    public static final Uri f91743a = Uri.parse("content://com.teslacoilsw.launcher.settings/drawer_groups");

    public static void a(SQLiteDatabase sQLiteDatabase, Context context) throws SQLException {
        try {
            sQLiteDatabase.execSQL("CREATE TABLE appgroups (_id INTEGER PRIMARY KEY, groupId INTEGER, component TEXT, modified INTEGER NOT NULL DEFAULT 0);");
            sQLiteDatabase.execSQL("CREATE UNIQUE INDEX idx_group_cn ON appgroups (groupId, component)");
            sQLiteDatabase.execSQL("CREATE TABLE drawer_groups (_id INTEGER PRIMARY KEY, title TEXT, category_id TEXT, groupType TEXT, tabOrder INTEGER DEFAULT -1, hideApps BOOLEAN, icon BLOB,customIconSource TEXT, customIconLoadedState TEXT, tabColor INTEGER NOT NULL DEFAULT 262914, flags INTEGER NOT NULL DEFAULT 0,modified INTEGER NOT NULL DEFAULT 0);");
            ContentValues contentValues = new ContentValues();
            contentValues.put("title", context.getResources().getString(2132017979));
            contentValues.put("tabOrder", (Integer) 0);
            contentValues.put("groupType", "TAB_APPS");
            sQLiteDatabase.insert("drawer_groups", null, contentValues);
        } catch (Exception unused) {
        }
    }
}
