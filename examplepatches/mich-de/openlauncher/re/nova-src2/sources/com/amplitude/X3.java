package com.amplitude;

import android.graphics.Matrix;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Lazy;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Regex;

/* loaded from: classes2.dex */
public final class X3 {

    /* renamed from: a, reason: collision with root package name */
    public static final Map f20432a = MapsKt.j0(new Pair("background-color", "#DEDFE2"), new Pair("background-image", "url(https://static.amplitude.com/onenav/static/img/image-not-supported.svg)"), new Pair("background-size", "clamp(64px, 20%, 80%)"), new Pair("background-repeat", "no-repeat"), new Pair("background-position", "center"), new Pair("border", "dotted"), new Pair("border-width", "2px"), new Pair("border-color", "red"));

    public static String a(O0 encodedImage, String identifier) {
        Intrinsics.g(encodedImage, "encodedImage");
        Intrinsics.g(identifier, "identifier");
        P0 p02 = P0.f20355a;
        String strA = a(new Pair("display", "flex"), new Pair("align-items", "stretch"), new Pair("justify-content", "center"), new Pair("background-size", "contain"), new Pair("background-repeat", "none"));
        ArrayList arrayList = new ArrayList();
        if (Intrinsics.b(encodedImage.f20340b, "https://static.amplitude.com/onenav/static/img/image-icon.svg")) {
            arrayList.add(a(new Pair("background", "#ebf5ff")));
        }
        return b.c0.s(b.c0.w(".", identifier, " { background-image: url(data:image/webp;base64,", encodedImage.f20340b, "); "), strA, " ", b70.g.f1(arrayList, "\n", null, null, 0, null, 62), "}");
    }

    public final V1 a(C0436f2 mobileNode, ArrayList imageContent, boolean z11) {
        Intrinsics.g(mobileNode, "mobileNode");
        Intrinsics.g(imageContent, "imageContent");
        ArrayList arrayList = new ArrayList();
        if (z11 && !mobileNode.f().isEmpty()) {
            Iterator it = mobileNode.f().iterator();
            while (it.hasNext()) {
                arrayList.add(a((C0436f2) it.next(), imageContent, true));
            }
        }
        return new V1(mobileNode.a(), mobileNode.w(), a(mobileNode, imageContent), arrayList, 112);
    }

    public static Map a(C0436f2 mobileNode, ArrayList imageContent) {
        boolean z11;
        String strH;
        Intrinsics.g(mobileNode, "mobileNode");
        Intrinsics.g(imageContent, "imageContent");
        ArrayList arrayList = new ArrayList();
        Integer numD = mobileNode.d();
        LinkedHashMap linkedHashMapK0 = MapsKt.k0(new Pair("background-color", numD != null ? R0.a(numD.intValue()) : null), new Pair("opacity", Float.valueOf(mobileNode.c())));
        if (mobileNode.u() == 0 && mobileNode.v() == 0) {
            z11 = false;
        } else {
            linkedHashMapK0.put("margin-top", String.valueOf(-mobileNode.v()));
            linkedHashMapK0.put("margin-left", String.valueOf(-mobileNode.u()));
            z11 = true;
        }
        if (mobileNode.B() != null) {
            linkedHashMapK0.put("zoom", String.valueOf(mobileNode.B()));
        }
        if (mobileNode.g()) {
            if (z11) {
                int iU = mobileNode.u();
                int iV = mobileNode.v();
                int iZ = mobileNode.z();
                int iJ = mobileNode.j();
                StringBuilder sbT = b.c0.t(iU, "xywh(", "px ", iV, "px ");
                sbT.append(iZ);
                sbT.append("px ");
                sbT.append(iJ);
                sbT.append("px)");
                linkedHashMapK0.put("clip-path", sbT.toString());
            } else {
                linkedHashMapK0.put("overflow", "clip");
            }
        }
        LinkedHashMap linkedHashMapK02 = MapsKt.k0(new Pair("border-top-left-radius", null), new Pair("border-top-right-radius", null), new Pair("border-bottom-right-radius", null), new Pair("border-bottom-left-radius", null));
        String strA = a(new Pair("position", "absolute"), new Pair("left", a2.c.h(mobileNode.l(), "px")), new Pair("top", a2.c.h(mobileNode.m(), "px")), new Pair("width", a2.c.h(mobileNode.n(), "px")), new Pair("height", a2.c.h(mobileNode.k(), "px")));
        if (mobileNode.A() != 0.0f) {
            new Pair("z-index", Float.valueOf(mobileNode.A())).toString();
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        Matrix matrixP = mobileNode.p();
        if (matrixP != null && !matrixP.isIdentity()) {
            float[] fArr = new float[9];
            matrixP.getValues(fArr);
            linkedHashMap.put("transform", "matrix(" + fArr[0] + ", " + fArr[3] + ", " + fArr[1] + ", " + fArr[4] + ", " + fArr[2] + ", " + fArr[5] + ")");
            linkedHashMap.put("transform-origin", "0 0");
        }
        String strE = mobileNode.e();
        if (strE != null) {
            Lazy lazy = Q0.f20371a;
            O0 o0A = N0.a(strE);
            String str = "bg-" + o0A.f20339a;
            arrayList.add(str);
            imageContent.add(new L0(o0A, str));
            linkedHashMap.put("background-repeat", "no-repeat");
            linkedHashMap.put("background-position", "center");
            linkedHashMap.put("background-size", "100% 100%");
        }
        String strA2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        String strE2 = b.c0.E(b.c0.E(b.c0.E(strA, a(linkedHashMap, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)), a(linkedHashMapK02, "px")), a(linkedHashMapK0, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b));
        if (mobileNode.C()) {
            strA2 = a(f20432a, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        }
        String strE3 = b.c0.E(strE2, strA2);
        Pair pair = new Pair("id", Integer.valueOf(mobileNode.q()));
        Pair pair2 = new Pair("style", strE3);
        Pair pair3 = new Pair("data-view-class", mobileNode.y());
        Pair pair4 = new Pair("mobile-id", Integer.valueOf(mobileNode.q()));
        Regex regex = W3.f20424a;
        String strT = mobileNode.t();
        if (strT != null) {
            Regex regex2 = W3.f20424a;
            String str2 = W3.f20427d;
            strH = W3.f20426c.h(str2, W3.f20425b.h(str2, regex2.h(str2, strT)));
        } else {
            strH = null;
        }
        Map mapK0 = MapsKt.k0(pair, pair2, pair3, pair4, new Pair("data-resource-name", strH));
        if (Intrinsics.b(mobileNode.w(), "iframe")) {
            mapK0 = MapsKt.n0(MapsKt.n0(mapK0, new Pair("sandbox", "allow-same-origin")), new Pair("scrolling", "no"));
        }
        if (!arrayList.isEmpty()) {
            mapK0 = MapsKt.n0(mapK0, new Pair("class", b70.g.f1(arrayList, " ", null, null, 0, null, 62)));
        }
        return mobileNode.i() != null ? MapsKt.n0(mapK0, new Pair("data-handler", mobileNode.i())) : mapK0;
    }

    public static String a(Map map, String str) {
        String str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        for (String str3 : map.keySet()) {
            Object obj = map.get(str3);
            if (obj != null) {
                str2 = ((Object) str2) + str3 + ":" + obj + str + ";";
            }
        }
        return str2;
    }

    public static String a(Pair... pairArr) {
        if (pairArr.length == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        MapsKt.o0(linkedHashMap, pairArr);
        return a(linkedHashMap, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
    }
}
