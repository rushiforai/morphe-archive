package com.fyber.inneractive.sdk.response;

import android.text.TextUtils;
import b.c0;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.config.w0;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.model.vast.a0;
import com.fyber.inneractive.sdk.model.vast.r;
import com.fyber.inneractive.sdk.model.vast.u;
import com.fyber.inneractive.sdk.model.vast.y;
import com.fyber.inneractive.sdk.model.vast.z;
import com.fyber.inneractive.sdk.network.t;
import com.fyber.inneractive.sdk.network.w;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.h0;
import com.fyber.inneractive.sdk.util.s;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import javax.xml.parsers.DocumentBuilderFactory;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;

/* loaded from: classes3.dex */
public final class d extends b {

    /* renamed from: e, reason: collision with root package name */
    public g f31035e;

    /* renamed from: f, reason: collision with root package name */
    public w0 f31036f;

    /* renamed from: g, reason: collision with root package name */
    public com.fyber.inneractive.sdk.model.vast.f f31037g;

    /* renamed from: h, reason: collision with root package name */
    public final ArrayList f31038h;

    /* renamed from: i, reason: collision with root package name */
    public int f31039i;

    /* renamed from: j, reason: collision with root package name */
    public z f31040j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f31041k;

    public d() {
        this.f31041k = true;
        this.f31038h = new ArrayList();
    }

    @Override // com.fyber.inneractive.sdk.response.b
    public final e a() {
        g gVar = new g();
        this.f31031a = gVar;
        this.f31035e = gVar;
        return gVar;
    }

    @Override // com.fyber.inneractive.sdk.response.b
    public final boolean b() {
        return true;
    }

    @Override // com.fyber.inneractive.sdk.response.b
    public final void a(String str, w0 w0Var) {
        this.f31036f = w0Var;
        if (w0Var != null && w0Var.f27948f != null) {
            this.f31035e.M = System.currentTimeMillis();
            this.f31035e.f31065z = this.f31036f.f27944b;
            this.f31039i = IAConfigManager.Q.f27752j.f27875b;
            try {
                a(str, 0);
                a(this.f31037g, this.f31038h);
                return;
            } catch (com.fyber.inneractive.sdk.flow.vast.h e3) {
                this.f31035e.f31050i = e3.getMessage();
                this.f31035e.f31051j = e3.getCause().getMessage();
                return;
            } catch (InterruptedException e11) {
                throw e11;
            } catch (Exception e12) {
                this.f31035e.f31051j = e12.getMessage();
                g gVar = this.f31035e;
                gVar.f31050i = "VastErrorInvalidFile";
                gVar.f31062w = e12;
                if (IAlog.f31163a == 2) {
                    e12.printStackTrace();
                    return;
                }
                return;
            }
        }
        this.f31031a.f31050i = "ErrorConfigurationMismatch";
    }

    public d(boolean z11) {
        this();
        this.f31041k = z11;
    }

    public final void a(String str, int i5) throws Exception {
        u uVarA;
        try {
            String strReplaceFirst = str.replaceFirst("<\\?.*\\?>", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            DocumentBuilderFactory documentBuilderFactoryNewInstance = DocumentBuilderFactory.newInstance();
            documentBuilderFactoryNewInstance.setCoalescing(true);
            Document document = documentBuilderFactoryNewInstance.newDocumentBuilder().parse(new InputSource(new StringReader(strReplaceFirst)));
            if (document != null) {
                Node firstChild = document.getFirstChild();
                if (firstChild.getNodeName().equalsIgnoreCase("VAST")) {
                    uVarA = u.a(firstChild);
                } else {
                    IAlog.a("XML does not contain a VAST tag as its first child!", new Object[0]);
                    throw new Exception("XML does not contain a VAST tag as its first child!");
                }
            } else {
                uVarA = null;
            }
            try {
                if (this.f31040j == null) {
                    this.f31040j = new z(uVarA.f28638a);
                } else {
                    z zVar = new z(uVarA.f28638a);
                    if (zVar.compareTo(this.f31040j) >= 0) {
                        this.f31040j = zVar;
                    }
                }
            } catch (y unused) {
            }
            ArrayList arrayList = uVarA.f28639b;
            if (arrayList != null && !arrayList.isEmpty()) {
                com.fyber.inneractive.sdk.model.vast.f fVar = (com.fyber.inneractive.sdk.model.vast.f) arrayList.get(0);
                a0 a0Var = fVar.f28596b;
                if (a0Var != null) {
                    IAlog.a("Vast response parser: found VAST wrapper #%d", Integer.valueOf(this.f31038h.size()));
                    int size = this.f31038h.size();
                    int i11 = this.f31039i;
                    if (size < i11) {
                        this.f31038h.add(fVar);
                        String str2 = a0Var.f28567i;
                        if (!TextUtils.isEmpty(str2)) {
                            if (h0.f(str2)) {
                                String strA = s.a(str2, 3000, 5000);
                                if (!TextUtils.isEmpty(strA)) {
                                    int i12 = this.f31039i - i5;
                                    if (i12 > 0) {
                                        a0Var.f28603f = i12;
                                        this.f31035e.R.put(str2, strA);
                                        a(strA, i5 + 1);
                                        return;
                                    }
                                    throw new com.fyber.inneractive.sdk.flow.vast.h("VastErrorInvalidFile", "Invalid level for wrapper");
                                }
                                throw new com.fyber.inneractive.sdk.flow.vast.h("VastErrorInvalidFile", "Failed getting data from ad tag URI");
                            }
                            IAlog.a("Vast response parser: Unsecure Wrapper URL. Aborting! url: %s", str2);
                            throw new com.fyber.inneractive.sdk.flow.vast.h("VastErrorUnsecure", "Unsecure ad tag URI for wrapper");
                        }
                        IAlog.a("Vast response parser: found an empty tag uri in wrapper! aborting!", new Object[0]);
                        throw new com.fyber.inneractive.sdk.flow.vast.h("VastErrorInvalidFile", "No ad tag URI for wrapper");
                    }
                    IAlog.a("Vast response parser: too many vast wrappers! Only %d allowed. stopping", Integer.valueOf(i11));
                    throw new com.fyber.inneractive.sdk.flow.vast.h("VastErrorTooManyWrappers", c0.o(new StringBuilder("More than "), this.f31039i, " found"));
                }
                if (fVar.f28597c != null) {
                    this.f31037g = fVar;
                    return;
                }
                throw new com.fyber.inneractive.sdk.flow.vast.h("VastErrorInvalidFile", "A top level ad with no wrapper on inline found!");
            }
            IAlog.a("Vast response parser: no ads found in model. aborting", new Object[0]);
            throw new com.fyber.inneractive.sdk.flow.vast.h("ErrorNoMediaFiles", "No ads found in model. Empty Vast?");
        } catch (Exception e3) {
            IAlog.a("Failed parsing Vast file! parsing error = %s", e3.getMessage());
            throw new com.fyber.inneractive.sdk.flow.vast.h("VastErrorInvalidFile", e3.getMessage());
        }
    }

    public final void a(com.fyber.inneractive.sdk.model.vast.f fVar, List list) throws JSONException {
        String str;
        com.fyber.inneractive.sdk.flow.vast.c cVar = new com.fyber.inneractive.sdk.flow.vast.c(this.f31041k);
        int iIntValue = this.f31036f.f27948f.f27956c.intValue();
        int iIntValue2 = this.f31036f.f27948f.f27955b.intValue();
        int iIntValue3 = this.f31036f.f27948f.f27960g.intValue();
        cVar.f28402b = iIntValue;
        cVar.f28403c = iIntValue2;
        cVar.f28404d = iIntValue3;
        if (UnitDisplayType.VERTICAL.equals(this.f31036f.f27948f.f27963j)) {
            cVar.f28405e = true;
        }
        if (this.f31036f.f27948f.f27964k.contains(2)) {
            cVar.f28406f = true;
        }
        try {
            z zVar = this.f31040j;
            if (zVar == null) {
                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            } else {
                str = zVar.f28653b;
            }
            this.f31035e.N = cVar.a(fVar, list, str);
        } catch (com.fyber.inneractive.sdk.flow.vast.h e3) {
            g gVar = this.f31035e;
            gVar.getClass();
            gVar.f31050i = e3.getMessage();
        }
        com.fyber.inneractive.sdk.model.vast.b bVar = this.f31035e.N;
        if (bVar != null) {
            String str2 = bVar.n;
            if (!TextUtils.isEmpty(str2) && h0.f(str2)) {
                w wVar = new w(com.fyber.inneractive.sdk.network.u.VAST_EVENT_DVC_DETECTED, (InneractiveAdRequest) null, this.f31031a);
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("templateURL", str2);
                } catch (Exception unused) {
                    IAlog.f("Got exception adding param to json object: %s, %s", "templateURL", str2);
                }
                wVar.f28823f.put(jSONObject);
                wVar.a((String) null);
            } else if (!TextUtils.isEmpty(str2)) {
                this.f31035e.N.n = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                com.fyber.inneractive.sdk.network.events.a.a(t.VAST_ERROR_DVC_FAILURE, com.fyber.inneractive.sdk.network.events.b.SSL_ERROR, (InneractiveAdRequest) null, this.f31031a, "Unsecured URL", str2, Boolean.FALSE);
            }
        }
        g gVar2 = this.f31035e;
        LinkedHashMap linkedHashMap = cVar.f28407g;
        if (linkedHashMap != null) {
            gVar2.O.putAll(linkedHashMap);
        } else {
            gVar2.getClass();
        }
        g gVar3 = this.f31035e;
        ArrayList arrayList = cVar.f28408h;
        if (arrayList != null) {
            gVar3.P.addAll(arrayList);
        } else {
            gVar3.getClass();
        }
        g gVar4 = this.f31035e;
        ArrayList arrayList2 = cVar.f28411k;
        if (arrayList2 != null) {
            gVar4.Q.addAll(arrayList2);
        } else {
            gVar4.getClass();
        }
        if (IAlog.f31163a == 2) {
            LinkedHashMap linkedHashMap2 = cVar.f28407g;
            if (linkedHashMap2.size() > 0) {
                IAlog.e(" VParser: Unsupported media files:", new Object[0]);
                for (r rVar : linkedHashMap2.keySet()) {
                    IAlog.e("VParser: %s", rVar);
                    IAlog.e("VParser: reason = %s", linkedHashMap2.get(rVar));
                }
                return;
            }
            IAlog.e("VParser: Unsupported media files: none", new Object[0]);
        }
    }
}
