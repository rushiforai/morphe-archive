package androidx.fragment.app;

import ads_mobile_sdk.gh1;
import ads_mobile_sdk.ih0;
import ads_mobile_sdk.pr;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.view.View;
import androidx.compose.ui.draw.ShadowGraphicsLayerElement;
import androidx.compose.ui.platform.AndroidComposeView;
import b3.t2;
import b3.v2;
import c3.n2;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.CancellationException;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import l1.h4;
import l1.o9;
import org.chromium.net.UrlRequest;
import p1.s2;

/* loaded from: classes2.dex */
public final class p extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f14647j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Object f14648k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ p(Object obj, int i5) {
        super(1);
        this.f14647j = i5;
        this.f14648k = obj;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5 = 0;
        switch (this.f14647j) {
            case 0:
                Map.Entry entry = (Map.Entry) obj;
                Intrinsics.g(entry, "entry");
                Collection collection = (Collection) this.f14648k;
                View view = (View) entry.getValue();
                WeakHashMap weakHashMap = a5.a1.f250a;
                return Boolean.valueOf(b70.g.O0(collection, a5.s0.f(view)));
            case 1:
                ((UrlRequest) this.f14648k).cancel();
                return Unit.f71706a;
            case 2:
                wi.c cVar = (wi.c) obj;
                ih0 ih0VarJ = ((gh1) this.f14648k).j();
                synchronized (ih0VarJ) {
                    ih0VarJ.a(cVar);
                    synchronized (ih0VarJ) {
                    }
                    return Unit.f71706a;
                }
                return Unit.f71706a;
            case 3:
                String it = (String) obj;
                Intrinsics.g(it, "it");
                return ((Intent) this.f14648k).setAction(it);
            case 4:
                String it2 = (String) obj;
                Intrinsics.g(it2, "it");
                try {
                    return Intent.parseUri(it2, 0);
                } catch (Exception e3) {
                    ((pr) this.f14648k).f8352b.a("Invalid intent Uri for canOpenIntents gmsg", (Throwable) e3);
                    return null;
                }
            case 5:
                return Boolean.valueOf(Intrinsics.b(obj, this.f14648k));
            case 6:
                c0.r rVar = (c0.r) obj;
                float f11 = rVar.f18935b;
                if (f11 < 0.0f) {
                    f11 = 0.0f;
                }
                if (f11 > 1.0f) {
                    f11 = 1.0f;
                }
                float f12 = rVar.f18936c;
                if (f12 < -0.5f) {
                    f12 = -0.5f;
                }
                if (f12 > 0.5f) {
                    f12 = 0.5f;
                }
                float f13 = rVar.f18937d;
                float f14 = f13 >= -0.5f ? f13 : -0.5f;
                float f15 = f14 <= 0.5f ? f14 : 0.5f;
                float f16 = rVar.f18934a;
                float f17 = f16 >= 0.0f ? f16 : 0.0f;
                return new i2.s(i2.s.a(i2.r0.a(f11, f12, f15, f17 <= 1.0f ? f17 : 1.0f, j2.d.f68679x), (j2.c) this.f14648k));
            case 7:
                return Boolean.valueOf(!Intrinsics.b(obj, ((s2) ((c0.c2) this.f14648k).f18733d).getValue()));
            case 8:
                AndroidComposeView androidComposeView = (AndroidComposeView) this.f14648k;
                return new c3.d1(androidComposeView, androidComposeView.getTextInputService(), (t70.j0) obj);
            case 9:
                return Boolean.valueOf(((z.m) this.f14648k).a(((j3.q) obj).f68826g));
            case 10:
                return Boolean.valueOf(c3.k0.i((j3.q) obj, (Resources) this.f14648k));
            case 11:
                r3.p pVar = (r3.p) obj;
                c1.s sVar = pVar.f85455b;
                if (sVar != null) {
                    pVar.a(sVar);
                    pVar.f85455b = null;
                }
                n2 n2Var = (n2) this.f14648k;
                r1.e eVar = n2Var.f19390d;
                Object[] objArr = eVar.f85077a;
                int i11 = eVar.f85079c;
                while (true) {
                    if (i5 >= i11) {
                        i5 = -1;
                    } else if (!Intrinsics.b((v2) objArr[i5], pVar)) {
                        i5++;
                    }
                }
                if (i5 >= 0) {
                    eVar.k(i5);
                }
                if (eVar.f85079c == 0) {
                    n2Var.f19388b.invoke();
                }
                return Unit.f71706a;
            case 12:
                e2.g gVar = (e2.g) obj;
                if (!gVar.getNode().getIsAttached()) {
                    return t2.f17371b;
                }
                e2.i iVar = gVar.f51999c;
                if (iVar != null) {
                    e2.h.c((e2.g) iVar, new p((cm.f) this.f14648k, 12));
                }
                gVar.f51999c = null;
                gVar.f51998b = null;
                return t2.f17370a;
            case 13:
                k2.c cVar2 = (k2.c) obj;
                ((b0.e) this.f14648k).invoke(cVar2);
                cVar2.drawContent();
                return Unit.f71706a;
            case 14:
                ShadowGraphicsLayerElement shadowGraphicsLayerElement = (ShadowGraphicsLayerElement) this.f14648k;
                i2.s0 s0Var = (i2.s0) ((i2.a0) obj);
                s0Var.k(s0Var.getDensity() * shadowGraphicsLayerElement.f14124b);
                s0Var.m(shadowGraphicsLayerElement.f14125c);
                s0Var.f(shadowGraphicsLayerElement.f14126d);
                s0Var.b(shadowGraphicsLayerElement.f14127e);
                s0Var.n(shadowGraphicsLayerElement.f14128f);
                return Unit.f71706a;
            case 15:
                try {
                    ((b90.j) this.f14648k).cancel();
                } catch (Throwable unused) {
                }
                return Unit.f71706a;
            case 16:
                if (((Throwable) obj) != null) {
                    ((CancellationSignal) this.f14648k).cancel();
                }
                return Unit.f71706a;
            case 17:
                j3.y.j((j3.b0) obj, ((j3.h) this.f14648k).f68785a);
                return Unit.f71706a;
            case 18:
                float fFloatValue = ((Number) obj).floatValue();
                o9 o9Var = (o9) ((l1.a2) this.f14648k).f73007a;
                o9Var.d(o9Var.b() + fFloatValue);
                return Unit.f71706a;
            case 19:
                ((o9) this.f14648k).d(((Number) ((s2) ((c0.l) obj).f18861e).getValue()).floatValue());
                return Unit.f71706a;
            case 20:
                i2.a0 a0Var = (i2.a0) obj;
                float fFloatValue2 = ((Number) ((c0.e) this.f14648k).e()).floatValue();
                float fD = h4.d(a0Var, fFloatValue2);
                float fE = h4.e(a0Var, fFloatValue2);
                i2.s0 s0Var2 = (i2.s0) a0Var;
                s0Var2.j(fE != 0.0f ? fD / fE : 1.0f);
                s0Var2.o(h4.f73380c);
                return Unit.f71706a;
            case 21:
                ((Number) obj).floatValue();
                return Float.valueOf(((y3.c) this.f14648k).mo102toPx0680j_4(56));
            case 22:
                k2.c cVar3 = (k2.c) obj;
                cVar3.drawContent();
                p1.e1 e1Var = (p1.e1) this.f14648k;
                float fMo102toPx0680j_4 = cVar3.mo102toPx0680j_4(((e0.u) e1Var.getValue()).f50132a);
                float fB = h2.e.b(cVar3.mo94getSizeNHjbRc()) - (fMo102toPx0680j_4 / 2);
                cVar3.mo84drawLine1RTmtNc(((e0.u) e1Var.getValue()).f50133b, ab.e0.h(0.0f, fB), ab.e0.h(h2.e.d(cVar3.mo94getSizeNHjbRc()), fB), fMo102toPx0680j_4, 0, null, (496 & 64) != 0 ? 1.0f : 0.0f, null, 3);
                return Unit.f71706a;
            case 23:
                return Integer.valueOf(ab.e0.t(Integer.valueOf(((o0.j) obj).f78746a), (Integer) this.f14648k));
            case 24:
                Throwable th2 = (Throwable) obj;
                o7.l lVar = (o7.l) this.f14648k;
                if (th2 == null) {
                    if (!lVar.f79676a.isDone()) {
                        throw new IllegalArgumentException("Failed requirement.");
                    }
                } else if (th2 instanceof CancellationException) {
                    lVar.f79676a.cancel(true);
                } else {
                    z7.j jVar = lVar.f79676a;
                    Throwable cause = th2.getCause();
                    if (cause != null) {
                        th2 = cause;
                    }
                    jVar.k(th2);
                }
                return Unit.f71706a;
            case 25:
                p6.n backStackEntry = (p6.n) obj;
                p6.z0 z0Var = (p6.z0) this.f14648k;
                Intrinsics.g(backStackEntry, "backStackEntry");
                p6.e0 e0Var = backStackEntry.f82192b;
                if (e0Var == null) {
                    e0Var = null;
                }
                if (e0Var == null) {
                    return null;
                }
                backStackEntry.a();
                p6.e0 e0VarC = z0Var.c(e0Var);
                if (e0VarC == null) {
                    return null;
                }
                if (e0VarC.equals(e0Var)) {
                    return backStackEntry;
                }
                p6.o oVarB = z0Var.b();
                Bundle bundleB = e0VarC.b(backStackEntry.a());
                p6.t tVar = oVarB.f82218h;
                return b50.d.l(tVar.f82252a, e0VarC, bundleB, tVar.i(), tVar.f82265p);
            case 26:
                ((p8.d) this.f14648k).f82444k = true;
                return Unit.f71706a;
            case 27:
                ArrayList mViews = (ArrayList) obj;
                Intrinsics.g(mViews, "mViews");
                q40.b bVar = ((q40.c) this.f14648k).f83655b;
                bVar.addAll(mViews);
                return bVar;
            case 28:
                Throwable th3 = (Throwable) obj;
                t5.c0 c0Var = (t5.c0) this.f14648k;
                a70.d dVar = c0Var.f88552j;
                if (th3 != null) {
                    c0Var.f88550h.K(new t5.n0(th3));
                }
                if (dVar.isInitialized()) {
                    ((t5.k1) dVar.getValue()).close();
                }
                return Unit.f71706a;
            default:
                File it3 = (File) obj;
                Intrinsics.g(it3, "it");
                return new t5.w0(((y70.d) this.f14648k).f96790a, it3);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(p6.z0 z0Var, p6.n0 n0Var) {
        super(1);
        this.f14647j = 25;
        this.f14648k = z0Var;
    }
}
