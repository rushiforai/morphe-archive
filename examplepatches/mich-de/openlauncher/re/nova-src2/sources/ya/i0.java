package ya;

import android.content.Context;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;

/* loaded from: classes.dex */
public final class i0 extends d0 {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ba.c f97145b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i0(ba.c cVar, Context context, String str, int i5) {
        super(context, str, i5);
        this.f97145b = cVar;
    }

    public final void a(SQLiteDatabase sQLiteDatabase) throws SQLException {
        sQLiteDatabase.execSQL("DROP TABLE IF EXISTS icons");
        onCreate(sQLiteDatabase);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onCreate(SQLiteDatabase sQLiteDatabase) throws SQLException {
        this.f97145b.getClass();
        sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS icons (componentName TEXT NOT NULL, profileId INTEGER NOT NULL, lastUpdated INTEGER NOT NULL DEFAULT 0, version INTEGER NOT NULL DEFAULT 0, icon BLOB, icon_color INTEGER NOT NULL DEFAULT 0, label TEXT, system_state TEXT, keywords TEXT, novaFlags INTEGER NOT NULL DEFAULT 0, PRIMARY KEY (componentName, profileId) );");
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onDowngrade(SQLiteDatabase sQLiteDatabase, int i5, int i11) throws SQLException {
        if (i5 != i11) {
            a(sQLiteDatabase);
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onUpgrade(SQLiteDatabase sQLiteDatabase, int i5, int i11) throws SQLException {
        if (i5 != i11) {
            a(sQLiteDatabase);
        }
    }
}
