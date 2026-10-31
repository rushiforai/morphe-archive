package o9;

import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.provider.BaseColumns;

/* loaded from: classes.dex */
public abstract class g2 implements BaseColumns {

    /* renamed from: a, reason: collision with root package name */
    public static final Uri f79844a = Uri.parse("content://com.teslacoilsw.launcher.settings/favorites");

    /* renamed from: b, reason: collision with root package name */
    public static final Uri f79845b = Uri.parse("content://com.teslacoilsw.launcher.settings/favorites_bakup");

    static {
        Uri.parse("content://com.teslacoilsw.launcher.settings/favorites_preview");
        Uri.parse("content://com.teslacoilsw.launcher.settings/favorites_tmp");
    }

    public static void a(SQLiteDatabase sQLiteDatabase, boolean z11, String str) throws SQLException {
        sQLiteDatabase.execSQL("CREATE TABLE " + (z11 ? " IF NOT EXISTS " : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b) + str + " (_id INTEGER PRIMARY KEY,title TEXT,intent TEXT,container INTEGER,screen INTEGER,cellX REAL,cellY REAL,spanX REAL,spanY REAL,itemType INTEGER,appWidgetId INTEGER NOT NULL DEFAULT -1,iconPackage TEXT,iconResource TEXT,icon BLOB,appWidgetProvider TEXT,modified INTEGER NOT NULL DEFAULT 0,restored INTEGER NOT NULL DEFAULT 0,profileId INTEGER DEFAULT -1,rank INTEGER NOT NULL DEFAULT 0,options INTEGER NOT NULL DEFAULT 0,appWidgetSource INTEGER NOT NULL DEFAULT -1, customIconSource TEXT, customIconLoadedState TEXT, flingUpIntent TEXT,flingDownIntent TEXT,zOrder INTEGER DEFAULT 0,novaFlags INTEGER NOT NULL DEFAULT 0);");
    }

    public static final String b(int i5) {
        switch (i5) {
            case -107:
                return "shortcuts";
            case -106:
                return "search_result";
            case -105:
                return "widgets_tray";
            case -104:
                return "all_apps";
            case -103:
            default:
                return String.valueOf(i5);
            case -102:
                return "prediction";
            case -101:
                return "hotseat";
            case -100:
                return "desktop";
        }
    }

    public static Uri c(int i5) {
        return Uri.parse("content://com.teslacoilsw.launcher.settings/favorites/" + i5);
    }
}
