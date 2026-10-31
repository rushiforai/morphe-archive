package com.fyber.inneractive.sdk.flow.nativead;

import android.net.Uri;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.x0;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.external.InneractiveInfrastructureError;
import com.fyber.inneractive.sdk.external.NativeAdContent;
import com.fyber.inneractive.sdk.flow.t0;
import com.fyber.inneractive.sdk.flow.w0;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;

/* loaded from: classes3.dex */
public final class f implements com.fyber.inneractive.sdk.flow.nativead.mainasset.c {

    /* renamed from: m, reason: collision with root package name */
    public static final String f28186m = IAlog.a(f.class);
    public static final Object n = new Object();

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.response.nativead.i f28189c;

    /* renamed from: e, reason: collision with root package name */
    public t0 f28191e;

    /* renamed from: f, reason: collision with root package name */
    public d f28192f;

    /* renamed from: h, reason: collision with root package name */
    public final InneractiveAdRequest f28194h;

    /* renamed from: i, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.config.global.r f28195i;

    /* renamed from: j, reason: collision with root package name */
    public final String f28196j;

    /* renamed from: k, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.response.nativead.j f28197k;

    /* renamed from: a, reason: collision with root package name */
    public final CopyOnWriteArrayList f28187a = new CopyOnWriteArrayList();

    /* renamed from: b, reason: collision with root package name */
    public final AtomicBoolean f28188b = new AtomicBoolean(false);

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f28190d = new ArrayList();

    /* renamed from: g, reason: collision with root package name */
    public final AtomicBoolean f28193g = new AtomicBoolean(false);

    /* renamed from: l, reason: collision with root package name */
    public final e f28198l = new e(this);

    public f(com.fyber.inneractive.sdk.config.global.r rVar, InneractiveAdRequest inneractiveAdRequest, com.fyber.inneractive.sdk.response.nativead.j jVar, com.fyber.inneractive.sdk.response.nativead.i iVar, d dVar, String str) {
        this.f28195i = rVar;
        this.f28197k = jVar;
        this.f28194h = inneractiveAdRequest;
        this.f28189c = iVar;
        this.f28192f = dVar;
        this.f28196j = str;
    }

    public final void a(InneractiveInfrastructureError inneractiveInfrastructureError, String str) throws JSONException {
        IAlog.f("%sonMainAssetLoadFailed: %s", f28186m, str != null ? "Failed to load native main media with message ".concat(str) : "Failed to load native main media");
        Iterator it = this.f28187a.iterator();
        while (it.hasNext()) {
            c cVar = (c) it.next();
            if (cVar.a()) {
                cVar.destroy();
            }
        }
        String strDescription = inneractiveInfrastructureError.description();
        if (this.f28193g.compareAndSet(false, true)) {
            InneractiveInfrastructureError inneractiveInfrastructureError2 = new InneractiveInfrastructureError(InneractiveErrorCode.NATIVE_AD_FAILED_TO_LOAD, com.fyber.inneractive.sdk.flow.i.NATIVE_AD_EMPTY_CONTENT);
            inneractiveInfrastructureError2.setCause(new com.fyber.inneractive.sdk.flow.nativead.mainasset.a(strDescription));
            d dVar = this.f28192f;
            dVar.getClass();
            com.fyber.inneractive.sdk.util.r.f31215a.execute(new com.fyber.inneractive.sdk.flow.e(new com.fyber.inneractive.sdk.flow.f(dVar.f28165b, dVar.f28164a, "send_failed_native_creatives", dVar.f28170g.b()), inneractiveInfrastructureError2));
            dVar.b(inneractiveInfrastructureError2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:131:0x01ff  */
    /* JADX WARN: Removed duplicated region for block: B:132:0x0207  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a() throws Throwable {
        boolean z11;
        x0 x0VarA;
        Iterator it;
        i iVar;
        String str;
        float f11;
        String strB;
        String strB2;
        synchronized (n) {
            try {
                if (!this.f28187a.isEmpty()) {
                    Iterator it2 = this.f28187a.iterator();
                    while (true) {
                        if (it2.hasNext()) {
                            if (((c) it2.next()).a()) {
                                break;
                            }
                        } else if (this.f28188b.get() || this.f28193g.get()) {
                            break;
                        } else {
                            z11 = false;
                        }
                    }
                }
                z11 = true;
            } catch (Throwable th2) {
                th = th2;
                while (true) {
                    try {
                        throw th;
                    } catch (Throwable th3) {
                        th = th3;
                    }
                }
            }
        }
        if (z11) {
            return;
        }
        IAlog.c("%s : onResourceFinished", f28186m);
        InneractiveAdRequest inneractiveAdRequest = this.f28194h;
        com.fyber.inneractive.sdk.response.nativead.j jVar = this.f28197k;
        if (inneractiveAdRequest != null) {
            x0VarA = inneractiveAdRequest.getSelectedUnitConfig();
        } else {
            x0VarA = com.fyber.inneractive.sdk.config.a.a(jVar.f31054m);
        }
        com.fyber.inneractive.sdk.config.global.r rVar = this.f28195i;
        HashMap map = new HashMap();
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        com.fyber.inneractive.sdk.response.nativead.i iVar2 = this.f28189c;
        String str2 = q.f28243a;
        ArrayList arrayList3 = new ArrayList();
        if (q.a(iVar2.f31090d) && (strB2 = q.b(iVar2.f31090d)) != null) {
            arrayList3.add(strB2);
        }
        ArrayList arrayList4 = iVar2.f31091e;
        if (arrayList4 != null) {
            ArrayList arrayList5 = new ArrayList();
            Iterator it3 = arrayList4.iterator();
            while (it3.hasNext()) {
                com.fyber.inneractive.sdk.response.nativead.g gVar = (com.fyber.inneractive.sdk.response.nativead.g) it3.next();
                if (gVar != null && gVar.f31080a == 1 && gVar.f31081b == 2) {
                    arrayList5.add(gVar.f31082c);
                }
            }
            Iterator it4 = arrayList5.iterator();
            while (it4.hasNext()) {
                String str3 = (String) it4.next();
                if (q.a(str3) && (strB = q.b(str3)) != null) {
                    arrayList3.add(strB);
                }
            }
        }
        arrayList2.addAll(arrayList3);
        ArrayList arrayList6 = new ArrayList();
        ArrayList arrayList7 = iVar2.f31089c;
        if (arrayList7 != null && !arrayList7.isEmpty()) {
            arrayList6.addAll(iVar2.f31089c);
        }
        ArrayList arrayList8 = iVar2.f31091e;
        if (arrayList8 != null) {
            ArrayList arrayList9 = new ArrayList();
            Iterator it5 = arrayList8.iterator();
            while (it5.hasNext()) {
                com.fyber.inneractive.sdk.response.nativead.g gVar2 = (com.fyber.inneractive.sdk.response.nativead.g) it5.next();
                if (gVar2 != null && gVar2.f31080a == 1 && gVar2.f31081b == 1) {
                    arrayList9.add(gVar2.f31082c);
                }
            }
            arrayList6.addAll(arrayList9);
        }
        arrayList.addAll(arrayList6);
        t0 t0Var = this.f28191e;
        ArrayList arrayList10 = this.f28190d;
        com.fyber.inneractive.sdk.response.nativead.h hVar = this.f28189c.f31088b;
        i iVar3 = (hVar == null || (TextUtils.isEmpty(hVar.f31084a) && TextUtils.isEmpty(hVar.f31086c) && hVar.f31085b.isEmpty())) ? null : new i(hVar.f31084a, hVar.f31086c, hVar.f31085b);
        if (iVar3 != null) {
            map.put(NativeAdContent.ViewTag.ROOT, iVar3);
        }
        Iterator it6 = this.f28189c.f31087a.iterator();
        Uri uri = null;
        String str4 = null;
        t0 t0Var2 = null;
        Float fA = null;
        Float f12 = null;
        Uri uri2 = null;
        String str5 = null;
        String str6 = null;
        while (it6.hasNext()) {
            com.fyber.inneractive.sdk.response.nativead.f fVar = (com.fyber.inneractive.sdk.response.nativead.f) it6.next();
            t0 t0Var3 = t0Var;
            com.fyber.inneractive.sdk.response.nativead.h hVar2 = fVar.f31079f;
            ArrayList arrayList11 = arrayList10;
            if (hVar2 == null || (TextUtils.isEmpty(hVar2.f31084a) && TextUtils.isEmpty(hVar2.f31086c) && hVar2.f31085b.isEmpty())) {
                it = it6;
                iVar = null;
            } else {
                it = it6;
                iVar = new i(hVar2.f31084a, hVar2.f31086c, hVar2.f31085b);
            }
            com.fyber.inneractive.sdk.response.nativead.d dVar = fVar.f31075b;
            if (dVar != null && !TextUtils.isEmpty(dVar.f31072a)) {
                String str7 = fVar.f31075b.f31072a;
                if (iVar != null) {
                    map.put(NativeAdContent.ViewTag.AD_TITLE, iVar);
                }
                str6 = str7;
            } else {
                com.fyber.inneractive.sdk.response.nativead.b bVar = fVar.f31078e;
                if (bVar != null && !TextUtils.isEmpty(bVar.f31070a)) {
                    String str8 = fVar.f31078e.f31070a;
                    int i5 = fVar.f31074a;
                    if (i5 == 5) {
                        str = NativeAdContent.ViewTag.AD_DESCRIPTION;
                        str5 = str8;
                    } else if (i5 != 6) {
                        if (i5 != 7) {
                            str = null;
                        } else {
                            str = NativeAdContent.ViewTag.CTA;
                            str4 = str8;
                        }
                    } else if (TextUtils.isEmpty(str8)) {
                        f11 = -1.0f;
                        if (f11 < 0.0f) {
                        }
                    } else {
                        try {
                            f11 = Float.parseFloat(str8);
                        } catch (NumberFormatException unused) {
                        }
                        if (f11 < 0.0f) {
                            Float fValueOf = Float.valueOf(f11);
                            str = NativeAdContent.ViewTag.RATING;
                            f12 = fValueOf;
                        }
                    }
                    if (!TextUtils.isEmpty(str)) {
                        map.put(str, iVar);
                    }
                } else {
                    Iterator it7 = arrayList11.iterator();
                    while (true) {
                        if (it7.hasNext()) {
                            g gVar3 = (g) it7.next();
                            if (gVar3 != null) {
                                int i11 = gVar3.f28199a;
                                Iterator it8 = it7;
                                if (i11 == fVar.f31074a) {
                                    if (i11 == 2) {
                                        uri2 = gVar3.f28200b;
                                        fA = com.fyber.inneractive.sdk.util.u.a(uri2);
                                        if (iVar != null) {
                                            map.put(NativeAdContent.ViewTag.MEDIA_VIEW, iVar);
                                        }
                                    } else if (i11 == 4) {
                                        uri = gVar3.f28200b;
                                        if (iVar != null) {
                                            map.put(NativeAdContent.ViewTag.AD_ICON, iVar);
                                        }
                                    }
                                }
                                it7 = it8;
                            }
                        } else {
                            com.fyber.inneractive.sdk.response.nativead.e eVar = fVar.f31076c;
                            if (eVar == null || TextUtils.isEmpty(eVar.f31073a) || t0Var3 == null) {
                                IAlog.c("%s : handleAsset failed: %d: ", f28186m, Integer.valueOf(fVar.f31074a));
                            } else {
                                if (iVar != null) {
                                    map.put(NativeAdContent.ViewTag.MEDIA_VIEW, iVar);
                                }
                                t0Var = t0Var3;
                                t0Var2 = t0Var;
                            }
                        }
                    }
                }
                t0Var = t0Var3;
                arrayList10 = arrayList11;
                it6 = it;
            }
            t0Var = t0Var3;
            arrayList10 = arrayList11;
            it6 = it;
        }
        w0 w0Var = new w0(x0VarA, rVar);
        w0Var.f28421g = str6;
        w0Var.f28422h = str5;
        w0Var.f28423i = str4;
        w0Var.f28424j = null;
        w0Var.f28425k = null;
        w0Var.f28426l = uri;
        w0Var.f28427m = uri2;
        w0Var.o = f12;
        w0Var.f28428p = fA;
        w0Var.f28431s = t0Var2;
        w0Var.f28432t.putAll(map);
        w0Var.f28433u = new j((i) map.get(NativeAdContent.ViewTag.ROOT));
        w0Var.f28435w.addAll(arrayList);
        w0Var.f28436x.addAll(arrayList2);
        map.clear();
        this.f28188b.set(true);
        w0Var.f28438b = this.f28197k;
        d dVar2 = this.f28192f;
        dVar2.f28166c = w0Var;
        dVar2.f();
    }
}
