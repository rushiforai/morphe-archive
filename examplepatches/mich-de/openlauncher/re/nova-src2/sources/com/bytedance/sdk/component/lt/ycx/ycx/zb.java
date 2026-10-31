package com.bytedance.sdk.component.lt.ycx.ycx;

import android.text.TextUtils;
import com.bytedance.sdk.component.lt.ycx.ul;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;

/* loaded from: classes2.dex */
public class zb extends ycx {
    private final Queue<String> sya;
    private final dj ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final sya f23905zb;

    public zb() {
        ConcurrentLinkedQueue concurrentLinkedQueue = new ConcurrentLinkedQueue();
        this.sya = concurrentLinkedQueue;
        this.ycx = new lt(concurrentLinkedQueue);
        this.f23905zb = new sya();
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.dj
    public synchronized void ycx(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar, int i5) {
        dj djVar;
        if (i5 != 5) {
            try {
                if (ul.lt().syc().ycx(ul.lt().lud()) && (djVar = this.ycx) != null && ycxVar != null) {
                    djVar.ycx(ycxVar, i5);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        sya syaVar = this.f23905zb;
        if (syaVar != null && ycxVar != null) {
            syaVar.ycx(ycxVar, i5);
        }
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.dj
    public synchronized void ycx(int i5, List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list) {
        try {
            Iterator<com.bytedance.sdk.component.lt.ycx.dj.ycx> it = list.iterator();
            while (it.hasNext()) {
                this.sya.remove(it.next().sya());
            }
            dj djVar = this.ycx;
            if (djVar != null) {
                djVar.ycx(i5, list);
            }
            sya syaVar = this.f23905zb;
            if (syaVar != null) {
                syaVar.ycx(i5, list);
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:11:0x0018 A[Catch: all -> 0x0051, TryCatch #0 {all -> 0x0051, blocks: (B:3:0x0001, B:5:0x0009, B:7:0x000f, B:66:0x014b, B:69:0x0152, B:70:0x0156, B:72:0x015c, B:76:0x016e, B:11:0x0018, B:13:0x002b, B:15:0x0031, B:16:0x003d, B:18:0x0043, B:21:0x0054, B:22:0x005f, B:24:0x0065, B:25:0x006f, B:27:0x0075, B:29:0x0085, B:30:0x008d, B:31:0x0091, B:33:0x0097, B:34:0x00a5, B:35:0x00b0, B:37:0x00b6, B:38:0x00c4, B:39:0x00c9, B:41:0x00d2, B:43:0x00d8, B:44:0x00db, B:46:0x00e3, B:48:0x00e9, B:49:0x00f2, B:51:0x00f8, B:52:0x0106, B:54:0x010f, B:55:0x0113, B:57:0x0119, B:59:0x0125, B:60:0x0129, B:61:0x0134, B:63:0x013a), top: B:81:0x0001 }] */
    @Override // com.bytedance.sdk.component.lt.ycx.ycx.dj
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public synchronized List<com.bytedance.sdk.component.lt.ycx.dj.ycx> ycx(int i5, int i11, List<String> list) {
        List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list2;
        try {
            List<com.bytedance.sdk.component.lt.ycx.dj.ycx> listYcx = this.ycx.ycx(i5, i11, list);
            if (listYcx != 0 && listYcx.size() != 0) {
                listYcx.size();
                if (i5 != 1) {
                    list2 = listYcx;
                    if (i5 == 2) {
                        List<com.bytedance.sdk.component.lt.ycx.dj.ycx> listZb = this.f23905zb.zb((com.bytedance.sdk.component.lt.ycx.dj.ycx) listYcx.get(0), listYcx.size());
                        list2 = listYcx;
                        if (listZb != null) {
                            list2 = listYcx;
                            if (listZb.size() != 0) {
                                listZb.size();
                                HashMap map = new HashMap();
                                for (com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar : listZb) {
                                    map.put(ycxVar.sya(), ycxVar);
                                }
                                ArrayList arrayList = new ArrayList(this.sya);
                                for (com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar2 : listZb) {
                                    Iterator it = arrayList.iterator();
                                    while (true) {
                                        if (it.hasNext()) {
                                            if (TextUtils.equals(ycxVar2.sya(), (String) it.next())) {
                                                map.remove(ycxVar2.sya());
                                                break;
                                            }
                                        }
                                    }
                                }
                                for (com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar3 : listYcx) {
                                    map.put(ycxVar3.sya(), ycxVar3);
                                }
                                listYcx.clear();
                                Iterator it2 = map.keySet().iterator();
                                while (it2.hasNext()) {
                                    listYcx.add(map.get((String) it2.next()));
                                }
                                listZb.clear();
                                list2 = listYcx;
                            }
                        }
                    }
                }
            } else {
                ArrayList arrayList2 = new ArrayList(this.sya);
                if (list != null && !list.isEmpty()) {
                    arrayList2.addAll(list);
                }
                List<com.bytedance.sdk.component.lt.ycx.dj.ycx> listYcx2 = this.f23905zb.ycx(i5, i11, arrayList2);
                if (listYcx2 != 0 && listYcx2.size() != 0) {
                    HashMap map2 = new HashMap();
                    for (com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar4 : listYcx2) {
                        map2.put(ycxVar4.sya(), ycxVar4);
                    }
                    arrayList2.size();
                    if (arrayList2.size() != 0) {
                        Iterator it3 = arrayList2.iterator();
                        while (it3.hasNext()) {
                            String str = (String) it3.next();
                            if (map2.get(str) != null) {
                                map2.remove(str);
                            }
                        }
                    }
                    listYcx2.clear();
                    Iterator it4 = map2.keySet().iterator();
                    while (it4.hasNext()) {
                        listYcx2.add(map2.get((String) it4.next()));
                    }
                }
                list2 = listYcx2;
            }
            if (list2 != null && !list2.isEmpty()) {
                Iterator<com.bytedance.sdk.component.lt.ycx.dj.ycx> it5 = list2.iterator();
                while (it5.hasNext()) {
                    this.sya.offer(it5.next().sya());
                }
                return list2;
            }
            return new ArrayList();
        } catch (Throwable th2) {
            throw th2;
        }
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.dj
    public synchronized boolean ycx(int i5, boolean z11) {
        if (this.ycx.ycx(i5, z11)) {
            com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.aeu(), 1);
            return true;
        }
        if ((i5 != 1 && i5 != 2) || !this.f23905zb.ycx(i5, z11)) {
            return false;
        }
        com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.xz(), 1);
        return true;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.dj
    public void ycx(int i5, long j11) {
        this.f23905zb.ycx(i5, j11);
        this.ycx.ycx(i5, j11);
    }
}
