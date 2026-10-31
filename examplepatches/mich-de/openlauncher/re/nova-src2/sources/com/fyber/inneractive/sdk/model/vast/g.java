package com.fyber.inneractive.sdk.model.vast;

import android.text.TextUtils;
import com.amplitude.android.migration.DatabaseConstants;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.x1;
import com.tiktok.util.TTConst;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/* loaded from: classes3.dex */
public abstract class g {

    /* renamed from: a, reason: collision with root package name */
    public String f28598a;

    /* renamed from: e, reason: collision with root package name */
    public o f28602e;

    /* renamed from: g, reason: collision with root package name */
    public v f28604g;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f28601d = new ArrayList();

    /* renamed from: f, reason: collision with root package name */
    public int f28603f = 0;

    /* renamed from: h, reason: collision with root package name */
    public final ArrayList f28605h = new ArrayList(1);

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f28599b = new ArrayList();

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f28600c = new ArrayList();

    public final void a(Node node) {
        w wVar;
        Node nodeD = x1.d(node, "AdVerifications");
        if (nodeD != null) {
            Iterator it = x1.c(nodeD, "Verification").iterator();
            while (it.hasNext()) {
                Node node2 = (Node) it.next();
                com.fyber.inneractive.sdk.measurement.h hVar = null;
                if (node2 != null) {
                    com.fyber.inneractive.sdk.measurement.h hVar2 = new com.fyber.inneractive.sdk.measurement.h();
                    hVar2.f28523e = x1.b(node2, "vendor");
                    Node nodeD2 = x1.d(node2, "JavaScriptResource");
                    if (nodeD2 != null) {
                        hVar2.f28525g = true;
                        try {
                            hVar2.f28524f = x1.a(nodeD2);
                            hVar2.f28520b = x1.b(nodeD2, "apiFramework");
                            hVar2.f28519a = new URL(hVar2.f28524f);
                        } catch (MalformedURLException unused) {
                        }
                    }
                    Node nodeD3 = x1.d(node2, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40348x);
                    if (nodeD3 != null) {
                        Iterator it2 = x1.c(nodeD3, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40349y).iterator();
                        while (it2.hasNext()) {
                            Node node3 = (Node) it2.next();
                            if (node3 == null) {
                                wVar = null;
                            } else {
                                wVar = new w();
                                wVar.f28649a = x1.b(node3, DatabaseConstants.EVENT_FIELD);
                                wVar.f28650b = x1.a(node3);
                                wVar.f28651c = x1.b(node3, "offset");
                            }
                            if (node3 != null && wVar.f28649a.equalsIgnoreCase("verificationNotExecuted")) {
                                hVar2.a(x.EVENT_VERIFICATION_NOT_EXECUTED, wVar.f28650b);
                            }
                        }
                    }
                    Node nodeD4 = x1.d(node2, "VerificationParameters");
                    if (nodeD4 != null) {
                        hVar2.f28522d = x1.a(nodeD4);
                    }
                    hVar = hVar2;
                }
                if (hVar != null) {
                    IAlog.a("Verification Found - %s", hVar.toString());
                    this.f28601d.add(hVar);
                }
            }
        }
    }

    public void b(Node node) throws NumberFormatException {
        Node nodeD;
        NodeList childNodes;
        NodeList childNodes2;
        m mVar;
        Iterator it;
        h hVar;
        Iterator it2;
        w wVar;
        w wVar2;
        Iterator it3;
        Iterator it4;
        r rVar;
        g gVar = this;
        Node nodeD2 = x1.d(node, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40336j);
        if (nodeD2 != null) {
            x1.b(nodeD2, "version");
            x1.a(nodeD2);
        }
        Node nodeD3 = x1.d(node, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40331e);
        if (nodeD3 != null) {
            String strA = x1.a(nodeD3);
            if (!TextUtils.isEmpty(strA)) {
                gVar.f28598a = strA;
            }
        }
        Iterator it5 = x1.c(node, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40340p).iterator();
        while (it5.hasNext()) {
            String strA2 = x1.a((Node) it5.next());
            if (!TextUtils.isEmpty(strA2)) {
                gVar.f28599b.add(strA2);
            }
        }
        Node nodeD4 = x1.d(node, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40341q);
        if (nodeD4 != null) {
            Iterator it6 = x1.c(nodeD4, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40342r).iterator();
            while (it6.hasNext()) {
                Node node2 = (Node) it6.next();
                if (node2 == null) {
                    it = it6;
                    mVar = null;
                } else {
                    mVar = new m();
                    if (TextUtils.isEmpty(x1.b(node2, "AdID"))) {
                        x1.b(node2, "adId");
                    }
                    x1.b(node2, "id");
                    x1.a(node2, "sequence");
                    Node nodeD5 = x1.d(node2, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40343s);
                    if (nodeD5 != null) {
                        q qVar = new q();
                        it = it6;
                        Node nodeD6 = x1.d(nodeD5, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40346v);
                        if (nodeD6 != null) {
                            ArrayList arrayListC = x1.c(nodeD6, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40347w);
                            if (!arrayListC.isEmpty()) {
                                qVar.f28626a = new ArrayList();
                                Iterator it7 = arrayListC.iterator();
                                while (it7.hasNext()) {
                                    Node node3 = (Node) it7.next();
                                    if (node3 == null) {
                                        it4 = it7;
                                        rVar = null;
                                    } else {
                                        it4 = it7;
                                        rVar = new r();
                                        rVar.f28631a = x1.b(node3, "delivery");
                                        rVar.f28632b = x1.a(node3, "width");
                                        rVar.f28633c = x1.a(node3, "height");
                                        rVar.f28634d = x1.b(node3, TTConst.TRACK_TYPE);
                                        x1.b(node3, "id");
                                        rVar.f28636f = x1.b(node3, "apiFramework");
                                        rVar.f28635e = x1.a(node3, "bitrate");
                                        TextUtils.isEmpty(x1.b(node3, "maintainAspectRatio"));
                                        TextUtils.isEmpty(x1.b(node3, "scalable"));
                                        rVar.f28637g = x1.a(node3);
                                    }
                                    if (rVar != null) {
                                        qVar.f28626a.add(rVar);
                                    }
                                    it7 = it4;
                                }
                            }
                        }
                        Node nodeD7 = x1.d(nodeD5, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40350z);
                        if (nodeD7 != null) {
                            qVar.f28628c = x1.a(x1.d(nodeD7, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.A));
                            ArrayList arrayListC2 = x1.c(nodeD7, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.B);
                            if (!arrayListC2.isEmpty()) {
                                qVar.f28629d = new ArrayList();
                                Iterator it8 = arrayListC2.iterator();
                                while (it8.hasNext()) {
                                    String strA3 = x1.a((Node) it8.next());
                                    if (!TextUtils.isEmpty(strA3)) {
                                        qVar.f28629d.add(strA3);
                                    }
                                }
                            }
                        }
                        Node nodeD8 = x1.d(nodeD5, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40348x);
                        if (nodeD8 != null) {
                            ArrayList arrayListC3 = x1.c(nodeD8, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40349y);
                            if (!arrayListC3.isEmpty()) {
                                qVar.f28627b = new ArrayList();
                                Iterator it9 = arrayListC3.iterator();
                                while (it9.hasNext()) {
                                    Node node4 = (Node) it9.next();
                                    if (node4 == null) {
                                        it3 = it9;
                                        wVar2 = null;
                                    } else {
                                        wVar2 = new w();
                                        it3 = it9;
                                        wVar2.f28649a = x1.b(node4, DatabaseConstants.EVENT_FIELD);
                                        wVar2.f28650b = x1.a(node4);
                                        wVar2.f28651c = x1.b(node4, "offset");
                                    }
                                    if (wVar2 != null) {
                                        qVar.f28627b.add(wVar2);
                                    }
                                    it9 = it3;
                                }
                            }
                        }
                        Node nodeD9 = x1.d(nodeD5, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40345u);
                        if (nodeD9 != null) {
                            qVar.f28630e = x1.a(nodeD9);
                        }
                        mVar.f28619a = qVar;
                    } else {
                        it = it6;
                    }
                    Node nodeD10 = x1.d(node2, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.N);
                    if (nodeD10 != null) {
                        j jVar = new j();
                        x1.b(nodeD10, "required");
                        ArrayList arrayListC4 = x1.c(nodeD10, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O);
                        jVar.f28616a.clear();
                        Iterator it10 = arrayListC4.iterator();
                        while (it10.hasNext()) {
                            Node node5 = (Node) it10.next();
                            if (node5 == null) {
                                it2 = it10;
                                hVar = null;
                            } else {
                                hVar = new h();
                                hVar.f28606a = x1.a(node5, "width");
                                hVar.f28607b = x1.a(node5, "height");
                                hVar.f28608c = x1.b(node5, "id");
                                x1.b(node5, "apiFramework");
                                x1.a(node5, "expandedWidth");
                                x1.a(node5, "expandedHeight");
                                Node nodeD11 = x1.d(node5, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.F);
                                if (nodeD11 != null) {
                                    l lVar = new l();
                                    it2 = it10;
                                    lVar.f28617a = x1.b(nodeD11, "creativeType");
                                    lVar.f28618b = x1.a(nodeD11);
                                    hVar.f28609d = lVar;
                                } else {
                                    it2 = it10;
                                }
                                Node nodeD12 = x1.d(node5, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.H);
                                if (nodeD12 != null) {
                                    hVar.f28611f = x1.a(nodeD12);
                                }
                                Node nodeD13 = x1.d(node5, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.G);
                                if (nodeD13 != null) {
                                    hVar.f28610e = x1.a(nodeD13);
                                }
                                Node nodeD14 = x1.d(node5, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.P);
                                if (nodeD14 != null) {
                                    hVar.f28612g = x1.a(nodeD14);
                                }
                                hVar.f28613h.clear();
                                ArrayList arrayListC5 = x1.c(node5, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.Q);
                                if (arrayListC5.size() > 0) {
                                    Iterator it11 = arrayListC5.iterator();
                                    while (it11.hasNext()) {
                                        String strA4 = x1.a((Node) it11.next());
                                        if (!TextUtils.isEmpty(strA4)) {
                                            hVar.f28613h.add(strA4);
                                        }
                                    }
                                }
                                hVar.f28615j.clear();
                                Node nodeD15 = x1.d(node5, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40348x);
                                if (nodeD15 != null) {
                                    ArrayList arrayListC6 = x1.c(nodeD15, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40349y);
                                    if (!arrayListC6.isEmpty()) {
                                        Iterator it12 = arrayListC6.iterator();
                                        while (it12.hasNext()) {
                                            Node node6 = (Node) it12.next();
                                            if (node6 == null) {
                                                wVar = null;
                                            } else {
                                                wVar = new w();
                                                wVar.f28649a = x1.b(node6, DatabaseConstants.EVENT_FIELD);
                                                wVar.f28650b = x1.a(node6);
                                                wVar.f28651c = x1.b(node6, "offset");
                                            }
                                            if (wVar != null) {
                                                hVar.f28615j.add(wVar);
                                            }
                                        }
                                    }
                                }
                            }
                            if (hVar != null) {
                                jVar.f28616a.add(hVar);
                            }
                            it10 = it2;
                        }
                        mVar.f28620b = jVar;
                    }
                }
                gVar = this;
                if (mVar != null) {
                    gVar.f28600c.add(mVar);
                }
                it6 = it;
            }
        }
        Node nodeD16 = x1.d(node, "Extensions");
        if (nodeD16 != null) {
            Iterator it13 = x1.c(nodeD16, "Extension").iterator();
            while (it13.hasNext()) {
                Node node7 = (Node) it13.next();
                if ("AdVerifications".equalsIgnoreCase(x1.b(node7, TTConst.TRACK_TYPE))) {
                    gVar.a(node7);
                }
                if ("FMPCompanionAssets".equalsIgnoreCase(x1.b(node7, TTConst.TRACK_TYPE))) {
                    IAlog.a("parseFMPCompanionAssetsTag", new Object[0]);
                    Node nodeD17 = x1.d(node7, "FMPCompanionAssets");
                    if (nodeD17 != null) {
                        o oVar = new o();
                        String strB = x1.b(nodeD17, "enableMultipleCompanions");
                        if ("false".equalsIgnoreCase(strB) || "0".equals(strB)) {
                            oVar.f28625d = false;
                        }
                        Node nodeD18 = x1.d(nodeD17, "Name");
                        if (nodeD18 != null) {
                            oVar.f28622a = x1.a(nodeD18);
                        }
                        Node nodeD19 = x1.d(nodeD17, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40338l);
                        if (nodeD19 != null) {
                            x1.a(nodeD19);
                        }
                        oVar.f28623b.clear();
                        Node nodeD20 = x1.d(nodeD17, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.D);
                        if (nodeD20 != null) {
                            Iterator it14 = x1.c(nodeD20, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.E).iterator();
                            while (it14.hasNext()) {
                                oVar.f28623b.add(x1.a((Node) it14.next()));
                            }
                        }
                        Node nodeD21 = x1.d(nodeD17, "Rating");
                        if (nodeD21 != null) {
                            try {
                                Float.parseFloat(x1.a(nodeD21));
                            } catch (Exception unused) {
                            }
                        }
                        Node nodeD22 = x1.d(nodeD17, "Screenshots");
                        if (nodeD22 != null) {
                            oVar.f28624c = new ArrayList();
                            Iterator it15 = x1.c(nodeD22, "Screenshot").iterator();
                            while (it15.hasNext()) {
                                String strA5 = x1.a((Node) it15.next());
                                if (!TextUtils.isEmpty(strA5)) {
                                    oVar.f28624c.add(strA5);
                                }
                            }
                        }
                        gVar.f28602e = oVar;
                    }
                }
                if ("DynamicVideoControlsURL".equalsIgnoreCase(x1.b(node7, TTConst.TRACK_TYPE))) {
                    Node nodeD23 = x1.d(node7, "DynamicVideoControlsURL");
                    n nVar = new n();
                    if (nodeD23 != null) {
                        nVar.f28621a = x1.a(nodeD23);
                    }
                    if (!TextUtils.isEmpty(nVar.f28621a)) {
                        gVar.f28605h.add(nVar);
                    }
                }
                if ("StorePromoAssets".equalsIgnoreCase(x1.b(node7, TTConst.TRACK_TYPE)) && (nodeD = x1.d(node7, "DTSPR")) != null) {
                    v vVar = new v();
                    Node nodeD24 = x1.d(nodeD, "DTSPNm");
                    if (nodeD24 != null) {
                        vVar.f28641b = x1.a(nodeD24);
                    }
                    Node nodeD25 = x1.d(nodeD, "DTSPTUrl");
                    if (nodeD25 != null) {
                        vVar.f28642c = x1.a(nodeD25);
                    }
                    Node nodeD26 = x1.d(nodeD, "DTSPPNm");
                    if (nodeD26 != null) {
                        vVar.f28648i = x1.a(nodeD26);
                    }
                    Node nodeD27 = x1.d(nodeD, "DTSPIap");
                    if (nodeD27 != null) {
                        vVar.f28643d = x1.a(nodeD27);
                    }
                    Node nodeD28 = x1.d(nodeD, "DTSPCads");
                    if (nodeD28 != null) {
                        vVar.f28644e = x1.a(nodeD28);
                    }
                    Node nodeD29 = x1.d(nodeD, "DTSPMedia");
                    if (nodeD29 != null && (childNodes2 = nodeD29.getChildNodes()) != null && childNodes2.getLength() != 0) {
                        for (int i5 = 0; i5 < childNodes2.getLength(); i5++) {
                            Node nodeItem = childNodes2.item(i5);
                            if (nodeItem != null) {
                                String nodeName = nodeItem.getNodeName();
                                String strA6 = x1.a(nodeItem);
                                if (!TextUtils.isEmpty(strA6)) {
                                    if ("DTSPScrn".equalsIgnoreCase(nodeName)) {
                                        vVar.f28645f.add(strA6);
                                    } else if ("DTSPVid".equalsIgnoreCase(nodeName)) {
                                        vVar.f28646g.add(strA6);
                                    } else if ("DTSPIcon".equalsIgnoreCase(nodeName)) {
                                        vVar.f28640a = strA6;
                                    }
                                }
                            }
                        }
                    }
                    Node nodeD30 = x1.d(nodeD, "DTSPMetadata");
                    if (nodeD30 != null && (childNodes = nodeD30.getChildNodes()) != null && childNodes.getLength() != 0) {
                        String strA7 = null;
                        String strA8 = null;
                        String strA9 = null;
                        for (int i11 = 0; i11 < childNodes.getLength(); i11++) {
                            Node nodeItem2 = childNodes.item(i11);
                            if (nodeItem2 != null) {
                                String nodeName2 = nodeItem2.getNodeName();
                                if ("DTSPLabel".equalsIgnoreCase(nodeName2)) {
                                    strA7 = x1.a(nodeItem2);
                                } else if ("DTSPRating".equalsIgnoreCase(nodeName2)) {
                                    strA8 = x1.a(nodeItem2);
                                } else if ("DTSPSize".equalsIgnoreCase(nodeName2)) {
                                    strA9 = x1.a(nodeItem2);
                                }
                            }
                        }
                        if (!TextUtils.isEmpty(strA7) && !TextUtils.isEmpty(strA8) && !TextUtils.isEmpty(strA9)) {
                            vVar.f28647h = new com.fyber.inneractive.sdk.flow.storepromo.model.d(strA8, strA7, strA9);
                        }
                    }
                    gVar.f28604g = vVar;
                }
            }
        }
        a(node);
    }
}
