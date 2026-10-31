package com.bytedance.sdk.component.lud.zb.sya.ycx.ycx;

import com.bytedance.sdk.component.lud.sya;
import com.bytedance.sdk.component.utils.jc;
import com.vungle.ads.internal.protos.Sdk;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes2.dex */
public class zb implements sya {
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private ycx f24029zb;

    public zb(File file, long j11) {
        int i5 = (int) j11;
        this.ycx = i5;
        this.f24029zb = ycx.ycx(i5, file);
    }

    @Override // com.bytedance.sdk.component.lud.ycx
    /* renamed from: sya, reason: merged with bridge method [inline-methods] */
    public boolean zb(String str) throws IOException {
        try {
            InputStream inputStreamYcx = this.f24029zb.ycx(str);
            boolean z11 = inputStreamYcx != null;
            jc.ycx(inputStreamYcx);
            return z11;
        } catch (Throwable th2) {
            try {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6AulAC0bImEQ8RW", "a+8quRGpSsiVRMN5hQKrC1rtJZA=", "WOEjgQK1Z9Q=", Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE);
                th2.getMessage();
                return false;
            } finally {
                jc.ycx(null);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r0v13 */
    /* JADX WARN: Type inference failed for: r0v2 */
    /* JADX WARN: Type inference failed for: r0v7 */
    /* JADX WARN: Type inference failed for: r9v1, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r9v10 */
    /* JADX WARN: Type inference failed for: r9v11 */
    /* JADX WARN: Type inference failed for: r9v3 */
    @Override // com.bytedance.sdk.component.lud.ycx
    /* renamed from: zb, reason: avoid collision after fix types in other method and merged with bridge method [inline-methods] */
    public byte[] ycx(String str) throws Throwable {
        ?? r92;
        ?? r02;
        InputStream inputStreamYcx;
        ByteArrayOutputStream byteArrayOutputStream;
        ycx ycxVar = this.f24029zb;
        if (ycxVar != null) {
            try {
                if (str != null) {
                    try {
                        inputStreamYcx = ycxVar.ycx(str);
                        if (inputStreamYcx != null) {
                            try {
                                byteArrayOutputStream = new ByteArrayOutputStream();
                                try {
                                    byte[] bArr = new byte[1024];
                                    while (true) {
                                        int i5 = inputStreamYcx.read(bArr);
                                        if (i5 == -1) {
                                            break;
                                        }
                                        byteArrayOutputStream.write(bArr, 0, i5);
                                    }
                                } catch (IOException e3) {
                                    e = e3;
                                    inputStreamYcx = inputStreamYcx;
                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6AulAC0bImEQ8RW", "a+8quRGpSsiVRMN5hQKrC1rtJZA=", "XOs5", 103);
                                    jc.ycx(inputStreamYcx);
                                    jc.ycx(byteArrayOutputStream);
                                    return null;
                                }
                            } catch (IOException e11) {
                                e = e11;
                                byteArrayOutputStream = null;
                                inputStreamYcx = inputStreamYcx;
                                com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6AulAC0bImEQ8RW", "a+8quRGpSsiVRMN5hQKrC1rtJZA=", "XOs5", 103);
                                jc.ycx(inputStreamYcx);
                                jc.ycx(byteArrayOutputStream);
                                return null;
                            } catch (Throwable th2) {
                                th = th2;
                                r02 = 0;
                                r92 = inputStreamYcx;
                                jc.ycx(r92);
                                jc.ycx(r02);
                                throw th;
                            }
                        } else {
                            byteArrayOutputStream = null;
                        }
                        if (byteArrayOutputStream != null) {
                            byte[] byteArray = byteArrayOutputStream.toByteArray();
                            jc.ycx(inputStreamYcx);
                            jc.ycx(byteArrayOutputStream);
                            return byteArray;
                        }
                    } catch (IOException e12) {
                        e = e12;
                        inputStreamYcx = null;
                        byteArrayOutputStream = null;
                    } catch (Throwable th3) {
                        r02 = 0;
                        th = th3;
                        r92 = 0;
                    }
                    jc.ycx(inputStreamYcx);
                    jc.ycx(byteArrayOutputStream);
                    return null;
                }
            } catch (Throwable th4) {
                th = th4;
                r02 = ycxVar;
                r92 = str;
            }
        }
        return null;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.bytedance.sdk.component.lud.sya
    public InputStream ycx(String str) {
        ycx ycxVar = this.f24029zb;
        if (ycxVar == null) {
            return null;
        }
        return ycxVar.ycx(str);
    }

    @Override // com.bytedance.sdk.component.lud.ycx
    public boolean ycx(String str, byte[] bArr) {
        ycx ycxVar = this.f24029zb;
        if (ycxVar == null || bArr == null || str == null) {
            return false;
        }
        return ycxVar.ycx(str, bArr);
    }
}
