package com.google.android.gms.internal.gtm;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.text.TextUtils;
import com.medium.android.admin.stagebranch.uG.peNPu;
import defpackage.qjg;
import defpackage.rt5;
import defpackage.vp7;
import defpackage.y3b;
import java.io.Closeable;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
final class zzcd extends zzbr implements Closeable {
    private static final String zza = "CREATE TABLE IF NOT EXISTS hits2 ( 'hit_id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 'hit_time' INTEGER NOT NULL, 'hit_url' TEXT NOT NULL, 'hit_string' TEXT NOT NULL, 'hit_app_id' INTEGER);";
    private static final String zzb = "SELECT MAX(hit_time) FROM hits2 WHERE 1;";
    private final zzcc zzc;
    private final zzfb zzd;
    private final zzfb zze;

    public zzcd(zzbu zzbuVar) {
        super(zzbuVar);
        this.zzd = new zzfb(zzC());
        this.zze = new zzfb(zzC());
        this.zzc = new zzcc(this, zzbuVar.zza(), zzad());
    }

    private final long zzac(String str, String[] strArr, long j) {
        Cursor cursorRawQuery = null;
        try {
            try {
                cursorRawQuery = zzf().rawQuery(str, strArr);
                long j2 = cursorRawQuery.moveToFirst() ? cursorRawQuery.getLong(0) : 0L;
                cursorRawQuery.close();
                return j2;
            } catch (SQLiteException e) {
                this.zzK("Database error", str, e);
                throw e;
            }
        } catch (Throwable th) {
            if (cursorRawQuery != null) {
                cursorRawQuery.close();
            }
            throw th;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final String zzad() {
        zzw();
        zzw();
        return "google_analytics_v4.db";
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        try {
            this.zzc.close();
        } catch (SQLiteException e) {
            zzJ("Sql error closing database", e);
        } catch (IllegalStateException e2) {
            zzJ("Error closing database", e2);
        }
    }

    public final void zzY(List list) {
        vp7.p(list);
        qjg.a();
        zzV();
        if (list.isEmpty()) {
            return;
        }
        StringBuilder sb = new StringBuilder("hit_id in (");
        for (int i = 0; i < list.size(); i++) {
            Long l = (Long) list.get(i);
            if (l == null || l.longValue() == 0) {
                throw new SQLiteException("Invalid hit id");
            }
            if (i > 0) {
                sb.append(",");
            }
            sb.append(l);
        }
        sb.append(")");
        String string = sb.toString();
        try {
            SQLiteDatabase sQLiteDatabaseZzf = zzf();
            zzO("Deleting dispatched hits. count", Integer.valueOf(list.size()));
            int iDelete = sQLiteDatabaseZzf.delete("hits2", string, null);
            if (iDelete != list.size()) {
                zzT("Deleted fewer hits then expected", Integer.valueOf(list.size()), Integer.valueOf(iDelete), string);
            }
        } catch (SQLiteException e) {
            zzJ("Error deleting hits", e);
            throw e;
        }
    }

    public final void zzZ() {
        zzV();
        zzf().endTransaction();
    }

    public final void zzaa() {
        zzV();
        zzf().setTransactionSuccessful();
    }

    public final boolean zzab() {
        return zzb() == 0;
    }

    public final long zzb() {
        qjg.a();
        zzV();
        Cursor cursor = null;
        try {
            try {
                Cursor cursorRawQuery = zzf().rawQuery("SELECT COUNT(*) FROM hits2", null);
                if (!cursorRawQuery.moveToFirst()) {
                    throw new SQLiteException("Database returned empty set");
                }
                long j = cursorRawQuery.getLong(0);
                cursorRawQuery.close();
                return j;
            } catch (SQLiteException e) {
                zzK("Database error", "SELECT COUNT(*) FROM hits2", e);
                throw e;
            }
        } catch (Throwable th) {
            if (0 != 0) {
                cursor.close();
            }
            throw th;
        }
    }

    public final long zzc() {
        qjg.a();
        zzV();
        return zzac(zzb, null, 0L);
    }

    @Override // com.google.android.gms.internal.gtm.zzbr
    public final void zzd() {
    }

    public final SQLiteDatabase zzf() {
        try {
            return this.zzc.getWritableDatabase();
        } catch (SQLiteException e) {
            this.zzR("Error opening database", e);
            throw e;
        }
    }

    public final List zzj(long j) throws Throwable {
        Cursor cursorQuery;
        Map map;
        boolean z;
        vp7.l(j >= 0);
        qjg.a();
        zzV();
        Cursor cursor = null;
        try {
            try {
                cursorQuery = zzf().query("hits2", new String[]{"hit_id", "hit_time", "hit_string", "hit_url", "hit_app_id"}, null, null, null, null, "hit_id ASC", Long.toString(j));
            } catch (Throwable th) {
                th = th;
            }
        } catch (SQLiteException e) {
            e = e;
        }
        try {
            ArrayList arrayList = new ArrayList();
            if (cursorQuery.moveToFirst()) {
                do {
                    long j2 = cursorQuery.getLong(0);
                    long j3 = cursorQuery.getLong(1);
                    String string = cursorQuery.getString(2);
                    String string2 = cursorQuery.getString(3);
                    int i = cursorQuery.getInt(4);
                    Map mapZzk = zzk(string);
                    if (!TextUtils.isEmpty(string2) && string2.startsWith("http:")) {
                        map = mapZzk;
                        z = false;
                    } else {
                        map = mapZzk;
                        z = true;
                    }
                    arrayList.add(new zzek(this, map, j3, z, j2, i, null));
                } while (cursorQuery.moveToNext());
            }
            cursorQuery.close();
            return arrayList;
        } catch (SQLiteException e2) {
            e = e2;
            zzJ("Error loading hits from the database", e);
            throw e;
        } catch (Throwable th2) {
            th = th2;
            cursor = cursorQuery;
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    public final Map zzk(String str) {
        if (TextUtils.isEmpty(str)) {
            return new HashMap(0);
        }
        try {
            if (!str.startsWith("?")) {
                str = "?".concat(str);
            }
            return rt5.a(new URI(str));
        } catch (URISyntaxException e) {
            this.zzJ("Error parsing hit parameters", e);
            return new HashMap(0);
        }
    }

    public final void zzm() {
        zzV();
        zzf().beginTransaction();
    }

    public final void zzn(long j) {
        qjg.a();
        zzV();
        ArrayList arrayList = new ArrayList(1);
        Long lValueOf = Long.valueOf(j);
        arrayList.add(lValueOf);
        zzO("Deleting hit, id", lValueOf);
        zzY(arrayList);
    }

    public final int zza() {
        qjg.a();
        zzV();
        if (!this.zzd.zzc(86400000L)) {
            return 0;
        }
        this.zzd.zzb();
        zzN("Deleting stale hits (if any)");
        SQLiteDatabase sQLiteDatabaseZzf = zzf();
        ((y3b) zzC()).getClass();
        int iDelete = sQLiteDatabaseZzf.delete("hits2", peNPu.iVFfLXilkJxVe, new String[]{Long.toString(System.currentTimeMillis() - 2592000000L)});
        zzO("Deleted stale hits, count", Integer.valueOf(iDelete));
        return iDelete;
    }
}
