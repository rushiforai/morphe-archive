package o9;

import android.content.Context;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

/* loaded from: classes2.dex */
public final class x2 extends SQLiteOpenHelper {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int f80245b = 0;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f80246a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ x2(Context context, String str, SQLiteDatabase.CursorFactory cursorFactory, int i5, int i11) {
        super(context, str, cursorFactory, i5);
        this.f80246a = i11;
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onCreate(SQLiteDatabase sQLiteDatabase) throws SQLException {
        switch (this.f80246a) {
            case 0:
                sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS saved_wallpaper_images (id INTEGER NOT NULL, image_thumbnail TEXT NOT NULL, image TEXT NOT NULL, PRIMARY KEY (id ASC) );");
                break;
            case 1:
                sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS ad_observations (\n    id INTEGER PRIMARY KEY AUTOINCREMENT,\n    timestamp INTEGER NOT NULL,\n    base_ad_unit_id TEXT NOT NULL,\n    network TEXT NOT NULL,\n    tier TEXT NOT NULL,\n    filled INTEGER NOT NULL,\n    cpm REAL NOT NULL\n)");
                sQLiteDatabase.execSQL("CREATE INDEX IF NOT EXISTS idx_lookup\nON ad_observations (base_ad_unit_id, network, tier, timestamp DESC)");
                break;
            default:
                sQLiteDatabase.execSQL("CREATE TABLE searches (\n    query      TEXT    NOT NULL,\n    searched_at INTEGER NOT NULL,\n    PRIMARY KEY (query, searched_at)\n)");
                break;
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onUpgrade(SQLiteDatabase sQLiteDatabase, int i5, int i11) throws SQLException {
        switch (this.f80246a) {
            case 0:
                if (i5 != i11) {
                    sQLiteDatabase.execSQL("DELETE FROM saved_wallpaper_images");
                    break;
                }
                break;
            case 1:
                sQLiteDatabase.execSQL("DROP TABLE IF EXISTS ad_observations");
                onCreate(sQLiteDatabase);
                break;
            default:
                sQLiteDatabase.execSQL("DROP TABLE IF EXISTS searches");
                sQLiteDatabase.execSQL("CREATE TABLE searches (\n    query      TEXT    NOT NULL,\n    searched_at INTEGER NOT NULL,\n    PRIMARY KEY (query, searched_at)\n)");
                break;
        }
    }
}
