package com.bykv.vk.openvk.preload.geckox.a;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.bykv.vk.openvk.preload.geckox.logger.GeckoLogger;
import com.bykv.vk.openvk.preload.geckox.statistic.model.StatisticModel;
import com.bykv.vk.openvk.preload.geckox.utils.CloseableUtils;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
class b extends SQLiteOpenHelper {

    /* renamed from: a, reason: collision with root package name */
    private static volatile b f22004a;

    private b(Context context, String str, SQLiteDatabase.CursorFactory cursorFactory) {
        super(context, str, cursorFactory, 1);
    }

    public static b a(Context context) {
        if (f22004a == null) {
            synchronized (b.class) {
                try {
                    if (f22004a == null) {
                        f22004a = new b(context.getApplicationContext(), "geckox_clean_statistic" + com.bykv.vk.openvk.preload.geckox.utils.a.a() + ".db", null);
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return f22004a;
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase sQLiteDatabase) throws SQLException {
        sQLiteDatabase.execSQL("create table if not exists geckox_clean_statistic (id integer primary key autoincrement,access_key text,channel text,clean_type integer,status integer,pkg_id integer,err_code integer,clean_strategy integer,clean_duration integer,err_msg text)");
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i5, int i11) {
    }

    public final void a(String str, String str2, int i5, int i11, long j11, int i12, String str3, long j12) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("access_key", str);
        contentValues.put("channel", str2);
        contentValues.put("clean_type", Integer.valueOf(i5));
        contentValues.put("status", Integer.valueOf(i11));
        contentValues.put("pkg_id", Long.valueOf(j11));
        contentValues.put("err_code", Integer.valueOf(i12));
        contentValues.put("err_msg", str3);
        contentValues.put("clean_duration", Long.valueOf(j12));
        contentValues.put("clean_strategy", (Integer) 1);
        try {
            getWritableDatabase().insert("geckox_clean_statistic", null, contentValues);
        } catch (Exception e3) {
            GeckoLogger.w("clean-channel", "insert failed", e3);
        }
    }

    public final List<StatisticModel.PackageStatisticModel> a() {
        Cursor cursorQuery;
        ArrayList arrayList = new ArrayList();
        Cursor cursor = null;
        try {
            cursorQuery = getWritableDatabase().query("geckox_clean_statistic", null, null, null, null, null, null);
        } catch (Exception e3) {
            e = e3;
        }
        if (cursorQuery == null) {
            return arrayList;
        }
        while (cursorQuery.moveToNext()) {
            try {
                String string = cursorQuery.getString(cursorQuery.getColumnIndex("access_key"));
                String string2 = cursorQuery.getString(cursorQuery.getColumnIndex("channel"));
                int i5 = cursorQuery.getInt(cursorQuery.getColumnIndex("clean_type"));
                int i11 = cursorQuery.getInt(cursorQuery.getColumnIndex("status"));
                long j11 = cursorQuery.getInt(cursorQuery.getColumnIndex("pkg_id"));
                int i12 = cursorQuery.getInt(cursorQuery.getColumnIndex("err_code"));
                String string3 = cursorQuery.getString(cursorQuery.getColumnIndex("err_msg"));
                int i13 = cursorQuery.getInt(cursorQuery.getColumnIndex("clean_strategy"));
                long j12 = cursorQuery.getLong(cursorQuery.getColumnIndex("clean_duration"));
                StatisticModel.PackageStatisticModel packageStatisticModel = new StatisticModel.PackageStatisticModel();
                packageStatisticModel.accessKey = string;
                packageStatisticModel.channel = string2;
                packageStatisticModel.statsType = Integer.valueOf(i11);
                packageStatisticModel.f22130id = Long.valueOf(j11);
                packageStatisticModel.errCode = i12 == 0 ? null : String.valueOf(i12);
                packageStatisticModel.errMsg = string3;
                packageStatisticModel.cleanType = Integer.valueOf(i5);
                packageStatisticModel.cleanDuration = Long.valueOf(j12);
                packageStatisticModel.cleanStrategy = Integer.valueOf(i13);
                arrayList.add(packageStatisticModel);
            } catch (Exception e11) {
                e = e11;
                cursor = cursorQuery;
                GeckoLogger.w("clean-channel", "get all statistic failed!", e);
                cursorQuery = cursor;
                CloseableUtils.close(cursorQuery);
                return arrayList;
            }
        }
        getWritableDatabase().delete("geckox_clean_statistic", null, null);
        CloseableUtils.close(cursorQuery);
        return arrayList;
    }
}
