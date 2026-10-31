package com.bykv.vk.openvk.preload.geckox.a;

import android.accounts.NetworkErrorException;
import android.content.Context;
import android.os.SystemClock;
import com.bykv.vk.openvk.preload.geckox.logger.GeckoLogger;
import com.bykv.vk.openvk.preload.geckox.model.Common;
import com.bykv.vk.openvk.preload.geckox.model.ComponentModel;
import com.bykv.vk.openvk.preload.geckox.net.Response;
import com.bykv.vk.openvk.preload.geckox.statistic.model.StatisticModel;
import com.bykv.vk.openvk.preload.geckox.utils.e;
import com.bykv.vk.openvk.preload.geckox.utils.g;
import com.tiktok.util.UrlConst;
import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    private List<String> f21984a;

    /* renamed from: b, reason: collision with root package name */
    private int f21985b = 1;

    /* renamed from: com.bykv.vk.openvk.preload.geckox.a.a$a, reason: collision with other inner class name */
    public static class C0010a {

        /* renamed from: a, reason: collision with root package name */
        String f21988a;

        /* renamed from: b, reason: collision with root package name */
        String f21989b;

        /* renamed from: c, reason: collision with root package name */
        int f21990c;

        /* renamed from: d, reason: collision with root package name */
        long f21991d;

        /* renamed from: e, reason: collision with root package name */
        File f21992e;

        public C0010a(String str, String str2, int i5, long j11, File file) {
            this.f21988a = str;
            this.f21989b = str2;
            this.f21990c = i5;
            this.f21991d = j11;
            this.f21992e = file;
        }
    }

    public a(List<String> list) {
        this.f21984a = list;
    }

    public static void a(final Context context, Map<String, ComponentModel.b> map, File file, com.bykv.vk.openvk.preload.geckox.d.a aVar) {
        final ArrayList arrayList;
        ComponentModel.b value;
        List<ComponentModel.a> list;
        List<Long> listB;
        List<Long> listB2;
        if (map == null || map.isEmpty()) {
            return;
        }
        try {
            arrayList = new ArrayList();
            for (Map.Entry<String, ComponentModel.b> entry : map.entrySet()) {
                String key = entry.getKey();
                File file2 = new File(file, key);
                if (file2.isDirectory() && (value = entry.getValue()) != null && (list = value.f22119a) != null && !list.isEmpty()) {
                    List<ComponentModel.a> list2 = value.f22119a;
                    HashSet hashSet = new HashSet();
                    for (ComponentModel.a aVar2 : list2) {
                        String str = aVar2.f22116a;
                        if (!hashSet.contains(str)) {
                            hashSet.add(str);
                            int i5 = aVar2.f22117b;
                            List<Long> list3 = aVar2.f22118c;
                            File file3 = new File(file2, str);
                            if (i5 != 1) {
                                if (i5 != 2) {
                                    if (i5 == 3) {
                                        File file4 = new File(file2, str);
                                        File file5 = new File(file2, str + "--pending-delete");
                                        file4.renameTo(file5);
                                        arrayList.add(new C0010a(key, str, i5, 0L, file5));
                                    }
                                } else if (list3 != null && (listB = g.b(file3)) != null && !listB.isEmpty()) {
                                    for (Long l9 : listB) {
                                        if (list3.get(0).longValue() > l9.longValue()) {
                                            File file6 = new File(file3, l9 + "--pending-delete");
                                            new File(file3, String.valueOf(l9)).renameTo(file6);
                                            arrayList.add(new C0010a(key, str, i5, l9.longValue(), file6));
                                        }
                                    }
                                }
                            } else if (list3 != null && (listB2 = g.b(file3)) != null && !listB2.isEmpty()) {
                                for (Long l11 : listB2) {
                                    if (list3.contains(l11)) {
                                        File file7 = new File(file3, l11 + "--pending-delete");
                                        new File(file3, String.valueOf(l11)).renameTo(file7);
                                        arrayList.add(new C0010a(key, str, i5, l11.longValue(), file7));
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } catch (Exception e3) {
            e3.printStackTrace();
            arrayList = null;
        }
        if (arrayList == null) {
            return;
        }
        com.bykv.vk.openvk.preload.geckox.utils.c.a().execute(new Runnable() { // from class: com.bykv.vk.openvk.preload.geckox.a.a.1
            @Override // java.lang.Runnable
            public final void run() {
                try {
                    Context context2 = context;
                    List<C0010a> list4 = arrayList;
                    if (list4 != null && !list4.isEmpty()) {
                        for (C0010a c0010a : list4) {
                            File file8 = c0010a.f21992e;
                            long jUptimeMillis = SystemClock.uptimeMillis();
                            boolean zA = com.bykv.vk.openvk.preload.geckox.utils.b.a(file8);
                            long jUptimeMillis2 = SystemClock.uptimeMillis();
                            if (zA) {
                                b.a(context2).a(c0010a.f21988a, c0010a.f21989b, c0010a.f21990c, 200, c0010a.f21991d, 0, null, jUptimeMillis2 - jUptimeMillis);
                            } else {
                                b.a(context2).a(c0010a.f21988a, c0010a.f21989b, c0010a.f21990c, 201, c0010a.f21991d, Sdk.SDKError.Reason.NATIVE_VIDEO_PLAYBACK_ERROR_VALUE, "delete failed", jUptimeMillis2 - jUptimeMillis);
                            }
                        }
                    }
                } catch (Exception e11) {
                    GeckoLogger.w("clean-channel", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, e11);
                }
            }
        });
    }

    public static List<StatisticModel.PackageStatisticModel> a(Context context) {
        return b.a(context).a();
    }

    public static void a(com.bykv.vk.openvk.preload.geckox.b bVar) {
        if (bVar.c()) {
            Common common = new Common(bVar.k(), bVar.o(), bVar.r(), com.bykv.vk.openvk.preload.geckox.utils.a.b(bVar.a()), e.a(bVar.a()), bVar.l(), bVar.m());
            StatisticModel statisticModel = new StatisticModel();
            statisticModel.common = common;
            statisticModel.packages.addAll(b.a(bVar.a()).a());
            if (statisticModel.packages.isEmpty()) {
                return;
            }
            String str = UrlConst.HTTPS + bVar.j() + "/gecko/server/packages/stats";
            try {
                Response responseDoPost = bVar.i().doPost(str, statisticModel.toJson());
                if (responseDoPost.code == 200) {
                    if (new JSONObject(responseDoPost.body).getInt("status") != 0) {
                        throw new RuntimeException("upload failed");
                    }
                } else {
                    throw new NetworkErrorException("net work get failed, code: " + responseDoPost.code + ", url:" + str);
                }
            } catch (Throwable th2) {
                th2.printStackTrace();
            }
        }
    }

    public final String a() {
        try {
            JSONObject jSONObject = new JSONObject();
            if (this.f21984a != null) {
                JSONArray jSONArray = new JSONArray();
                for (int i5 = 0; i5 < this.f21984a.size(); i5++) {
                    jSONArray.put(this.f21984a.get(i5));
                }
                jSONObject.put("gecko_accesskey", jSONArray);
            }
            jSONObject.put("os", 0);
            jSONObject.put("msg_type", this.f21985b);
            return jSONObject.toString();
        } catch (Throwable unused) {
            return null;
        }
    }
}
