package com.amplitude;

import android.graphics.Matrix;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;
import androidx.compose.ui.node.Owner;
import androidx.webkit.WebViewFeature;
import com.amplitude.android.sessionreplay.config.MaskLevel;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import kotlin.Lazy;
import kotlin.Pair;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.FilteringSequence;
import kotlin.sequences.SequencesKt;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.amplitude.t, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0514t {

    /* renamed from: a, reason: collision with root package name */
    public final K3 f20750a;

    /* renamed from: b, reason: collision with root package name */
    public final u4 f20751b;

    /* renamed from: c, reason: collision with root package name */
    public final M4 f20752c;

    /* renamed from: d, reason: collision with root package name */
    public final G0 f20753d;

    public C0514t(K3 logger, u4 viewCache, M4 webViewManager, G0 flutterViewManager) {
        Intrinsics.g(logger, "logger");
        Intrinsics.g(viewCache, "viewCache");
        Intrinsics.g(webViewManager, "webViewManager");
        Intrinsics.g(flutterViewManager, "flutterViewManager");
        this.f20750a = logger;
        this.f20751b = viewCache;
        this.f20752c = webViewManager;
        this.f20753d = flutterViewManager;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final J0 a(View view, C0436f2 c0436f2) {
        z2.a0 a0Var;
        if (((Boolean) P.f20354a.getValue()).booleanValue()) {
            Intrinsics.g(view, "<this>");
            if (r70.k.K0(view.getClass().getName(), "AndroidComposeView", false)) {
                Lazy lazy = AbstractC0451i.f20608a;
                K3 k32 = this.f20750a;
                Owner owner = view instanceof Owner ? (Owner) view : null;
                z2.a0 root = owner != null ? owner.getRoot() : null;
                if (root != null) {
                    a0Var = root;
                } else {
                    if (k32 != null) {
                        k32.a(C0439g.f20586a);
                    }
                    Method method = (Method) AbstractC0451i.f20609b.getValue();
                    Object objInvoke = method != null ? method.invoke(view, null) : null;
                    if (objInvoke instanceof z2.a0) {
                        root = (z2.a0) objInvoke;
                        a0Var = root;
                    } else {
                        a0Var = null;
                    }
                }
                if (a0Var != null) {
                    return new L(a0Var, c0436f2, c0436f2.q(), 0L, null);
                }
                this.f20750a.a(new C0509s(view));
                return null;
            }
        }
        return new C0519u(view, c0436f2);
    }

    public final Pair a(C0519u hierarchyNode) throws JSONException {
        Object obj;
        boolean z11;
        C0436f2 c0436f2;
        Iterable iterableA0;
        Intrinsics.g(hierarchyNode, "hierarchyNode");
        if (v4.a(hierarchyNode.f20768a)) {
            View view = hierarchyNode.f20768a;
            C0436f2 c0436f22 = hierarchyNode.f20769b;
            int[] iArr = new int[2];
            Intrinsics.g(view, "<this>");
            if (!(view.getParent() instanceof View)) {
                view.getLocationOnScreen(iArr);
            }
            float f11 = view.getContext().getResources().getDisplayMetrics().density;
            u4 u4Var = this.f20751b;
            C0494p c0494p = new C0494p(view, this);
            u4Var.getClass();
            Map map = (Map) u4Var.f20785g.getValue();
            Integer numValueOf = Integer.valueOf(System.identityHashCode(view));
            Object objValueOf = map.get(numValueOf);
            if (objValueOf == null) {
                int iA = AbstractC0484n1.a();
                c0494p.invoke(Integer.valueOf(iA));
                objValueOf = Integer.valueOf(iA);
                map.put(numValueOf, objValueOf);
            }
            int iIntValue = ((Number) objValueOf).intValue();
            String strO = c0436f22 != null ? c0436f22.o() : null;
            String str = "amp-mask";
            if (!v4.a(view, "amp-mask")) {
                if (v4.a(view, "amp-unmask")) {
                    str = "amp-unmask";
                } else if (!(view instanceof TextureView) && !(view instanceof SurfaceView)) {
                    str = null;
                } else if (strO != null) {
                    str = strO;
                }
            }
            String str2 = str == null ? strO : str;
            if (view instanceof WebView) {
                String name = view.getClass().getName();
                boolean zA = v4.a(view, "amp-block");
                WebView webView = (WebView) view;
                int left = (int) (webView.getLeft() / f11);
                int top = (int) (webView.getTop() / f11);
                float z12 = webView.getZ();
                int width = (int) (webView.getWidth() / f11);
                int height = (int) (webView.getHeight() / f11);
                z11 = false;
                Matrix matrix = new Matrix(webView.getMatrix());
                float alpha = webView.getAlpha();
                Float fValueOf = Float.valueOf(f11);
                obj = "amp-unmask";
                c0436f2 = new C0436f2(iIntValue, name, zA, "iframe", left, top, z12, width, height, 0, 0, matrix, str2, null, false, fValueOf, alpha, 0.0f, 486004748);
            } else {
                obj = "amp-unmask";
                z11 = false;
                c0436f2 = new C0436f2(iIntValue, view.getClass().getName(), v4.a(view, "amp-block"), "div", view.getLeft() + iArr[0], view.getTop() + iArr[1], view.getZ(), view.getWidth(), view.getHeight(), view.getScrollX(), view.getScrollY(), new Matrix(view.getMatrix()), str2, null, view instanceof ViewGroup ? ((ViewGroup) view).getClipChildren() : false, null, view.getAlpha(), 0.0f, 494387212);
            }
            if (c0436f22 != null) {
                c0436f22.a(c0436f2);
            }
            if (c0436f2.C()) {
                Pair pair = K0.f20298a;
                return new Pair(c0436f2, EmptyList.f71733a);
            }
            if ((hierarchyNode.f20768a instanceof WebView) && Intrinsics.b(c0436f2.o(), obj)) {
                M4 m42 = this.f20752c;
                WebView webView2 = (WebView) hierarchyNode.f20768a;
                int iQ = c0436f2.q();
                m42.getClass();
                Intrinsics.g(webView2, "webView");
                if (WebViewFeature.a(WebViewFeature.CREATE_WEB_MESSAGE_CHANNEL) && WebViewFeature.a(WebViewFeature.POST_WEB_MESSAGE)) {
                    LinkedHashMap linkedHashMap = m42.f20790d;
                    Integer numValueOf2 = Integer.valueOf(iQ);
                    Object obj2 = linkedHashMap.get(numValueOf2);
                    if (obj2 == null) {
                        String str3 = (String) m42.f20331g.getValue();
                        String str4 = m42.f20330f;
                        K4 k42 = new K4(m42);
                        K3 k32 = m42.f20329e;
                        z4 z4Var = new z4();
                        a80.e eVar = t70.y0.f88884a;
                        I4 i42 = new I4(iQ, str3, str4, k42, k32, z4Var, y70.o.f96819a, t70.y0.f88884a);
                        if (!webView2.isAttachedToWindow()) {
                            i42.a();
                            i42.f20697a = null;
                            i42.f20698b = null;
                            m42.f20790d.remove(Integer.valueOf(iQ));
                        } else {
                            webView2.addOnAttachStateChangeListener(new J4(webView2, i42, m42, iQ));
                        }
                        linkedHashMap.put(numValueOf2, i42);
                        obj2 = i42;
                    }
                    I4 i43 = (I4) obj2;
                    t70.m0.t(i43, null, null, new F4(i43, webView2, null), 3);
                }
                Pair pair2 = K0.f20298a;
                return new Pair(c0436f2, EmptyList.f71733a);
            }
            View view2 = hierarchyNode.f20768a;
            Intrinsics.g(view2, "view");
            if (((Boolean) AbstractC0540y0.f20818a.getValue()).booleanValue() && view2.getClass().getName().equals("io.flutter.embedding.android.FlutterView")) {
                G0 g02 = this.f20753d;
                View view3 = hierarchyNode.f20768a;
                Intrinsics.g(view3, "view");
                int iQ2 = c0436f2.q();
                LinkedHashMap linkedHashMap2 = g02.f20790d;
                Integer numValueOf3 = Integer.valueOf(iQ2);
                Object obj3 = linkedHashMap2.get(numValueOf3);
                Object obj4 = obj3;
                if (obj3 == null) {
                    B0 b02 = new B0(new D0(g02), g02.f20241e);
                    if (!view3.isAttachedToWindow()) {
                        b02.a();
                        b02.f20697a = null;
                        b02.f20698b = null;
                        g02.f20790d.remove(Integer.valueOf(iQ2));
                    } else {
                        view3.addOnAttachStateChangeListener(new E0(view3, b02, g02, iQ2));
                    }
                    linkedHashMap2.put(numValueOf3, b02);
                    obj4 = b02;
                }
                B0 b03 = (B0) obj4;
                c0436f2.a(new C0436f2(b03.f20184g, "FlutterIframe", false, "iframe", 0, 0, 0.0f, c0436f2.z(), c0436f2.j(), 0, 0, new Matrix(), c0436f2.o(), null, false, Float.valueOf(view3.getContext().getResources().getDisplayMetrics().density), 0.0f, 0.0f, 519559452));
                MaskLevel maskLevel = g02.f20242f;
                K1 k12 = g02.f20243g;
                A a11 = b03.f20185h;
                if (a11.f20178c != null) {
                    if (b03.f20702f) {
                        b03.f20702f = z11;
                        C0515t0.a(b03.f20699c);
                        A a12 = b03.f20185h;
                        a12.getClass();
                        JSONObject jSONObject = new JSONObject();
                        jSONObject.put("command", "go");
                        if (maskLevel != null || k12 != null) {
                            JSONObject jSONObject2 = new JSONObject();
                            if (maskLevel != null) {
                                String lowerCase = maskLevel.name().toLowerCase(Locale.ROOT);
                                Intrinsics.f(lowerCase, "toLowerCase(...)");
                                jSONObject2.put("maskLevel", lowerCase);
                            }
                            if (k12 != null) {
                                String lowerCase2 = k12.name().toLowerCase(Locale.ROOT);
                                Intrinsics.f(lowerCase2, "toLowerCase(...)");
                                jSONObject2.put("qualityProfile", lowerCase2);
                            }
                            jSONObject.put("config", jSONObject2);
                        }
                        String string = jSONObject.toString();
                        Intrinsics.f(string, "toString(...)");
                        a12.a(string);
                    }
                } else {
                    a11.f20179d = new A0(b03);
                    C0515t0.a(b03.f20699c);
                    b03.f20185h.a(view3, maskLevel, k12);
                }
                if (view3 instanceof ViewGroup) {
                    iterableA0 = SequencesKt.A0(SequencesKt.t0(new a5.b1((ViewGroup) view3), C0.f20194a));
                } else {
                    iterableA0 = EmptyList.f71733a;
                }
                ArrayList arrayList = new ArrayList();
                Iterator it = iterableA0.iterator();
                while (it.hasNext()) {
                    J0 j0A = a((View) it.next(), c0436f2);
                    if (j0A != null) {
                        arrayList.add(j0A);
                    }
                }
                Pair pair3 = K0.f20298a;
                return new Pair(c0436f2, arrayList);
            }
            View view4 = hierarchyNode.f20768a;
            if (view4 instanceof ViewGroup) {
                ViewGroup viewGroup = (ViewGroup) view4;
                Drawable background = viewGroup.getBackground();
                ColorDrawable colorDrawable = background instanceof ColorDrawable ? (ColorDrawable) background : null;
                Integer numValueOf4 = colorDrawable != null ? Integer.valueOf(colorDrawable.getColor()) : null;
                if (numValueOf4 == null) {
                    c0436f2.x().f20448a = this.f20751b.a(viewGroup, c0436f2.q(), c0436f2.o());
                } else {
                    c0436f2.a(numValueOf4);
                }
                FilteringSequence filteringSequenceZ0 = SequencesKt.z0(new a5.b1((ViewGroup) hierarchyNode.f20768a), new C0500q(this, c0436f2));
                Pair pair4 = K0.f20298a;
                List children = SequencesKt.A0(filteringSequenceZ0);
                Intrinsics.g(children, "children");
                return new Pair(c0436f2, children);
            }
            c0436f2.x().f20448a = this.f20751b.a(hierarchyNode.f20768a, c0436f2.q(), c0436f2.o());
            Pair pair5 = K0.f20298a;
            return new Pair(c0436f2, EmptyList.f71733a);
        }
        this.f20750a.a(new r(hierarchyNode));
        return K0.f20298a;
    }
}
