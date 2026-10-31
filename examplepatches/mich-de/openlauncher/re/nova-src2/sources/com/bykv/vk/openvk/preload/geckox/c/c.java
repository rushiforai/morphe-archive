package com.bykv.vk.openvk.preload.geckox.c;

import android.accounts.NetworkErrorException;
import android.content.Context;
import android.text.TextUtils;
import android.util.Pair;
import b.c0;
import b.u4;
import com.bykv.vk.openvk.preload.geckox.logger.GeckoLogger;
import com.bykv.vk.openvk.preload.geckox.model.CheckRequestBodyModel;
import com.bykv.vk.openvk.preload.geckox.model.Common;
import com.bykv.vk.openvk.preload.geckox.model.UpdatePackage;
import com.bykv.vk.openvk.preload.geckox.net.Response;
import com.tiktok.util.UrlConst;
import h6.c1;
import java.io.File;
import java.io.FileFilter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class c extends com.bykv.vk.openvk.preload.a.d<Map<String, List<Pair<String, Long>>>, List<UpdatePackage>> {

    /* renamed from: d, reason: collision with root package name */
    private com.bykv.vk.openvk.preload.geckox.b f22073d;

    /* renamed from: e, reason: collision with root package name */
    private Map<String, Map<String, Object>> f22074e;

    /* renamed from: f, reason: collision with root package name */
    private Map<String, List<CheckRequestBodyModel.TargetChannel>> f22075f;

    /* renamed from: g, reason: collision with root package name */
    private com.bykv.vk.openvk.preload.geckox.d.a f22076g;

    /* renamed from: h, reason: collision with root package name */
    private String f22077h;

    /* renamed from: i, reason: collision with root package name */
    private com.bykv.vk.openvk.preload.geckox.buffer.a.a f22078i = new com.bykv.vk.openvk.preload.geckox.buffer.a.a();

    public static class a extends RuntimeException {
        public a(String str) {
            super(str);
        }
    }

    public static class b extends RuntimeException {
        public b(String str, Throwable th2) {
            super(str, th2);
        }
    }

    /* renamed from: com.bykv.vk.openvk.preload.geckox.c.c$c, reason: collision with other inner class name */
    public static class C0012c extends RuntimeException {
        public C0012c(String str, Throwable th2) {
            super(str, th2);
        }
    }

    private static void b(List<Pair<String, com.bykv.vk.openvk.preload.geckox.f.a>> list) {
        if (list == null) {
            return;
        }
        Iterator<Pair<String, com.bykv.vk.openvk.preload.geckox.f.a>> it = list.iterator();
        while (it.hasNext()) {
            try {
                ((com.bykv.vk.openvk.preload.geckox.f.a) it.next().second).a();
            } catch (Exception e3) {
                GeckoLogger.e("gecko-debug-tag", "releaseLock:", e3);
            }
        }
    }

    private List<Pair<String, com.bykv.vk.openvk.preload.geckox.f.a>> c(List<UpdatePackage> list) {
        if (list.isEmpty()) {
            return Collections.EMPTY_LIST;
        }
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (UpdatePackage updatePackage : list) {
            String channel = updatePackage.getChannel();
            if (channel == null) {
                GeckoLogger.w("gecko-debug-tag", "invalid channel, skip update");
                new IllegalArgumentException("invalid channel");
            } else {
                try {
                    File file = new File(new File(this.f22073d.n(), updatePackage.getAccessKey()), channel);
                    if (file.isFile()) {
                        com.bykv.vk.openvk.preload.geckox.utils.b.a(file);
                    }
                    if (!file.mkdirs() && !file.isDirectory()) {
                        GeckoLogger.d("gecko-debug-tag", "can not create channel dir：", file.getAbsolutePath());
                        throw new RuntimeException("can not create channel dir:" + file.getAbsolutePath());
                    }
                    com.bykv.vk.openvk.preload.geckox.f.a aVarA = com.bykv.vk.openvk.preload.geckox.f.a.a(file.getAbsolutePath() + File.separator + "update.lock");
                    if (aVarA != null) {
                        arrayList.add(new Pair(channel, aVarA));
                        arrayList2.add(updatePackage);
                    } else {
                        com.bykv.vk.openvk.preload.geckox.d.a aVar = this.f22076g;
                    }
                } catch (Exception e3) {
                    GeckoLogger.e("gecko-debug-tag", "filterChannel:", e3);
                }
            }
        }
        list.clear();
        list.addAll(arrayList2);
        return arrayList;
    }

    @Override // com.bykv.vk.openvk.preload.a.d
    public final void a(Object... objArr) {
        super.a(objArr);
        this.f22073d = (com.bykv.vk.openvk.preload.geckox.b) objArr[0];
        this.f22074e = (Map) objArr[1];
        this.f22075f = (Map) objArr[2];
        this.f22076g = (com.bykv.vk.openvk.preload.geckox.d.a) objArr[3];
        this.f22077h = (String) objArr[4];
    }

    private String b(Map<String, List<Pair<String, Long>>> map) {
        List<CheckRequestBodyModel.TargetChannel> list;
        CheckRequestBodyModel checkRequestBodyModel = new CheckRequestBodyModel();
        Context contextA = this.f22073d.a();
        checkRequestBodyModel.setCommon(new Common(this.f22073d.k(), this.f22073d.o(), this.f22073d.r(), com.bykv.vk.openvk.preload.geckox.utils.a.b(contextA), com.bykv.vk.openvk.preload.geckox.utils.e.a(contextA), this.f22073d.l(), this.f22073d.m()));
        HashMap map2 = new HashMap();
        for (Map.Entry<String, List<Pair<String, Long>>> entry : map.entrySet()) {
            HashMap map3 = new HashMap();
            for (Pair<String, Long> pair : entry.getValue()) {
                CheckRequestBodyModel.LocalChannel localChannel = new CheckRequestBodyModel.LocalChannel();
                localChannel.localVersion = (Long) pair.second;
                map3.put(pair.first, localChannel);
            }
            map2.put(entry.getKey(), map3);
        }
        try {
            if (!map2.isEmpty()) {
                JSONObject jSONObject = new JSONObject();
                for (Map.Entry entry2 : map2.entrySet()) {
                    String str = (String) entry2.getKey();
                    Map map4 = (Map) entry2.getValue();
                    if (map4 != null && !map4.isEmpty()) {
                        JSONObject jSONObject2 = new JSONObject();
                        for (Map.Entry entry3 : map4.entrySet()) {
                            jSONObject2.put((String) entry3.getKey(), ((CheckRequestBodyModel.LocalChannel) entry3.getValue()).toJson());
                        }
                        jSONObject.put(str, jSONObject2);
                    }
                }
                this.f22078i.f22038a = jSONObject.toString();
            }
            checkRequestBodyModel.setLocal(map2);
            HashMap map5 = new HashMap();
            for (String str2 : this.f22073d.e()) {
                CheckRequestBodyModel.Group group = new CheckRequestBodyModel.Group();
                group.groupName = this.f22077h;
                Map<String, List<CheckRequestBodyModel.TargetChannel>> map6 = this.f22075f;
                if (map6 != null && !map6.isEmpty() && (list = this.f22075f.get(str2)) != null && !list.isEmpty()) {
                    ArrayList arrayList = new ArrayList();
                    group.targetChannels = arrayList;
                    arrayList.addAll(list);
                }
                map5.put(str2, group);
            }
            if (!map5.isEmpty()) {
                JSONObject jSONObject3 = new JSONObject();
                for (Map.Entry entry4 : map5.entrySet()) {
                    Object value = entry4.getValue();
                    if (value != null && (value instanceof CheckRequestBodyModel.Group)) {
                        jSONObject3.put((String) entry4.getKey(), ((CheckRequestBodyModel.Group) value).toJson());
                    }
                }
                this.f22078i.f22039b = jSONObject3.toString();
            }
            checkRequestBodyModel.setDeployments(map5);
            Map<String, Map<String, Object>> map7 = this.f22074e;
            if (map7 != null) {
                if (!map7.isEmpty()) {
                    JSONObject jSONObject4 = new JSONObject();
                    for (Map.Entry<String, Map<String, Object>> entry5 : this.f22074e.entrySet()) {
                        String key = entry5.getKey();
                        Map<String, Object> value2 = entry5.getValue();
                        if (value2 != null && !value2.isEmpty()) {
                            JSONObject jSONObject5 = new JSONObject();
                            for (Map.Entry<String, Object> entry6 : value2.entrySet()) {
                                Object value3 = entry6.getValue();
                                if (value3 instanceof String) {
                                    jSONObject5.put(entry6.getKey(), value3);
                                }
                            }
                            jSONObject4.put(key, jSONObject5);
                        }
                    }
                    this.f22078i.f22040c = jSONObject4.toString();
                }
                checkRequestBodyModel.setCustom(this.f22074e);
            }
            return checkRequestBodyModel.toJson();
        } catch (Throwable unused) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.bykv.vk.openvk.preload.a.d
    public Object a(com.bykv.vk.openvk.preload.a.b<List<UpdatePackage>> bVar, Map<String, List<Pair<String, Long>>> map) throws Exception {
        List<Pair<String, com.bykv.vk.openvk.preload.geckox.f.a>> listC;
        String channel;
        GeckoLogger.d("gecko-debug-tag", "start get server channel version[v3]... local channel version:", map);
        Map<String, List<UpdatePackage>> mapA = a(map);
        com.bykv.vk.openvk.preload.geckox.statistic.c.a(this.f22073d, this.f22078i);
        Iterator<Map.Entry<String, List<UpdatePackage>>> it = mapA.entrySet().iterator();
        while (it.hasNext()) {
            Iterator<UpdatePackage> it2 = it.next().getValue().iterator();
            while (it2.hasNext()) {
                UpdatePackage next = it2.next();
                long localVersion = next.getLocalVersion();
                long version = next.getVersion();
                if (version < localVersion && (channel = next.getChannel()) != null) {
                    GeckoLogger.d("gecko-debug-tag", channel, "rollback：", Long.valueOf(localVersion), "->", Long.valueOf(version));
                    File fileN = this.f22073d.n();
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append(next.getAccessKey());
                    File[] fileArrListFiles = new File(fileN, c0.q(sb2, File.separator, channel)).listFiles(new FileFilter() { // from class: com.bykv.vk.openvk.preload.geckox.c.c.1
                        @Override // java.io.FileFilter
                        public final boolean accept(File file) {
                            return file.isDirectory();
                        }
                    });
                    if (fileArrListFiles != null && fileArrListFiles.length != 0) {
                        for (File file : fileArrListFiles) {
                            try {
                                long j11 = Long.parseLong(file.getName());
                                if (j11 > version) {
                                    final File file2 = new File(file.getParent(), file.getName() + "--pending-delete");
                                    file.renameTo(file2);
                                    com.bykv.vk.openvk.preload.geckox.utils.c.a().execute(new Runnable() { // from class: com.bykv.vk.openvk.preload.geckox.c.c.2
                                        @Override // java.lang.Runnable
                                        public final void run() {
                                            com.bykv.vk.openvk.preload.geckox.utils.b.a(file2);
                                        }
                                    });
                                } else if (j11 == version) {
                                    it2.remove();
                                }
                            } catch (Exception unused) {
                            }
                        }
                    }
                }
            }
        }
        ArrayList arrayList = new ArrayList();
        Iterator<Map.Entry<String, List<UpdatePackage>>> it3 = mapA.entrySet().iterator();
        while (it3.hasNext()) {
            arrayList.addAll(it3.next().getValue());
        }
        Object objA = null;
        try {
            listC = c(arrayList);
            try {
                objA = bVar.a((com.bykv.vk.openvk.preload.a.b<List<UpdatePackage>>) arrayList);
                b(listC);
                GeckoLogger.d("gecko-debug-tag", "all channel update finished");
            } catch (Throwable th2) {
                th = th2;
                try {
                    GeckoLogger.e("gecko-debug-tag", "filterChannel:", th);
                    a(arrayList);
                    return objA;
                } finally {
                    b(listC);
                    GeckoLogger.d("gecko-debug-tag", "all channel update finished");
                }
            }
        } catch (Throwable th3) {
            th = th3;
            listC = null;
        }
        a(arrayList);
        return objA;
    }

    private void a(List<UpdatePackage> list) {
        if (list.isEmpty()) {
            return;
        }
        for (UpdatePackage updatePackage : list) {
            String channel = updatePackage.getChannel();
            if (channel != null) {
                com.bykv.vk.openvk.preload.geckox.a.c.a(new File(new File(this.f22073d.n(), updatePackage.getAccessKey()), channel).getAbsolutePath());
            }
        }
    }

    private Map<String, List<UpdatePackage>> a(Map<String, List<Pair<String, Long>>> map) throws Exception {
        String strB = b(map);
        String str = UrlConst.HTTPS + this.f22073d.j() + "/gecko/server/v3/package";
        try {
            this.f22078i.f22043f = com.bykv.vk.openvk.preload.geckox.utils.e.a(this.f22073d.a());
            Response responseDoPost = this.f22073d.i().doPost(str, strB);
            com.bykv.vk.openvk.preload.geckox.buffer.a.a aVar = this.f22078i;
            aVar.f22044g = responseDoPost.code;
            aVar.f22041d = responseDoPost.msg;
            Map<String, String> map2 = responseDoPost.headers;
            String str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            if (map2 != null && !map2.isEmpty()) {
                String str3 = map2.get("x-tt-logid");
                if (TextUtils.isEmpty(str3)) {
                    str3 = map2.get("X-Tt-Logid");
                    if (TextUtils.isEmpty(str3)) {
                        String str4 = map2.get("X-TT-LOGID");
                        if (!TextUtils.isEmpty(str4)) {
                            str2 = str4;
                        }
                    } else {
                        str2 = str3;
                    }
                } else {
                    str2 = str3;
                }
            }
            aVar.f22042e = str2;
            if (responseDoPost.code == 200) {
                String str5 = responseDoPost.body;
                GeckoLogger.d("gecko-debug-tag", "response:", str5);
                try {
                    com.bykv.vk.openvk.preload.geckox.model.Response response = new com.bykv.vk.openvk.preload.geckox.model.Response();
                    response.fromJson(str5);
                    int i5 = response.status;
                    if (i5 != 0) {
                        if (i5 == 2000) {
                            com.bykv.vk.openvk.preload.geckox.a.a.a(this.f22073d);
                            return new HashMap();
                        }
                        String str6 = "check update error，unknow status code，response.status：" + response.status;
                        com.bykv.vk.openvk.preload.geckox.buffer.a.a aVar2 = this.f22078i;
                        aVar2.f22041d = str6;
                        com.bykv.vk.openvk.preload.geckox.statistic.c.a(this.f22073d, aVar2);
                        throw new a(str6);
                    }
                    if (response.data != null) {
                        com.bykv.vk.openvk.preload.geckox.a.a.a(this.f22073d.a(), response.data.getUniversalStrategies(), this.f22073d.n(), this.f22076g);
                        Map<String, List<UpdatePackage>> packages = response.data.getPackages();
                        if (packages != null && !packages.isEmpty()) {
                            for (String str7 : this.f22073d.e()) {
                                List<UpdatePackage> list = packages.get(str7);
                                if (list != null && !list.isEmpty()) {
                                    for (UpdatePackage updatePackage : list) {
                                        updatePackage.setAccessKey(str7);
                                        updatePackage.setLocalVersion(a(map.get(str7), updatePackage.getChannel()));
                                    }
                                }
                            }
                            return packages;
                        }
                        com.bykv.vk.openvk.preload.geckox.a.a.a(this.f22073d);
                        return new HashMap();
                    }
                    com.bykv.vk.openvk.preload.geckox.buffer.a.a aVar3 = this.f22078i;
                    aVar3.f22041d = "check update error：response.data==null";
                    com.bykv.vk.openvk.preload.geckox.statistic.c.a(this.f22073d, aVar3);
                    throw new a("check update error：response.data==null");
                } catch (Throwable th2) {
                    this.f22078i.f22041d = fq.c.f(th2, new StringBuilder("json parse failed："));
                    com.bykv.vk.openvk.preload.geckox.statistic.c.a(this.f22073d, this.f22078i);
                    throw new b(fq.c.f(th2, u4.k("json parse failed：", str5, " caused by:")), th2);
                }
            }
            throw new NetworkErrorException("net work get failed, code: " + responseDoPost.code + ", url:" + str);
        } catch (Exception e3) {
            com.bykv.vk.openvk.preload.geckox.statistic.c.a(this.f22073d, this.f22078i);
            throw new C0012c(c1.s(e3, u4.k("request failed：url:", str, ", caused by:")), e3);
        }
    }

    private static long a(List<Pair<String, Long>> list, String str) {
        if (str == null) {
            return 0L;
        }
        for (Pair<String, Long> pair : list) {
            if (((String) pair.first).equals(str)) {
                return ((Long) pair.second).longValue();
            }
        }
        return 0L;
    }
}
