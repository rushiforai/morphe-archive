package com.bykv.vk.openvk.preload.geckox.statistic;

import android.accounts.NetworkErrorException;
import android.content.Context;
import android.os.Build;
import android.text.TextUtils;
import com.amplitude.android.TrackingOptions;
import com.bykv.vk.openvk.preload.geckox.logger.GeckoLogger;
import com.bykv.vk.openvk.preload.geckox.model.Common;
import com.bykv.vk.openvk.preload.geckox.net.Response;
import com.bykv.vk.openvk.preload.geckox.statistic.model.StatisticModel;
import com.bykv.vk.openvk.preload.geckox.utils.e;
import com.tiktok.util.UrlConst;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public final class c {
    public static void a(com.bykv.vk.openvk.preload.geckox.b bVar, com.bykv.vk.openvk.preload.geckox.buffer.a.a aVar) {
        IStatisticMonitor iStatisticMonitorQ = bVar.q();
        if (iStatisticMonitorQ != null) {
            try {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("params_for_special", "gecko");
                jSONObject.put("device_id", bVar.r());
                jSONObject.put("os", 0);
                jSONObject.put("app_version", bVar.o());
                jSONObject.put("api_version", "v3");
                jSONObject.put("aid", bVar.k());
                jSONObject.put("x_tt_logid", aVar.f22042e);
                jSONObject.put("http_status", aVar.f22044g);
                jSONObject.put("err_msg", aVar.f22041d);
                if (TextUtils.isEmpty(aVar.f22042e)) {
                    jSONObject.put("deployments_info", aVar.f22039b);
                    jSONObject.put("local_info", aVar.f22038a);
                    jSONObject.put("custom_info", aVar.f22040c);
                } else {
                    jSONObject.put("deployments_info", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                    jSONObject.put("local_info", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                    jSONObject.put("custom_info", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                }
                StringBuilder sb2 = new StringBuilder();
                sb2.append(Build.VERSION.SDK_INT);
                jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_OS_VERSION, sb2.toString());
                jSONObject.put("device_platform", "android");
                jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_DEVICE_MODEL, Build.MODEL);
                jSONObject.put("ac", aVar.f22043f);
                iStatisticMonitorQ.upload("geckosdk_query_pkgs", jSONObject);
            } catch (Throwable th2) {
                GeckoLogger.w("gecko-debug-tag", "UploadStatistic.upload:", th2);
            }
        }
    }

    private static List<StatisticModel.PackageStatisticModel.DownloadFailRecords> b(List<StatisticModel.PackageStatisticModel.DownloadFailRecords> list) {
        if (list == null || list.isEmpty()) {
            return null;
        }
        return list;
    }

    private static Integer a(List<StatisticModel.PackageStatisticModel.DownloadFailRecords> list) {
        if (list == null || list.isEmpty()) {
            return null;
        }
        return Integer.valueOf(list.size());
    }

    private static void a(com.bykv.vk.openvk.preload.geckox.statistic.model.a aVar, List<StatisticModel.PackageStatisticModel> list) {
        if (aVar.f22154z && aVar.A) {
            StatisticModel.PackageStatisticModel packageStatisticModel = new StatisticModel.PackageStatisticModel();
            list.add(packageStatisticModel);
            packageStatisticModel.statsType = 0;
            packageStatisticModel.accessKey = aVar.f22131a;
            packageStatisticModel.groupName = aVar.f22132b;
            packageStatisticModel.channel = aVar.f22133c;
            packageStatisticModel.ac = aVar.n;
            packageStatisticModel.f22130id = aVar.f22144p;
            packageStatisticModel.downloadRetryTimes = a(aVar.f22149u);
            packageStatisticModel.downloadUrl = aVar.f22148t;
            packageStatisticModel.downloadFailRecords = b(aVar.f22149u);
            packageStatisticModel.downloadDuration = Long.valueOf(aVar.f22151w - aVar.f22150v);
            if (aVar.B) {
                StatisticModel.PackageStatisticModel packageStatisticModel2 = new StatisticModel.PackageStatisticModel();
                list.add(packageStatisticModel2);
                packageStatisticModel2.accessKey = aVar.f22131a;
                packageStatisticModel2.groupName = aVar.f22132b;
                packageStatisticModel2.statsType = 2;
                packageStatisticModel2.f22130id = aVar.f22144p;
                packageStatisticModel2.channel = aVar.f22133c;
                packageStatisticModel2.activeCheckDuration = Long.valueOf(aVar.f22152x - aVar.f22151w);
                packageStatisticModel2.applyDuration = Long.valueOf(aVar.f22153y - aVar.f22152x);
                return;
            }
            StatisticModel.PackageStatisticModel packageStatisticModel3 = new StatisticModel.PackageStatisticModel();
            list.add(packageStatisticModel3);
            packageStatisticModel3.statsType = 3;
            packageStatisticModel3.accessKey = aVar.f22131a;
            packageStatisticModel3.groupName = aVar.f22132b;
            packageStatisticModel3.errCode = "500";
            packageStatisticModel3.f22130id = aVar.f22144p;
            packageStatisticModel3.channel = aVar.f22133c;
            packageStatisticModel3.errMsg = aVar.D;
            return;
        }
        StatisticModel.PackageStatisticModel packageStatisticModel4 = new StatisticModel.PackageStatisticModel();
        list.add(packageStatisticModel4);
        packageStatisticModel4.statsType = 1;
        packageStatisticModel4.accessKey = aVar.f22131a;
        packageStatisticModel4.groupName = aVar.f22132b;
        packageStatisticModel4.channel = aVar.f22133c;
        packageStatisticModel4.ac = aVar.n;
        packageStatisticModel4.f22130id = aVar.f22144p;
        packageStatisticModel4.downloadRetryTimes = a(aVar.f22149u);
        packageStatisticModel4.downloadUrl = aVar.f22148t;
        packageStatisticModel4.downloadFailRecords = b(aVar.f22149u);
        if (!aVar.f22154z) {
            packageStatisticModel4.errCode = "300";
            List<StatisticModel.PackageStatisticModel.DownloadFailRecords> list2 = aVar.f22149u;
            if (list2 == null || list2.isEmpty()) {
                return;
            }
            packageStatisticModel4.errMsg = aVar.f22149u.get(0).reason;
            return;
        }
        if (aVar.A) {
            return;
        }
        packageStatisticModel4.errCode = "450";
        packageStatisticModel4.errMsg = aVar.C;
    }

    public static void a(final com.bykv.vk.openvk.preload.geckox.b bVar, a aVar) {
        StatisticModel statisticModel;
        ArrayList arrayList = new ArrayList();
        for (com.bykv.vk.openvk.preload.geckox.statistic.model.a aVar2 : aVar.a()) {
            if (aVar2.f22134d != null || aVar2.f22136f != 0) {
                if (aVar2.f22138h && aVar2.f22139i) {
                    StatisticModel.PackageStatisticModel packageStatisticModel = new StatisticModel.PackageStatisticModel();
                    arrayList.add(packageStatisticModel);
                    packageStatisticModel.statsType = 100;
                    packageStatisticModel.groupName = aVar2.f22132b;
                    packageStatisticModel.accessKey = aVar2.f22131a;
                    packageStatisticModel.channel = aVar2.f22133c;
                    packageStatisticModel.ac = aVar2.n;
                    packageStatisticModel.f22130id = aVar2.f22144p;
                    packageStatisticModel.patchId = aVar2.o;
                    packageStatisticModel.downloadRetryTimes = a(aVar2.f22135e);
                    packageStatisticModel.downloadUrl = aVar2.f22134d;
                    packageStatisticModel.downloadFailRecords = b(aVar2.f22135e);
                    packageStatisticModel.downloadDuration = Long.valueOf(aVar2.f22137g - aVar2.f22136f);
                    if (!aVar2.f22140j) {
                        StatisticModel.PackageStatisticModel packageStatisticModel2 = new StatisticModel.PackageStatisticModel();
                        arrayList.add(packageStatisticModel2);
                        packageStatisticModel2.statsType = 100;
                        packageStatisticModel2.channel = aVar2.f22133c;
                        packageStatisticModel2.errCode = "403";
                        packageStatisticModel2.errMsg = aVar2.f22146r;
                        packageStatisticModel2.ac = aVar2.n;
                        packageStatisticModel2.patchId = aVar2.o;
                        packageStatisticModel2.f22130id = aVar2.f22144p;
                        packageStatisticModel2.downloadRetryTimes = a(aVar2.f22135e);
                        packageStatisticModel2.downloadUrl = aVar2.f22134d;
                        packageStatisticModel2.downloadFailRecords = b(aVar2.f22135e);
                    } else if (aVar2.f22141k) {
                        StatisticModel.PackageStatisticModel packageStatisticModel3 = new StatisticModel.PackageStatisticModel();
                        arrayList.add(packageStatisticModel3);
                        packageStatisticModel3.accessKey = aVar2.f22131a;
                        packageStatisticModel3.groupName = aVar2.f22132b;
                        packageStatisticModel3.statsType = 102;
                        packageStatisticModel3.patchId = aVar2.o;
                        packageStatisticModel3.f22130id = aVar2.f22144p;
                        packageStatisticModel3.channel = aVar2.f22133c;
                        packageStatisticModel3.activeCheckDuration = Long.valueOf(aVar2.f22142l - aVar2.f22137g);
                        packageStatisticModel3.applyDuration = Long.valueOf(aVar2.f22143m - aVar2.f22142l);
                    } else {
                        StatisticModel.PackageStatisticModel packageStatisticModel4 = new StatisticModel.PackageStatisticModel();
                        arrayList.add(packageStatisticModel4);
                        packageStatisticModel4.accessKey = aVar2.f22131a;
                        packageStatisticModel4.groupName = aVar2.f22132b;
                        packageStatisticModel4.statsType = 103;
                        packageStatisticModel4.errCode = "501";
                        packageStatisticModel4.channel = aVar2.f22133c;
                        packageStatisticModel4.patchId = aVar2.o;
                        packageStatisticModel4.f22130id = aVar2.f22144p;
                        packageStatisticModel4.errMsg = aVar2.f22147s;
                        a(aVar2, arrayList);
                    }
                } else {
                    StatisticModel.PackageStatisticModel packageStatisticModel5 = new StatisticModel.PackageStatisticModel();
                    arrayList.add(packageStatisticModel5);
                    packageStatisticModel5.statsType = 101;
                    packageStatisticModel5.accessKey = aVar2.f22131a;
                    packageStatisticModel5.groupName = aVar2.f22132b;
                    packageStatisticModel5.channel = aVar2.f22133c;
                    packageStatisticModel5.ac = aVar2.n;
                    packageStatisticModel5.patchId = aVar2.o;
                    packageStatisticModel5.f22130id = aVar2.f22144p;
                    packageStatisticModel5.downloadRetryTimes = a(aVar2.f22135e);
                    packageStatisticModel5.downloadUrl = aVar2.f22134d;
                    packageStatisticModel5.downloadFailRecords = b(aVar2.f22135e);
                    if (!aVar2.f22138h) {
                        packageStatisticModel5.errCode = "301";
                        List<StatisticModel.PackageStatisticModel.DownloadFailRecords> list = aVar2.f22135e;
                        if (list != null && !list.isEmpty()) {
                            packageStatisticModel5.errMsg = aVar2.f22135e.get(0).reason;
                        }
                    } else if (!aVar2.f22139i) {
                        packageStatisticModel5.errCode = "402";
                        packageStatisticModel5.errMsg = aVar2.f22145q;
                    }
                    a(aVar2, arrayList);
                }
            }
            a(aVar2, arrayList);
        }
        Context contextA = bVar.a();
        arrayList.addAll(com.bykv.vk.openvk.preload.geckox.a.a.a(contextA));
        if (arrayList.isEmpty()) {
            statisticModel = null;
        } else {
            Common common = new Common(bVar.k(), bVar.o(), bVar.r(), com.bykv.vk.openvk.preload.geckox.utils.a.b(contextA), e.a(contextA), bVar.l(), bVar.m());
            statisticModel = new StatisticModel();
            statisticModel.common = common;
            statisticModel.packages = arrayList;
            String string = UUID.randomUUID().toString();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                ((StatisticModel.PackageStatisticModel) it.next()).logId = string;
            }
        }
        StatisticModel statisticModel2 = statisticModel;
        if (statisticModel2 == null || statisticModel2.packages == null) {
            return;
        }
        IStatisticMonitor iStatisticMonitorQ = bVar.q();
        if (iStatisticMonitorQ != null) {
            try {
                for (StatisticModel.PackageStatisticModel packageStatisticModel6 : statisticModel2.packages) {
                    Common common2 = statisticModel2.common;
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put("params_for_special", "gecko");
                    jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_REGION, common2.region);
                    jSONObject.put("err_code", packageStatisticModel6.errCode);
                    jSONObject.put("err_msg", packageStatisticModel6.errMsg);
                    jSONObject.put("sdk_version", common2.sdkVersion);
                    jSONObject.put("access_key", packageStatisticModel6.accessKey);
                    jSONObject.put("stats_type", packageStatisticModel6.statsType);
                    jSONObject.put("device_id", common2.deviceId);
                    Long l9 = packageStatisticModel6.patchId;
                    jSONObject.put("patch_id", l9 == null ? 0L : l9.longValue());
                    jSONObject.put("group_name", packageStatisticModel6.groupName);
                    jSONObject.put("os", common2.f22115os);
                    jSONObject.put("app_version", common2.appVersion);
                    jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_DEVICE_MODEL, common2.deviceModel);
                    jSONObject.put("channel", packageStatisticModel6.channel);
                    Long l11 = packageStatisticModel6.f22130id;
                    jSONObject.put("id", l11 == null ? 0L : l11.longValue());
                    jSONObject.put("ac", common2.ac);
                    Integer num = packageStatisticModel6.downloadRetryTimes;
                    jSONObject.put("download_retry_times", num == null ? 0 : num.intValue());
                    String str = packageStatisticModel6.downloadUrl;
                    Object obj = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    if (str == null) {
                        str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    }
                    jSONObject.put("download_url", str);
                    jSONObject.put("download_duration", packageStatisticModel6.downloadDuration);
                    List<StatisticModel.PackageStatisticModel.DownloadFailRecords> list2 = packageStatisticModel6.downloadFailRecords;
                    if (list2 != null) {
                        obj = list2;
                    }
                    jSONObject.put("download_fail_records", obj);
                    jSONObject.put("log_id", packageStatisticModel6.logId);
                    Long l12 = packageStatisticModel6.activeCheckDuration;
                    jSONObject.put("active_check_duration", l12 == null ? 0L : l12.longValue());
                    Long l13 = packageStatisticModel6.applyDuration;
                    jSONObject.put("apply_duration", l13 == null ? 0L : l13.longValue());
                    iStatisticMonitorQ.upload("geckosdk_update_stats", jSONObject);
                }
            } catch (Throwable th2) {
                GeckoLogger.w("gecko-debug-tag", "UploadStatistic.upload:", th2);
            }
        }
        if (bVar.c()) {
            try {
                final String json = statisticModel2.toJson();
                if (TextUtils.isEmpty(json)) {
                    return;
                }
                final String str2 = UrlConst.HTTPS + bVar.j() + "/gecko/server/packages/stats";
                com.bykv.vk.openvk.preload.geckox.b.g().execute(new Runnable() { // from class: com.bykv.vk.openvk.preload.geckox.statistic.c.1
                    @Override // java.lang.Runnable
                    public final void run() throws NetworkErrorException {
                        Response responseDoPost;
                        for (int i5 = 0; i5 < 3; i5++) {
                            try {
                                responseDoPost = bVar.i().doPost(str2, json);
                            } catch (Exception e3) {
                                GeckoLogger.w("gecko-debug-tag", "upload statistic:", e3);
                            }
                            if (responseDoPost.code != 200) {
                                throw new NetworkErrorException("net work get failed, code: " + responseDoPost.code + ", url:" + str2);
                            }
                            if (new JSONObject(responseDoPost.body).getInt("status") == 0) {
                                return;
                            }
                        }
                    }
                });
            } catch (Throwable unused) {
            }
        }
    }
}
