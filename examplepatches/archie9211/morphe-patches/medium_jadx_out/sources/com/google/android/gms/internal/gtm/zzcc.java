package com.google.android.gms.internal.gtm;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.os.Build;
import com.squareup.wire.sjIw.ezwlgQm;
import java.io.File;
import java.util.HashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
final class zzcc extends zzfp {
    final /* synthetic */ zzcd zza;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zzcc(zzcd zzcdVar, Context context, String str) {
        super(context, "google_analytics_v4.db", null, 1);
        this.zza = zzcdVar;
    }

    private final boolean zza(SQLiteDatabase sQLiteDatabase, String str) {
        boolean zMoveToFirst;
        Cursor cursorQuery = null;
        try {
            try {
                cursorQuery = sQLiteDatabase.query("SQLITE_MASTER", new String[]{"name"}, "name=?", new String[]{str}, null, null, null);
                zMoveToFirst = cursorQuery.moveToFirst();
            } catch (SQLiteException e) {
                this.zza.zzS("Error querying for table", str, e);
                zMoveToFirst = false;
            }
            if (cursorQuery != null) {
                cursorQuery.close();
            }
            return zMoveToFirst;
        } finally {
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final SQLiteDatabase getWritableDatabase() {
        if (!this.zza.zze.zzc(3600000L)) {
            throw new SQLiteException("Database open failed");
        }
        try {
            return super.getWritableDatabase();
        } catch (SQLiteException unused) {
            this.zza.zze.zzb();
            this.zza.zzI("Opening the database failed, dropping the table and recreating it");
            zzcd zzcdVar = this.zza;
            zzcdVar.zzo().getDatabasePath(zzcdVar.zzad()).delete();
            try {
                SQLiteDatabase writableDatabase = super.getWritableDatabase();
                this.zza.zze.zza();
                return writableDatabase;
            } catch (SQLiteException e) {
                this.zza.zzJ("Failed to open freshly created database", e);
                throw e;
            }
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onCreate(SQLiteDatabase sQLiteDatabase) {
        String path = sQLiteDatabase.getPath();
        try {
            if (Integer.parseInt(Build.VERSION.SDK) < 9) {
                return;
            }
            zzfm.zza();
            int i = zzfr.a;
            File file = new File(path);
            file.setReadable(false, false);
            file.setWritable(false, false);
            file.setReadable(true, true);
            file.setWritable(true, true);
        } catch (NumberFormatException unused) {
            zzen.zzb("Invalid version number", Build.VERSION.SDK);
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onDowngrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onOpen(SQLiteDatabase sQLiteDatabase) {
        if (zza(sQLiteDatabase, "hits2")) {
            Set setZzb = zzb(sQLiteDatabase, "hits2");
            String[] strArr = {"hit_id", "hit_string", "hit_time", "hit_url"};
            for (int i = 0; i < 4; i++) {
                String str = strArr[i];
                if (!setZzb.remove(str)) {
                    throw new SQLiteException("Database hits2 is missing required column: ".concat(String.valueOf(str)));
                }
            }
            boolean zRemove = setZzb.remove("hit_app_id");
            if (!setZzb.isEmpty()) {
                throw new SQLiteException("Database hits2 has extra columns");
            }
            if (!zRemove) {
                sQLiteDatabase.execSQL("ALTER TABLE hits2 ADD COLUMN hit_app_id INTEGER");
            }
        } else {
            sQLiteDatabase.execSQL(zzcd.zza);
        }
        if (!zza(sQLiteDatabase, "properties")) {
            sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS properties ( app_uid INTEGER NOT NULL, cid TEXT NOT NULL, tid TEXT NOT NULL, params TEXT NOT NULL, adid INTEGER NOT NULL, hits_count INTEGER NOT NULL, PRIMARY KEY (app_uid, cid, tid)) ;");
            return;
        }
        Set setZzb2 = zzb(sQLiteDatabase, "properties");
        String[] strArr2 = {"app_uid", "cid", "tid", "params", "adid", "hits_count"};
        for (int i2 = 0; i2 < 6; i2++) {
            String str2 = strArr2[i2];
            if (!setZzb2.remove(str2)) {
                throw new SQLiteException("Database properties is missing required column: ".concat(String.valueOf(str2)));
            }
        }
        if (!setZzb2.isEmpty()) {
            throw new SQLiteException("Database properties table has extra columns");
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
    }

    private static final Set zzb(SQLiteDatabase sQLiteDatabase, String str) {
        HashSet hashSet = new HashSet();
        Cursor cursorRawQuery = sQLiteDatabase.rawQuery("SELECT * FROM " + str + ezwlgQm.xgxkpuwX, null);
        try {
            for (String str2 : cursorRawQuery.getColumnNames()) {
                hashSet.add(str2);
            }
            return hashSet;
        } finally {
            cursorRawQuery.close();
        }
    }
}
