package com.bytedance.sdk.component.lt.ycx.ycx.ycx;

import android.content.ContentValues;
import android.content.Context;
import android.database.AbstractCursor;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.text.TextUtils;
import com.bytedance.sdk.component.lt.ycx.ul;
import java.util.List;
import org.json.JSONObject;

/* loaded from: classes2.dex */
class zb {
    private C0040zb ycx;

    /* renamed from: zb, reason: collision with root package name */
    private Context f23903zb;

    public class ycx extends AbstractCursor {
        private ycx() {
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

    public zb(Context context) {
        try {
            this.f23903zb = context.getApplicationContext();
            if (this.ycx == null) {
                this.ycx = new C0040zb();
            }
        } catch (Throwable unused) {
        }
    }

    public C0040zb ycx() {
        return this.ycx;
    }

    /* renamed from: com.bytedance.sdk.component.lt.ycx.ycx.ycx.zb$zb, reason: collision with other inner class name */
    public class C0040zb {

        /* renamed from: zb, reason: collision with root package name */
        private volatile SQLiteDatabase f23904zb = null;

        public C0040zb() {
        }

        private void ycx() {
            boolean zZb;
            try {
                if (this.f23904zb != null && this.f23904zb.isOpen()) {
                    return;
                }
                synchronized (this) {
                    try {
                        if (this.f23904zb == null || !this.f23904zb.isOpen()) {
                            this.f23904zb = ul.lt().sya().ycx(ul.lt().lud());
                            this.f23904zb.setLockingEnabled(false);
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
            } finally {
                if (!zZb) {
                }
            }
        }

        private boolean zb() {
            SQLiteDatabase sQLiteDatabase = this.f23904zb;
            return sQLiteDatabase != null && sQLiteDatabase.inTransaction();
        }

        public void ycx(String str) throws SQLException {
            try {
                ycx();
                this.f23904zb.execSQL(str);
            } catch (Throwable th2) {
                if (zb()) {
                    throw th2;
                }
            }
        }

        public Cursor ycx(String str, String[] strArr, String str2, String[] strArr2, String str3, String str4, String str5) {
            try {
                ycx();
                return this.f23904zb.query(str, strArr, str2, strArr2, str3, str4, str5);
            } catch (Throwable th2) {
                ycx ycxVar = new ycx();
                if (zb()) {
                    throw th2;
                }
                return ycxVar;
            }
        }

        public int ycx(String str, ContentValues contentValues, String str2, String[] strArr) throws Exception {
            try {
                ycx();
                return this.f23904zb.update(str, contentValues, str2, strArr);
            } catch (Exception e3) {
                if (zb()) {
                    throw e3;
                }
                return 0;
            }
        }

        public long ycx(String str, String str2, ContentValues contentValues) throws Exception {
            try {
                ycx();
                return this.f23904zb.insert(str, str2, contentValues);
            } catch (Exception e3) {
                if (zb()) {
                    throw e3;
                }
                return -1L;
            }
        }

        public synchronized void ycx(String str, String str2, List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list) {
            JSONObject jSONObjectLt;
            try {
                try {
                    ycx();
                    this.f23904zb.beginTransaction();
                    ContentValues contentValues = new ContentValues();
                    for (int i5 = 0; i5 < list.size(); i5++) {
                        com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar = list.get(i5);
                        if (ycxVar != null && (jSONObjectLt = ycxVar.lt()) != null) {
                            contentValues.put("id", ycxVar.sya());
                            String strZb = ul.lt().syc().zb(jSONObjectLt.toString());
                            if (!TextUtils.isEmpty(strZb)) {
                                contentValues.put("value", strZb);
                                contentValues.put("gen_time", Long.valueOf(System.currentTimeMillis()));
                                contentValues.put("retry", (Integer) 0);
                                contentValues.put("encrypt", (Integer) 1);
                                if (com.bytedance.sdk.component.lt.ycx.sya.ycx.dj() && ycxVar.jw() > 0 && (ycxVar.dj() == 0 || ycxVar.dj() == 3)) {
                                    contentValues.put("channel", Integer.valueOf(ycxVar.jw()));
                                }
                                this.f23904zb.insert(str, str2, contentValues);
                            }
                            contentValues.clear();
                        }
                    }
                    this.f23904zb.setTransactionSuccessful();
                    list.size();
                    if (this.f23904zb != null) {
                        this.f23904zb.endTransaction();
                    }
                } catch (Exception e3) {
                    list.size();
                    if (!zb()) {
                        if (this.f23904zb != null) {
                            this.f23904zb.endTransaction();
                        }
                    } else {
                        throw e3;
                    }
                }
            } catch (Throwable th2) {
                if (this.f23904zb != null) {
                    this.f23904zb.endTransaction();
                }
                throw th2;
            }
        }

        public int ycx(String str, String str2, String[] strArr) throws Exception {
            try {
                ycx();
                return this.f23904zb.delete(str, str2, strArr);
            } catch (Exception e3) {
                if (zb()) {
                    throw e3;
                }
                return 0;
            }
        }
    }
}
