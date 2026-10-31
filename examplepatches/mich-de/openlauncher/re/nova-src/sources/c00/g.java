package c00;

import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.provider.BaseColumns;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class g implements BaseColumns {

    /* renamed from: a, reason: collision with root package name */
    public static final Uri f19060a;

    static {
        Uri uri = Uri.parse("content://com.teslacoilsw.launcher.settings/allapps");
        Intrinsics.d(uri);
        f19060a = uri;
    }

    public static final void a(SQLiteDatabase sQLiteDatabase) throws SQLException {
        sQLiteDatabase.execSQL("CREATE TABLE  IF NOT EXISTS  allapps (_id INTEGER PRIMARY KEY, componentName TEXT, profileId INTEGER DEFAULT -1, title TEXT, customIconSource TEXT, flags INTEGER NOT NULL DEFAULT 0, modified INTEGER NOT NULL DEFAULT 0);");
        sQLiteDatabase.execSQL("CREATE UNIQUE INDEX  IF NOT EXISTS  componentNameProfileId ON allapps (componentName, profileId)");
    }
}
