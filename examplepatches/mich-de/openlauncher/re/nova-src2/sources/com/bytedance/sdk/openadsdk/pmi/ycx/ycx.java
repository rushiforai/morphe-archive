package com.bytedance.sdk.openadsdk.pmi.ycx;

import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.utils.thx;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes2.dex */
public class ycx extends SQLiteOpenHelper {

    /* renamed from: zb, reason: collision with root package name */
    private static volatile ycx f26981zb;
    final Context ycx;

    private ycx(Context context, String str) {
        super(context, str, (SQLiteDatabase.CursorFactory) null, 1);
        this.ycx = context;
    }

    private static ycx sya() {
        if (f26981zb == null) {
            synchronized (ycx.class) {
                try {
                    if (f26981zb == null) {
                        if (thx.ycx(com.bytedance.sdk.openadsdk.pmi.ycx.ycx())) {
                            f26981zb = new ycx(com.bytedance.sdk.openadsdk.pmi.ycx.ycx(), "pag_monitor.db");
                        } else {
                            f26981zb = new ycx(com.bytedance.sdk.openadsdk.pmi.ycx.ycx(), "pag_monitor_" + thx.sya(com.bytedance.sdk.openadsdk.pmi.ycx.ycx()) + ".db");
                        }
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return f26981zb;
    }

    public static SQLiteDatabase ycx() {
        try {
            ycx ycxVarSya = sya();
            if (ycxVarSya == null) {
                return null;
            }
            SQLiteDatabase writableDatabase = ycxVarSya.getWritableDatabase();
            if (writableDatabase.isOpen()) {
                return writableDatabase;
            }
            return null;
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EeriFP4T/bB74=", "duEjnBeze/SxZt5JiT6wLVXGKJkTuXs=", "XOs5uAyyYNOPWOBPhQWhKlfrCZQXvWvGk08=", 75);
            Log.i("MonitorSQLiteOpenHelper", th2.getMessage());
            return null;
        }
    }

    public static SQLiteDatabase zb() {
        try {
            ycx ycxVarSya = sya();
            if (ycxVarSya == null) {
                return null;
            }
            SQLiteDatabase readableDatabase = ycxVarSya.getReadableDatabase();
            if (readableDatabase.isOpen()) {
                return readableDatabase;
            }
            return null;
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EeriFP4T/bB74=", "duEjnBeze/SxZt5JiT6wLVXGKJkTuXs=", "XOs5uAyyYNOPWOVYjRWhKlfrCZQXvWvGk08=", 91);
            Log.i("MonitorSQLiteOpenHelper", th2.getMessage());
            return null;
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase sQLiteDatabase) {
        try {
            sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS monitor_table (_id INTEGER PRIMARY KEY AUTOINCREMENT,sdk_version TEXT ,scene TEXT ,start_count INTEGER default 0 , success_count INTEGER default 0  , fail_count INTEGER default 0  , rit TEXT  , tag TEXT  , label TEXT  , timestamp INTEGER default 0 ,mediation TEXT  , is_init INTEGER , extra TEXT )");
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EeriFP4T/bB74=", "duEjnBeze/SxZt5JiT6wLVXGKJkTuXs=", "VOAOhwa9fcI=", Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE);
            Log.e("MonitorSQLiteOpenHelper", th2.getMessage());
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onDowngrade(SQLiteDatabase sQLiteDatabase, int i5, int i11) {
        try {
            if (i5 <= i11) {
                onCreate(sQLiteDatabase);
            } else {
                ycx(sQLiteDatabase);
                onCreate(sQLiteDatabase);
            }
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EeriFP4T/bB74=", "duEjnBeze/SxZt5JiT6wLVXGKJkTuXs=", "VOAJmhSybtWBTtI=", 147);
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i5, int i11) {
    }

    private void ycx(SQLiteDatabase sQLiteDatabase) throws SQLException {
        ArrayList<String> arrayListZb = zb(sQLiteDatabase);
        if (arrayListZb == null || arrayListZb.size() <= 0) {
            return;
        }
        Iterator<String> it = arrayListZb.iterator();
        while (it.hasNext()) {
            sQLiteDatabase.execSQL("DROP TABLE IF EXISTS " + it.next() + " ;");
        }
    }

    private ArrayList<String> zb(SQLiteDatabase sQLiteDatabase) {
        ArrayList<String> arrayList = new ArrayList<>();
        try {
            Cursor cursorRawQuery = sQLiteDatabase.rawQuery("select name from sqlite_master where type='table' order by name", null);
            if (cursorRawQuery != null) {
                while (cursorRawQuery.moveToNext()) {
                    String string = cursorRawQuery.getString(0);
                    if (!string.equals("android_metadata") && !string.equals("sqlite_sequence")) {
                        arrayList.add(string);
                    }
                }
                cursorRawQuery.close();
            }
            return arrayList;
        } catch (Exception e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EeriFP4T/bB74=", "duEjnBeze/SxZt5JiT6wLVXGKJkTuXs=", "V+c+gSeeXcaCRtJO", 179);
            htf.sya("MonitorSQLiteOpenHelper", e3.getMessage());
            return arrayList;
        }
    }
}
