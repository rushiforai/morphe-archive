package a3;

import ads_mobile_sdk.du0;
import ads_mobile_sdk.dv0;
import ads_mobile_sdk.em2;
import ads_mobile_sdk.fh1;
import ads_mobile_sdk.fi0;
import ads_mobile_sdk.fq;
import ads_mobile_sdk.hs;
import ads_mobile_sdk.iu0;
import ads_mobile_sdk.j01;
import ads_mobile_sdk.ji;
import ads_mobile_sdk.ji3;
import ads_mobile_sdk.jn;
import ads_mobile_sdk.jr0;
import ads_mobile_sdk.kz2;
import ads_mobile_sdk.l11;
import ads_mobile_sdk.lw0;
import ads_mobile_sdk.mi3;
import ads_mobile_sdk.ph0;
import ads_mobile_sdk.pu0;
import ads_mobile_sdk.s8;
import ads_mobile_sdk.t11;
import ads_mobile_sdk.th3;
import ads_mobile_sdk.tu2;
import ads_mobile_sdk.um0;
import ads_mobile_sdk.ur2;
import ads_mobile_sdk.w20;
import ads_mobile_sdk.wv0;
import ads_mobile_sdk.zi3;
import android.content.Context;
import android.os.Bundle;
import android.os.Trace;
import android.view.View;
import android.view.inputmethod.BaseInputConnection;
import android.view.inputmethod.InputMethodManager;
import androidx.compose.ui.node.BackwardsCompatNode;
import androidx.compose.ui.node.LayoutNode;
import androidx.room.v;
import b.a1;
import b.a4;
import b.c0;
import b.e6;
import b.xc;
import b0.r0;
import b3.e1;
import b3.t0;
import b3.t1;
import b90.m;
import c0.c2;
import com.google.android.gms.appset.AppSet;
import com.google.android.play.core.hsdp.service.HsdpDeepLinkServiceFactory;
import i2.s0;
import java.io.File;
import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CancellationException;
import javax.net.ssl.SSLPeerUnverifiedException;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.io.CloseableKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlinx.coroutines.TimeoutCancellationException;
import o2.m0;
import p1.o2;
import p1.s2;
import t70.j0;
import x7.u;
import x80.t;

/* loaded from: classes.dex */
public final class e extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f173j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Object f174k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e(Object obj, int i5) {
        super(0);
        this.f173j = i5;
        this.f174k = obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:161:0x0328  */
    /* JADX WARN: Type inference failed for: r0v3, types: [kotlin.jvm.functions.Function0, kotlin.jvm.internal.Lambda] */
    @Override // kotlin.jvm.functions.Function0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke() {
        e6 e6Var;
        boolean z11;
        jr0 jr0Var;
        jr0 jr0Var2;
        e7.h hVar;
        Object objInvoke = null;
        z = false;
        boolean z12 = false;
        switch (this.f173j) {
            case 0:
                f fVar = (f) this.f174k;
                r1.e eVar = fVar.f177c;
                r1.e eVar2 = fVar.f176b;
                r1.e eVar3 = fVar.f179e;
                fVar.f180f = false;
                HashSet hashSet = new HashSet();
                r1.e eVar4 = fVar.f178d;
                Object[] objArr = eVar4.f85077a;
                int i5 = eVar4.f85079c;
                for (int i11 = 0; i11 < i5; i11++) {
                    LayoutNode layoutNode = (LayoutNode) objArr[i11];
                    c cVar = (c) eVar3.f85077a[i11];
                    if (layoutNode.getNodes().getHead().getIsAttached()) {
                        f.b(layoutNode.getNodes().getHead(), cVar, hashSet);
                    }
                }
                eVar4.g();
                eVar3.g();
                Object[] objArr2 = eVar2.f85077a;
                int i12 = eVar2.f85079c;
                for (int i13 = 0; i13 < i12; i13++) {
                    BackwardsCompatNode backwardsCompatNode = (BackwardsCompatNode) objArr2[i13];
                    c cVar2 = (c) eVar.f85077a[i13];
                    if (backwardsCompatNode.getIsAttached()) {
                        f.b(backwardsCompatNode, cVar2, hashSet);
                    }
                }
                eVar2.g();
                eVar.g();
                Iterator it = hashSet.iterator();
                while (it.hasNext()) {
                    ((BackwardsCompatNode) it.next()).updateModifierLocalConsumer();
                }
                return Unit.f71706a;
            case 1:
                mg.l lVar = (mg.l) this.f174k;
                return "variations header: " + lVar.b() + ", " + lVar.c();
            case 2:
                mk.b bVarCreate = HsdpDeepLinkServiceFactory.create(((j01) this.f174k).f5074a);
                Intrinsics.f(bVarCreate, "create(...)");
                return bVarCreate;
            case 3:
                return AppSet.getClient(((ji) this.f174k).f5244a);
            case 4:
                return "CSRB buildClientSideAdUrlResult: " + ((a1) this.f174k);
            case 5:
                l11 l11Var = (l11) this.f174k;
                t11 t11Var = l11Var.f6029a;
                if (((Boolean) t11Var.f9758e.getValue()).booleanValue()) {
                    Object obj = t11Var.f9756c.get();
                    Intrinsics.d(obj);
                    e6Var = (e6) obj;
                } else {
                    Object obj2 = t11Var.f9755b.get();
                    Intrinsics.d(obj2);
                    e6Var = (e6) obj2;
                }
                xc xcVar = l11Var.f6031c;
                if (xcVar != null) {
                    e6Var.a(xcVar);
                }
                hs hsVar = l11Var.f6030b;
                if (hsVar != null) {
                    e6Var.a(hsVar);
                }
                return e6Var;
            case 6:
                return c0.k("Cronet engine initialization failed. Falling back to Java provider: ", ((Throwable) this.f174k).getMessage());
            case 7:
                jn jnVar = jn.a$10;
                w20 w20Var = (w20) this.f174k;
                fi0 fi0Var = w20Var.f11003g;
                jr0 jr0Var3 = w20Var.f10998b;
                if (fi0Var == null) {
                    return Boolean.valueOf(jr0Var3 != null ? ((Boolean) jr0Var3.a("gads:use_cronet_fallback_provider_for_offline_client:enabled", Boolean.TRUE, jnVar)).booleanValue() : true);
                }
                if (jr0Var3 == null || ((Boolean) jr0Var3.a("gads:initialize_device_tier_manager_in_cronet_provider:enabled", Boolean.TRUE, jnVar)).booleanValue()) {
                    fi0Var.b();
                }
                return Boolean.valueOf(((ph0) fi0Var.f3358b.get()).getNumber() <= (jr0Var3 != null ? ((Number) jr0Var3.a("gads:cronet_fallback_device_memory_threshold", Integer.valueOf(jr0.B), jn.a$15)).intValue() : jr0.B));
            case 8:
                return "CSRB buildSdkCoreAdUrlResult: " + ((fq) this.f174k);
            case 9:
                t11 t11Var2 = (t11) this.f174k;
                u uVarA = t11Var2.f9757d.a();
                if (uVarA == null || !((Bundle) uVarA.f95210c).getBoolean("force_use_cronet")) {
                    jr0 jr0Var4 = t11Var2.f9754a;
                    jr0Var4.getClass();
                    z11 = ((Boolean) jr0Var4.a("gads:use_cronet_for_http_client:enabled", Boolean.FALSE, jn.a$10)).booleanValue();
                }
                return Boolean.valueOf(z11);
            case 10:
                jn jnVar2 = jn.a$10;
                um0 um0Var = (um0) this.f174k;
                kz2 kz2Var = um0Var.f10408c;
                wv0 wv0Var = wv0.CUI_NAME_INIT_FIREBASE_ANALYTICS;
                EmptyList emptyList = EmptyList.f71733a;
                mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
                if (ji3.b().f4777a == null) {
                    em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                    try {
                        try {
                            jr0Var2 = um0Var.f10409d;
                            jr0Var2.getClass();
                        } catch (Exception e3) {
                            zi3.a(4, "Exception while getting Firebase Analytics SDK instance", e3);
                        }
                        if (((Boolean) jr0Var2.a("gads:firebase_analytics_integration:enabled", Boolean.TRUE, jnVar2)).booleanValue()) {
                            objInvoke = Class.forName(um0Var.f10409d.Q()).getMethod("getInstance", Context.class).invoke(null, um0Var.f10406a);
                            if (objInvoke instanceof pu0) {
                                zi3.a((pu0) objInvoke, false);
                            }
                            em2VarA.close();
                        } else {
                            em2VarA.close();
                        }
                    } catch (Throwable th2) {
                        try {
                            em2VarA.b(th2);
                            if (th2 instanceof a4) {
                                throw th2;
                            }
                            if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                                em2VarA.a(th2);
                            }
                            if (th2 instanceof TimeoutCancellationException) {
                                throw new lw0(th2);
                            }
                            if (th2 instanceof CancellationException) {
                                throw new du0(th2);
                            }
                            if (th2 instanceof dv0) {
                                throw th2;
                            }
                            throw new iu0(th2);
                        } catch (Throwable th3) {
                            try {
                                throw th3;
                            } catch (Throwable th4) {
                                CloseableKt.a(em2VarA, th3);
                                throw th4;
                            }
                        }
                    }
                } else {
                    th3 th3VarA = ji3.a(wv0Var, emptyList, true);
                    try {
                        try {
                            jr0Var = um0Var.f10409d;
                            jr0Var.getClass();
                        } catch (Throwable th5) {
                            try {
                                th3VarA.b(th5);
                                if (th5 instanceof a4) {
                                    throw th5;
                                }
                                if (!(th5 instanceof TimeoutCancellationException) && !(th5 instanceof CancellationException)) {
                                    th3VarA.a(th5);
                                }
                                if (th5 instanceof TimeoutCancellationException) {
                                    throw new lw0(th5);
                                }
                                if (th5 instanceof CancellationException) {
                                    throw new du0(th5);
                                }
                                if (th5 instanceof dv0) {
                                    throw th5;
                                }
                                throw new iu0(th5);
                            } catch (Throwable th6) {
                                try {
                                    throw th6;
                                } catch (Throwable th7) {
                                    CloseableKt.a(th3VarA, th6);
                                    throw th7;
                                }
                            }
                        }
                    } catch (Exception e11) {
                        zi3.a(4, "Exception while getting Firebase Analytics SDK instance", e11);
                    }
                    if (((Boolean) jr0Var.a("gads:firebase_analytics_integration:enabled", Boolean.TRUE, jnVar2)).booleanValue()) {
                        objInvoke = Class.forName(um0Var.f10409d.Q()).getMethod("getInstance", Context.class).invoke(null, um0Var.f10406a);
                        if (objInvoke instanceof pu0) {
                            zi3.a((pu0) objInvoke, false);
                        }
                        th3VarA.close();
                    } else {
                        th3VarA.close();
                    }
                }
                return objInvoke;
            case 11:
                v vVar = (v) this.f174k;
                return vVar.database.compileStatement(vVar.createQuery());
            case 12:
                c2 c2Var = (c2) this.f174k;
                Object objC = c2Var.f18730a.c();
                r0 r0Var = r0.f16220c;
                if (objC == r0Var && ((s2) c2Var.f18733d).getValue() == r0Var) {
                    z12 = true;
                }
                return Boolean.valueOf(z12);
            case 13:
                t0 layoutDelegate = ((LayoutNode) this.f174k).getLayoutDelegate();
                layoutDelegate.f17357p.A = true;
                e1 e1Var = layoutDelegate.f17358q;
                if (e1Var != null) {
                    e1Var.p0();
                }
                return Unit.f71706a;
            case 14:
                Function1 function1 = (Function1) this.f174k;
                s0 s0Var = t1.K;
                function1.invoke(s0Var);
                s0Var.f61165s = s0Var.f61161m.a(s0Var.o, s0Var.f61163q, s0Var.f61162p);
                return Unit.f71706a;
            case 15:
                t tVar = ((m) this.f174k).f17706e;
                Intrinsics.d(tVar);
                List<Certificate> listA = tVar.a();
                ArrayList arrayList = new ArrayList(b70.c.u0(listA, 10));
                for (Certificate certificate : listA) {
                    Intrinsics.e(certificate, "null cannot be cast to non-null type java.security.cert.X509Certificate");
                    arrayList.add((X509Certificate) certificate);
                }
                return arrayList;
            case 16:
                return Unit.f71706a;
            case 17:
                return new cd.a((cd.b) this.f174k);
            case 18:
                e7.i iVar = (e7.i) this.f174k;
                String str = iVar.f52233b;
                if (str == null || !iVar.f52235d) {
                    hVar = new e7.h(iVar.f52232a, iVar.f52233b, new e7.e(), iVar.f52234c, iVar.f52236e);
                } else {
                    Context context = iVar.f52232a;
                    Intrinsics.g(context, "context");
                    File noBackupFilesDir = context.getNoBackupFilesDir();
                    Intrinsics.f(noBackupFilesDir, "context.noBackupFilesDir");
                    hVar = new e7.h(iVar.f52232a, new File(noBackupFilesDir, str).getAbsolutePath(), new e7.e(), iVar.f52234c, iVar.f52236e);
                }
                hVar.setWriteAheadLoggingEnabled(iVar.f52238g);
                return hVar;
            case 19:
                ((s2) ((k1.a) this.f174k).f70803j).setValue(Boolean.valueOf(!((Boolean) ((s2) r0).getValue()).booleanValue()));
                return Unit.f71706a;
            case 20:
                k3.a aVar = (k3.a) this.f174k;
                aVar.f70894g = null;
                Trace.beginSection("OnPositionedDispatch");
                try {
                    aVar.b();
                    Unit unit = Unit.f71706a;
                    Trace.endSection();
                    return Unit.f71706a;
                } catch (Throwable th8) {
                    Trace.endSection();
                    throw th8;
                }
            case 21:
                return ((Function0) this.f174k).invoke();
            case 22:
                return (x8.k) ((s2) ((n8.l) this.f174k).f77999q).getValue();
            case 23:
                m0 m0Var = (m0) this.f174k;
                int i14 = m0Var.f79330k;
                o2 o2Var = m0Var.f79327h;
                if (i14 == o2Var.m()) {
                    o2Var.p(o2Var.m() + 1);
                }
                return Unit.f71706a;
            case 24:
                Object systemService = ((View) ((i50.c) this.f174k).f61379b).getContext().getSystemService("input_method");
                Intrinsics.e(systemService, "null cannot be cast to non-null type android.view.inputmethod.InputMethodManager");
                return (InputMethodManager) systemService;
            case 25:
                return new BaseInputConnection(((r3.c0) this.f174k).f85405a, false);
            case 26:
                return (j0) ((x7.h) this.f174k).f95140e;
            case 27:
                return ((u2.f) this.f174k).B();
            case 28:
                return (List) this.f174k;
            default:
                try {
                    return (List) ((Lambda) this.f174k).invoke();
                } catch (SSLPeerUnverifiedException unused) {
                    return EmptyList.f71733a;
                }
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public e(Function0 function0) {
        super(0);
        this.f173j = 29;
        this.f174k = (Lambda) function0;
    }
}
