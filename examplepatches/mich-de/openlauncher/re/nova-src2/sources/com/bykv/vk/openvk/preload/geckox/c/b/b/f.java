package com.bykv.vk.openvk.preload.geckox.c.b.b;

import android.util.Pair;
import b.u4;
import com.bykv.vk.openvk.preload.geckox.logger.GeckoLogger;
import com.bykv.vk.openvk.preload.geckox.model.UpdatePackage;
import com.bykv.vk.openvk.preload.geckox.utils.h;
import java.io.File;

/* loaded from: classes2.dex */
public class f extends com.bykv.vk.openvk.preload.a.d<Pair<com.bykv.vk.openvk.preload.geckox.buffer.a, UpdatePackage>, Pair<File, UpdatePackage>> {
    @Override // com.bykv.vk.openvk.preload.a.d
    public final /* bridge */ /* synthetic */ Object a(com.bykv.vk.openvk.preload.a.b<Pair<File, UpdatePackage>> bVar, Pair<com.bykv.vk.openvk.preload.geckox.buffer.a, UpdatePackage> pair) throws Throwable {
        return a2(bVar, pair);
    }

    /* renamed from: a, reason: avoid collision after fix types in other method */
    private static Object a2(com.bykv.vk.openvk.preload.a.b<Pair<File, UpdatePackage>> bVar, Pair<com.bykv.vk.openvk.preload.geckox.buffer.a, UpdatePackage> pair) throws Throwable {
        UpdatePackage updatePackage = (UpdatePackage) pair.second;
        String channel = updatePackage.getChannel();
        GeckoLogger.d("gecko-debug-tag", "start unzip merged zip file, channel:", channel);
        com.bykv.vk.openvk.preload.geckox.buffer.a aVar = (com.bykv.vk.openvk.preload.geckox.buffer.a) pair.first;
        aVar.b(0L);
        File parentFile = aVar.f().getParentFile();
        try {
            h.a(new com.bykv.vk.openvk.preload.geckox.buffer.stream.a(aVar), parentFile.getAbsolutePath(), channel);
            aVar.a();
            File file = new File(parentFile, "res");
            com.bykv.vk.openvk.preload.geckox.utils.b.a(file);
            if (new File(parentFile, channel).renameTo(file)) {
                return bVar.a((com.bykv.vk.openvk.preload.a.b<Pair<File, UpdatePackage>>) new Pair<>(aVar.f(), updatePackage));
            }
            throw new RuntimeException("rename unzip merged zip file failed:" + parentFile.getAbsolutePath());
        } catch (Exception e3) {
            StringBuilder sbK = u4.k("unzip merged zip file failed, channel:", channel, ", pkg id:");
            sbK.append(updatePackage.getPatch().getId());
            sbK.append(e3.getMessage());
            throw new RuntimeException(sbK.toString(), e3);
        }
    }
}
