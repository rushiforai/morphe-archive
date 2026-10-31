package com.bytedance.sdk.component.ul.sya;

import a2.c;
import android.net.Uri;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes2.dex */
public class sya {
    private static final sya ycx = new sya();

    /* renamed from: zb, reason: collision with root package name */
    private final Object f24069zb = new Object();
    private volatile List<String> sya = new ArrayList();

    /* renamed from: dj, reason: collision with root package name */
    private final ConcurrentHashMap<String, Integer> f24066dj = new ConcurrentHashMap<>();
    private final ConcurrentHashMap<String, Long> lud = new ConcurrentHashMap<>();

    /* renamed from: lt, reason: collision with root package name */
    private volatile boolean f24067lt = false;

    /* renamed from: ul, reason: collision with root package name */
    private volatile int f24068ul = 10;
    private volatile long fby = 1800000;

    private sya() {
    }

    public static sya ycx() {
        return ycx;
    }

    private List<String> zb(String str, List<String> list) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(str);
        if (list != null) {
            arrayList.addAll(list);
        }
        return arrayList;
    }

    public void ycx(lud ludVar) {
        if (this.f24067lt == ludVar.ycx && this.f24068ul == ludVar.f24065zb && this.fby == ludVar.sya) {
            return;
        }
        this.f24067lt = ludVar.ycx;
        this.f24068ul = ludVar.f24065zb;
        this.fby = ludVar.sya;
    }

    private boolean zb(List<String> list, String str) {
        if (!list.contains(str)) {
            list.add(str);
            return true;
        }
        if (((String) c.e(1, list)).equals(str)) {
            return false;
        }
        list.remove(str);
        list.add(str);
        return true;
    }

    private String ycx(String str) {
        if (str == null) {
            return null;
        }
        try {
            Uri uri = Uri.parse(str);
            String host = uri.getHost();
            String path = uri.getPath();
            if (host != null && path != null) {
                if (path.isEmpty()) {
                    path = "/";
                }
                return host.concat(path);
            }
            return null;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZO+iSZEA==", "f+EglAqyRdWVZ9ZTjRalOg==", "XOs5pQKoYeyFUw==", 74);
            return null;
        }
    }

    private String ycx(String str, String str2, List<String> list) {
        if (str.equals(ycx(str2))) {
            return str2;
        }
        for (String str3 : list) {
            if (str.equals(ycx(str3))) {
                return str3;
            }
        }
        return null;
    }

    public List<String> ycx(String str, List<String> list) {
        if (list != null && !list.isEmpty()) {
            if (!this.f24067lt) {
                return zb(str, list);
            }
            String strYcx = ycx(str);
            if (strYcx == null) {
                return zb(str, list);
            }
            ArrayList arrayList = new ArrayList();
            ArrayList arrayList2 = new ArrayList();
            List<String> list2 = this.sya;
            Iterator<String> it = list2.iterator();
            while (it.hasNext()) {
                String strYcx2 = ycx(it.next(), str, list);
                if (strYcx2 != null && !arrayList.contains(strYcx2)) {
                    arrayList.add(strYcx2);
                }
            }
            for (String str2 : list) {
                if (!list2.contains(ycx(str2)) && !arrayList.contains(str2)) {
                    arrayList2.add(str2);
                }
            }
            if (!arrayList.isEmpty() && !arrayList2.isEmpty()) {
                arrayList.addAll(1, arrayList2);
            } else if (arrayList.isEmpty() && !arrayList2.isEmpty()) {
                arrayList.addAll(arrayList2);
            }
            LinkedHashSet linkedHashSet = new LinkedHashSet(arrayList);
            linkedHashSet.add(str);
            linkedHashSet.addAll(list);
            ArrayList arrayList3 = new ArrayList(linkedHashSet);
            Long l9 = this.lud.get(strYcx);
            long jCurrentTimeMillis = System.currentTimeMillis();
            if ((l9 == null || jCurrentTimeMillis >= l9.longValue()) && arrayList3.remove(str)) {
                arrayList3.add(0, str);
            }
            arrayList3.toString();
            return arrayList3;
        }
        ArrayList arrayList4 = new ArrayList();
        arrayList4.add(str);
        return arrayList4;
    }

    public void ycx(String str, String str2, boolean z11) {
        if ((z11 || com.bytedance.sdk.component.ul.ycx.ul()) && this.f24067lt && !TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2)) {
            String strYcx = ycx(str);
            String strYcx2 = ycx(str2);
            if (strYcx == null || strYcx2 == null) {
                return;
            }
            boolean zEquals = str.equals(str2);
            synchronized (this.f24069zb) {
                try {
                    ArrayList arrayList = new ArrayList(this.sya);
                    boolean zZb = false;
                    if (zEquals) {
                        if (z11) {
                            this.f24066dj.remove(strYcx2);
                            this.lud.remove(strYcx2);
                            zZb = ycx(arrayList, strYcx2);
                        } else {
                            long jCurrentTimeMillis = System.currentTimeMillis();
                            Long l9 = this.lud.get(strYcx2);
                            if (l9 != null && jCurrentTimeMillis < l9.longValue()) {
                                zZb = zb(arrayList, strYcx2);
                            } else {
                                Integer num = this.f24066dj.get(strYcx2);
                                int iIntValue = (num == null ? 0 : num.intValue()) + 1;
                                this.f24066dj.put(strYcx2, Integer.valueOf(iIntValue));
                                if (iIntValue >= this.f24068ul) {
                                    this.lud.put(strYcx2, Long.valueOf(jCurrentTimeMillis + this.fby));
                                    zZb = zb(arrayList, strYcx2);
                                    this.f24066dj.remove(strYcx2);
                                }
                            }
                        }
                    } else if (z11) {
                        Long l11 = this.lud.get(strYcx2);
                        long jCurrentTimeMillis2 = System.currentTimeMillis();
                        if (l11 != null && l11.longValue() > jCurrentTimeMillis2) {
                            zZb = ycx(arrayList, strYcx);
                        }
                    } else {
                        zZb = zb(arrayList, strYcx);
                    }
                    if (zZb) {
                        while (arrayList.size() > 15) {
                            arrayList.remove(arrayList.size() - 1);
                        }
                        this.sya = arrayList;
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
    }

    private boolean ycx(List<String> list, String str) {
        if (!list.isEmpty() && list.get(0).equals(str)) {
            return false;
        }
        list.remove(str);
        list.add(0, str);
        return true;
    }
}
