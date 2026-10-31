package com.bytedance.sdk.openadsdk.ul;

import android.util.Pair;
import com.bykv.vk.openvk.preload.geckox.buffer.stream.BufferOutputStream;
import com.bykv.vk.openvk.preload.geckox.net.INetWork;
import com.bykv.vk.openvk.preload.geckox.net.Response;
import com.bykv.vk.openvk.preload.geckox.utils.CloseableUtils;
import com.bytedance.sdk.component.zb.ycx.ea;
import com.bytedance.sdk.component.zb.ycx.jw;
import com.bytedance.sdk.component.zb.ycx.lt;
import com.bytedance.sdk.component.zb.ycx.lud;
import com.bytedance.sdk.component.zb.ycx.ok;
import com.bytedance.sdk.component.zb.ycx.ry;
import com.bytedance.sdk.component.zb.ycx.syc;
import com.bytedance.sdk.component.zb.ycx.xkz;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.vungle.ads.internal.protos.Sdk;
import java.io.BufferedInputStream;
import java.io.Closeable;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/* loaded from: classes2.dex */
public class ycx implements INetWork {
    protected ea ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected ea f27096zb;

    public ycx() {
        ea.ycx ycxVar = new ea.ycx();
        TimeUnit timeUnit = TimeUnit.SECONDS;
        this.ycx = ycxVar.ycx(10L, timeUnit).zb(10L, timeUnit).sya(10L, timeUnit).ycx();
        this.f27096zb = new ea.ycx().ycx(10L, timeUnit).zb(30L, timeUnit).sya(30L, timeUnit).ycx();
    }

    private Map<String, String> ycx(lt ltVar) {
        if (ltVar == null) {
            return null;
        }
        HashMap map = new HashMap();
        for (int i5 = 0; i5 < ltVar.ycx(); i5++) {
            map.put(ltVar.ycx(i5), ltVar.zb(i5));
        }
        return map;
    }

    @Override // com.bykv.vk.openvk.preload.geckox.net.INetWork
    public Response doGet(String str) throws Exception {
        xkz xkzVarZb = this.ycx.ycx(new ok.ycx().ycx().zb(str).ycx("gecko").zb()).zb();
        syc sycVarLt = xkzVarZb.lt();
        return new Response(ycx(xkzVarZb.ul()), (xkzVarZb.sya() != 200 || sycVarLt == null) ? null : sycVarLt.zb(), xkzVarZb.sya(), xkzVarZb.lud());
    }

    @Override // com.bykv.vk.openvk.preload.geckox.net.INetWork
    public Response doPost(String str, List<Pair<String, String>> list) throws Exception {
        lud.ycx ycxVar = new lud.ycx();
        if (list != null) {
            for (Pair<String, String> pair : list) {
                ycxVar.ycx((String) pair.first, (String) pair.second);
            }
        }
        xkz xkzVarZb = this.ycx.ycx(new ok.ycx().zb(str).ycx((ry) ycxVar.ycx()).ycx("gecko").zb()).zb();
        syc sycVarLt = xkzVarZb.lt();
        return new Response(ycx(xkzVarZb.ul()), (xkzVarZb.sya() != 200 || sycVarLt == null) ? null : sycVarLt.zb(), xkzVarZb.sya(), xkzVarZb.lud());
    }

    /* JADX WARN: Not initialized variable reg: 2, insn: 0x0044: MOVE (r7 I:??[OBJECT, ARRAY]) = (r2 I:??[OBJECT, ARRAY]), block:B:12:0x0044 */
    @Override // com.bykv.vk.openvk.preload.geckox.net.INetWork
    public void downloadFile(String str, long j11, BufferOutputStream bufferOutputStream) throws Exception {
        Exception e3;
        Closeable closeable;
        BufferedInputStream bufferedInputStream;
        Closeable closeable2 = null;
        int i5 = 0;
        try {
            try {
                try {
                    xkz xkzVarZb = this.f27096zb.ycx(new ok.ycx().ycx().ycx("gecko").zb(str).zb()).zb();
                    int iSya = xkzVarZb.sya();
                    try {
                        bufferedInputStream = new BufferedInputStream(xkzVarZb.lt().sya());
                    } catch (Exception e11) {
                        e3 = e11;
                    }
                    try {
                        byte[] bArr = new byte[2048];
                        while (true) {
                            int i11 = bufferedInputStream.read(bArr, 0, 2048);
                            if (i11 == -1) {
                                CloseableUtils.close(bufferedInputStream);
                                return;
                            }
                            bufferOutputStream.write(bArr, 0, i11);
                        }
                    } catch (Exception e12) {
                        e3 = e12;
                        i5 = iSya;
                        sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4sUoyNU", "f+srlBawfemFXuBSnho=", "X+E6mw+zaMOmQ9tY", Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE);
                        throw new RuntimeException("downloadFile failed, code: " + i5 + ", url:" + str + ", caused by:" + e3.getMessage(), e3);
                    }
                } catch (Throwable th2) {
                    th = th2;
                    closeable2 = closeable;
                    CloseableUtils.close(closeable2);
                    throw th;
                }
            } catch (Exception e13) {
                e3 = e13;
            }
        } catch (Throwable th3) {
            th = th3;
            CloseableUtils.close(closeable2);
            throw th;
        }
    }

    @Override // com.bykv.vk.openvk.preload.geckox.net.INetWork
    public void syncDoGet(final String str) {
        this.ycx.ycx(new ok.ycx().ycx().zb(str).ycx("gecko").zb()).ycx(new com.bytedance.sdk.component.zb.ycx.sya() { // from class: com.bytedance.sdk.openadsdk.ul.ycx.1
            @Override // com.bytedance.sdk.component.zb.ycx.sya
            public void ycx(com.bytedance.sdk.component.zb.ycx.zb zbVar, xkz xkzVar) throws IOException {
            }

            @Override // com.bytedance.sdk.component.zb.ycx.sya
            public void ycx(com.bytedance.sdk.component.zb.ycx.zb zbVar, IOException iOException) {
            }
        });
    }

    @Override // com.bykv.vk.openvk.preload.geckox.net.INetWork
    public Response doPost(String str, String str2) throws Exception {
        xkz xkzVarZb = this.ycx.ycx(new ok.ycx().zb(str).ycx(ry.ycx(jw.ycx("application/json; charset=utf-8"), str2)).ycx("gecko").zb()).zb();
        syc sycVarLt = xkzVarZb.lt();
        return new Response(ycx(xkzVarZb.ul()), (xkzVarZb.sya() != 200 || sycVarLt == null) ? null : sycVarLt.zb(), xkzVarZb.sya(), xkzVarZb.lud());
    }
}
