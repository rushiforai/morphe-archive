package com.bytedance.sdk.component.ul.zb;

import android.text.TextUtils;
import android.util.Pair;
import com.bytedance.sdk.component.zb.ycx.ea;
import com.bytedance.sdk.component.zb.ycx.jw;
import com.bytedance.sdk.component.zb.ycx.lt;
import com.bytedance.sdk.component.zb.ycx.ok;
import com.bytedance.sdk.component.zb.ycx.ry;
import com.bytedance.sdk.component.zb.ycx.syc;
import com.bytedance.sdk.component.zb.ycx.xkz;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.zip.GZIPOutputStream;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dj extends sya {
    ry ycx;

    public dj(ea eaVar) {
        super(eaVar);
        this.ycx = null;
    }

    private byte[] lt(String str) throws Throwable {
        ByteArrayOutputStream byteArrayOutputStream;
        GZIPOutputStream gZIPOutputStream;
        GZIPOutputStream gZIPOutputStream2 = null;
        if (str == null || str.length() == 0) {
            return null;
        }
        byte[] byteArray = new byte[0];
        try {
            byteArrayOutputStream = new ByteArrayOutputStream();
            try {
                try {
                    gZIPOutputStream = new GZIPOutputStream(byteArrayOutputStream);
                } catch (IOException e3) {
                    e = e3;
                }
            } catch (Throwable th2) {
                th = th2;
            }
            try {
                gZIPOutputStream.write(str.getBytes("utf-8"));
                try {
                    gZIPOutputStream.close();
                } catch (IOException e11) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "a+E+gSakbMSVXthP", "WOEghRG5etTSbc1UnA==", 328);
                }
            } catch (IOException e12) {
                e = e12;
                gZIPOutputStream2 = gZIPOutputStream;
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "a+E+gSakbMSVXthP", "WOEghRG5etTSbc1UnA==", Sdk.SDKError.Reason.MRAID_UNRECOGNIZED_COMMAND_VALUE);
                if (gZIPOutputStream2 != null) {
                    try {
                        gZIPOutputStream2.close();
                    } catch (IOException e13) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e13, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "a+E+gSakbMSVXthP", "WOEghRG5etTSbc1UnA==", 328);
                    }
                }
                if (byteArrayOutputStream != null) {
                    byteArray = byteArrayOutputStream.toByteArray();
                    byteArrayOutputStream.close();
                }
                return byteArray;
            } catch (Throwable th3) {
                th = th3;
                gZIPOutputStream2 = gZIPOutputStream;
                if (gZIPOutputStream2 != null) {
                    try {
                        gZIPOutputStream2.close();
                    } catch (IOException e14) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e14, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "a+E+gSakbMSVXthP", "WOEghRG5etTSbc1UnA==", 328);
                    }
                }
                if (byteArrayOutputStream == null) {
                    throw th;
                }
                byteArrayOutputStream.toByteArray();
                try {
                    byteArrayOutputStream.close();
                    throw th;
                } catch (IOException e15) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e15, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "a+E+gSakbMSVXthP", "WOEghRG5etTSbc1UnA==", 336);
                    throw th;
                }
            }
        } catch (IOException e16) {
            e = e16;
            byteArrayOutputStream = null;
        } catch (Throwable th4) {
            th = th4;
            byteArrayOutputStream = null;
        }
        byteArray = byteArrayOutputStream.toByteArray();
        try {
            byteArrayOutputStream.close();
        } catch (IOException e17) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e17, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "a+E+gSakbMSVXthP", "WOEghRG5etTSbc1UnA==", 336);
        }
        return byteArray;
    }

    public void lud(String str) {
        if (TextUtils.isEmpty(str)) {
            str = "{}";
        }
        this.ycx = ry.ycx(jw.ycx("application/json; charset=utf-8"), str);
    }

    public void ycx(JSONObject jSONObject) {
        String string;
        if (jSONObject != null) {
            string = jSONObject.toString();
        } else {
            string = "{}";
        }
        this.ycx = ry.ycx(jw.ycx("application/json; charset=utf-8"), string);
    }

    public void ycx(String str, byte[] bArr) {
        this.ycx = ry.ycx(jw.ycx(str), bArr);
    }

    @Override // com.bytedance.sdk.component.ul.zb.sya
    public void ycx(final com.bytedance.sdk.component.ul.ycx.ycx ycxVar) {
        try {
            ok.ycx ycxVar2 = new ok.ycx();
            if (TextUtils.isEmpty(this.fby)) {
                ycxVar.ycx(this, new IOException("Url is Empty"));
                return;
            }
            if (!TextUtils.isEmpty(this.lud)) {
                ycxVar2.ycx(this.lud);
            }
            int i5 = this.f24086lt;
            if (i5 > 0) {
                ycxVar2.ycx(i5);
            }
            ycxVar2.zb(this.fby);
            if (this.ycx == null) {
                if (ycxVar != null) {
                    ycxVar.ycx(this, new IOException("RequestBody is null, content type is not support!!"));
                }
            } else {
                zb(ycxVar2);
                ycxVar2.ycx((Object) dj());
                ycx(ycxVar2);
                this.sya.ycx(ycxVar2.ycx(this.ycx).zb()).ycx(new com.bytedance.sdk.component.zb.ycx.sya() { // from class: com.bytedance.sdk.component.ul.zb.dj.1
                    @Override // com.bytedance.sdk.component.zb.ycx.sya
                    public void ycx(com.bytedance.sdk.component.zb.ycx.zb zbVar, IOException iOException) {
                        com.bytedance.sdk.component.ul.ycx.ycx ycxVar3 = ycxVar;
                        if (ycxVar3 != null) {
                            ycxVar3.ycx(dj.this, iOException);
                        }
                    }

                    /* JADX WARN: Multi-variable type inference failed */
                    /* JADX WARN: Removed duplicated region for block: B:44:0x0100  */
                    /* JADX WARN: Removed duplicated region for block: B:46:0x0108  */
                    /* JADX WARN: Type inference failed for: r0v7, types: [com.bytedance.sdk.component.zb.ycx.lt] */
                    /* JADX WARN: Type inference failed for: r13v6, types: [com.bytedance.sdk.component.ul.ycx.ycx] */
                    /* JADX WARN: Type inference failed for: r2v1 */
                    /* JADX WARN: Type inference failed for: r2v10, types: [com.bytedance.sdk.component.ul.zb] */
                    /* JADX WARN: Type inference failed for: r2v12 */
                    /* JADX WARN: Type inference failed for: r2v13, types: [int] */
                    /* JADX WARN: Type inference failed for: r2v15 */
                    /* JADX WARN: Type inference failed for: r2v16 */
                    /* JADX WARN: Type inference failed for: r2v17 */
                    /* JADX WARN: Type inference failed for: r2v18 */
                    /* JADX WARN: Type inference failed for: r2v19 */
                    /* JADX WARN: Type inference failed for: r2v2, types: [com.bytedance.sdk.component.ul.zb] */
                    /* JADX WARN: Type inference failed for: r2v6 */
                    @Override // com.bytedance.sdk.component.zb.ycx.sya
                    /*
                        Code decompiled incorrectly, please refer to instructions dump.
                    */
                    public void ycx(com.bytedance.sdk.component.zb.ycx.zb zbVar, xkz xkzVar) throws IOException {
                        Throwable th2;
                        ?? r22;
                        ?? zbVar2;
                        com.bytedance.sdk.component.ul.ycx.ycx ycxVar3 = ycxVar;
                        if (ycxVar3 != null) {
                            if (xkzVar == null) {
                                ycxVar3.ycx(dj.this, new IOException("No response"));
                                return;
                            }
                            dj.this.ycx(xkzVar.jw());
                            IOException iOException = null;
                            try {
                                HashMap map = new HashMap();
                                ?? Ul = xkzVar.ul();
                                if (Ul != 0) {
                                    zbVar2 = 0;
                                    while (zbVar2 < Ul.ycx()) {
                                        String strYcx = Ul.ycx(zbVar2);
                                        String strZb = Ul.zb(zbVar2);
                                        map.put(strYcx, strZb);
                                        if (strYcx != null && strYcx.equalsIgnoreCase("content-type")) {
                                            map.put("content-type", strZb == null ? b.f42142b : strZb.toLowerCase());
                                        }
                                        zbVar2++;
                                    }
                                }
                                syc sycVarLt = xkzVar.lt();
                                try {
                                    if (com.bytedance.sdk.component.ul.sya.ycx.ycx(map)) {
                                        byte[] bArrDj = sycVarLt.dj();
                                        com.bytedance.sdk.component.ul.zb zbVar3 = new com.bytedance.sdk.component.ul.zb(xkzVar.dj(), xkzVar.sya(), xkzVar.lud(), map, null, xkzVar.zb(), xkzVar.ycx());
                                        zbVar3.ycx(bArrDj);
                                        zbVar2 = zbVar3;
                                    } else if (dj.this.f24084jc) {
                                        byte[] bArrDj2 = sycVarLt.dj();
                                        dj djVar = dj.this;
                                        com.bytedance.sdk.component.ul.zb zbVar4 = new com.bytedance.sdk.component.ul.zb(xkzVar.dj(), xkzVar.sya(), xkzVar.lud(), map, new String(bArrDj2, djVar.ycx(djVar.ycx(sycVarLt))), xkzVar.zb(), xkzVar.ycx());
                                        zbVar4.ycx(bArrDj2);
                                        zbVar2 = zbVar4;
                                    } else if (sycVarLt != null) {
                                        zbVar2 = new com.bytedance.sdk.component.ul.zb(xkzVar.dj(), xkzVar.sya(), xkzVar.lud(), map, sycVarLt.zb(), xkzVar.zb(), xkzVar.ycx());
                                    } else {
                                        throw new IOException(xkzVar.lud());
                                    }
                                    dj.this.ycx((com.bytedance.sdk.component.ul.zb) zbVar2, xkzVar);
                                    r22 = zbVar2;
                                } catch (Throwable th3) {
                                    th2 = th3;
                                    iOException = zbVar2;
                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "a+E+gSakbMSVXthPyEA=", "VOAfkBCsZsmTTw==", 175);
                                    r22 = iOException;
                                    iOException = new IOException(th2);
                                    if (r22 == 0) {
                                    }
                                }
                            } catch (Throwable th4) {
                                th2 = th4;
                            }
                            if (r22 == 0) {
                                ycxVar.ycx(dj.this, r22);
                                return;
                            }
                            com.bytedance.sdk.component.ul.ycx.ycx ycxVar4 = ycxVar;
                            if (ycxVar4 instanceof com.bytedance.sdk.component.ul.ycx.zb) {
                                com.bytedance.sdk.component.ul.ycx.zb zbVar5 = (com.bytedance.sdk.component.ul.ycx.zb) ycxVar4;
                                dj djVar2 = dj.this;
                                if (iOException == null) {
                                    iOException = new IOException("Unexpected exception");
                                }
                                zbVar5.ycx(djVar2, iOException, new com.bytedance.sdk.component.ul.zb(xkzVar.dj(), xkzVar.sya(), xkzVar.lud(), null, null, xkzVar.zb(), xkzVar.ycx()));
                                return;
                            }
                            dj djVar3 = dj.this;
                            if (iOException == null) {
                                iOException = new IOException("Unexpected exception");
                            }
                            ycxVar4.ycx(djVar3, iOException);
                        }
                    }
                });
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "a+E+gSakbMSVXthP", "XuA8gAapbO6OXtJPghCs", 193);
            ycxVar.ycx(this, new IOException(th2.getMessage()));
        }
    }

    private Pair<xkz, Exception> ycx(ok okVar) {
        try {
            return new Pair<>(this.sya.ycx(okVar).zb(), null);
        } catch (IOException e3) {
            return new Pair<>(null, e3);
        }
    }

    @Override // com.bytedance.sdk.component.ul.zb.sya
    public com.bytedance.sdk.component.ul.zb ycx() {
        com.bytedance.sdk.component.ul.zb zbVar;
        com.bytedance.sdk.component.ul.zb zbVar2;
        try {
            ok.ycx ycxVar = new ok.ycx();
            if (TextUtils.isEmpty(this.fby)) {
                return new com.bytedance.sdk.component.ul.zb(false, 5000, "URL_NULL_MSG", null, "URL_NULL_BODY", 1L, 1L);
            }
            ycxVar.zb(this.fby);
            if (this.ycx == null) {
                return new com.bytedance.sdk.component.ul.zb(false, 5000, "BODY_NULL_MSG", null, "BODY_NULL_BODY", 1L, 1L);
            }
            zb(ycxVar);
            ycxVar.ycx((Object) dj());
            ycx(ycxVar);
            Pair<xkz, Exception> pairYcx = ycx(ycxVar.ycx(this.ycx).zb());
            Object obj = pairYcx.second;
            if (obj != null) {
                return new com.bytedance.sdk.component.ul.zb(false, 5001, ((Exception) obj).getMessage(), null, "BODY_NULL_BODY", 1L, 1L);
            }
            xkz xkzVar = (xkz) pairYcx.first;
            if (xkzVar == null) {
                return null;
            }
            ycx(xkzVar.jw());
            HashMap map = new HashMap();
            lt ltVarUl = xkzVar.ul();
            if (ltVarUl != null) {
                for (int i5 = 0; i5 < ltVarUl.ycx(); i5++) {
                    String strYcx = ltVarUl.ycx(i5);
                    String strZb = ltVarUl.zb(i5);
                    map.put(strYcx, strZb);
                    if (strYcx != null && strYcx.equalsIgnoreCase("content-type")) {
                        map.put("content-type", strZb == null ? b.f42142b : strZb.toLowerCase());
                    }
                }
            }
            syc sycVarLt = xkzVar.lt();
            if (sycVarLt == null) {
                zbVar2 = new com.bytedance.sdk.component.ul.zb(false, 5001, xkzVar.lud(), null, "BODY_NULL_BODY", 1L, 1L);
            } else {
                if (com.bytedance.sdk.component.ul.sya.ycx.ycx(map)) {
                    byte[] bArrDj = sycVarLt.dj();
                    zbVar = new com.bytedance.sdk.component.ul.zb(xkzVar.dj(), xkzVar.sya(), xkzVar.lud(), map, null, xkzVar.zb(), xkzVar.ycx());
                    zbVar.ycx(bArrDj);
                } else if (this.f24084jc) {
                    byte[] bArrDj2 = sycVarLt.dj();
                    zbVar = new com.bytedance.sdk.component.ul.zb(xkzVar.dj(), xkzVar.sya(), xkzVar.lud(), map, new String(bArrDj2, ycx(ycx(sycVarLt))), xkzVar.zb(), xkzVar.ycx());
                    zbVar.ycx(bArrDj2);
                } else {
                    zbVar = new com.bytedance.sdk.component.ul.zb(xkzVar.dj(), xkzVar.sya(), xkzVar.lud(), map, sycVarLt.zb(), xkzVar.zb(), xkzVar.ycx());
                }
                zbVar2 = zbVar;
            }
            ycx(zbVar2, xkzVar);
            return zbVar2;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "a+E+gSakbMSVXthP", "XvYolhaobO6OXtJPghCs", 290);
            return new com.bytedance.sdk.component.ul.zb(false, 5001, th2.getMessage(), null, "BODY_NULL_BODY", 1L, 1L);
        }
    }

    public void ycx(String str, boolean z11) {
        if (z11) {
            ycx("application/json; charset=utf-8", lt(str));
            zb("Content-Encoding", "gzip");
        } else {
            lud(str);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Charset ycx(jw jwVar) {
        try {
            return jwVar != null ? jwVar.ycx(com.bytedance.sdk.component.zb.ycx.zb.jw.ycx) : com.bytedance.sdk.component.zb.ycx.zb.jw.ycx;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "a+E+gSakbMSVXthP", "WOYshxC5fQ==", 348);
            return com.bytedance.sdk.component.zb.ycx.zb.jw.ycx;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public jw ycx(syc sycVar) {
        try {
            return sycVar.lud();
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "a+E+gSakbMSVXthP", "WOEjgQayffOZWtI=", 356);
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(com.bytedance.sdk.component.ul.zb zbVar, xkz xkzVar) {
        if (zbVar == null || xkzVar == null) {
            return;
        }
        zbVar.ycx(xkzVar.fby());
    }
}
