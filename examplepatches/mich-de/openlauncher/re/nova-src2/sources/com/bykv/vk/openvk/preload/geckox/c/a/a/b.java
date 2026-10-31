package com.bykv.vk.openvk.preload.geckox.c.a.a;

import android.net.Uri;
import android.text.TextUtils;
import android.util.Pair;
import b.u4;
import com.bykv.vk.openvk.preload.a.d;
import com.bykv.vk.openvk.preload.geckox.buffer.stream.BufferOutputStream;
import com.bykv.vk.openvk.preload.geckox.logger.GeckoLogger;
import com.bykv.vk.openvk.preload.geckox.model.UpdatePackage;
import java.io.File;

/* loaded from: classes2.dex */
public class b extends d<Pair<Uri, UpdatePackage>, Pair<com.bykv.vk.openvk.preload.geckox.buffer.a, UpdatePackage>> {

    /* renamed from: d, reason: collision with root package name */
    private com.bykv.vk.openvk.preload.geckox.b f22063d;

    /* renamed from: e, reason: collision with root package name */
    private File f22064e;

    public static String a(UpdatePackage updatePackage, String str) {
        if (TextUtils.isEmpty(str)) {
            throw new RuntimeException("url empty, channel:" + updatePackage.getChannel());
        }
        int iLastIndexOf = str.lastIndexOf("/");
        if (iLastIndexOf == -1) {
            throw new RuntimeException("url path illegal, url:".concat(str));
        }
        String strSubstring = str.substring(iLastIndexOf + 1);
        if (TextUtils.isEmpty(strSubstring)) {
            throw new RuntimeException("url path illegal, url:".concat(str));
        }
        return strSubstring;
    }

    @Override // com.bykv.vk.openvk.preload.a.d
    public final void a(Object... objArr) {
        super.a(objArr);
        this.f22063d = (com.bykv.vk.openvk.preload.geckox.b) objArr[0];
        this.f22064e = (File) objArr[1];
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.bykv.vk.openvk.preload.a.d
    public Object a(com.bykv.vk.openvk.preload.a.b<Pair<com.bykv.vk.openvk.preload.geckox.buffer.a, UpdatePackage>> bVar, Pair<Uri, UpdatePackage> pair) throws Throwable {
        UpdatePackage updatePackage = (UpdatePackage) pair.second;
        String channel = updatePackage.getChannel();
        GeckoLogger.d("gecko-debug-tag", "start download full single file channel:", channel);
        String string = ((Uri) pair.first).toString();
        long length = updatePackage.getFullPackage().getLength();
        File file = this.f22064e;
        StringBuilder sb2 = new StringBuilder();
        sb2.append(updatePackage.getAccessKey());
        String str = File.separator;
        sb2.append(str);
        sb2.append(channel);
        sb2.append(str);
        sb2.append(updatePackage.getVersion());
        sb2.append("--updating");
        File file2 = new File(file, sb2.toString());
        file2.mkdirs();
        File file3 = new File(file2, "res" + str + a(updatePackage, string));
        this.f22063d.a();
        com.bykv.vk.openvk.preload.geckox.buffer.a aVarA = com.bykv.vk.openvk.preload.geckox.buffer.a.a.a(file3, length);
        try {
            this.f22063d.i().downloadFile(string, length, new BufferOutputStream(aVarA));
            try {
                try {
                    Object objA = bVar.a((com.bykv.vk.openvk.preload.a.b<Pair<com.bykv.vk.openvk.preload.geckox.buffer.a, UpdatePackage>>) new Pair<>(aVarA, updatePackage));
                    try {
                        return objA;
                    } catch (Exception e3) {
                        return objA;
                    }
                } catch (Exception e11) {
                    throw e11;
                }
            } finally {
                try {
                    aVarA.e();
                } catch (Exception e32) {
                    GeckoLogger.w("gecko-debug-tag", "DownloadFullSingleFile-release:", e32);
                }
            }
        } catch (Throwable th2) {
            aVarA.e();
            StringBuilder sbK = u4.k("download full single file failed! url:", string, ", channel:");
            sbK.append(updatePackage.getChannel());
            sbK.append(", pkg id:");
            sbK.append(updatePackage.getFullPackage().getId());
            sbK.append(", caused by:");
            sbK.append(th2.getMessage());
            throw new com.bykv.vk.openvk.preload.geckox.b.a(sbK.toString(), th2);
        }
    }
}
