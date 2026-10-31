package com.bytedance.sdk.openadsdk.pmi;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.bytedance.sdk.component.fby.ycx.lt;
import com.bytedance.sdk.openadsdk.BusMonitorDependWrapper;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: dj, reason: collision with root package name */
    private static Context f26971dj;
    private Boolean fby;

    /* renamed from: lt, reason: collision with root package name */
    private zb f26976lt;

    /* renamed from: ul, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.pmi.sya.ycx f26978ul;
    public static final long ycx = com.bytedance.sdk.openadsdk.pmi.dj.ycx.ycx();

    /* renamed from: zb, reason: collision with root package name */
    private static final String[] f26972zb = {"_id", "sdk_version", "scene", "start_count", "success_count", "fail_count", "rit", "tag", "label", "timestamp", "mediation", "is_init", "extra"};
    private static final long sya = System.currentTimeMillis();
    private final ArrayList<dj> lud = new ArrayList<>();

    /* renamed from: jw, reason: collision with root package name */
    private final Runnable f26975jw = new Runnable() { // from class: com.bytedance.sdk.openadsdk.pmi.ycx.1
        @Override // java.lang.Runnable
        public void run() {
            if (!ycx.this.dj() || ycx.this.lud.isEmpty()) {
                return;
            }
            ycx ycxVar = ycx.this;
            ycxVar.ycx(ycxVar.lud);
            ycx.this.lud.clear();
        }
    };

    /* renamed from: jc, reason: collision with root package name */
    private int f26974jc = 0;

    /* renamed from: ea, reason: collision with root package name */
    private long f26973ea = -1;

    /* renamed from: ok, reason: collision with root package name */
    private final Runnable f26977ok = new Runnable() { // from class: com.bytedance.sdk.openadsdk.pmi.ycx.4
        @Override // java.lang.Runnable
        public void run() {
            int i5;
            int i11;
            int i12;
            int i13;
            int i14;
            int i15;
            int i16;
            try {
                SQLiteDatabase sQLiteDatabaseZb = com.bytedance.sdk.openadsdk.pmi.ycx.ycx.zb();
                if (sQLiteDatabaseZb != null) {
                    String[] strArr = {String.valueOf(ycx.this.f26976lt.getOnceLogInterval() < 86400000 ? ycx.sya : ycx.ycx)};
                    int iMax = Math.max(10, ycx.this.f26976lt.getOnceLogCount());
                    if (iMax > 100) {
                        iMax = 10;
                    }
                    Cursor cursorQuery = sQLiteDatabaseZb.query("monitor_table", ycx.f26972zb, "timestamp < ?", strArr, null, null, "_id ASC", String.valueOf(iMax));
                    if (cursorQuery != null) {
                        ArrayList arrayList = new ArrayList();
                        ArrayList arrayList2 = new ArrayList();
                        int columnIndex = cursorQuery.getColumnIndex("_id");
                        int columnIndex2 = cursorQuery.getColumnIndex("sdk_version");
                        int columnIndex3 = cursorQuery.getColumnIndex("scene");
                        int columnIndex4 = cursorQuery.getColumnIndex("start_count");
                        int columnIndex5 = cursorQuery.getColumnIndex("success_count");
                        int columnIndex6 = cursorQuery.getColumnIndex("fail_count");
                        int columnIndex7 = cursorQuery.getColumnIndex("rit");
                        int columnIndex8 = cursorQuery.getColumnIndex("tag");
                        int columnIndex9 = cursorQuery.getColumnIndex("label");
                        int columnIndex10 = cursorQuery.getColumnIndex("timestamp");
                        int columnIndex11 = cursorQuery.getColumnIndex("mediation");
                        int i17 = iMax;
                        int columnIndex12 = cursorQuery.getColumnIndex("is_init");
                        ArrayList arrayList3 = arrayList;
                        int columnIndex13 = cursorQuery.getColumnIndex("extra");
                        while (cursorQuery.moveToNext()) {
                            int i18 = columnIndex13;
                            com.bytedance.sdk.openadsdk.pmi.zb.ycx ycxVar = new com.bytedance.sdk.openadsdk.pmi.zb.ycx();
                            if (columnIndex >= 0) {
                                i11 = columnIndex10;
                                i12 = columnIndex11;
                                long j11 = cursorQuery.getLong(columnIndex);
                                i5 = columnIndex;
                                if (j11 == ycx.this.f26973ea && j11 > 0) {
                                    break;
                                }
                                ycxVar.ycx(j11);
                                arrayList2.add(String.valueOf(j11));
                            } else {
                                i5 = columnIndex;
                                i11 = columnIndex10;
                                i12 = columnIndex11;
                            }
                            if (columnIndex2 >= 0) {
                                ycxVar.ycx(cursorQuery.getString(columnIndex2));
                            }
                            if (columnIndex3 >= 0) {
                                ycxVar.zb(cursorQuery.getString(columnIndex3));
                            }
                            if (columnIndex4 >= 0) {
                                ycxVar.ycx(cursorQuery.getInt(columnIndex4));
                            }
                            if (columnIndex5 >= 0) {
                                ycxVar.zb(cursorQuery.getInt(columnIndex5));
                            }
                            if (columnIndex6 >= 0) {
                                ycxVar.sya(cursorQuery.getInt(columnIndex6));
                            }
                            if (columnIndex7 >= 0) {
                                ycxVar.sya(cursorQuery.getString(columnIndex7));
                            }
                            if (columnIndex8 >= 0) {
                                ycxVar.dj(cursorQuery.getString(columnIndex8));
                            }
                            if (columnIndex9 >= 0) {
                                ycxVar.lud(cursorQuery.getString(columnIndex9));
                            }
                            if (i11 >= 0) {
                                i13 = i11;
                                ycxVar.zb(cursorQuery.getLong(i13));
                            } else {
                                i13 = i11;
                            }
                            if (i12 >= 0) {
                                i14 = i12;
                                ycxVar.lt(cursorQuery.getString(i14));
                            } else {
                                i14 = i12;
                            }
                            if (columnIndex12 >= 0) {
                                ycxVar.dj(cursorQuery.getInt(columnIndex12));
                            }
                            if (i18 >= 0) {
                                i15 = i18;
                                i16 = columnIndex12;
                                ycxVar.ul(cursorQuery.getString(i15));
                            } else {
                                i15 = i18;
                                i16 = columnIndex12;
                            }
                            ArrayList arrayList4 = arrayList3;
                            arrayList4.add(ycxVar);
                            arrayList3 = arrayList4;
                            columnIndex13 = i15;
                            columnIndex12 = i16;
                            columnIndex11 = i14;
                            columnIndex10 = i13;
                            columnIndex = i5;
                        }
                        ArrayList arrayList5 = arrayList3;
                        cursorQuery.close();
                        if (arrayList5.isEmpty()) {
                            return;
                        }
                        ycx.this.f26976lt.onMonitorUpload(arrayList5);
                        SQLiteDatabase sQLiteDatabaseYcx = com.bytedance.sdk.openadsdk.pmi.ycx.ycx.ycx();
                        if (sQLiteDatabaseYcx != null && sQLiteDatabaseYcx.isOpen()) {
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("_id IN (");
                            for (int i19 = 0; i19 < arrayList2.size(); i19++) {
                                sb2.append("?");
                                if (i19 < arrayList2.size() - 1) {
                                    sb2.append(",");
                                }
                            }
                            sb2.append(")");
                            sQLiteDatabaseYcx.delete("monitor_table", sb2.toString(), (String[]) arrayList2.toArray(new String[0]));
                            if (ycx.this.f26978ul != null) {
                                ycx.this.f26978ul.ycx(ycx.sya);
                            }
                        }
                        if (arrayList5.size() < i17 || ycx.this.f26974jc > 1000) {
                            return;
                        }
                        ycx.this.ycx(false);
                    }
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EeriFP4T8=", "efs+uAyyYNOPWPRYggWlOh+6", "Sfsj", 468);
            }
        }
    };

    private ycx(zb zbVar) {
        try {
            this.f26976lt = new BusMonitorDependWrapper(zbVar);
            this.f26978ul = new com.bytedance.sdk.openadsdk.pmi.sya.ycx(zbVar.getContext());
            f26971dj = zbVar.getContext();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EeriFP4T8=", "efs+uAyyYNOPWPRYggWlOg==", "B+cjnBfi", 104);
        }
    }

    public static /* synthetic */ int dj(ycx ycxVar) {
        int i5 = ycxVar.f26974jc;
        ycxVar.f26974jc = i5 + 1;
        return i5;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean dj() {
        if (this.fby == null) {
            zb zbVar = this.f26976lt;
            this.fby = Boolean.valueOf((zbVar == null || zbVar.getContext() == null || !this.f26976lt.isMonitorOpen() || this.f26976lt.getHandler() == null) ? false : true);
        }
        return this.fby.booleanValue();
    }

    public static ycx ycx(zb zbVar) {
        return new ycx(zbVar);
    }

    public static Context ycx() {
        Context context = f26971dj;
        return context != null ? context : BusMonitorDependWrapper.getReflectContext();
    }

    public void ycx(final dj djVar) {
        if (djVar == null || !dj()) {
            return;
        }
        final lt handler = this.f26976lt.getHandler();
        handler.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.pmi.ycx.2
            @Override // java.lang.Runnable
            public void run() {
                ycx.this.lud.add(djVar);
                if (ycx.this.lud.size() >= 10) {
                    handler.zb(ycx.this.f26975jw);
                    ycx ycxVar = ycx.this;
                    ycxVar.ycx(ycxVar.lud);
                    ycx.this.lud.clear();
                }
            }
        });
        handler.zb(this.f26975jw);
        handler.ycx(this.f26975jw, 5000L);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(List<dj> list) {
        com.bytedance.sdk.openadsdk.pmi.zb.ycx ycxVarYcx;
        if (list == null || list.isEmpty()) {
            return;
        }
        SQLiteDatabase sQLiteDatabase = null;
        try {
            try {
                SQLiteDatabase sQLiteDatabaseYcx = com.bytedance.sdk.openadsdk.pmi.ycx.ycx.ycx();
                if (sQLiteDatabaseYcx != null) {
                    try {
                        sQLiteDatabaseYcx.beginTransaction();
                        for (int i5 = 0; i5 < list.size(); i5++) {
                            dj djVar = list.get(i5);
                            if (djVar != null && (ycxVarYcx = djVar.ycx()) != null) {
                                Cursor cursorQuery = sQLiteDatabaseYcx.query("monitor_table", f26972zb, "sdk_version = ? AND scene = ? AND rit = ? AND tag = ? AND label = ? AND mediation = ? AND is_init = ? AND timestamp = ? AND extra = ?", new String[]{ycxVarYcx.zb(), ycxVarYcx.sya(), ycxVarYcx.ul(), ycxVarYcx.fby(), ycxVarYcx.jw(), ycxVarYcx.ea(), String.valueOf(ycxVarYcx.ok()), String.valueOf(ycxVarYcx.jc()), ycxVarYcx.ry()}, null, null, null);
                                if (cursorQuery != null) {
                                    if (cursorQuery.moveToNext()) {
                                        int columnIndex = cursorQuery.getColumnIndex("_id");
                                        if (columnIndex >= 0) {
                                            ycxVarYcx.ycx(cursorQuery.getLong(columnIndex));
                                        }
                                        int columnIndex2 = cursorQuery.getColumnIndex("start_count");
                                        if (columnIndex2 >= 0) {
                                            ycxVarYcx.ycx(cursorQuery.getInt(columnIndex2) + ycxVarYcx.dj());
                                        }
                                        int columnIndex3 = cursorQuery.getColumnIndex("success_count");
                                        if (columnIndex3 >= 0) {
                                            ycxVarYcx.zb(cursorQuery.getInt(columnIndex3) + ycxVarYcx.lud());
                                        }
                                        int columnIndex4 = cursorQuery.getColumnIndex("fail_count");
                                        if (columnIndex4 >= 0) {
                                            ycxVarYcx.sya(cursorQuery.getInt(columnIndex4) + ycxVarYcx.lt());
                                        }
                                    }
                                    cursorQuery.close();
                                }
                                ContentValues contentValues = new ContentValues();
                                if (ycxVarYcx.ycx() > 0) {
                                    contentValues.put("_id", Long.valueOf(ycxVarYcx.ycx()));
                                }
                                contentValues.put("sdk_version", ycxVarYcx.zb());
                                contentValues.put("scene", ycxVarYcx.sya());
                                contentValues.put("start_count", Integer.valueOf(ycxVarYcx.dj()));
                                contentValues.put("success_count", Integer.valueOf(ycxVarYcx.lud()));
                                contentValues.put("fail_count", Integer.valueOf(ycxVarYcx.lt()));
                                contentValues.put("rit", ycxVarYcx.ul());
                                contentValues.put("tag", ycxVarYcx.fby());
                                contentValues.put("label", ycxVarYcx.jw());
                                contentValues.put("timestamp", Long.valueOf(ycxVarYcx.jc()));
                                contentValues.put("mediation", ycxVarYcx.ea());
                                contentValues.put("is_init", Integer.valueOf(ycxVarYcx.ok()));
                                contentValues.put("extra", ycxVarYcx.ry());
                                long jInsertWithOnConflict = sQLiteDatabaseYcx.insertWithOnConflict("monitor_table", null, contentValues, 5);
                                if (jInsertWithOnConflict > 0 && this.f26973ea < 0 && ycxVarYcx.ycx() < 0) {
                                    this.f26973ea = jInsertWithOnConflict;
                                }
                            }
                        }
                        sQLiteDatabaseYcx.setTransactionSuccessful();
                    } catch (Throwable th2) {
                        th = th2;
                        sQLiteDatabase = sQLiteDatabaseYcx;
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EeriFP4T8=", "efs+uAyyYNOPWPRYggWlOg==", "XvYoljC9f8KyT9RSnhU=", 239);
                        if (sQLiteDatabase != null) {
                            sQLiteDatabase.endTransaction();
                            return;
                        }
                        return;
                    }
                }
                if (sQLiteDatabaseYcx != null) {
                    sQLiteDatabaseYcx.endTransaction();
                }
            } catch (Throwable th3) {
                th = th3;
            }
        } catch (Throwable th4) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th4, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EeriFP4T8=", "efs+uAyyYNOPWPRYggWlOg==", "XvYoljC9f8KyT9RSnhU=", 248);
        }
    }

    public void ycx(final boolean z11) {
        final lt handler = this.f26976lt.getHandler();
        zb zbVar = this.f26976lt;
        if (zbVar == null || handler == null || zbVar.getContext() == null || this.f26978ul == null || !dj()) {
            return;
        }
        handler.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.pmi.ycx.3
            @Override // java.lang.Runnable
            public void run() {
                try {
                    ycx.dj(ycx.this);
                    if (z11) {
                        long jYcx = ycx.this.f26978ul.ycx();
                        if (jYcx == 0) {
                            ycx.this.f26978ul.ycx(System.currentTimeMillis());
                            return;
                        } else if (com.bytedance.sdk.openadsdk.pmi.dj.ycx.ycx(jYcx) && System.currentTimeMillis() - jYcx < ycx.this.f26976lt.getUploadIntervalTime()) {
                            return;
                        }
                    }
                    handler.ycx(ycx.this.f26977ok);
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EeriFP4T8=", "efs+uAyyYNOPWPRYggWlOh+9", "Sfsj", Sdk.SDKError.Reason.GENERATE_JSON_DATA_ERROR_VALUE);
                }
            }
        }, Math.max(this.f26976lt.getOnceLogInterval(), 10000));
    }
}
