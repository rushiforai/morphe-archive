package com.bykv.vk.openvk.preload.geckox.c;

import com.bykv.vk.openvk.preload.a.j;
import com.bykv.vk.openvk.preload.geckox.logger.GeckoLogger;
import com.bykv.vk.openvk.preload.geckox.model.UpdatePackage;
import java.util.List;

/* loaded from: classes2.dex */
public class b extends j<UpdatePackage, UpdatePackage> {
    @Override // com.bykv.vk.openvk.preload.a.j
    public final /* synthetic */ String a(UpdatePackage updatePackage) {
        UpdatePackage updatePackage2 = updatePackage;
        UpdatePackage.Package patch = updatePackage2.getPatch();
        if (patch == null) {
            GeckoLogger.d("gecko-debug-tag", "start full update, channel:", updatePackage2.getChannel());
            return "full";
        }
        List<String> urlList = patch.getUrlList();
        if (urlList == null || urlList.isEmpty()) {
            GeckoLogger.d("gecko-debug-tag", "start full update, channel:", updatePackage2.getChannel());
            return "full";
        }
        GeckoLogger.d("gecko-debug-tag", "start full update, channel:", updatePackage2.getChannel());
        return "patch";
    }

    @Override // com.bykv.vk.openvk.preload.a.j
    public final /* synthetic */ String a(UpdatePackage updatePackage, Throwable th2, String str) {
        UpdatePackage updatePackage2 = updatePackage;
        if ("patch".equals(str)) {
            GeckoLogger.d("gecko-debug-tag", "start full update, channel:", updatePackage2.getChannel());
            return "full";
        }
        throw new RuntimeException(fq.c.f(th2, new StringBuilder("full update failed, caused by:")), th2);
    }
}
