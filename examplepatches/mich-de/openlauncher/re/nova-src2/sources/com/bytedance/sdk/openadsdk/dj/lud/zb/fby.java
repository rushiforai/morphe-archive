package com.bytedance.sdk.openadsdk.dj.lud.zb;

import com.bykv.vk.openvk.ycx.ycx.ycx.sya.a;
import com.bytedance.sdk.component.utils.htf;
import java.io.File;
import java.io.FileInputStream;
import org.json.JSONException;
import org.json.JSONObject;
import ps.f;

/* loaded from: classes2.dex */
public class fby extends sya {

    /* renamed from: dj, reason: collision with root package name */
    private int f26534dj;
    private long sya;
    private final a ycx;

    /* renamed from: zb, reason: collision with root package name */
    private long f26535zb;

    public fby(a aVar) {
        this.ycx = aVar;
    }

    public void ycx(long j11) {
        this.f26535zb = j11;
    }

    public void zb(long j11) {
        this.sya = j11;
    }

    public void ycx(int i5) {
        this.f26534dj = i5;
    }

    @Override // com.bytedance.sdk.openadsdk.dj.lud.zb.sya
    public void ycx(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        try {
            jSONObject.put("video_start_duration", this.f26535zb);
            jSONObject.put("video_cache_size", this.sya);
            jSONObject.put("is_auto_play", this.f26534dj);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZPoDucB7lmiY1F01iA", "fesokTOwaN6tRdNYgA==", "WuopoQyWesiOZdVXiRK0", 54);
            htf.sya("FeedPlayModel", th2.getMessage());
        }
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:42:0x00c2 -> B:63:0x00d4). Please report as a decompilation issue!!! */
    @Override // com.bytedance.sdk.openadsdk.dj.lud.zb.sya
    public void ycx(ycx ycxVar) throws Throwable {
        Throwable th2;
        FileInputStream fileInputStream;
        FileInputStream fileInputStream2;
        char c11;
        int i5;
        if (this.ycx.hf()) {
            String strLud = this.ycx.lud();
            String strWie = this.ycx.wie();
            File fileX = f.x(strLud, strWie);
            File fileT = f.t(strLud, strWie);
            if (fileT.exists()) {
                fileX = fileT;
            }
            int i11 = -1;
            if (fileX.exists()) {
                long length = fileX.length();
                long j11 = 0;
                if (length > 0) {
                    FileInputStream fileInputStream3 = null;
                    FileInputStream fileInputStream4 = null;
                    fileInputStream3 = null;
                    try {
                        try {
                            try {
                                fileInputStream2 = new FileInputStream(fileX);
                                c11 = '\b';
                            } catch (Throwable th3) {
                                th2 = th3;
                                fileInputStream = fileInputStream3;
                            }
                        } catch (Exception e3) {
                            e = e3;
                        }
                    } catch (Exception e11) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOUE7Un0pRD204=", "becpkAyYbMSPTtJomBis", "XOs5uDPoT86MT/pSgweCJ0PeIoYKqGDIjg==", 148);
                        fileInputStream3 = fileInputStream3;
                    }
                    try {
                        byte[] bArr = new byte[8];
                        long j12 = 0;
                        while (true) {
                            i5 = fileInputStream2.read(bArr);
                            if (i5 != c11) {
                                break;
                            }
                            char c12 = c11;
                            long j13 = j11;
                            i5 = 16;
                            long j14 = ((bArr[0] & 255) << 24) | ((bArr[1] & 255) << 16) | ((bArr[2] & 255) << c12) | (bArr[3] & 255);
                            if (bArr[4] != 109 || bArr[5] != 111 || bArr[6] != 111 || bArr[7] != 118) {
                                long j15 = j14 - 8;
                                i5 = (j15 > j13 ? 1 : (j15 == j13 ? 0 : -1));
                                if (i5 > 0 && fileInputStream2.skip(j15) < j15) {
                                    break;
                                }
                                j12 += j14;
                                c11 = c12;
                                j11 = j13;
                            } else {
                                break;
                            }
                        }
                        i11 = (int) ((j12 * 100.0f) / length);
                        fileInputStream2.close();
                        fileInputStream3 = i5;
                    } catch (Exception e12) {
                        e = e12;
                        fileInputStream4 = fileInputStream2;
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOUE7Un0pRD204=", "becpkAyYbMSPTtJomBis", "XOs5uDPoT86MT/pSgweCJ0PeIoYKqGDIjg==", 139);
                        fileInputStream3 = fileInputStream4;
                        if (fileInputStream4 != null) {
                            fileInputStream4.close();
                            fileInputStream3 = fileInputStream4;
                        }
                        ycxVar.dj().put("moov_box_pos", i11);
                    } catch (Throwable th4) {
                        th2 = th4;
                        fileInputStream = fileInputStream2;
                        if (fileInputStream != null) {
                            try {
                                fileInputStream.close();
                                throw th2;
                            } catch (Exception e13) {
                                com.bytedance.sdk.openadsdk.oty.sya.ycx(e13, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOUE7Un0pRD204=", "becpkAyYbMSPTtJomBis", "XOs5uDPoT86MT/pSgweCJ0PeIoYKqGDIjg==", 148);
                                throw th2;
                            }
                        }
                        throw th2;
                    }
                }
            }
            try {
                ycxVar.dj().put("moov_box_pos", i11);
            } catch (JSONException e14) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e14, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZPoDucB7lmiY1F01iA", "fesokTOwaN6tRdNYgA==", "WesrmhG5W8KQRcVJqQelJk8=", 74);
            }
        }
    }
}
