package com.bykv.vk.openvk.preload.geckox.c;

import com.bykv.vk.openvk.preload.geckox.model.UpdatePackage;

/* loaded from: classes2.dex */
public class a extends com.bykv.vk.openvk.preload.a.a<UpdatePackage, UpdatePackage> {
    @Override // com.bykv.vk.openvk.preload.a.a
    public final /* synthetic */ String a(UpdatePackage updatePackage) {
        int packageType = updatePackage.getPackageType();
        if (packageType == 0) {
            return "branch_zip";
        }
        if (packageType == 1) {
            return "branch_single_file";
        }
        throw new RuntimeException("unknow file type: ".concat(String.valueOf(packageType)));
    }
}
