package com.bykv.vk.openvk.preload.geckox.c.b.a;

import android.net.Uri;
import android.util.Pair;
import b.u4;
import com.bykv.vk.openvk.preload.geckox.buffer.stream.BufferOutputStream;
import com.bykv.vk.openvk.preload.geckox.model.UpdatePackage;
import java.io.File;

/* loaded from: classes2.dex */
public class b extends com.bykv.vk.openvk.preload.a.d<Pair<Uri, UpdatePackage>, Pair<com.bykv.vk.openvk.preload.geckox.buffer.a, UpdatePackage>> {

    /* renamed from: d, reason: collision with root package name */
    private com.bykv.vk.openvk.preload.geckox.b f22068d;

    /* renamed from: e, reason: collision with root package name */
    private File f22069e;

    @Override // com.bykv.vk.openvk.preload.a.d
    public final void a(Object... objArr) {
        super.a(objArr);
        this.f22068d = (com.bykv.vk.openvk.preload.geckox.b) objArr[0];
        this.f22069e = (File) objArr[1];
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.bykv.vk.openvk.preload.a.d
    public Object a(com.bykv.vk.openvk.preload.a.b<Pair<com.bykv.vk.openvk.preload.geckox.buffer.a, UpdatePackage>> bVar, Pair<Uri, UpdatePackage> pair) throws Throwable {
        UpdatePackage updatePackage = (UpdatePackage) pair.second;
        String string = ((Uri) pair.first).toString();
        long length = updatePackage.getFullPackage().getLength();
        File file = this.f22069e;
        StringBuilder sb2 = new StringBuilder();
        sb2.append(updatePackage.getAccessKey());
        String str = File.separator;
        sb2.append(str);
        sb2.append(updatePackage.getChannel());
        sb2.append(str);
        sb2.append(updatePackage.getVersion());
        sb2.append("--updating");
        File file2 = new File(file, sb2.toString());
        file2.mkdirs();
        File file3 = new File(file2, "res.zip");
        this.f22068d.a();
        com.bykv.vk.openvk.preload.geckox.buffer.a aVarA = com.bykv.vk.openvk.preload.geckox.buffer.a.a.a(file3, length);
        try {
            this.f22068d.i().downloadFile(string, length, new BufferOutputStream(aVarA));
            try {
                return bVar.a((com.bykv.vk.openvk.preload.a.b<Pair<com.bykv.vk.openvk.preload.geckox.buffer.a, UpdatePackage>>) new Pair<>(aVarA, updatePackage));
            } finally {
                aVarA.e();
            }
        } catch (Throwable th2) {
            aVarA.e();
            StringBuilder sbK = u4.k("download full zip file failed, url:", string, ", channel:");
            sbK.append(updatePackage.getChannel());
            sbK.append(", pkg id:");
            sbK.append(updatePackage.getFullPackage().getId());
            sbK.append(", caused by:");
            sbK.append(th2.getMessage());
            throw new com.bykv.vk.openvk.preload.geckox.b.a(sbK.toString(), th2);
        }
    }
}
