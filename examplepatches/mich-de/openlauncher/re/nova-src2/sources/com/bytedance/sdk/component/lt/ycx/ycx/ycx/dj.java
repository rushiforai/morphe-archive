package com.bytedance.sdk.component.lt.ycx.ycx.ycx;

import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.bytedance.sdk.component.lt.ycx.ul;
import com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.lt;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes2.dex */
public class dj extends SQLiteOpenHelper {
    final Context ycx;

    public dj(Context context) {
        super(context, "ttadlog.db", (SQLiteDatabase.CursorFactory) null, 1);
        this.ycx = context;
    }

    private ArrayList<String> sya(SQLiteDatabase sQLiteDatabase) {
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
        } catch (Exception unused) {
        }
        return arrayList;
    }

    private void ycx(SQLiteDatabase sQLiteDatabase) throws SQLException {
        sQLiteDatabase.execSQL(com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.ycx.zb(ul.lt().sya().zb()));
        sQLiteDatabase.execSQL(com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.dj.sya(ul.lt().sya().ycx()));
        sQLiteDatabase.execSQL(com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.ul.sya(ul.lt().sya().dj()));
        sQLiteDatabase.execSQL(lt.ycx(ul.lt().sya().lud()));
        sQLiteDatabase.execSQL(com.bytedance.sdk.component.lt.ycx.lt.lt.zb());
    }

    private void zb(SQLiteDatabase sQLiteDatabase) throws SQLException {
        ArrayList<String> arrayListSya = sya(sQLiteDatabase);
        if (arrayListSya == null || arrayListSya.size() <= 0) {
            return;
        }
        Iterator<String> it = arrayListSya.iterator();
        while (it.hasNext()) {
            sQLiteDatabase.execSQL("DROP TABLE IF EXISTS " + it.next() + " ;");
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase sQLiteDatabase) {
        try {
            ycx(sQLiteDatabase);
        } catch (Throwable unused) {
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i5, int i11) {
        try {
            if (i5 <= i11) {
                ycx(sQLiteDatabase);
            } else {
                zb(sQLiteDatabase);
                ycx(sQLiteDatabase);
            }
        } catch (Throwable unused) {
        }
    }
}
