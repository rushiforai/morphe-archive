package com.bykv.vk.openvk.preload.geckox.c.a.b;

import android.net.Uri;
import android.util.Pair;
import b.u4;
import com.bykv.vk.openvk.preload.geckox.buffer.stream.BufferOutputStream;
import com.bykv.vk.openvk.preload.geckox.logger.GeckoLogger;
import com.bykv.vk.openvk.preload.geckox.model.UpdatePackage;
import java.io.File;

/* loaded from: classes2.dex */
public class c extends com.bykv.vk.openvk.preload.a.d<Pair<Uri, UpdatePackage>, Pair<com.bykv.vk.openvk.preload.geckox.buffer.a, UpdatePackage>> {

    /* renamed from: d, reason: collision with root package name */
    private com.bykv.vk.openvk.preload.geckox.b f22065d;

    /* renamed from: e, reason: collision with root package name */
    private File f22066e;

    @Override // com.bykv.vk.openvk.preload.a.d
    public final void a(Object... objArr) {
        super.a(objArr);
        this.f22065d = (com.bykv.vk.openvk.preload.geckox.b) objArr[0];
        this.f22066e = (File) objArr[1];
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.bykv.vk.openvk.preload.a.d
    public Object a(com.bykv.vk.openvk.preload.a.b<Pair<com.bykv.vk.openvk.preload.geckox.buffer.a, UpdatePackage>> bVar, Pair<Uri, UpdatePackage> pair) throws Throwable {
        UpdatePackage updatePackage = (UpdatePackage) pair.second;
        String channel = updatePackage.getChannel();
        GeckoLogger.d("gecko-debug-tag", "start download patch single file, channel:", channel);
        String string = ((Uri) pair.first).toString();
        long length = updatePackage.getPatch().getLength();
        File file = this.f22066e;
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
        File file3 = new File(file2, "patch.tmp");
        this.f22065d.a();
        com.bykv.vk.openvk.preload.geckox.buffer.a aVarA = com.bykv.vk.openvk.preload.geckox.buffer.a.a.a(file3, length);
        try {
            this.f22065d.i().downloadFile(string, length, new BufferOutputStream(aVarA));
            try {
                return bVar.a((com.bykv.vk.openvk.preload.a.b<Pair<com.bykv.vk.openvk.preload.geckox.buffer.a, UpdatePackage>>) new Pair<>(aVarA, updatePackage));
            } finally {
                aVarA.e();
            }
        } catch (Throwable th2) {
            aVarA.e();
            StringBuilder sbK = u4.k("download patch single file failed, url:", string, ", channel:");
            sbK.append(updatePackage.getChannel());
            sbK.append(", pkg id:");
            sbK.append(updatePackage.getPatch().getId());
            sbK.append(", caused by:");
            sbK.append(th2.getMessage());
            throw new com.bykv.vk.openvk.preload.geckox.b.a(sbK.toString(), th2);
        }
    }
}
