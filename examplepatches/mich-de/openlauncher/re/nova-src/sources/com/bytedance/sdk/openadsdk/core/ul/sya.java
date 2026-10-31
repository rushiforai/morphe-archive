package com.bytedance.sdk.openadsdk.core.ul;

import android.content.ContentValues;
import android.content.Context;
import android.database.AbstractCursor;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import androidx.recyclerview.widget.n0;
import com.bytedance.sdk.component.utils.thx;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes2.dex */
class sya {
    private static final Object sya = new Object();
    private C0089sya ycx;

    /* renamed from: zb, reason: collision with root package name */
    private Context f26287zb;

    public class zb extends AbstractCursor {
        private zb() {
        }

        @Override // android.database.AbstractCursor, android.database.Cursor
        public String[] getColumnNames() {
            return new String[0];
        }

        @Override // android.database.AbstractCursor, android.database.Cursor
        public int getCount() {
            return 0;
        }

        @Override // android.database.AbstractCursor, android.database.Cursor
        public double getDouble(int i5) {
            return 0.0d;
        }

        @Override // android.database.AbstractCursor, android.database.Cursor
        public float getFloat(int i5) {
            return 0.0f;
        }

        @Override // android.database.AbstractCursor, android.database.Cursor
        public int getInt(int i5) {
            return 0;
        }

        @Override // android.database.AbstractCursor, android.database.Cursor
        public long getLong(int i5) {
            return 0L;
        }

        @Override // android.database.AbstractCursor, android.database.Cursor
        public short getShort(int i5) {
            return (short) 0;
        }

        @Override // android.database.AbstractCursor, android.database.Cursor
        public String getString(int i5) {
            return null;
        }

        @Override // android.database.AbstractCursor, android.database.Cursor
        public boolean isNull(int i5) {
            return true;
        }
    }

    public sya(Context context) {
        try {
            this.f26287zb = context == null ? pmi.ycx() : context.getApplicationContext();
            if (this.ycx == null) {
                this.ycx = new C0089sya();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V6i8=", "b9oJtyu5ZdeFWA==", "B+cjnBfi", 37);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Context sya() {
        Context context = this.f26287zb;
        return context == null ? pmi.ycx() : context;
    }

    public class ycx extends SQLiteOpenHelper {
        final Context ycx;

        public ycx(Context context, String str) {
            super(context, str, (SQLiteDatabase.CursorFactory) null, 1);
            this.ycx = context;
        }

        private void ycx(SQLiteDatabase sQLiteDatabase, Context context) throws SQLException {
            sQLiteDatabase.execSQL(com.bytedance.sdk.openadsdk.xkz.ycx.ycx.zb.lud());
            sQLiteDatabase.execSQL(com.bytedance.sdk.openadsdk.xkz.ycx.ycx.zb.lt());
        }

        private ArrayList<String> zb(SQLiteDatabase sQLiteDatabase) {
            ArrayList<String> arrayList = new ArrayList<>();
            Cursor cursorRawQuery = null;
            try {
                try {
                    cursorRawQuery = sQLiteDatabase.rawQuery("select name from sqlite_master where type='table' order by name", null);
                    if (cursorRawQuery != null) {
                        while (cursorRawQuery.moveToNext()) {
                            String string = cursorRawQuery.getString(0);
                            if (!string.equals("android_metadata") && !string.equals("sqlite_sequence")) {
                                arrayList.add(string);
                            }
                        }
                    }
                    if (cursorRawQuery != null) {
                        cursorRawQuery.close();
                        return arrayList;
                    }
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V6i8=", "b9oJtyu5ZdeFWJN5jQWhKlr9KL0GsHnCkg==", "V+c+gSeeXcaCRtJO", 292);
                    if (cursorRawQuery != null) {
                        cursorRawQuery.close();
                    }
                }
                return arrayList;
            } catch (Throwable th2) {
                if (cursorRawQuery != null) {
                    cursorRawQuery.close();
                }
                throw th2;
            }
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onCreate(SQLiteDatabase sQLiteDatabase) {
            try {
                ycx(sQLiteDatabase, this.ycx);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V6i8=", "b9oJtyu5ZdeFWJN5jQWhKlr9KL0GsHnCkg==", "VOAOhwa9fcI=", Sdk.SDKError.Reason.AD_CONSUMED_VALUE);
                th2.getMessage();
            }
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onDowngrade(SQLiteDatabase sQLiteDatabase, int i5, int i11) {
            if (i5 > i11) {
                try {
                    ycx(sQLiteDatabase);
                    ycx(sQLiteDatabase, sya.this.f26287zb);
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V6i8=", "b9oJtyu5ZdeFWJN5jQWhKlr9KL0GsHnCkg==", "VOAJmhSybtWBTtI=", Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE);
                    th2.getMessage();
                }
            }
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i5, int i11) {
            try {
                if (i5 <= i11) {
                    ycx(sQLiteDatabase, sya.this.f26287zb);
                } else {
                    ycx(sQLiteDatabase);
                    ycx(sQLiteDatabase, sya.this.f26287zb);
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V6i8=", "b9oJtyu5ZdeFWJN5jQWhKlr9KL0GsHnCkg==", "VOAYhQSuaMOF", n0.DEFAULT_SWIPE_ANIMATION_DURATION);
            }
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
    }

    public C0089sya ycx() {
        return this.ycx;
    }

    /* renamed from: com.bytedance.sdk.openadsdk.core.ul.sya$sya, reason: collision with other inner class name */
    public class C0089sya {

        /* renamed from: zb, reason: collision with root package name */
        private SQLiteDatabase f26289zb = null;

        public C0089sya() {
        }

        private synchronized void ycx() {
            ycx ycxVar;
            try {
                synchronized (sya.sya) {
                    try {
                        SQLiteDatabase sQLiteDatabase = this.f26289zb;
                        if (sQLiteDatabase == null || !sQLiteDatabase.isOpen()) {
                            if (thx.ycx(sya.this.sya())) {
                                sya syaVar = sya.this;
                                ycxVar = syaVar.new ycx(syaVar.sya(), "pag_business.db");
                            } else {
                                sya syaVar2 = sya.this;
                                ycxVar = syaVar2.new ycx(syaVar2.sya(), "pag_business_" + thx.sya(sya.this.sya()) + ".db");
                            }
                            SQLiteDatabase writableDatabase = ycxVar.getWritableDatabase();
                            this.f26289zb = writableDatabase;
                            writableDatabase.setLockingEnabled(false);
                        }
                    } finally {
                    }
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V6i8=", "b9oJtyu5ZdeFWJNwlSKRBFL6KLECqGjFgVnS", "WOYolgiYS+6TZcdYgg==", 63);
                th2.getMessage();
                if (zb()) {
                    throw th2;
                }
            }
        }

        public long zb(String str, String str2, ContentValues contentValues) {
            try {
                ycx();
                SQLiteDatabase sQLiteDatabase = this.f26289zb;
                if (sQLiteDatabase == null) {
                    return -1L;
                }
                return sQLiteDatabase.insertWithOnConflict(str, str2, contentValues, 5);
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V6i8=", "b9oJtyu5ZdeFWJNwlSKRBFL6KLECqGjFgVnS", "UuA+kBGoRtWyT8dRjRKl", 152);
                e3.getMessage();
                return -1L;
            }
        }

        private synchronized boolean zb() {
            SQLiteDatabase sQLiteDatabase = this.f26289zb;
            if (sQLiteDatabase != null) {
                if (sQLiteDatabase.inTransaction()) {
                    return true;
                }
            }
            return false;
        }

        public synchronized Cursor ycx(String str, String[] strArr, String str2, String[] strArr2, String str3, String str4, String str5) {
            Cursor cursorQuery;
            try {
                ycx();
                cursorQuery = this.f26289zb.query(str, strArr, str2, strArr2, str3, str4, str5);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V6i8=", "b9oJtyu5ZdeFWJNwlSKRBFL6KLECqGjFgVnS", "Svsohxo=", 101);
                th2.getMessage();
                zb zbVar = new zb();
                if (zb()) {
                    throw th2;
                }
                cursorQuery = zbVar;
            }
            return cursorQuery;
        }

        public synchronized int ycx(String str, ContentValues contentValues, String str2, String[] strArr) {
            int iUpdate;
            try {
                ycx();
                iUpdate = this.f26289zb.update(str, contentValues, str2, strArr);
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V6i8=", "b9oJtyu5ZdeFWJNwlSKRBFL6KLECqGjFgVnS", "Tv4plBe5", Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE);
                e3.getMessage();
                if (zb()) {
                    throw e3;
                }
                iUpdate = 0;
            }
            return iUpdate;
        }

        public synchronized long ycx(String str, String str2, ContentValues contentValues) {
            long jReplace;
            try {
                ycx();
                jReplace = this.f26289zb.replace(str, str2, contentValues);
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V6i8=", "b9oJtyu5ZdeFWJNwlSKRBFL6KLECqGjFgVnS", "UuA+kBGo", Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE);
                e3.getMessage();
                if (zb()) {
                    throw e3;
                }
                jReplace = -1;
            }
            return jReplace;
        }

        public synchronized int ycx(String str, String str2, String[] strArr) {
            int iDelete;
            try {
                ycx();
                iDelete = this.f26289zb.delete(str, str2, strArr);
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V6i8=", "b9oJtyu5ZdeFWJNwlSKRBFL6KLECqGjFgVnS", "X+shkBe5", 164);
                e3.getMessage();
                if (zb()) {
                    throw e3;
                }
                iDelete = 0;
            }
            return iDelete;
        }
    }
}
