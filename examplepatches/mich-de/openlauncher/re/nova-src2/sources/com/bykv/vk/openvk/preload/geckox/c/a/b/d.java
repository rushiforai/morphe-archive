package com.bykv.vk.openvk.preload.geckox.c.a.b;

import android.util.Pair;
import b.c0;
import com.bykv.vk.openvk.preload.geckox.logger.GeckoLogger;
import com.bykv.vk.openvk.preload.geckox.model.UpdatePackage;
import com.bykv.vk.openvk.preload.geckox.utils.BsPatch;
import java.io.File;

/* loaded from: classes2.dex */
public class d extends com.bykv.vk.openvk.preload.a.d<Pair<com.bykv.vk.openvk.preload.geckox.buffer.a, UpdatePackage>, Pair<com.bykv.vk.openvk.preload.geckox.buffer.a, UpdatePackage>> {

    /* renamed from: d, reason: collision with root package name */
    private com.bykv.vk.openvk.preload.geckox.b f22067d;

    @Override // com.bykv.vk.openvk.preload.a.d
    public final void a(Object... objArr) {
        super.a(objArr);
        this.f22067d = (com.bykv.vk.openvk.preload.geckox.b) objArr[0];
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.bykv.vk.openvk.preload.a.d
    public Object a(com.bykv.vk.openvk.preload.a.b<Pair<com.bykv.vk.openvk.preload.geckox.buffer.a, UpdatePackage>> bVar, Pair<com.bykv.vk.openvk.preload.geckox.buffer.a, UpdatePackage> pair) throws Throwable {
        UpdatePackage updatePackage = (UpdatePackage) pair.second;
        String channel = updatePackage.getChannel();
        GeckoLogger.d("gecko-debug-tag", "start merge patch single file, channel:", channel);
        com.bykv.vk.openvk.preload.geckox.buffer.a aVar = (com.bykv.vk.openvk.preload.geckox.buffer.a) pair.first;
        File fileF = aVar.f();
        aVar.a();
        aVar.e();
        File parentFile = fileF.getParentFile().getParentFile();
        StringBuilder sb2 = new StringBuilder();
        sb2.append(updatePackage.getLocalVersion());
        String str = File.separator;
        File file = new File(parentFile, c0.q(sb2, str, "res"));
        File[] fileArrListFiles = file.listFiles();
        if (fileArrListFiles != null && fileArrListFiles.length != 0) {
            File file2 = fileArrListFiles[0];
            File file3 = new File(fileF.getParentFile(), "res" + str + com.bykv.vk.openvk.preload.geckox.c.a.a.b.a(updatePackage, updatePackage.getFullPackage().getUrlList().get(0)));
            com.bykv.vk.openvk.preload.geckox.utils.b.a(file3);
            try {
                try {
                    BsPatch.a(file2, fileF, file3.getParentFile(), file3.getName());
                    com.bykv.vk.openvk.preload.geckox.utils.b.a(fileF);
                    this.f22067d.a();
                    com.bykv.vk.openvk.preload.geckox.buffer.a aVarA = com.bykv.vk.openvk.preload.geckox.buffer.a.a.a(file3, file3.length());
                    try {
                        return bVar.a((com.bykv.vk.openvk.preload.a.b<Pair<com.bykv.vk.openvk.preload.geckox.buffer.a, UpdatePackage>>) new Pair<>(aVarA, updatePackage));
                    } finally {
                        aVarA.e();
                    }
                } catch (Exception e3) {
                    throw new RuntimeException("merge patch single file failed, channel：" + channel + ", pkg id:" + updatePackage.getPatch().getId() + ", caused by:" + e3.getMessage(), e3);
                }
            } catch (Throwable th2) {
                com.bykv.vk.openvk.preload.geckox.utils.b.a(fileF);
                throw th2;
            }
        }
        throw new RuntimeException("can not found old full single file,:" + file.getAbsolutePath());
    }
}
