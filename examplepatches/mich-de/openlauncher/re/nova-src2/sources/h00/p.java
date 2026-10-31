package h00;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.format.DateFormat;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import b.c0;
import b10.b0;
import b2.r;
import com.teslacoilsw.conditions.ConditionSetId;
import com.teslacoilsw.conditions.ConditionSetRecord;
import com.teslacoilsw.conditions.rules.ConditionModel;
import e00.u5;
import e00.z;
import e10.z2;
import f00.i0;
import g20.w;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Pattern;
import k0.i2;
import k0.x;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import l1.g7;
import mx.g0;
import nova.branch.engage.sesame_lite.api_integration.ExternalLink;
import p1.a0;
import p1.e1;
import p1.g1;
import p1.n1;
import p1.o0;
import p1.t;
import p1.t1;
import t70.j0;
import t70.m0;
import u10.p0;

/* loaded from: classes4.dex */
public abstract class p {

    /* renamed from: a, reason: collision with root package name */
    public static final Pattern f58832a = Pattern.compile("<meta\\s+content=\"([^\"]+)\"\\s+property=\"og:image\"\\s*>");

    public static final void a(int i5, Function0 function0, Function1 function1, p1.o oVar) {
        e1 e1Var;
        Function1 function12;
        t tVar = (t) oVar;
        tVar.d0(-225339220);
        int i11 = (tVar.h(function1) ? 32 : 16) | i5;
        if ((i11 & 19) == 18 && tVar.E()) {
            tVar.V();
            function12 = function1;
        } else {
            tVar.b0(-653079510);
            Object objP = tVar.P();
            g1 g1Var = p1.n.f81514a;
            if (objP == g1Var) {
                objP = androidx.compose.runtime.d.k(null);
                tVar.m0(objP);
            }
            e1 e1Var2 = (e1) objP;
            Object objF = a2.c.f(-653077688, tVar, false);
            if (objF == g1Var) {
                objF = androidx.compose.runtime.d.k(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                tVar.m0(objF);
            }
            e1 e1Var3 = (e1) objF;
            tVar.p(false);
            boolean z11 = ((i0) e1Var2.getValue()) != null;
            Object objP2 = tVar.P();
            if (objP2 == g1Var) {
                objP2 = o0.i(EmptyCoroutineContext.f71803a, tVar);
                tVar.m0(objP2);
            }
            j0 j0Var = (j0) objP2;
            i0 i0Var = (i0) e1Var2.getValue();
            tVar.b0(-653072748);
            boolean zF = tVar.f(i0Var);
            Object objP3 = tVar.P();
            if (zF || objP3 == g1Var) {
                objP3 = androidx.compose.runtime.d.k(null);
                tVar.m0(objP3);
            }
            e1 e1Var4 = (e1) objP3;
            tVar.p(false);
            String strY = x7.f.Y(tVar, 2132017238);
            tVar.b0(-653064228);
            boolean zH = tVar.h(j0Var) | tVar.f(e1Var4) | ((i11 & 112) == 32);
            Object objP4 = tVar.P();
            if (zH || objP4 == g1Var) {
                e1Var = e1Var3;
                com.instabridge.mobilesdk.internal.ui.screens.t tVar2 = new com.instabridge.mobilesdk.internal.ui.screens.t(j0Var, function1, e1Var2, e1Var4, e1Var, 7);
                function12 = function1;
                tVar.m0(tVar2);
                objP4 = tVar2;
            } else {
                function12 = function1;
                e1Var = e1Var3;
            }
            tVar.p(false);
            lb0.b.b(strY, z11, null, null, function0, null, (Function0) objP4, x1.f.d(-665209918, new b0(17, e1Var4, e1Var2, e1Var), tVar), tVar, 12607488, 44);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new e(function0, function12, i5, 0);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void b(e20.d dVar, jx.k kVar, boolean z11, boolean z12, g7 g7Var, p1.o oVar, int i5) {
        j0 j0Var;
        Throwable th2;
        w wVar;
        Object obj;
        p0 p0Var;
        j0 j0Var2;
        ConditionSetRecord conditionSetRecord;
        ExternalLink externalLink;
        String str;
        ConditionSetRecord conditionSetRecord2;
        EmptyList emptyList;
        Object obj2;
        int i11;
        String strH;
        Object obj3;
        Function0 function0;
        jx.k kVar2 = kVar;
        t tVar = (t) oVar;
        tVar.d0(-212386305);
        boolean z13 = z11;
        boolean z14 = z12;
        if (((i5 | (tVar.h(dVar) ? 4 : 2) | (tVar.h(kVar2) ? 32 : 16) | (tVar.g(z13) ? 256 : 128) | (tVar.g(z14) ? 2048 : 1024)) & 9363) == 9362 && tVar.E()) {
            tVar.V();
        } else {
            Object objP = tVar.P();
            g1 g1Var = p1.n.f81514a;
            if (objP == g1Var) {
                objP = o0.i(EmptyCoroutineContext.f71803a, tVar);
                tVar.m0(objP);
            }
            j0 j0Var3 = (j0) objP;
            Context context = g0.f77088a;
            w wVarC = g0.c();
            w70.m mVarB = dVar.b();
            EmptyList emptyList2 = EmptyList.f71733a;
            e1 e1VarA = androidx.compose.runtime.d.a(mVarB, emptyList2, null, tVar, 48, 2);
            e1 e1VarA2 = androidx.compose.runtime.d.a(((t5.g) jx.e.f70405b.getValue(kVar2.f70414a, jx.e.f70404a[0])).getData(), emptyList2, null, tVar, 48, 2);
            t tVar2 = tVar;
            tVar2.b0(1135221851);
            Object objP2 = tVar2.P();
            if (objP2 == g1Var) {
                objP2 = androidx.compose.runtime.d.k(emptyList2);
                tVar2.m0(objP2);
            }
            e1 e1Var = (e1) objP2;
            tVar2.p(false);
            Unit unit = Unit.f71706a;
            tVar2.b0(1135224155);
            boolean zH = tVar2.h(wVarC);
            Object objP3 = tVar2.P();
            Continuation continuation = null;
            if (zH || objP3 == g1Var) {
                objP3 = new dm.c(wVarC, e1Var, continuation, 22);
                tVar2.m0(objP3);
            }
            tVar2.p(false);
            o0.f(unit, (Function2) objP3, tVar2);
            tVar2.b0(1135231253);
            Object objP4 = tVar2.P();
            if (objP4 == g1Var) {
                objP4 = androidx.compose.runtime.d.k(Boolean.FALSE);
                tVar2.m0(objP4);
            }
            e1 e1Var2 = (e1) objP4;
            tVar2.p(false);
            tVar2.b0(1135244398);
            if (((Boolean) e1Var2.getValue()).booleanValue()) {
                tVar2.b0(1135246284);
                Object objP5 = tVar2.P();
                if (objP5 == g1Var) {
                    objP5 = new u5(e1Var2, 23);
                    tVar2.m0(objP5);
                }
                Function0 function02 = (Function0) objP5;
                tVar2.p(false);
                tVar2.b0(1135247368);
                boolean zH2 = tVar2.h(j0Var3) | tVar2.h(wVarC) | tVar2.h(dVar);
                Object objP6 = tVar2.P();
                if (zH2 || objP6 == g1Var) {
                    j0Var = j0Var3;
                    function0 = function02;
                    wVar = wVarC;
                    th2 = null;
                    c1.a aVar = new c1.a(e1Var, e1Var2, j0Var, wVar, dVar, 6);
                    tVar2.m0(aVar);
                    objP6 = aVar;
                } else {
                    th2 = null;
                    wVar = wVarC;
                    function0 = function02;
                    j0Var = j0Var3;
                }
                tVar2.p(false);
                a(6, function0, (Function1) objP6, tVar2);
            } else {
                j0Var = j0Var3;
                th2 = null;
                wVar = wVarC;
            }
            tVar2.p(false);
            x xVarA = k0.w.a(k0.k.f70657c, b2.d.f17009m, tVar2, 0);
            int iHashCode = Long.hashCode(tVar2.T);
            n1 n1VarL = tVar2.l();
            r rVar = r.f17024a;
            b2.t tVarI = fg.a.I(rVar, tVar2);
            b3.l.Po.getClass();
            Function0 function03 = b3.k.f17270b;
            tVar2.f0();
            e1 e1Var3 = e1Var2;
            if (tVar2.S) {
                tVar2.k(function03);
            } else {
                tVar2.p0();
            }
            a0.j(xVarA, b3.k.f17275g, tVar2);
            a0.j(n1VarL, b3.k.f17274f, tVar2);
            b3.i iVar = b3.k.f17278j;
            if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, tVar2, iHashCode, iVar);
            }
            a0.j(tVarI, b3.k.f17272d, tVar2);
            Context context2 = (Context) tVar2.j(AndroidCompositionLocals_androidKt.f14166b);
            tVar2.b0(-322968743);
            Iterator it = ((List) e1Var.getValue()).iterator();
            while (it.hasNext()) {
                ExternalLink externalLink2 = (ExternalLink) it.next();
                p0 p0VarE = e(externalLink2);
                Iterator it2 = ((Iterable) e1VarA.getValue()).iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        obj = th2;
                        break;
                    }
                    Object next = it2.next();
                    if (Intrinsics.b(((e20.k) next).f52041c, p0VarE)) {
                        obj = next;
                        break;
                    }
                }
                e20.k kVar3 = (e20.k) obj;
                if (kVar3 != null) {
                    Iterator it3 = ((Iterable) e1VarA2.getValue()).iterator();
                    while (true) {
                        if (!it3.hasNext()) {
                            p0Var = p0VarE;
                            j0Var2 = j0Var;
                            obj3 = th2;
                            break;
                        }
                        Object next2 = it3.next();
                        Iterator it4 = it3;
                        p0Var = p0VarE;
                        j0Var2 = j0Var;
                        if (kVar3.f52039a.contains(new ConditionSetId(((ConditionSetRecord) next2).f45532a))) {
                            obj3 = next2;
                            break;
                        } else {
                            it3 = it4;
                            p0VarE = p0Var;
                            j0Var = j0Var2;
                        }
                    }
                    conditionSetRecord = (ConditionSetRecord) obj3;
                } else {
                    p0Var = p0VarE;
                    j0Var2 = j0Var;
                    conditionSetRecord = th2;
                }
                tVar2.Z(-322959938, externalLink2);
                String str2 = externalLink2.f78378b;
                Object obj4 = conditionSetRecord != 0 ? conditionSetRecord.f45533b : th2;
                if (obj4 != null) {
                    externalLink = externalLink2;
                    ArrayList arrayList = new ArrayList();
                    ConditionSetRecord conditionSetRecord3 = conditionSetRecord;
                    for (Object obj5 : (Iterable) obj4) {
                        String str3 = str2;
                        ConditionSetRecord conditionSetRecord4 = conditionSetRecord3;
                        if (obj5 instanceof ConditionModel.TimeOfDayDurationModel) {
                            arrayList.add(obj5);
                        }
                        str2 = str3;
                        conditionSetRecord3 = conditionSetRecord4;
                    }
                    str = str2;
                    conditionSetRecord2 = conditionSetRecord3;
                    emptyList = arrayList;
                } else {
                    externalLink = externalLink2;
                    str = str2;
                    conditionSetRecord2 = conditionSetRecord;
                    emptyList = EmptyList.f71733a;
                }
                if (obj4 != null) {
                    ArrayList arrayList2 = new ArrayList();
                    for (Object obj6 : (Iterable) obj4) {
                        if (obj6 instanceof ConditionModel.WeatherChangeModel) {
                            arrayList2.add(obj6);
                        }
                    }
                    obj2 = (ConditionModel.WeatherChangeModel) b70.g.Y0(arrayList2);
                } else {
                    obj2 = th2;
                }
                EmptyList emptyList3 = emptyList;
                if ((emptyList3 instanceof Collection) && emptyList3.isEmpty()) {
                    i11 = 0;
                } else {
                    Iterator<E> it5 = emptyList3.iterator();
                    i11 = 0;
                    while (it5.hasNext()) {
                        if (!((ConditionModel.TimeOfDayDurationModel) it5.next()).f45545d.isEmpty() && (i11 = i11 + 1) < 0) {
                            ul.b.d0();
                            throw th2;
                        }
                    }
                }
                boolean z15 = obj2 != null;
                if (!z15 && i11 == 0) {
                    strH = "Never";
                } else if (z15) {
                    strH = c0.k("When changing", i11 == 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : c0.i(i11, " and ", " schedules"));
                } else {
                    strH = a2.c.h(i11, " schedules");
                }
                boolean z16 = z13;
                w wVar2 = wVar;
                e1 e1Var4 = e1VarA;
                t tVar3 = tVar2;
                e1 e1Var5 = e1Var3;
                Iterator it6 = it;
                r rVar2 = rVar;
                a.a.o(str, null, strH, null, null, x1.f.d(-862856561, new n(externalLink, conditionSetRecord2, z14, z16, j0Var2, dVar, p0Var, kVar2, wVar2, g7Var, context2, e1Var), tVar3), tVar3, 196608, 26);
                tVar3.p(false);
                i2.b(androidx.compose.foundation.layout.e.o(rVar2, 8), tVar3);
                kVar2 = kVar;
                z14 = z12;
                tVar2 = tVar3;
                wVar = wVar2;
                rVar = rVar2;
                it = it6;
                e1Var3 = e1Var5;
                j0Var = j0Var2;
                e1VarA = e1Var4;
                z13 = z11;
            }
            t tVar4 = tVar2;
            e1 e1Var6 = e1Var3;
            tVar4.p(false);
            x1.e eVar = c.f58771b;
            x1.e eVar2 = c.f58772c;
            tVar4.b0(-322841178);
            Object objP7 = tVar4.P();
            if (objP7 == g1Var) {
                objP7 = new u5(e1Var6, 24);
                tVar4.m0(objP7);
            }
            tVar4.p(false);
            ky.l.d(null, false, eVar, eVar2, false, (Function0) objP7, null, null, null, tVar4, 200064, 467);
            tVar = tVar4;
            tVar.p(true);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new d(dVar, kVar, z11, z12, g7Var, i5, 0);
        }
    }

    public static final void c(p6.t tVar, p1.o oVar, int i5) {
        p6.t tVar2;
        t tVar3 = (t) oVar;
        tVar3.d0(534499682);
        int i11 = (tVar3.h(tVar) ? 4 : 2) | i5;
        if ((i11 & 3) == 2 && tVar3.E()) {
            tVar3.V();
            tVar2 = tVar;
        } else {
            Context context = (Context) tVar3.j(AndroidCompositionLocals_androidKt.f14166b);
            e20.d dVar = new e20.d(context);
            jx.k kVar = new jx.k(context);
            boolean zIs24HourFormat = DateFormat.is24HourFormat(context);
            boolean z11 = Calendar.getInstance().getFirstDayOfWeek() == 1;
            tVar3.b0(1135179475);
            Object objP = tVar3.P();
            if (objP == p1.n.f81514a) {
                objP = new g7();
                tVar3.m0(objP);
            }
            g7 g7Var = (g7) objP;
            tVar3.p(false);
            tVar2 = tVar;
            z2.h(2132018205, tVar2, x1.f.d(-616106418, new h(g7Var, 0), tVar3), null, null, null, x1.f.d(1940058853, new k(dVar, kVar, z11, zIs24HourFormat, g7Var), tVar3), tVar3, ((i11 << 3) & 112) | 1573248, 56);
        }
        t1 t1VarU = tVar3.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new z(tVar2, i5, 5);
        }
    }

    public static final void d(j0 j0Var, w wVar, e20.d dVar, e1 e1Var) {
        m0.t(j0Var, null, null, new dm.c(wVar, dVar, e1Var, null, 23), 3);
    }

    public static final p0 e(ExternalLink externalLink) {
        String str = externalLink.f78381e;
        String str2 = externalLink.f78378b;
        String str3 = externalLink.f78380d;
        Uri data = Intent.parseUri(str, 0).getData();
        if (!Intrinsics.b(data != null ? data.getScheme() : null, "geo")) {
            if (!Intrinsics.b(data != null ? data.getScheme() : null, "https") || !Intrinsics.b(data.getAuthority(), "www.google.com") || !Intrinsics.b(data.getPath(), "/maps/dir/")) {
                return new p0(externalLink.f78377a, str2, str3 != null ? Uri.parse(str3) : null, 10);
            }
            String queryParameter = data.getQueryParameter("destination");
            Intrinsics.d(queryParameter);
            return new p0(queryParameter, data.getQueryParameter("destination_place_id"), externalLink.f78378b, null, str3 != null ? Uri.parse(str3) : null);
        }
        String query = data.getQuery();
        String str4 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (query != null) {
            String strM1 = r70.k.m1(query, "q=", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            if (r70.k.U0(strM1)) {
                strM1 = null;
            }
            if (strM1 != null) {
                str4 = strM1;
            }
        }
        return new p0(str4, str2, str3 != null ? Uri.parse(str3) : null, 2);
    }
}
