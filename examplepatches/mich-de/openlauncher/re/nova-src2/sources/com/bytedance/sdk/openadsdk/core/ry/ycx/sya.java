package com.bytedance.sdk.openadsdk.core.ry.ycx;

import android.content.ContentValues;
import android.text.TextUtils;
import android.util.LruCache;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/* loaded from: classes2.dex */
public class sya {
    public static int ycx = 20;

    /* renamed from: zb, reason: collision with root package name */
    private static volatile sya f25997zb;
    private final Object sya = new Object();

    /* renamed from: dj, reason: collision with root package name */
    private final LruCache<String, ycx> f25998dj = new LruCache<String, ycx>(ycx) { // from class: com.bytedance.sdk.openadsdk.core.ry.ycx.sya.1
        @Override // android.util.LruCache
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public int sizeOf(String str, ycx ycxVar) {
            return 1;
        }
    };

    private sya() {
    }

    public static String dj() {
        return "ALTER TABLE ugen_template ADD COLUMN rit TEXT ";
    }

    public static String sya() {
        return "CREATE TABLE IF NOT EXISTS ugen_template (_id INTEGER PRIMARY KEY AUTOINCREMENT,id TEXT UNIQUE,md5 TEXT ,url TEXT , data TEXT , rit TEXT , update_time TEXT)";
    }

    public static sya ycx() {
        if (f25997zb == null) {
            synchronized (sya.class) {
                try {
                    if (f25997zb == null) {
                        f25997zb = new sya();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return f25997zb;
    }

    public List<ycx> zb() {
        ArrayList arrayList = new ArrayList();
        com.bytedance.sdk.openadsdk.uh.ycx.ycx ycxVar = new com.bytedance.sdk.openadsdk.uh.ycx.ycx(com.bytedance.sdk.openadsdk.uh.zb.ycx.ycx(pmi.ycx(), "ugen_template", null, null, null, null, null, null));
        try {
            if (ycxVar.moveToFirst()) {
                do {
                    int columnIndex = ycxVar.getColumnIndex("id");
                    int columnIndex2 = ycxVar.getColumnIndex("md5");
                    int columnIndex3 = ycxVar.getColumnIndex(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
                    int columnIndex4 = ycxVar.getColumnIndex("data");
                    int columnIndex5 = ycxVar.getColumnIndex("update_time");
                    if (columnIndex != -1 && columnIndex2 != -1 && columnIndex3 != -1 && columnIndex5 != -1 && columnIndex4 != -1) {
                        int columnIndex6 = ycxVar.getColumnIndex("rit");
                        String string = columnIndex6 != -1 ? ycxVar.getString(columnIndex6) : null;
                        String string2 = ycxVar.getString(columnIndex);
                        String string3 = ycxVar.getString(columnIndex2);
                        String string4 = ycxVar.getString(columnIndex3);
                        ycx ycxVarYcx = new ycx().ycx(string2).zb(string3).sya(string4).dj(ycxVar.getString(columnIndex4)).lud(string).ycx(Long.valueOf(ycxVar.getLong(columnIndex5)));
                        arrayList.add(ycxVarYcx);
                        synchronized (this.sya) {
                            this.f25998dj.put(string2, ycxVarYcx);
                        }
                    }
                } while (ycxVar.moveToNext());
            }
            return arrayList;
        } catch (Throwable th2) {
            try {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJqxoNC0g==", "bskomzexecukSP9YgAGlOg==", "XOs5tA+wXcKNWttcmBQ=", Sdk.SDKError.Reason.PLACEMENT_SLEEP_VALUE);
                htf.ycx("UGTmplDbHelper", "getUgenTemplate error", th2);
                return arrayList;
            } finally {
                ycxVar.close();
            }
        }
    }

    public ycx ycx(String str, String str2) {
        ycx ycxVar;
        ycx ycxVarYcx;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        synchronized (this.sya) {
            ycxVar = this.f25998dj.get(str);
        }
        if (ycxVar != null) {
            if (TextUtils.equals(str2, ycxVar.zb())) {
                return ycxVar;
            }
            zb(str2);
            return null;
        }
        com.bytedance.sdk.openadsdk.uh.ycx.ycx ycxVar2 = new com.bytedance.sdk.openadsdk.uh.ycx.ycx(com.bytedance.sdk.openadsdk.uh.zb.ycx.ycx(pmi.ycx(), "ugen_template", null, "id=? AND md5=?", new String[]{str, str2}, null, null, null));
        try {
            if (ycxVar2.moveToFirst()) {
                do {
                    int columnIndex = ycxVar2.getColumnIndex("id");
                    int columnIndex2 = ycxVar2.getColumnIndex("md5");
                    int columnIndex3 = ycxVar2.getColumnIndex(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
                    int columnIndex4 = ycxVar2.getColumnIndex("data");
                    int columnIndex5 = ycxVar2.getColumnIndex("update_time");
                    if (columnIndex != -1 && columnIndex2 != -1 && columnIndex3 != -1 && columnIndex5 != -1 && columnIndex4 != -1) {
                        int columnIndex6 = ycxVar2.getColumnIndex("rit");
                        String string = ycxVar2.getString(columnIndex);
                        String string2 = ycxVar2.getString(columnIndex2);
                        String string3 = ycxVar2.getString(columnIndex3);
                        String string4 = ycxVar2.getString(columnIndex4);
                        if (TextUtils.isEmpty(string4)) {
                            return null;
                        }
                        ycxVarYcx = new ycx().ycx(string).zb(string2).dj(string4).sya(string3).lud(columnIndex6 != -1 ? ycxVar2.getString(columnIndex6) : null).ycx(Long.valueOf(ycxVar2.getLong(columnIndex5)));
                        synchronized (this.sya) {
                            this.f25998dj.put(string, ycxVarYcx);
                        }
                    }
                    return null;
                } while (ycxVar2.moveToNext());
                return ycxVarYcx;
            }
        } finally {
            try {
                return null;
            } finally {
            }
        }
        return null;
    }

    private void zb(String str) {
        if (!TextUtils.isEmpty(str) && this.f25998dj.size() > 0) {
            synchronized (this.sya) {
                this.f25998dj.remove(str);
            }
        }
    }

    public void ycx(ycx ycxVar) {
        if (ycxVar == null || TextUtils.isEmpty(ycxVar.ycx())) {
            return;
        }
        com.bytedance.sdk.openadsdk.uh.ycx.ycx ycxVar2 = new com.bytedance.sdk.openadsdk.uh.ycx.ycx(com.bytedance.sdk.openadsdk.uh.zb.ycx.ycx(pmi.ycx(), "ugen_template", null, "id=?", new String[]{ycxVar.ycx()}, null, null, null));
        boolean z11 = ycxVar2.getCount() > 0;
        try {
            ycxVar2.close();
            ContentValues contentValues = new ContentValues();
            contentValues.put("id", ycxVar.ycx());
            contentValues.put("md5", ycxVar.zb());
            contentValues.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, ycxVar.sya());
            contentValues.put("data", ycxVar.lud());
            contentValues.put("rit", ycxVar.lt());
            contentValues.put("update_time", ycxVar.dj());
            if (z11) {
                com.bytedance.sdk.openadsdk.uh.zb.ycx.ycx(pmi.ycx(), "ugen_template", contentValues, "id=?", new String[]{ycxVar.ycx()});
            } else {
                com.bytedance.sdk.openadsdk.uh.zb.ycx.ycx(pmi.ycx(), "ugen_template", contentValues);
            }
            synchronized (this.sya) {
                this.f25998dj.put(ycxVar.ycx(), ycxVar);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJqxoNC0g==", "bskomzexecukSP9YgAGlOg==", "UuA+kBGoRtW1WtNcmBSULVb+IZQXuQ==", 167);
        }
    }

    public Set<ycx> ycx(String str) {
        ycx ycxVar;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        HashSet hashSet = new HashSet();
        com.bytedance.sdk.openadsdk.uh.ycx.ycx ycxVar2 = new com.bytedance.sdk.openadsdk.uh.ycx.ycx(com.bytedance.sdk.openadsdk.uh.zb.ycx.ycx(pmi.ycx(), "ugen_template", null, "rit=?", new String[]{str}, null, null, null));
        try {
            if (ycxVar2.moveToFirst()) {
                do {
                    int columnIndex = ycxVar2.getColumnIndex("id");
                    if (columnIndex != -1) {
                        String string = ycxVar2.getString(columnIndex);
                        if (!TextUtils.isEmpty(string)) {
                            synchronized (this.sya) {
                                ycxVar = this.f25998dj.get(string);
                            }
                            if (ycxVar != null) {
                                hashSet.add(ycxVar);
                            } else {
                                ycx ycxVar3 = new ycx();
                                int columnIndex2 = ycxVar2.getColumnIndex("data");
                                if (columnIndex2 != -1) {
                                    String string2 = ycxVar2.getString(columnIndex2);
                                    if (!TextUtils.isEmpty(string2)) {
                                        ycxVar3.dj(string2);
                                        ycxVar3.ycx(string);
                                        ycxVar3.lud(str);
                                        int columnIndex3 = ycxVar2.getColumnIndex("md5");
                                        int columnIndex4 = ycxVar2.getColumnIndex(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
                                        int columnIndex5 = ycxVar2.getColumnIndex("update_time");
                                        if (columnIndex3 != -1) {
                                            ycxVar3.zb(ycxVar2.getString(columnIndex3));
                                        }
                                        if (columnIndex4 != -1) {
                                            ycxVar3.sya(ycxVar2.getString(columnIndex4));
                                        }
                                        if (columnIndex5 != -1) {
                                            ycxVar3.ycx(Long.valueOf(ycxVar2.getLong(columnIndex5)));
                                        }
                                        hashSet.add(ycxVar3);
                                        synchronized (this.sya) {
                                            this.f25998dj.put(string, ycxVar3);
                                        }
                                    }
                                }
                            }
                        }
                    }
                } while (ycxVar2.moveToNext());
            }
            return hashSet;
        } catch (Throwable th2) {
            try {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJqxoNC0g==", "bskomzexecukSP9YgAGlOg==", "XOs5oAS5Z/OFR8dRjQWlDknhIKcKqA==", 274);
                htf.ycx("UGTmplDbHelper", "getUgenTemplateFormRit error", th2);
                return hashSet;
            } finally {
                ycxVar2.close();
            }
        }
    }

    public void ycx(Set<String> set) {
        if (set == null || set.isEmpty()) {
            return;
        }
        String[] strArr = (String[]) set.toArray(new String[set.size()]);
        if (strArr.length > 0) {
            for (String str : strArr) {
                zb(str);
                com.bytedance.sdk.openadsdk.uh.zb.ycx.ycx(pmi.ycx(), "ugen_template", "id=?", new String[]{str});
            }
        }
    }
}
