package com.bytedance.sdk.openadsdk.core;

import android.content.ContentValues;
import android.content.Context;
import android.database.AbstractCursor;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class ul {
    private static final Object sya = new Object();
    private sya ycx;

    /* renamed from: zb, reason: collision with root package name */
    private Context f26286zb;

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

    public ul(Context context) {
        try {
            this.f26286zb = context == null ? pmi.ycx() : context.getApplicationContext();
            if (this.ycx == null) {
                this.ycx = new sya();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "f8wFkA+sbNU=", "B+cjnBfi", 48);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Context sya() {
        Context context = this.f26286zb;
        return context == null ? pmi.ycx() : context;
    }

    public class sya {

        /* renamed from: zb, reason: collision with root package name */
        private SQLiteDatabase f26288zb = null;

        public sya() {
        }

        private synchronized boolean sya() {
            SQLiteDatabase sQLiteDatabase = this.f26288zb;
            if (sQLiteDatabase != null) {
                if (sQLiteDatabase.inTransaction()) {
                    return true;
                }
            }
            return false;
        }

        private synchronized void zb() {
            ycx ycxVar;
            try {
                synchronized (ul.sya) {
                    try {
                        SQLiteDatabase sQLiteDatabase = this.f26288zb;
                        if (sQLiteDatabase == null || !sQLiteDatabase.isOpen()) {
                            if (com.bytedance.sdk.component.utils.thx.ycx(ul.this.sya())) {
                                ul ulVar = ul.this;
                                ycxVar = ulVar.new ycx(ulVar.sya(), "ttopensdk.db");
                            } else {
                                ul ulVar2 = ul.this;
                                ycxVar = ulVar2.new ycx(ulVar2.sya(), "ttopensdk_" + com.bytedance.sdk.component.utils.thx.sya(ul.this.sya()) + ".db");
                            }
                            SQLiteDatabase writableDatabase = ycxVar.getWritableDatabase();
                            this.f26288zb = writableDatabase;
                            writableDatabase.setLockingEnabled(false);
                        }
                    } finally {
                    }
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "f8wFkA+sbNXEZ85uvT2pPF7KLIECvmjUhQ==", "WOYolgiYS+6TZcdYgg==", 74);
                com.bytedance.sdk.component.utils.htf.sya("DBHelper", th2.getMessage());
                if (sya()) {
                    throw th2;
                }
            }
        }

        public SQLiteDatabase ycx() {
            zb();
            return this.f26288zb;
        }

        public synchronized Cursor ycx(String str, String[] strArr, String str2, String[] strArr2, String str3, String str4, String str5) {
            Cursor cursorQuery;
            try {
                zb();
                cursorQuery = this.f26288zb.query(str, strArr, str2, strArr2, str3, str4, str5);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "f8wFkA+sbNXEZ85uvT2pPF7KLIECvmjUhQ==", "Svsohxo=", 112);
                com.bytedance.sdk.component.utils.htf.sya("DBHelper", th2.getMessage());
                zb zbVar = new zb();
                if (sya()) {
                    throw th2;
                }
                cursorQuery = zbVar;
            }
            return cursorQuery;
        }

        public synchronized int ycx(String str, ContentValues contentValues, String str2, String[] strArr) {
            int iUpdate;
            try {
                zb();
                iUpdate = this.f26288zb.update(str, contentValues, str2, strArr);
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "f8wFkA+sbNXEZ85uvT2pPF7KLIECvmjUhQ==", "Tv4plBe5", Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE);
                com.bytedance.sdk.component.utils.htf.sya("DBHelper", e3.getMessage());
                if (sya()) {
                    throw e3;
                }
                iUpdate = 0;
            }
            return iUpdate;
        }

        public synchronized long ycx(String str, String str2, ContentValues contentValues) {
            long jReplace;
            try {
                zb();
                jReplace = this.f26288zb.replace(str, str2, contentValues);
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "f8wFkA+sbNXEZ85uvT2pPF7KLIECvmjUhQ==", "UuA+kBGo", 145);
                com.bytedance.sdk.component.utils.htf.sya("DBHelper", e3.getMessage());
                if (sya()) {
                    throw e3;
                }
                jReplace = -1;
            }
            return jReplace;
        }

        public synchronized int ycx(String str, String str2, String[] strArr) {
            int iDelete;
            try {
                zb();
                iDelete = this.f26288zb.delete(str, str2, strArr);
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "f8wFkA+sbNXEZ85uvT2pPF7KLIECvmjUhQ==", "X+shkBe5", 161);
                com.bytedance.sdk.component.utils.htf.sya("DBHelper", e3.getMessage());
                if (sya()) {
                    throw e3;
                }
                iDelete = 0;
            }
            return iDelete;
        }
    }

    public sya ycx() {
        return this.ycx;
    }

    public class ycx extends SQLiteOpenHelper {
        final Context ycx;

        public ycx(Context context, String str) {
            super(context, str, (SQLiteDatabase.CursorFactory) null, 11);
            this.ycx = context;
        }

        private ArrayList<String> dj(SQLiteDatabase sQLiteDatabase) {
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
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "f8wFkA+sbNXEbtZJjROhO17GKJkTuXs=", "V+c+gSeeXcaCRtJO", 344);
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

        private void sya(SQLiteDatabase sQLiteDatabase) throws SQLException {
            ArrayList<String> arrayListDj = dj(sQLiteDatabase);
            if (arrayListDj == null || arrayListDj.size() <= 0) {
                return;
            }
            Iterator<String> it = arrayListDj.iterator();
            while (it.hasNext()) {
                sQLiteDatabase.execSQL("DROP TABLE IF EXISTS " + it.next() + " ;");
            }
        }

        private void ycx(SQLiteDatabase sQLiteDatabase, Context context) throws SQLException {
            sQLiteDatabase.execSQL(com.bytedance.sdk.openadsdk.dj.dj.ycx());
            sQLiteDatabase.execSQL(com.bytedance.sdk.openadsdk.dj.ea.sya());
            sQLiteDatabase.execSQL(com.bytedance.sdk.openadsdk.dj.dy.ycx());
            sQLiteDatabase.execSQL(com.bytedance.sdk.openadsdk.dj.syc.ycx());
            sQLiteDatabase.execSQL(com.bytedance.sdk.openadsdk.oty.zb.ycx());
            sQLiteDatabase.execSQL(com.bytedance.sdk.openadsdk.dj.pmi.sya());
            sQLiteDatabase.execSQL(com.bytedance.sdk.component.adexpress.ycx.zb.zb.sya());
            sQLiteDatabase.execSQL(com.bytedance.sdk.openadsdk.core.ry.ycx.sya.sya());
            sQLiteDatabase.execSQL(com.bytedance.sdk.openadsdk.dj.wie.ycx());
        }

        private void zb(SQLiteDatabase sQLiteDatabase) throws SQLException {
            sQLiteDatabase.execSQL(com.bytedance.sdk.openadsdk.core.ry.ycx.sya.dj());
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onCreate(SQLiteDatabase sQLiteDatabase) {
            try {
                ycx(sQLiteDatabase, this.ycx);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "f8wFkA+sbNXEbtZJjROhO17GKJkTuXs=", "VOAOhwa9fcI=", 199);
                com.bytedance.sdk.component.utils.htf.sya("DBHelper", th2.getMessage());
            }
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onDowngrade(SQLiteDatabase sQLiteDatabase, int i5, int i11) {
            if (i5 > i11) {
                try {
                    sya(sQLiteDatabase);
                    ycx(sQLiteDatabase, ul.this.f26286zb);
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "f8wFkA+sbNXEbtZJjROhO17GKJkTuXs=", "VOAJmhSybtWBTtI=", 232);
                    com.bytedance.sdk.component.utils.htf.sya(th2.getMessage(), new Object[0]);
                }
            }
        }

        /* JADX WARN: Removed duplicated region for block: B:10:0x001b A[Catch: all -> 0x000c, TryCatch #0 {all -> 0x000c, blocks: (B:4:0x0008, B:7:0x000e, B:8:0x0017, B:10:0x001b, B:11:0x001f, B:12:0x002a, B:13:0x0035, B:14:0x0040, B:15:0x0049), top: B:25:0x0008 }] */
        /* JADX WARN: Removed duplicated region for block: B:11:0x001f A[Catch: all -> 0x000c, TryCatch #0 {all -> 0x000c, blocks: (B:4:0x0008, B:7:0x000e, B:8:0x0017, B:10:0x001b, B:11:0x001f, B:12:0x002a, B:13:0x0035, B:14:0x0040, B:15:0x0049), top: B:25:0x0008 }] */
        /* JADX WARN: Removed duplicated region for block: B:12:0x002a A[Catch: all -> 0x000c, TryCatch #0 {all -> 0x000c, blocks: (B:4:0x0008, B:7:0x000e, B:8:0x0017, B:10:0x001b, B:11:0x001f, B:12:0x002a, B:13:0x0035, B:14:0x0040, B:15:0x0049), top: B:25:0x0008 }] */
        /* JADX WARN: Removed duplicated region for block: B:13:0x0035 A[Catch: all -> 0x000c, TryCatch #0 {all -> 0x000c, blocks: (B:4:0x0008, B:7:0x000e, B:8:0x0017, B:10:0x001b, B:11:0x001f, B:12:0x002a, B:13:0x0035, B:14:0x0040, B:15:0x0049), top: B:25:0x0008 }] */
        /* JADX WARN: Removed duplicated region for block: B:14:0x0040 A[Catch: all -> 0x000c, TryCatch #0 {all -> 0x000c, blocks: (B:4:0x0008, B:7:0x000e, B:8:0x0017, B:10:0x001b, B:11:0x001f, B:12:0x002a, B:13:0x0035, B:14:0x0040, B:15:0x0049), top: B:25:0x0008 }] */
        /* JADX WARN: Removed duplicated region for block: B:15:0x0049 A[Catch: all -> 0x000c, TRY_LEAVE, TryCatch #0 {all -> 0x000c, blocks: (B:4:0x0008, B:7:0x000e, B:8:0x0017, B:10:0x001b, B:11:0x001f, B:12:0x002a, B:13:0x0035, B:14:0x0040, B:15:0x0049), top: B:25:0x0008 }] */
        /* JADX WARN: Removed duplicated region for block: B:9:0x001a  */
        @Override // android.database.sqlite.SQLiteOpenHelper
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i5, int i11) {
            if (i5 > i11) {
                try {
                    sya(sQLiteDatabase);
                    ycx(sQLiteDatabase, ul.this.f26286zb);
                    switch (i5) {
                        case 1:
                            ycx(sQLiteDatabase);
                            break;
                        case 2:
                            sQLiteDatabase.execSQL("DROP TABLE IF EXISTS 'ad_video_info';");
                            ycx(sQLiteDatabase);
                            break;
                        case 3:
                            sQLiteDatabase.execSQL(com.bytedance.sdk.openadsdk.dj.dy.ycx());
                            ycx(sQLiteDatabase);
                            break;
                        case 4:
                            sQLiteDatabase.execSQL(com.bytedance.sdk.component.adexpress.ycx.zb.zb.sya());
                            ycx(sQLiteDatabase);
                            break;
                        case 5:
                            sQLiteDatabase.execSQL(com.bytedance.sdk.openadsdk.dj.syc.ycx());
                            ycx(sQLiteDatabase);
                            break;
                        case 6:
                            ycx(sQLiteDatabase);
                            break;
                    }
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "f8wFkA+sbNXEbtZJjROhO17GKJkTuXs=", "VOAYhQSuaMOF", 284);
                }
            } else {
                ycx(sQLiteDatabase, ul.this.f26286zb);
                switch (i5) {
                }
            }
            if (i5 < 11) {
                try {
                    zb(sQLiteDatabase);
                    com.bytedance.sdk.openadsdk.oty.zb.ycx(sQLiteDatabase);
                } catch (Throwable th3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "f8wFkA+sbNXEbtZJjROhO17GKJkTuXs=", "VOAYhQSuaMOF", 291);
                    com.bytedance.sdk.component.utils.htf.sya("DBHelper", th3.getMessage());
                }
            }
        }

        private void ycx(SQLiteDatabase sQLiteDatabase) throws SQLException {
            sQLiteDatabase.execSQL(com.bytedance.sdk.openadsdk.dj.dj.zb());
            sQLiteDatabase.execSQL(com.bytedance.sdk.openadsdk.dj.ea.dj());
            sQLiteDatabase.execSQL(com.bytedance.sdk.openadsdk.dj.dy.zb());
            sQLiteDatabase.execSQL(com.bytedance.sdk.openadsdk.dj.syc.zb());
        }
    }
}
