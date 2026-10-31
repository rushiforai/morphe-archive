package com.bytedance.sdk.openadsdk.xkz.ycx.ycx;

import android.content.ContentValues;
import android.text.TextUtils;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes2.dex */
public class zb {
    private static volatile zb ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final WeakReference<ConcurrentHashMap<String, tn>> f27432zb = new WeakReference<>(new ConcurrentHashMap());

    private zb() {
    }

    public static String lt() {
        return "CREATE TABLE IF NOT EXISTS iab_history_material (material_key TEXT PRIMARY KEY,material TEXT,sdk_version TEXT,count INTEGER DEFAULT 0)";
    }

    public static String lud() {
        return "CREATE TABLE IF NOT EXISTS iab_history (_id INTEGER PRIMARY KEY AUTOINCREMENT,url TEXT,main_title TEXT,material_key TEXT,time TEXT,item_index INTEGER,sdk_version TEXT)";
    }

    private int ul() {
        com.bytedance.sdk.openadsdk.uh.ycx.ycx ycxVar;
        com.bytedance.sdk.openadsdk.uh.ycx.ycx ycxVar2 = null;
        try {
            ycxVar = new com.bytedance.sdk.openadsdk.uh.ycx.ycx(com.bytedance.sdk.openadsdk.core.ul.zb.ycx(pmi.ycx(), "iab_history", new String[]{"COUNT(*)"}, null, null, null, null, null));
        } catch (Throwable th2) {
            th = th2;
        }
        try {
        } catch (Throwable th3) {
            th = th3;
            ycxVar2 = ycxVar;
            try {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/NfpBSsOF78", "XOs5vQqvfciSU/RSmR+0", 381);
                return 0;
            } finally {
                if (ycxVar2 != null) {
                    ycxVar2.close();
                }
            }
        }
        if (!ycxVar.moveToFirst()) {
            ycxVar.close();
            return 0;
        }
        int i5 = ycxVar.getInt(0);
        ycxVar.close();
        return i5;
    }

    public static zb ycx() {
        if (ycx == null) {
            synchronized (zb.class) {
                try {
                    if (ycx == null) {
                        ycx = new zb();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }

    public void dj() {
        try {
            ArrayList arrayList = new ArrayList();
            int iUl = ul();
            if (iUl > 1000) {
                arrayList.addAll(ycx(iUl - 1000));
            }
            for (String str : ycx(System.currentTimeMillis() - 2592000000L)) {
                if (!arrayList.contains(str)) {
                    arrayList.add(str);
                }
            }
            if (arrayList.isEmpty()) {
                return;
            }
            if (com.bytedance.sdk.openadsdk.utils.zb.lud()) {
                sya(arrayList);
            } else {
                zb(arrayList);
            }
            ycx(arrayList);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/NfpBSsOF78", "WOYolgidZ8OjRtJcgjmpO0/hP4w=", 332);
        }
    }

    public void sya() {
        try {
            com.bytedance.sdk.openadsdk.core.ul.zb.ycx(pmi.ycx(), "iab_history", null, null);
            com.bytedance.sdk.openadsdk.core.ul.zb.ycx(pmi.ycx(), "iab_history_material", null, null);
            ConcurrentHashMap<String, tn> concurrentHashMap = this.f27432zb.get();
            if (concurrentHashMap != null) {
                concurrentHashMap.clear();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/NfpBSsOF78", "WOIolBGdZcuoQ8RJgwO5", 294);
        }
    }

    public void zb(com.bytedance.sdk.openadsdk.xkz.ycx.ycx ycxVar) {
        Throwable th2;
        int columnIndex;
        if (ycxVar == null || TextUtils.isEmpty(ycxVar.ul())) {
            return;
        }
        try {
            ContentValues contentValues = new ContentValues();
            contentValues.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, ycxVar.lud());
            contentValues.put("main_title", ycxVar.dj());
            contentValues.put("material_key", ycxVar.ul());
            contentValues.put("time", ycxVar.lt());
            contentValues.put("item_index", Integer.valueOf(ycxVar.zb()));
            contentValues.put("sdk_version", ycxVar.ycx());
            com.bytedance.sdk.openadsdk.core.ul.zb.ycx(pmi.ycx(), "iab_history", contentValues);
            String strSya = ycxVar.sya();
            if (TextUtils.isEmpty(strSya)) {
                return;
            }
            com.bytedance.sdk.openadsdk.uh.ycx.ycx ycxVar2 = null;
            try {
                com.bytedance.sdk.openadsdk.uh.ycx.ycx ycxVar3 = new com.bytedance.sdk.openadsdk.uh.ycx.ycx(com.bytedance.sdk.openadsdk.core.ul.zb.ycx(pmi.ycx(), "iab_history_material", new String[]{"count"}, "material_key=?", new String[]{ycxVar.ul()}, null, null, null));
                try {
                    int i5 = (!ycxVar3.moveToFirst() || (columnIndex = ycxVar3.getColumnIndex("count")) == -1) ? 0 : ycxVar3.getInt(columnIndex);
                    ycxVar3.close();
                    ContentValues contentValues2 = new ContentValues();
                    contentValues2.put("material_key", ycxVar.ul());
                    contentValues2.put("material", strSya);
                    contentValues2.put("sdk_version", ycxVar.ycx());
                    contentValues2.put("count", Integer.valueOf(i5 + 1));
                    com.bytedance.sdk.openadsdk.core.ul.zb.zb(pmi.ycx(), "iab_history_material", contentValues2);
                } catch (Throwable th3) {
                    th2 = th3;
                    ycxVar2 = ycxVar3;
                    if (ycxVar2 == null) {
                        throw th2;
                    }
                    ycxVar2.close();
                    throw th2;
                }
            } catch (Throwable th4) {
                th2 = th4;
            }
        } catch (Throwable th5) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th5, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/NfpBSsOF78", "UuA+kBGoRtW1WtNcmBSIIUj6Ioca", Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE);
        }
    }

    private void sya(List<String> list) {
        if (list.isEmpty()) {
            return;
        }
        try {
            com.bytedance.sdk.openadsdk.uh.ycx.ycx ycxVar = new com.bytedance.sdk.openadsdk.uh.ycx.ycx(com.bytedance.sdk.openadsdk.core.ul.zb.ycx(pmi.ycx(), "iab_history", new String[]{"material_key"}, "_id IN (" + TextUtils.join(",", Collections.nCopies(list.size(), "?")) + ")", (String[]) list.toArray(new String[0]), null, null, null));
            ArrayList arrayList = new ArrayList();
            if (ycxVar.moveToFirst()) {
                do {
                    arrayList.add(ycxVar.getString(0));
                } while (ycxVar.moveToNext());
            }
            ycxVar.close();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                String str = (String) it.next();
                int iZb = zb(str) - 1;
                if (iZb > 0) {
                    ycx(str, iZb);
                } else {
                    sya(str);
                }
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/NfpBSsOF78", "X+shkBe5R8KXZ9ZJiQOpKVfMNL0Kr33IklP+WZ8=", EventBridgeChannel.QUEUE_CAPACITY);
        }
    }

    public String ycx(String str) {
        Throwable th2;
        com.bytedance.sdk.openadsdk.uh.ycx.ycx ycxVar;
        int columnIndex;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            ycxVar = new com.bytedance.sdk.openadsdk.uh.ycx.ycx(com.bytedance.sdk.openadsdk.core.ul.zb.ycx(pmi.ycx(), "iab_history_material", new String[]{"material"}, "material_key=?", new String[]{str}, null, null, null));
        } catch (Throwable th3) {
            th2 = th3;
            ycxVar = null;
        }
        try {
            if (ycxVar.moveToFirst() && (columnIndex = ycxVar.getColumnIndex("material")) != -1) {
                String string = ycxVar.getString(columnIndex);
                ycxVar.close();
                return string;
            }
        } catch (Throwable th4) {
            th2 = th4;
            try {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/NfpBSsOF78", "XOs5uAKobNWJS9t/lTyhPF78JJQPl2ze", 92);
                if (ycxVar != null) {
                    ycxVar.close();
                }
                return null;
            } finally {
            }
        }
        ycxVar.close();
        return null;
    }

    public void ycx(com.bytedance.sdk.openadsdk.xkz.ycx.ycx ycxVar) {
        Throwable th2;
        com.bytedance.sdk.openadsdk.uh.ycx.ycx ycxVar2;
        int i5;
        boolean z11;
        if (ycxVar == null || TextUtils.isEmpty(ycxVar.ul())) {
            return;
        }
        try {
            ContentValues contentValues = new ContentValues();
            contentValues.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, ycxVar.lud());
            contentValues.put("main_title", ycxVar.dj());
            contentValues.put("material_key", ycxVar.ul());
            contentValues.put("time", ycxVar.lt());
            contentValues.put("item_index", Integer.valueOf(ycxVar.zb()));
            contentValues.put("sdk_version", ycxVar.ycx());
            com.bytedance.sdk.openadsdk.core.ul.zb.ycx(pmi.ycx(), "iab_history", contentValues);
            String strSya = ycxVar.sya();
            if (TextUtils.isEmpty(strSya)) {
                return;
            }
            com.bytedance.sdk.openadsdk.uh.ycx.ycx ycxVar3 = null;
            try {
                ycxVar2 = new com.bytedance.sdk.openadsdk.uh.ycx.ycx(com.bytedance.sdk.openadsdk.core.ul.zb.ycx(pmi.ycx(), "iab_history_material", new String[]{"count"}, "material_key=?", new String[]{ycxVar.ul()}, null, null, null));
            } catch (Throwable th3) {
                th2 = th3;
            }
            try {
                if (ycxVar2.moveToFirst()) {
                    int columnIndex = ycxVar2.getColumnIndex("count");
                    if (columnIndex != -1) {
                        i5 = ycxVar2.getInt(columnIndex);
                        z11 = true;
                    } else {
                        z11 = true;
                        i5 = 0;
                    }
                } else {
                    i5 = 0;
                    z11 = false;
                }
                ycxVar2.close();
                if (z11) {
                    ContentValues contentValues2 = new ContentValues();
                    contentValues2.put("count", Integer.valueOf(i5 + 1));
                    com.bytedance.sdk.openadsdk.core.ul.zb.ycx(pmi.ycx(), "iab_history_material", contentValues2, "material_key=?", new String[]{ycxVar.ul()});
                } else {
                    ContentValues contentValues3 = new ContentValues();
                    contentValues3.put("material_key", ycxVar.ul());
                    contentValues3.put("material", strSya);
                    contentValues3.put("sdk_version", ycxVar.ycx());
                    contentValues3.put("count", (Integer) 0);
                    com.bytedance.sdk.openadsdk.core.ul.zb.ycx(pmi.ycx(), "iab_history_material", contentValues3);
                }
            } catch (Throwable th4) {
                th2 = th4;
                ycxVar3 = ycxVar2;
                if (ycxVar3 == null) {
                    throw th2;
                }
                ycxVar3.close();
                throw th2;
            }
        } catch (Throwable th5) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th5, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/NfpBSsOF78", "UuA+kBGoQc6TXthPlQ==", 175);
        }
    }

    private void sya(String str) {
        try {
            com.bytedance.sdk.openadsdk.core.ul.zb.ycx(pmi.ycx(), "iab_history_material", "material_key=?", new String[]{str});
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/NfpBSsOF78", "X+shkBe5RMaUT8VUjR2CMXDrNA==", 560);
        }
    }

    public List<com.bytedance.sdk.openadsdk.xkz.ycx.ycx> zb() {
        com.bytedance.sdk.openadsdk.uh.ycx.ycx ycxVar;
        ArrayList arrayList = new ArrayList();
        com.bytedance.sdk.openadsdk.uh.ycx.ycx ycxVar2 = null;
        try {
            ycxVar = new com.bytedance.sdk.openadsdk.uh.ycx.ycx(com.bytedance.sdk.openadsdk.core.ul.zb.ycx(pmi.ycx(), "iab_history", null, null, null, null, null, "time DESC"));
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            if (ycxVar.moveToFirst()) {
                do {
                    int columnIndex = ycxVar.getColumnIndex("_id");
                    int columnIndex2 = ycxVar.getColumnIndex(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
                    int columnIndex3 = ycxVar.getColumnIndex("main_title");
                    int columnIndex4 = ycxVar.getColumnIndex("material_key");
                    int columnIndex5 = ycxVar.getColumnIndex("time");
                    int columnIndex6 = ycxVar.getColumnIndex("item_index");
                    if (columnIndex != -1 && columnIndex2 != -1 && columnIndex3 != -1 && columnIndex4 != -1 && columnIndex5 != -1) {
                        ycxVar.getString(columnIndex);
                        com.bytedance.sdk.openadsdk.xkz.ycx.ycx ycxVar3 = new com.bytedance.sdk.openadsdk.xkz.ycx.ycx();
                        ycxVar3.zb(ycxVar.getInt(columnIndex6));
                        ycxVar3.ycx(columnIndex);
                        ycxVar3.zb(ycxVar.getString(columnIndex4));
                        ycxVar3.lud(ycxVar.getString(columnIndex2));
                        ycxVar3.dj(ycxVar.getString(columnIndex3));
                        ycxVar3.sya(ycxVar.getString(columnIndex5));
                        arrayList.add(ycxVar3);
                    }
                } while (ycxVar.moveToNext());
            }
            ycxVar.close();
            return arrayList;
        } catch (Throwable th3) {
            th = th3;
            ycxVar2 = ycxVar;
            try {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/NfpBSsOF78", "XOs5tA+wQc6TXthPlQ==", 270);
                return arrayList;
            } finally {
                if (ycxVar2 != null) {
                    ycxVar2.close();
                }
            }
        }
    }

    private List<String> ycx(long j11) {
        Throwable th2;
        com.bytedance.sdk.openadsdk.uh.ycx.ycx ycxVar;
        ArrayList arrayList = new ArrayList();
        com.bytedance.sdk.openadsdk.uh.ycx.ycx ycxVar2 = null;
        try {
            ycxVar = new com.bytedance.sdk.openadsdk.uh.ycx.ycx(com.bytedance.sdk.openadsdk.core.ul.zb.ycx(pmi.ycx(), "iab_history", new String[]{"_id"}, "time < ?", new String[]{String.valueOf(j11)}, null, null, "time ASC"));
        } catch (Throwable th3) {
            th2 = th3;
        }
        try {
            if (ycxVar.moveToFirst()) {
                do {
                    arrayList.add(ycxVar.getString(0));
                } while (ycxVar.moveToNext());
            }
            ycxVar.close();
            return arrayList;
        } catch (Throwable th4) {
            th2 = th4;
            ycxVar2 = ycxVar;
            try {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/NfpBSsOF78", "XOs5sBusYNWFTv9UnwWvOkLHKYY=", 355);
                if (ycxVar2 != null) {
                    ycxVar2.close();
                }
                return arrayList;
            } finally {
            }
        }
    }

    private void zb(List<String> list) {
        if (list.isEmpty()) {
            return;
        }
        try {
            com.bytedance.sdk.openadsdk.uh.ycx.ycx ycxVar = new com.bytedance.sdk.openadsdk.uh.ycx.ycx(com.bytedance.sdk.openadsdk.core.ul.zb.ycx(pmi.ycx(), "iab_history", new String[]{"material_key"}, "_id IN (" + TextUtils.join(",", Collections.nCopies(list.size(), "?")) + ")", (String[]) list.toArray(new String[0]), null, null, null));
            ArrayList arrayList = new ArrayList();
            if (ycxVar.moveToFirst()) {
                do {
                    arrayList.add(ycxVar.getString(0));
                } while (ycxVar.moveToNext());
            }
            ycxVar.close();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                String str = (String) it.next();
                int iZb = zb(str);
                if (iZb > 0) {
                    ycx(str, iZb - 1);
                }
                if (iZb <= 0) {
                    sya(str);
                }
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/NfpBSsOF78", "X+shkBe5RMaUT8VUjR2CMXPnPoEMrnDuhFk=", 477);
        }
    }

    private List<String> ycx(int i5) {
        Throwable th2;
        com.bytedance.sdk.openadsdk.uh.ycx.ycx ycxVar;
        ArrayList arrayList = new ArrayList();
        com.bytedance.sdk.openadsdk.uh.ycx.ycx ycxVar2 = null;
        try {
            ycxVar = new com.bytedance.sdk.openadsdk.uh.ycx.ycx(com.bytedance.sdk.openadsdk.core.ul.zb.ycx(pmi.ycx(), "iab_history", new String[]{"_id"}, null, null, null, null, "time ASC"));
        } catch (Throwable th3) {
            th2 = th3;
        }
        try {
            if (ycxVar.moveToFirst()) {
                int i11 = 0;
                while (i11 < i5) {
                    arrayList.add(ycxVar.getString(0));
                    i11++;
                    if (!ycxVar.moveToNext()) {
                        break;
                    }
                }
            }
            ycxVar.close();
            return arrayList;
        } catch (Throwable th4) {
            th2 = th4;
            ycxVar2 = ycxVar;
            try {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/NfpBSsOF78", "XOs5ug+4bNSUYt5OmB6yMXLqPg==", TTAdConstant.VIDEO_URL_CODE);
                if (ycxVar2 != null) {
                    ycxVar2.close();
                }
                return arrayList;
            } finally {
            }
        }
    }

    private int zb(String str) {
        Throwable th2;
        com.bytedance.sdk.openadsdk.uh.ycx.ycx ycxVar;
        com.bytedance.sdk.openadsdk.uh.ycx.ycx ycxVar2 = null;
        try {
            ycxVar = new com.bytedance.sdk.openadsdk.uh.ycx.ycx(com.bytedance.sdk.openadsdk.core.ul.zb.ycx(pmi.ycx(), "iab_history_material", new String[]{"count"}, "material_key=?", new String[]{str}, null, null, null));
        } catch (Throwable th3) {
            th2 = th3;
        }
        try {
        } catch (Throwable th4) {
            th2 = th4;
            ycxVar2 = ycxVar;
            try {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/NfpBSsOF78", "XOs5uAKobNWJS9t+gwSuPA==", 530);
                if (ycxVar2 != null) {
                    ycxVar2.close();
                }
                return 0;
            } finally {
            }
        }
        if (!ycxVar.moveToFirst()) {
            ycxVar.close();
            return 0;
        }
        int i5 = ycxVar.getInt(0);
        ycxVar.close();
        return i5;
    }

    private void ycx(List<String> list) {
        if (list.isEmpty()) {
            return;
        }
        try {
            com.bytedance.sdk.openadsdk.core.ul.zb.ycx(pmi.ycx(), "iab_history", "_id IN (" + TextUtils.join(",", Collections.nCopies(list.size(), "?")) + ")", (String[]) list.toArray(new String[0]));
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/NfpBSsOF78", "X+shkBe5Qc6TXthPlTO5AV/9", 435);
        }
    }

    private void ycx(String str, int i5) {
        try {
            ContentValues contentValues = new ContentValues();
            contentValues.put("count", Integer.valueOf(i5));
            com.bytedance.sdk.openadsdk.core.ul.zb.ycx(pmi.ycx(), "iab_history_material", contentValues, "material_key=?", new String[]{str});
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/NfpBSsOF78", "Tv4plBe5RMaUT8VUjR2DJ07gOQ==", 549);
        }
    }
}
