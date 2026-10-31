package com.bytedance.sdk.component.ul.zb;

import android.net.Uri;
import android.text.TextUtils;
import com.bytedance.sdk.component.zb.ycx.ea;
import com.bytedance.sdk.component.zb.ycx.lt;
import com.bytedance.sdk.component.zb.ycx.ok;
import com.bytedance.sdk.component.zb.ycx.syc;
import com.bytedance.sdk.component.zb.ycx.ul;
import com.bytedance.sdk.component.zb.ycx.xkz;
import com.bytedance.sdk.component.zb.ycx.ycx;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/* loaded from: classes2.dex */
public class zb extends sya {
    public static final com.bytedance.sdk.component.zb.ycx.ycx ycx = new ycx.C0046ycx().ycx().zb();

    /* renamed from: zb, reason: collision with root package name */
    public static final com.bytedance.sdk.component.zb.ycx.ycx f24093zb = new ycx.C0046ycx().zb();

    /* renamed from: ea, reason: collision with root package name */
    private com.bytedance.sdk.component.zb.ycx.ycx f24094ea;

    /* renamed from: ok, reason: collision with root package name */
    private boolean f24095ok;

    /* renamed from: ry, reason: collision with root package name */
    private Map<String, String> f24096ry;

    public zb(ea eaVar) {
        super(eaVar);
        this.f24094ea = ycx;
        this.f24095ok = false;
        this.f24096ry = new HashMap();
    }

    public void ycx(boolean z11) {
        this.f24095ok = z11;
    }

    @Override // com.bytedance.sdk.component.ul.zb.sya
    public void ycx(final com.bytedance.sdk.component.ul.ycx.ycx ycxVar) {
        try {
            ok.ycx ycxVar2 = new ok.ycx();
            if (this.f24095ok) {
                ycxVar2.zb(this.fby);
            } else {
                ul.ycx ycxVar3 = new ul.ycx();
                Uri uri = Uri.parse(this.fby);
                ycxVar3.ycx(uri.getScheme());
                ycxVar3.zb(uri.getHost());
                String encodedPath = uri.getEncodedPath();
                if (!TextUtils.isEmpty(encodedPath)) {
                    if (encodedPath.startsWith("/")) {
                        encodedPath = encodedPath.substring(1);
                    }
                    ycxVar3.sya(encodedPath);
                }
                Set<String> queryParameterNames = uri.getQueryParameterNames();
                if (queryParameterNames != null && queryParameterNames.size() > 0) {
                    for (String str : queryParameterNames) {
                        this.f24096ry.put(str, uri.getQueryParameter(str));
                    }
                }
                for (Map.Entry<String, String> entry : this.f24096ry.entrySet()) {
                    String key = entry.getKey();
                    String value = entry.getValue();
                    if (!TextUtils.isEmpty(key)) {
                        String strEncode = URLEncoder.encode(key, "UTF-8");
                        if (value == null) {
                            value = b.f42142b;
                        }
                        ycxVar3.ycx(strEncode, URLEncoder.encode(value, "UTF-8"));
                    }
                }
                ycxVar2.ycx(ycxVar3.zb());
            }
            zb(ycxVar2);
            ycx(ycxVar2);
            ycxVar2.ycx(this.f24094ea);
            ycxVar2.ycx((Object) dj());
            if (!TextUtils.isEmpty(this.lud)) {
                ycxVar2.ycx(this.lud);
            }
            int i5 = this.f24086lt;
            if (i5 > 0) {
                ycxVar2.ycx(i5);
            }
            this.sya.ycx(ycxVar2.ycx().zb()).ycx(new com.bytedance.sdk.component.zb.ycx.sya() { // from class: com.bytedance.sdk.component.ul.zb.zb.1
                @Override // com.bytedance.sdk.component.zb.ycx.sya
                public void ycx(com.bytedance.sdk.component.zb.ycx.zb zbVar, IOException iOException) {
                    com.bytedance.sdk.component.ul.ycx.ycx ycxVar4 = ycxVar;
                    if (ycxVar4 != null) {
                        ycxVar4.ycx(zb.this, iOException);
                    }
                }

                @Override // com.bytedance.sdk.component.zb.ycx.sya
                public void ycx(com.bytedance.sdk.component.zb.ycx.zb zbVar, xkz xkzVar) throws IOException {
                    String strZb;
                    if (ycxVar != null) {
                        HashMap map = new HashMap();
                        if (xkzVar != null) {
                            zb.this.ycx(xkzVar.jw());
                            lt ltVarUl = xkzVar.ul();
                            if (ltVarUl != null) {
                                for (int i11 = 0; i11 < ltVarUl.ycx(); i11++) {
                                    map.put(ltVarUl.ycx(i11), ltVarUl.zb(i11));
                                }
                            }
                            syc sycVarLt = xkzVar.lt();
                            if (sycVarLt == null) {
                                strZb = b.f42142b;
                            } else {
                                strZb = sycVarLt.zb();
                            }
                            ycxVar.ycx(zb.this, new com.bytedance.sdk.component.ul.zb(xkzVar.dj(), xkzVar.sya(), xkzVar.lud(), map, strZb, xkzVar.zb(), xkzVar.ycx()));
                        }
                    }
                }
            });
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "fOs5sBu5atKURcU=", "XuA8gAapbO6OXtJPghCs", 175);
            if (ycxVar != null) {
                ycxVar.ycx(this, new IOException(th2.getMessage()));
            }
        }
    }

    @Override // com.bytedance.sdk.component.ul.zb.sya
    public com.bytedance.sdk.component.ul.zb ycx() {
        try {
            ok.ycx ycxVar = new ok.ycx();
            boolean z11 = this.f24095ok;
            String strZb = b.f42142b;
            if (z11) {
                ycxVar.zb(this.fby);
            } else {
                ul.ycx ycxVar2 = new ul.ycx();
                Uri uri = Uri.parse(this.fby);
                ycxVar2.ycx(uri.getScheme());
                ycxVar2.zb(uri.getHost());
                String encodedPath = uri.getEncodedPath();
                if (!TextUtils.isEmpty(encodedPath)) {
                    if (encodedPath.startsWith("/")) {
                        encodedPath = encodedPath.substring(1);
                    }
                    ycxVar2.sya(encodedPath);
                }
                Set<String> queryParameterNames = uri.getQueryParameterNames();
                if (queryParameterNames != null && queryParameterNames.size() > 0) {
                    for (String str : queryParameterNames) {
                        this.f24096ry.put(str, uri.getQueryParameter(str));
                    }
                }
                for (Map.Entry<String, String> entry : this.f24096ry.entrySet()) {
                    String key = entry.getKey();
                    String value = entry.getValue();
                    if (!TextUtils.isEmpty(key)) {
                        String strEncode = URLEncoder.encode(key, "UTF-8");
                        if (value == null) {
                            value = b.f42142b;
                        }
                        ycxVar2.ycx(strEncode, URLEncoder.encode(value, "UTF-8"));
                    }
                }
                ycxVar.ycx(ycxVar2.zb());
            }
            zb(ycxVar);
            ycx(ycxVar);
            ycxVar.ycx(this.f24094ea);
            ycxVar.ycx((Object) dj());
            xkz xkzVarZb = this.sya.ycx(ycxVar.ycx().zb()).zb();
            if (xkzVarZb == null) {
                return null;
            }
            ycx(xkzVarZb.jw());
            HashMap map = new HashMap();
            lt ltVarUl = xkzVarZb.ul();
            if (ltVarUl != null) {
                for (int i5 = 0; i5 < ltVarUl.ycx(); i5++) {
                    map.put(ltVarUl.ycx(i5), ltVarUl.zb(i5));
                }
            }
            syc sycVarLt = xkzVarZb.lt();
            if (sycVarLt != null) {
                strZb = sycVarLt.zb();
            }
            return new com.bytedance.sdk.component.ul.zb(xkzVarZb.dj(), xkzVarZb.sya(), xkzVarZb.lud(), map, strZb, xkzVarZb.zb(), xkzVarZb.ycx());
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "fOs5sBu5atKURcU=", "XvYolhaobO6OXtJPghCs", 258);
            return null;
        }
    }
}
