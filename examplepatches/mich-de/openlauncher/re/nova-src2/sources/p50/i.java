package p50;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.LocaleList;
import android.text.style.LocaleSpan;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import b10.u;
import b2.r;
import c3.p2;
import com.google.android.gms.internal.measurement.k2;
import com.google.android.gms.tasks.Tasks;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.mobilesdk.internal.ui.screens.u0;
import com.stripe.android.core.StripeError;
import com.stripe.android.core.exception.APIConnectionException;
import com.stripe.android.core.exception.LocalStripeException;
import com.stripe.android.core.exception.StripeException;
import com.stripe.android.core.strings.ResolvableString;
import com.teslacoilsw.launcher.search.NovaSearchProvider;
import com.vungle.ads.internal.protos.Sdk;
import cw.r3;
import e00.i0;
import e10.s2;
import e10.y2;
import e10.z2;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.File;
import java.math.BigInteger;
import java.security.spec.ECFieldFp;
import java.security.spec.ECParameterSpec;
import java.security.spec.EllipticCurve;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import k0.h2;
import k0.i2;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import l1.b3;
import l1.s1;
import m3.h0;
import p1.e1;
import p1.g1;
import p1.o;
import p1.o0;
import p1.t;
import p1.t1;
import ps.f0;
import tx.d3;
import x3.q;
import z1.s;
import z2.y;

/* loaded from: classes4.dex */
public abstract class i {
    public i() {
        new ConcurrentHashMap();
    }

    public static final void a(int i5, Function0 function0, Function1 function1, o oVar) {
        e1 e1Var;
        e1 e1Var2;
        Function1 function12;
        t tVar = (t) oVar;
        tVar.d0(2076739180);
        int i11 = (tVar.h(function1) ? 32 : 16) | i5;
        if ((i11 & 19) == 18 && tVar.E()) {
            tVar.V();
            function12 = function1;
        } else {
            tVar.b0(-1078706364);
            Object objP = tVar.P();
            Object obj = p1.n.f81514a;
            if (objP == obj) {
                objP = androidx.compose.runtime.d.k(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                tVar.m0(objP);
            }
            e1 e1Var3 = (e1) objP;
            Object objF = a2.c.f(-1078704828, tVar, false);
            if (objF == obj) {
                objF = androidx.compose.runtime.d.k(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                tVar.m0(objF);
            }
            e1 e1Var4 = (e1) objF;
            Object objF2 = a2.c.f(-1078703065, tVar, false);
            if (objF2 == obj) {
                objF2 = androidx.compose.runtime.d.k(Boolean.FALSE);
                tVar.m0(objF2);
            }
            e1 e1Var5 = (e1) objF2;
            Object objF3 = a2.c.f(-1078701333, tVar, false);
            if (objF3 == obj) {
                objF3 = androidx.compose.runtime.d.k(Uri.EMPTY);
                tVar.m0(objF3);
            }
            e1 e1Var6 = (e1) objF3;
            tVar.p(false);
            tVar.b0(-1078699086);
            Continuation continuation = null;
            if (r70.k.L0((String) e1Var3.getValue(), '/') || r70.k.L0((String) e1Var3.getValue(), '?')) {
                String strQ1 = r70.k.q1((String) e1Var3.getValue(), '/');
                if (!((Boolean) e1Var5.getValue()).booleanValue()) {
                    String str = (String) e1Var3.getValue();
                    String strP1 = r70.k.p1(str, ".com/", str);
                    String strP12 = r70.k.p1(strP1, ".org/", strP1);
                    String strQ12 = r70.k.q1(r70.k.p1(strP12, ".net/", strP12), '/');
                    String strM1 = r70.k.m1(strQ12, "search.", strQ12);
                    e1Var4.setValue(lx.d.h(r70.k.m1(strM1, "www.", strM1)));
                }
                tVar.b0(-1078686590);
                Object objP2 = tVar.P();
                if (objP2 == obj) {
                    objP2 = new v30.c();
                    tVar.m0(objP2);
                }
                v30.c cVar = (v30.c) objP2;
                tVar.p(false);
                tVar.b0(-1078684349);
                boolean zH = tVar.h(cVar) | tVar.f(strQ1);
                Object objP3 = tVar.P();
                if (zH || objP3 == obj) {
                    e1Var = e1Var6;
                    Object oVar2 = new w00.o(cVar, strQ1, e1Var, continuation, 1);
                    tVar.m0(oVar2);
                    objP3 = oVar2;
                } else {
                    e1Var = e1Var6;
                }
                tVar.p(false);
                o0.f(strQ1, (Function2) objP3, tVar);
            } else {
                if (!((Boolean) e1Var5.getValue()).booleanValue()) {
                    e1Var4.setValue(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                }
                e1Var6.setValue(p6.j.d("!", null));
                e1Var = e1Var6;
            }
            tVar.p(false);
            boolean z11 = r70.k.K0((String) e1Var3.getValue(), "/", false) && r70.k.K0((String) e1Var3.getValue(), "%s", false) && ((String) e1Var4.getValue()).length() > 0;
            String strY = x7.f.Y(tVar, 2132017240);
            tVar.b0(-1078662492);
            boolean z12 = (i11 & 112) == 32;
            Object objP4 = tVar.P();
            if (z12 || objP4 == obj) {
                e1Var2 = e1Var3;
                objP4 = new u(function1, e1Var4, e1Var, e1Var2, 15);
                tVar.m0(objP4);
            } else {
                e1Var2 = e1Var3;
            }
            tVar.p(false);
            x1.e eVarD = x1.f.d(898458882, new f00.d(e1Var2, e1Var4, e1Var5, e1Var, 1), tVar);
            function12 = function1;
            lb0.b.b(strY, z11, null, null, function0, null, (Function0) objP4, eVarD, tVar, 12607488, 44);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new h00.e(function0, function12, i5, 5);
        }
    }

    public static final void b(Map map, List list, Function2 function2, Function2 function22, o oVar, int i5) {
        Map map2;
        t tVar = (t) oVar;
        tVar.d0(-1284034102);
        int i11 = i5 | (tVar.h(list) ? 32 : 16) | (tVar.h(function2) ? 256 : 128) | (tVar.h(function22) ? 2048 : 1024);
        if ((i11 & 1171) == 1170 && tVar.E()) {
            tVar.V();
            map2 = map;
        } else {
            b2.t tVarC = androidx.compose.foundation.layout.e.c(r.f17024a, 1.0f);
            WeakHashMap weakHashMap = h2.f70617v;
            map2 = map;
            f0.c(list, tVarC, false, androidx.compose.foundation.layout.d.c(0.0f, 0.0f, i2.d(k0.e.e(tVar).f70622e, tVar).a() + 16, 7), function2, null, x1.f.d(-2049027035, new vs.c(2, map2, function22), tVar), tVar, ((i11 >> 3) & 14) | 1572912 | ((i11 << 6) & 57344), 36);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new b20.g(i5, 15, map2, list, function2, function22);
        }
    }

    public static final void c(p6.t tVar, r3 r3Var, o oVar, int i5) {
        p6.t tVar2;
        t tVar3 = (t) oVar;
        tVar3.d0(-1870440005);
        int i11 = (tVar3.h(tVar) ? 4 : 2) | i5;
        if ((i11 & 3) == 2 && tVar3.E()) {
            tVar3.V();
            tVar2 = tVar;
        } else {
            tVar3.b0(-1599044192);
            Object objP = tVar3.P();
            g1 g1Var = p1.n.f81514a;
            if (objP == g1Var) {
                y2.f51877a.getClass();
                objP = (List) y2.n1().l();
                tVar3.m0(objP);
            }
            List list = (List) objP;
            Object objF = a2.c.f(-1599041002, tVar3, false);
            if (objF == g1Var) {
                objF = androidx.compose.runtime.d.k(EmptyList.f71733a);
                tVar3.m0(objF);
            }
            e1 e1Var = (e1) objF;
            tVar3.p(false);
            Context context = (Context) tVar3.j(AndroidCompositionLocals_androidKt.f14166b);
            Unit unit = Unit.f71706a;
            tVar3.b0(-1599037399);
            boolean zH = tVar3.h(context);
            Object objP2 = tVar3.P();
            if (zH || objP2 == g1Var) {
                objP2 = new c20.f(context, e1Var, (Continuation) null, 7);
                tVar3.m0(objP2);
            }
            tVar3.p(false);
            o0.f(unit, (Function2) objP2, tVar3);
            tVar3.b0(-1599028739);
            Object objP3 = tVar3.P();
            Object obj = objP3;
            if (objP3 == g1Var) {
                s sVar = new s();
                List list2 = list;
                int iD0 = b70.k.d0(b70.c.u0(list2, 10));
                if (iD0 < 16) {
                    iD0 = 16;
                }
                LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
                for (Object obj2 : list2) {
                    linkedHashMap.put(obj2, Boolean.TRUE);
                }
                sVar.putAll(linkedHashMap);
                tVar3.m0(sVar);
                obj = sVar;
            }
            s sVar2 = (s) obj;
            tVar3.p(false);
            List list3 = (List) e1Var.getValue();
            tVar3.b0(-1599023453);
            boolean zF = tVar3.f(list3);
            Object objP4 = tVar3.P();
            if (zF || objP4 == g1Var) {
                objP4 = androidx.compose.runtime.d.k((List) e1Var.getValue());
                tVar3.m0(objP4);
            }
            e1 e1Var2 = (e1) objP4;
            Object objF2 = a2.c.f(-1599017008, tVar3, false);
            if (objF2 == g1Var) {
                objF2 = androidx.compose.runtime.d.k(Boolean.FALSE);
                tVar3.m0(objF2);
            }
            e1 e1Var3 = (e1) objF2;
            tVar3.p(false);
            tVar3.b0(-1599015431);
            if (((Boolean) e1Var3.getValue()).booleanValue()) {
                tVar3.b0(-1599013914);
                Object objP5 = tVar3.P();
                if (objP5 == g1Var) {
                    objP5 = new d3(e1Var3, 13);
                    tVar3.m0(objP5);
                }
                Function0 function0 = (Function0) objP5;
                tVar3.p(false);
                tVar3.b0(-1599012833);
                boolean zF2 = tVar3.f(e1Var2);
                Object objP6 = tVar3.P();
                if (zF2 || objP6 == g1Var) {
                    objP6 = new n00.u(sVar2, e1Var2, e1Var3, 13);
                    tVar3.m0(objP6);
                }
                tVar3.p(false);
                a(6, function0, (Function1) objP6, tVar3);
            }
            tVar3.p(false);
            tVar2 = tVar;
            z2.h(2132019468, tVar2, null, x1.f.d(-1896810800, new i0(e1Var3, 20), tVar3), null, null, x1.f.d(1708084056, new e00.b(7, sVar2, e1Var2), tVar3), tVar3, ((i11 << 3) & 112) | 1575936, 52);
        }
        t1 t1VarU = tVar3.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new e00.a(tVar2, r3Var, i5, 5);
        }
    }

    public static final void d(e1 e1Var, s sVar) {
        y2.f51877a.getClass();
        s2 s2VarN1 = y2.n1();
        List list = (List) e1Var.getValue();
        ArrayList arrayList = new ArrayList();
        for (Object obj : list) {
            if (Intrinsics.b(sVar.get((NovaSearchProvider) obj), Boolean.TRUE)) {
                arrayList.add(obj);
            }
        }
        s2VarN1.i(arrayList);
    }

    public static final long e(int i5) {
        long j11 = (i5 << 32) | (0 & 4294967295L);
        int i11 = t2.a.f88473p;
        return j11;
    }

    /* JADX WARN: Removed duplicated region for block: B:100:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x007e  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00ad  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00bc  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00f3  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x01cf  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void f(b2.t tVar, y20.d dVar, z2.l lVar, String str, y3.i iVar, i2.s sVar, o oVar, int i5, int i11) {
        int i12;
        z2.l lVar2;
        int i13;
        y3.i iVar2;
        int i14;
        i2.s sVar2;
        int i15;
        t tVar2;
        i2.s sVar3;
        t1 t1VarU;
        t tVar3 = (t) oVar;
        tVar3.d0(-918109305);
        if ((i5 & 6) == 0) {
            i12 = (tVar3.f(tVar) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        int i16 = i12 | (tVar3.f(dVar) ? 32 : 16);
        int i17 = i11 & 4;
        if (i17 != 0) {
            i16 |= 384;
        } else {
            if ((i5 & 384) == 0) {
                lVar2 = lVar;
                i16 |= tVar3.f(lVar2) ? 256 : 128;
            }
            if ((i5 & 3072) == 0) {
                i16 |= tVar3.f(str) ? 2048 : 1024;
            }
            i13 = i11 & 16;
            if (i13 != 0) {
                if ((i5 & 24576) == 0) {
                    iVar2 = iVar;
                    i16 |= tVar3.f(iVar2) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
                }
                i14 = i11 & 32;
                if (i14 != 0) {
                    i15 = i16 | 196608;
                    sVar2 = sVar;
                } else {
                    sVar2 = sVar;
                    i15 = i16 | (tVar3.f(sVar2) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX);
                }
                if ((74899 & i15) == 74898 && tVar3.E()) {
                    tVar3.V();
                    sVar3 = sVar2;
                    tVar2 = tVar3;
                } else {
                    z2.l lVar3 = i17 == 0 ? z2.k.f98095b : lVar2;
                    if (i13 != 0) {
                        iVar2 = null;
                    }
                    i2.s sVar4 = i14 == 0 ? null : sVar2;
                    if (dVar instanceof y20.a) {
                        z2.l lVar4 = lVar3;
                        tVar2 = tVar3;
                        if (dVar instanceof y20.c) {
                            tVar2.b0(1220441583);
                            o2.g gVar = ((y20.c) dVar).f96594a;
                            tVar2.b0(-237720941);
                            long j11 = sVar4 == null ? ((i2.s) tVar2.j(s1.f73932a)).f61148a : sVar4.f61148a;
                            tVar2.p(false);
                            b3.b(gVar, str, tVar, j11, tVar2, ((i15 >> 6) & 112) | ((i15 << 6) & 896), 0);
                            tVar2 = tVar2;
                            tVar2.p(false);
                            lVar3 = lVar4;
                        } else {
                            if (!(dVar instanceof y20.b)) {
                                throw k2.q(-237735580, tVar2, false);
                            }
                            tVar2.b0(-237717885);
                            if (((Boolean) tVar2.j(p2.f19399a)).booleanValue()) {
                                tVar2.b0(1220701766);
                                int i18 = (i15 >> 6) & 112;
                                int i19 = i15 << 6;
                                lVar3 = lVar4;
                                bh.g.h(ul.b.V(2131232050, tVar2, 0), str, tVar, null, lVar3, 0.0f, sVar4 != null ? new i2.n(sVar4.f61148a, 5) : null, tVar2, (i19 & 57344) | i18 | (i19 & 896), 40);
                                tVar2.p(false);
                            } else {
                                tVar2.b0(1221034768);
                                n8.n.a(r10.o0.c(((y20.b) dVar).f96593a, iVar2, tVar2, 0), str, tVar, lVar4, sVar4 != null ? new i2.n(sVar4.f61148a, 5) : null, tVar2, ((i15 >> 6) & 112) | ((i15 << 6) & 896) | ((i15 << 12) & 3670016), 696);
                                lVar3 = lVar4;
                                tVar2 = tVar2;
                                tVar2.p(false);
                            }
                            tVar2.p(false);
                        }
                    } else {
                        tVar3.b0(1220150059);
                        int i21 = (i15 >> 6) & 112;
                        int i22 = i15 << 6;
                        tVar2 = tVar3;
                        bh.g.h(ul.b.V(((y20.a) dVar).f96592a, tVar3, 0), str, tVar, null, lVar3, 0.0f, sVar4 != null ? new i2.n(sVar4.f61148a, 5) : null, tVar2, i21 | (i22 & 896) | (i22 & 57344), 40);
                        tVar2.p(false);
                    }
                    sVar3 = sVar4;
                    lVar2 = lVar3;
                }
                t1VarU = tVar2.u();
                if (t1VarU != null) {
                    t1VarU.f81583d = new u0(tVar, dVar, lVar2, str, iVar2, sVar3, i5, i11);
                    return;
                }
                return;
            }
            i16 |= 24576;
            iVar2 = iVar;
            i14 = i11 & 32;
            if (i14 != 0) {
            }
            if ((74899 & i15) == 74898) {
                if (i17 == 0) {
                }
                if (i13 != 0) {
                }
                if (i14 == 0) {
                }
                if (dVar instanceof y20.a) {
                }
                sVar3 = sVar4;
                lVar2 = lVar3;
            }
            t1VarU = tVar2.u();
            if (t1VarU != null) {
            }
        }
        lVar2 = lVar;
        if ((i5 & 3072) == 0) {
        }
        i13 = i11 & 16;
        if (i13 != 0) {
        }
        iVar2 = iVar;
        i14 = i11 & 32;
        if (i14 != 0) {
        }
        if ((74899 & i15) == 74898) {
        }
        t1VarU = tVar2.u();
        if (t1VarU != null) {
        }
    }

    public static final h2.c g(b3.t1 t1Var, y yVar, h2.c cVar) {
        return cVar.j(t1Var.i(yVar, false).d());
    }

    public static u60.e i(h60.h hVar, u60.e eVar) {
        HashMap map = hVar.f59486a;
        u60.e eVar2 = (u60.e) map.get(Integer.valueOf(System.identityHashCode(eVar)));
        if (eVar2 != null) {
            return eVar2;
        }
        List list = eVar.tokens();
        ArrayList arrayList = new ArrayList(list.size());
        u60.a aVar = new u60.a(eVar.name(), arrayList);
        map.put(Integer.valueOf(System.identityHashCode(eVar)), aVar);
        Iterator it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(j(hVar, (u60.j) it.next()));
        }
        return aVar;
    }

    public static u60.j j(h60.h hVar, u60.j jVar) {
        HashMap map = hVar.f59486a;
        u60.j jVar2 = (u60.j) map.get(Integer.valueOf(System.identityHashCode(jVar)));
        if (jVar2 != null) {
            return jVar2;
        }
        ArrayList arrayList = jVar.f90660b;
        ArrayList arrayList2 = new ArrayList(arrayList.size());
        u60.j jVar3 = new u60.j(jVar.f90659a, arrayList2);
        map.put(Integer.valueOf(System.identityHashCode(jVar)), jVar3);
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            u60.d dVar = (u60.d) it.next();
            u60.d dVar2 = (u60.d) map.get(Integer.valueOf(System.identityHashCode(dVar)));
            if (dVar2 == null) {
                u60.e eVar = dVar.f90650e;
                u60.d dVar3 = new u60.d(dVar.f90646a, dVar.f90647b, dVar.f90648c, dVar.f90649d, eVar != null ? i(hVar, eVar) : null);
                map.put(Integer.valueOf(System.identityHashCode(dVar)), dVar3);
                dVar2 = dVar3;
            }
            arrayList2.add(dVar2);
        }
        return jVar3;
    }

    public static final int p(long j11) {
        return (int) (j11 >> 32);
    }

    public static final int q(Object... objArr) {
        return Objects.hash(Arrays.copyOf(objArr, objArr.length));
    }

    public static void r(Context context) {
        Context applicationContext;
        PackageManager packageManager;
        ApplicationInfo applicationInfo;
        Bundle bundle;
        if (p6.f.E(context).getBoolean("proxy_notification_initialized", false)) {
            return;
        }
        try {
            applicationContext = context.getApplicationContext();
            packageManager = applicationContext.getPackageManager();
        } catch (PackageManager.NameNotFoundException unused) {
        }
        boolean z11 = (packageManager == null || (applicationInfo = packageManager.getApplicationInfo(applicationContext.getPackageName(), 128)) == null || (bundle = applicationInfo.metaData) == null || !bundle.containsKey("firebase_messaging_notification_delegation_enabled")) ? true : applicationInfo.metaData.getBoolean("firebase_messaging_notification_delegation_enabled");
        if (Build.VERSION.SDK_INT >= 29) {
            new com.amplitude.android.internal.gestures.c(context, z11, new fi.j(), 4).run();
        } else {
            Tasks.d(null);
        }
    }

    public static boolean s(BigInteger bigInteger, BigInteger bigInteger2, ECParameterSpec eCParameterSpec) {
        EllipticCurve curve = eCParameterSpec.getCurve();
        BigInteger a11 = curve.getA();
        BigInteger b11 = curve.getB();
        BigInteger p11 = ((ECFieldFp) curve.getField()).getP();
        return bigInteger2.pow(2).mod(p11).equals(bigInteger.pow(3).add(a11.multiply(bigInteger)).add(b11).mod(p11));
    }

    public static final q t(q qVar, q qVar2, float f11) {
        return new q(h0.c(f11, qVar.f95030a, qVar2.f95030a), h0.c(f11, qVar.f95031b, qVar2.f95031b));
    }

    public static LocaleSpan u(t3.b bVar) {
        ArrayList arrayList = new ArrayList(b70.c.u0(bVar, 10));
        Iterator it = bVar.f88511a.iterator();
        while (it.hasNext()) {
            arrayList.add(((t3.a) it.next()).f88509a);
        }
        Locale[] localeArr = (Locale[]) arrayList.toArray(new Locale[0]);
        return new LocaleSpan(new LocaleList((Locale[]) Arrays.copyOf(localeArr, localeArr.length)));
    }

    public static void v(u3.g gVar, t3.b bVar) {
        ArrayList arrayList = new ArrayList(b70.c.u0(bVar, 10));
        Iterator it = bVar.f88511a.iterator();
        while (it.hasNext()) {
            arrayList.add(((t3.a) it.next()).f88509a);
        }
        Locale[] localeArr = (Locale[]) arrayList.toArray(new Locale[0]);
        gVar.setTextLocales(new LocaleList((Locale[]) Arrays.copyOf(localeArr, localeArr.length)));
    }

    public static final ResolvableString w(Throwable th2) {
        StripeError stripeError;
        String str;
        String str2;
        Intrinsics.g(th2, "<this>");
        if ((th2 instanceof APIConnectionException ? (APIConnectionException) th2 : null) != null) {
            return zg.a.G(2132019854);
        }
        LocalStripeException localStripeException = th2 instanceof LocalStripeException ? (LocalStripeException) th2 : null;
        if (localStripeException != null && (str2 = localStripeException.f42560f) != null) {
            return zg.a.H(str2);
        }
        StripeException stripeException = th2 instanceof StripeException ? (StripeException) th2 : null;
        return (stripeException == null || (stripeError = stripeException.f42563a) == null || (str = stripeError.f42551b) == null) ? zg.a.G(2132020022) : zg.a.H(str);
    }

    public static final y20.c x(o2.g gVar) {
        return new y20.c(gVar);
    }

    public abstract qg.k h();

    public abstract Typeface k(Context context, q4.e eVar, Resources resources, int i5);

    public abstract Typeface l(Context context, x4.h[] hVarArr, int i5);

    public Typeface m(Context context, List list, int i5) {
        throw new IllegalStateException("createFromFontInfoWithFallback must only be called on API 29+");
    }

    public Typeface n(Context context, Resources resources, int i5, String str, int i11) {
        File fileF = p6.f.F(context);
        if (fileF == null) {
            return null;
        }
        try {
            if (p6.f.u(fileF, resources, i5)) {
                return Typeface.createFromFile(fileF.getPath());
            }
            return null;
        } catch (RuntimeException unused) {
            return null;
        } finally {
            fileF.delete();
        }
    }

    public x4.h o(x4.h[] hVarArr, int i5) {
        int i11 = (i5 & 1) == 0 ? Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE : Sdk.SDKError.Reason.DNS_OVER_HTTP_FAILED_VALUE;
        boolean z11 = (i5 & 2) != 0;
        x4.h hVar = null;
        int i12 = LayoutNode.NotPlacedPlaceOrder;
        for (x4.h hVar2 : hVarArr) {
            int iAbs = (Math.abs(hVar2.f95087c - i11) * 2) + (hVar2.f95088d == z11 ? 0 : 1);
            if (hVar == null || i12 > iAbs) {
                hVar = hVar2;
                i12 = iAbs;
            }
        }
        return hVar;
    }
}
