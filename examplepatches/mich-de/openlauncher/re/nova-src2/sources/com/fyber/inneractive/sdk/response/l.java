package com.fyber.inneractive.sdk.response;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.w0;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.v;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class l extends b {

    /* renamed from: e, reason: collision with root package name */
    public com.fyber.inneractive.sdk.response.nativead.j f31069e;

    @Override // com.fyber.inneractive.sdk.response.b
    public final void a(String str, w0 w0Var) throws Exception {
        com.fyber.inneractive.sdk.response.nativead.j jVar;
        if (this.f31031a == null || (jVar = this.f31069e) == null) {
            throw new Exception("Missing response ".concat(this.f31031a == null ? "data" : "data native"));
        }
        if (w0Var == null) {
            jVar.f31050i = "ErrorConfigurationMismatch";
            return;
        }
        JSONObject jSONObject = new JSONObject(str);
        if (jSONObject.isNull("native")) {
            this.f31069e.f31050i = "ErrorInvalidJsonResponse";
            throw new com.fyber.inneractive.sdk.response.nativead.a("Missing native ad object", "ErrorInvalidJsonResponse");
        }
        try {
            com.fyber.inneractive.sdk.response.nativead.i iVarA = a(jSONObject.optJSONObject("native"));
            com.fyber.inneractive.sdk.response.nativead.k kVar = this.f31069e.S;
            kVar.M = iVarA;
            if (kVar.d()) {
                a(this.f31069e, w0Var);
            }
        } catch (com.fyber.inneractive.sdk.flow.vast.h e3) {
            if (e3.getCause() != null) {
                this.f31069e.f31050i = e3.getCause().getMessage();
            }
            this.f31069e.f31051j = e3.getMessage();
            throw e3;
        } catch (com.fyber.inneractive.sdk.response.nativead.a e11) {
            if (e11.getCause() != null) {
                this.f31069e.f31050i = e11.getCause().getMessage();
            }
            this.f31069e.f31051j = e11.getMessage();
            IAlog.f("%s: parsing native ad response: error: %s", "NativeAdResponseParser", e11.getMessage());
            throw e11;
        } catch (Exception e12) {
            this.f31069e.f31051j = e12.getMessage();
            com.fyber.inneractive.sdk.response.nativead.j jVar2 = this.f31069e;
            jVar2.f31050i = "ErrorInvalidNativeOrtbObject";
            jVar2.f31062w = e12;
            IAlog.f("%s: parsing native ad response: error: %s", "NativeAdResponseParser", e12.getMessage());
            if (IAlog.f31163a == 2) {
                e12.printStackTrace();
            }
            throw e12;
        }
    }

    public final void a(com.fyber.inneractive.sdk.response.nativead.j jVar, w0 w0Var) {
        com.fyber.inneractive.sdk.response.nativead.e eVarC = jVar.S.c();
        String str = eVarC != null ? eVarC.f31073a : null;
        if (str != null && !str.isEmpty()) {
            d dVar = new d(false);
            dVar.f31031a = new g();
            dVar.f31035e = this.f31069e;
            dVar.a(str, w0Var);
            return;
        }
        throw new com.fyber.inneractive.sdk.flow.vast.h("Missing vast content", "VastErrorInvalidFile");
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x00c1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static com.fyber.inneractive.sdk.response.nativead.i a(JSONObject jSONObject) {
        if (jSONObject != null) {
            if (jSONObject.has("assets") && !jSONObject.isNull("assets")) {
                if (jSONObject.has("link") && !jSONObject.isNull("link")) {
                    JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("assets");
                    ArrayList arrayList = new ArrayList();
                    if (jSONArrayOptJSONArray != null) {
                        boolean z11 = false;
                        boolean z12 = false;
                        for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                            JSONObject jSONObjectOptJSONObject = jSONArrayOptJSONArray.optJSONObject(i5);
                            if (jSONObjectOptJSONObject != null) {
                                com.fyber.inneractive.sdk.response.nativead.f fVar = new com.fyber.inneractive.sdk.response.nativead.f();
                                fVar.f31074a = jSONObjectOptJSONObject.optInt("id");
                                jSONObjectOptJSONObject.optInt("required");
                                fVar.f31079f = com.fyber.inneractive.sdk.response.nativead.parser.c.a(jSONObjectOptJSONObject.optJSONObject("link"));
                                if (jSONObjectOptJSONObject.has("title")) {
                                    JSONObject jSONObjectOptJSONObject2 = jSONObjectOptJSONObject.optJSONObject("title");
                                    com.fyber.inneractive.sdk.response.nativead.d dVar = new com.fyber.inneractive.sdk.response.nativead.d();
                                    if (jSONObjectOptJSONObject2 != null) {
                                        dVar.f31072a = v.a(jSONObjectOptJSONObject2, "text");
                                        jSONObjectOptJSONObject2.optInt("len");
                                    }
                                    fVar.f31075b = dVar;
                                } else if (jSONObjectOptJSONObject.has("video")) {
                                    if (z11) {
                                        fVar = null;
                                    } else {
                                        JSONObject jSONObjectOptJSONObject3 = jSONObjectOptJSONObject.optJSONObject("video");
                                        com.fyber.inneractive.sdk.response.nativead.e eVar = new com.fyber.inneractive.sdk.response.nativead.e();
                                        if (jSONObjectOptJSONObject3 != null) {
                                            eVar.f31073a = v.a(jSONObjectOptJSONObject3, "vasttag");
                                        }
                                        fVar.f31076c = eVar;
                                        z11 = !TextUtils.isEmpty(eVar.f31073a);
                                    }
                                } else if (jSONObjectOptJSONObject.has("img")) {
                                    int i11 = fVar.f31074a;
                                    boolean z13 = i11 == 2;
                                    if ((!z13 || !z11) && (z13 || !z12)) {
                                        JSONObject jSONObjectOptJSONObject4 = jSONObjectOptJSONObject.optJSONObject("img");
                                        com.fyber.inneractive.sdk.response.nativead.c cVar = new com.fyber.inneractive.sdk.response.nativead.c();
                                        if (jSONObjectOptJSONObject4 != null) {
                                            jSONObjectOptJSONObject4.optInt("width");
                                            jSONObjectOptJSONObject4.optInt("height");
                                            cVar.f31071a = v.a(jSONObjectOptJSONObject4, TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
                                        }
                                        if (i11 == 2) {
                                            z11 = !TextUtils.isEmpty(cVar.f31071a);
                                        } else if (i11 == 4) {
                                            z12 = !TextUtils.isEmpty(cVar.f31071a);
                                        }
                                        fVar.f31077d = cVar;
                                    }
                                } else if (jSONObjectOptJSONObject.has("data")) {
                                    JSONObject jSONObjectOptJSONObject5 = jSONObjectOptJSONObject.optJSONObject("data");
                                    com.fyber.inneractive.sdk.response.nativead.b bVar = new com.fyber.inneractive.sdk.response.nativead.b();
                                    if (jSONObjectOptJSONObject5 != null) {
                                        bVar.f31070a = v.a(jSONObjectOptJSONObject5, "value");
                                    }
                                    fVar.f31078e = bVar;
                                }
                                if (fVar != null) {
                                    arrayList.add(fVar);
                                }
                            }
                        }
                        if (!z11) {
                            throw new com.fyber.inneractive.sdk.response.nativead.a("Missing valid main asset (video/image)", "ErrorNoMainAsset");
                        }
                    }
                    com.fyber.inneractive.sdk.response.nativead.h hVarA = com.fyber.inneractive.sdk.response.nativead.parser.c.a(jSONObject.optJSONObject("link"));
                    if (!TextUtils.isEmpty(hVarA.f31084a)) {
                        String strA = v.a(jSONObject, "jstracker");
                        v.a(jSONObject, "privacy");
                        ArrayList arrayListA = com.fyber.inneractive.sdk.response.nativead.parser.b.a(jSONObject.optJSONArray("imptrackers"));
                        ArrayList arrayListA2 = com.fyber.inneractive.sdk.response.nativead.parser.a.a(jSONObject.optJSONArray("eventtrackers"));
                        com.fyber.inneractive.sdk.response.nativead.i iVar = new com.fyber.inneractive.sdk.response.nativead.i();
                        iVar.f31087a = arrayList;
                        iVar.f31088b = hVarA;
                        iVar.f31090d = strA;
                        iVar.f31089c = arrayListA;
                        iVar.f31091e = arrayListA2;
                        return iVar;
                    }
                    throw new com.fyber.inneractive.sdk.response.nativead.a("Missing url in main link object", "ErrorNoMainLink");
                }
                throw new com.fyber.inneractive.sdk.response.nativead.a("Missing main link object", "ErrorNoMainLink");
            }
            throw new com.fyber.inneractive.sdk.response.nativead.a("Missing assets", "ErrorNoAssets");
        }
        throw new com.fyber.inneractive.sdk.response.nativead.a("Empty native body", "ErrorNoNativeBody");
    }

    @Override // com.fyber.inneractive.sdk.response.b
    public final e a() {
        com.fyber.inneractive.sdk.response.nativead.j jVar = new com.fyber.inneractive.sdk.response.nativead.j();
        this.f31031a = jVar;
        this.f31069e = jVar;
        return jVar;
    }
}
