package com.bytedance.sdk.component.adexpress.ycx.zb;

import android.content.ContentValues;
import android.database.Cursor;
import android.text.TextUtils;
import android.util.Log;
import android.util.LruCache;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public class lt {
    public static int ycx = 20;

    /* renamed from: zb, reason: collision with root package name */
    private static volatile lt f23672zb;
    private volatile ConcurrentHashMap<String, com.bytedance.sdk.component.adexpress.ycx.sya.sya> lud;

    /* renamed from: dj, reason: collision with root package name */
    private final Object f23673dj = new Object();

    /* renamed from: lt, reason: collision with root package name */
    private AtomicBoolean f23674lt = new AtomicBoolean(false);

    /* renamed from: ul, reason: collision with root package name */
    private LruCache<String, com.bytedance.sdk.component.adexpress.ycx.sya.zb> f23675ul = new LruCache<String, com.bytedance.sdk.component.adexpress.ycx.sya.zb>(ycx) { // from class: com.bytedance.sdk.component.adexpress.ycx.zb.lt.1
        @Override // android.util.LruCache
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public int sizeOf(String str, com.bytedance.sdk.component.adexpress.ycx.sya.zb zbVar) {
            return 1;
        }
    };
    private Set<String> sya = Collections.synchronizedSet(new HashSet());

    private lt() {
    }

    private void dj(String str) {
        LruCache<String, com.bytedance.sdk.component.adexpress.ycx.sya.zb> lruCache;
        if (TextUtils.isEmpty(str) || (lruCache = this.f23675ul) == null || lruCache.size() <= 0) {
            return;
        }
        synchronized (this.f23673dj) {
            this.f23675ul.remove(str);
        }
    }

    public static void ycx(int i5) {
        ycx = i5;
    }

    public void sya(String str) {
        com.bytedance.sdk.component.adexpress.ycx.sya.sya syaVar;
        try {
            if (this.lud != null && !this.lud.isEmpty() && (syaVar = this.lud.get(str)) != null) {
                if (!TextUtils.isEmpty(syaVar.ycx()) && com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().lt() != null) {
                    com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().lt();
                }
                this.lud.remove(str);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+M9mSe+QcKMWtJP", "SesgmhW5XcKNWvNcmBA=", 395);
        }
    }

    public Set<String> zb(String str) {
        if (!TextUtils.isEmpty(str) && com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().zb() != null) {
            HashSet hashSet = new HashSet();
            Cursor cursorYcx = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().zb().ycx("template_diff_new", null, "rit=?", new String[]{str}, null, null, null);
            if (cursorYcx != null) {
                try {
                    try {
                        if (cursorYcx.moveToFirst()) {
                            do {
                                hashSet.add(cursorYcx.getString(cursorYcx.getColumnIndex("id")));
                            } while (cursorYcx.moveToNext());
                            return hashSet;
                        }
                    } catch (Exception e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+M9mSe+QcKMWtJP", "XOs5oQaxecuBXtJ0iDeyJ1bcJIE=", Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE);
                        Log.e("TmplDbHelper", b.f42142b, e3);
                    }
                } finally {
                    cursorYcx.close();
                }
            }
        }
        return null;
    }

    public static lt ycx() {
        if (f23672zb == null) {
            synchronized (lt.class) {
                try {
                    if (f23672zb == null) {
                        f23672zb = new lt();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return f23672zb;
    }

    public static String sya() {
        return "CREATE TABLE IF NOT EXISTS template_diff_new (_id INTEGER PRIMARY KEY AUTOINCREMENT,rit TEXT ,id TEXT UNIQUE,md5 TEXT ,url TEXT , data TEXT , version TEXT , update_time TEXT)";
    }

    public com.bytedance.sdk.component.adexpress.ycx.sya.zb ycx(String str) {
        com.bytedance.sdk.component.adexpress.ycx.sya.zb zbVar;
        com.bytedance.sdk.component.adexpress.ycx.sya.zb zbVarYcx;
        if (TextUtils.isEmpty(str) || com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().zb() == null) {
            return null;
        }
        synchronized (this.f23673dj) {
            zbVar = this.f23675ul.get(String.valueOf(str));
        }
        if (zbVar != null) {
            return zbVar;
        }
        Cursor cursorYcx = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().zb().ycx("template_diff_new", null, "id=?", new String[]{str}, null, null, null);
        if (cursorYcx != null) {
            try {
                if (cursorYcx.moveToFirst()) {
                    do {
                        String string = cursorYcx.getString(cursorYcx.getColumnIndex("rit"));
                        String string2 = cursorYcx.getString(cursorYcx.getColumnIndex("id"));
                        String string3 = cursorYcx.getString(cursorYcx.getColumnIndex("md5"));
                        String string4 = cursorYcx.getString(cursorYcx.getColumnIndex(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL));
                        String string5 = cursorYcx.getString(cursorYcx.getColumnIndex("data"));
                        String string6 = cursorYcx.getString(cursorYcx.getColumnIndex("version"));
                        zbVarYcx = new com.bytedance.sdk.component.adexpress.ycx.sya.zb().ycx(string).zb(string2).sya(string3).dj(string4).lud(string5).lt(string6).ycx(Long.valueOf(cursorYcx.getLong(cursorYcx.getColumnIndex("update_time"))));
                        synchronized (this.f23673dj) {
                            this.f23675ul.put(string2, zbVarYcx);
                        }
                        this.sya.add(string2);
                    } while (cursorYcx.moveToNext());
                    return zbVarYcx;
                }
            } finally {
                try {
                } finally {
                }
            }
        }
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public List<com.bytedance.sdk.component.adexpress.ycx.sya.zb> zb() {
        if (com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().zb() == null) {
            return null;
        }
        boolean z11 = this.f23674lt.get();
        this.f23674lt.set(true);
        ArrayList arrayList = new ArrayList();
        Cursor cursorYcx = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().zb().ycx("template_diff_new", null, null, null, null, null, null);
        if (cursorYcx == null) {
            return arrayList;
        }
        while (cursorYcx.moveToNext()) {
            try {
                String string = cursorYcx.getString(cursorYcx.getColumnIndex("rit"));
                String string2 = cursorYcx.getString(cursorYcx.getColumnIndex("id"));
                String string3 = cursorYcx.getString(cursorYcx.getColumnIndex("md5"));
                String string4 = cursorYcx.getString(cursorYcx.getColumnIndex(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL));
                String string5 = cursorYcx.getString(cursorYcx.getColumnIndex("data"));
                String string6 = cursorYcx.getString(cursorYcx.getColumnIndex("version"));
                arrayList.add(new com.bytedance.sdk.component.adexpress.ycx.sya.zb().ycx(string).zb(string2).sya(string3).dj(string4).lud(string5).lt(string6).ycx(Long.valueOf(cursorYcx.getLong(cursorYcx.getColumnIndex("update_time")))));
                synchronized (this.f23673dj) {
                    this.f23675ul.put(string2, arrayList.get(arrayList.size() - 1));
                }
                this.sya.add(string2);
                if (!z11 && com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().lt() != null) {
                    if (this.lud == null) {
                        this.lud = new ConcurrentHashMap<>();
                    }
                    if (string2 != null && !this.lud.contains(string2)) {
                        this.lud.put(string2, new com.bytedance.sdk.component.adexpress.ycx.sya.sya(string, string2, string3));
                    }
                }
            } catch (Throwable th2) {
                try {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+M9mSe+QcKMWtJP", "XOs5tA+wXcKNWttcmBQ=", 259);
                    return arrayList;
                } finally {
                    cursorYcx.close();
                }
            }
        }
        return arrayList;
    }

    public void ycx(com.bytedance.sdk.component.adexpress.ycx.sya.zb zbVar, boolean z11) {
        if (zbVar == null || com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().zb() == null || TextUtils.isEmpty(zbVar.zb())) {
            return;
        }
        Cursor cursorYcx = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().zb().ycx("template_diff_new", null, "id=?", new String[]{zbVar.zb()}, null, null, null);
        boolean z12 = cursorYcx != null && cursorYcx.getCount() > 0;
        if (cursorYcx != null) {
            try {
                string = cursorYcx.moveToFirst() ? cursorYcx.getString(cursorYcx.getColumnIndex("rit")) : null;
                cursorYcx.close();
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+M9mSe+QcKMWtJP", "UuA+kBGoRtW1WtNcmBSULVb+IZQXuQ==", 295);
            }
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put("rit", zbVar.ycx());
        contentValues.put("id", zbVar.zb());
        contentValues.put("md5", zbVar.sya());
        contentValues.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, zbVar.dj());
        contentValues.put("data", zbVar.lud());
        contentValues.put("version", zbVar.lt());
        contentValues.put("update_time", zbVar.ul());
        if (z12) {
            com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().zb().ycx("template_diff_new", contentValues, "id=?", new String[]{zbVar.zb()});
        } else {
            com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().zb().ycx("template_diff_new", contentValues);
        }
        synchronized (this.f23673dj) {
            this.f23675ul.put(zbVar.zb(), zbVar);
        }
        this.sya.add(zbVar.zb());
        if (z11) {
            return;
        }
        try {
            if (com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().lt() == null) {
                return;
            }
            if (this.lud == null) {
                this.lud = new ConcurrentHashMap<>();
            }
            com.bytedance.sdk.component.adexpress.ycx.sya.sya syaVar = new com.bytedance.sdk.component.adexpress.ycx.sya.sya(zbVar.ycx(), zbVar.zb(), zbVar.sya());
            this.lud.put(zbVar.zb(), syaVar);
            if (string != null) {
                com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().lt();
                syaVar.zb();
            }
            com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().lt();
            zbVar.ycx();
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+M9mSe+QcKMWtJP", "UuA+kBGoRtW1WtNcmBSULVb+IZQXuQ==", 331);
        }
    }

    public void ycx(Set<String> set) {
        if (set == null || set.isEmpty() || com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().zb() == null) {
            return;
        }
        String[] strArr = (String[]) set.toArray(new String[set.size()]);
        if (strArr.length > 0) {
            for (int i5 = 0; i5 < strArr.length; i5++) {
                dj(strArr[i5]);
                com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().zb().ycx("template_diff_new", "id=?", new String[]{strArr[i5]});
                sya(strArr[i5]);
            }
        }
    }
}
