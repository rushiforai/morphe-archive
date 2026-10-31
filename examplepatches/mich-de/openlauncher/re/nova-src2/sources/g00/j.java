package g00;

import android.content.Context;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import b10.q;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.mobilesdk.internal.ui.screens.f1;
import com.instabridge.mobilesdk.internal.ui.screens.t;
import com.instabridge.mobilesdk.internal.ui.screens.z;
import com.teslacoilsw.conditions.ConditionSetId;
import com.teslacoilsw.conditions.ConditionSetRecord;
import com.teslacoilsw.conditions.rules.ConditionModel;
import cw.l2;
import e10.o3;
import e10.z2;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KFunction;
import kotlin.text.MatcherMatchResult$groupValues$1;
import kotlin.text.Regex;
import l1.g9;
import l1.l5;
import p1.e1;
import p1.n;
import p1.o;
import p1.o0;
import p1.t1;
import p6.l0;
import p6.z0;
import ps.i0;
import r10.n0;
import t70.j0;
import u10.c0;
import u10.e0;
import u10.h0;
import u10.m;
import u10.p0;
import u10.q0;
import u10.r0;
import u10.w;
import u10.w0;

/* loaded from: classes4.dex */
public abstract class j {

    /* renamed from: a, reason: collision with root package name */
    public static final Regex f56824a = new Regex("packageName=(.*?), className=(.*?), userSerial=(.*?)\\)");

    public static final void a(String str, Function0 function0, o oVar, int i5) {
        int i11;
        Context context;
        jx.k kVar;
        j0 j0Var;
        boolean z11;
        com.teslacoilsw.launcher.search.hero.c cVar;
        t tVar;
        Object next;
        jx.k kVar2;
        a aVar;
        Object next2;
        com.teslacoilsw.launcher.search.hero.a aVar2;
        boolean z12;
        Object tVar2;
        String str2 = str;
        Function0 function02 = function0;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(-619900330);
        if ((i5 & 6) == 0) {
            i11 = (tVar3.f(str2 != null ? new e20.h(str2) : null) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        int i12 = i11 | (tVar3.h(function02) ? 32 : 16);
        if ((i12 & 19) == 18 && tVar3.E()) {
            tVar3.V();
        } else {
            Context context2 = (Context) tVar3.j(AndroidCompositionLocals_androidKt.f14166b);
            e20.d dVar = new e20.d(context2);
            jx.k kVar3 = new jx.k(context2);
            List list = (List) androidx.compose.runtime.d.a(dVar.b(), null, null, tVar3, 48, 2).getValue();
            List list2 = (List) androidx.compose.runtime.d.a(((t5.g) jx.e.f70405b.getValue(kVar3.f70414a, jx.e.f70404a[0])).getData(), null, null, tVar3, 48, 2).getValue();
            if (list == null || list2 == null) {
                tVar3.b0(-369354624);
                str2 = str;
                l5.b(null, 0L, 0.0f, 0L, 0, tVar3, 0, 31);
                tVar3 = tVar3;
                tVar3.p(false);
            } else {
                tVar3.b0(-369127239);
                Object objP = tVar3.P();
                Object obj = n.f81514a;
                if (objP == obj) {
                    objP = o0.i(EmptyCoroutineContext.f71803a, tVar3);
                    tVar3.m0(objP);
                }
                j0 j0Var2 = (j0) objP;
                tVar3.b0(-704646309);
                if (str2 != null) {
                    tVar3.b0(-704645299);
                    boolean zH = ((i12 & 14) == 4) | ((i12 & 112) == 32) | tVar3.h(j0Var2) | tVar3.h(dVar) | tVar3.h(context2);
                    Object objP2 = tVar3.P();
                    if (zH || objP2 == obj) {
                        context = context2;
                        kVar = kVar3;
                        j0Var = j0Var2;
                        cVar = null;
                        tVar2 = new t((Object) function02, j0Var, (Object) dVar, (Object) str2, (Object) context, 6);
                        tVar3.m0(tVar2);
                    } else {
                        context = context2;
                        j0Var = j0Var2;
                        tVar2 = objP2;
                        cVar = null;
                        kVar = kVar3;
                    }
                    z11 = false;
                    tVar3.p(false);
                    tVar = (Function0) tVar2;
                } else {
                    context = context2;
                    kVar = kVar3;
                    j0Var = j0Var2;
                    z11 = false;
                    cVar = null;
                    tVar = null;
                }
                tVar3.p(z11);
                tVar3.b0(-704613752);
                if (str2 == null) {
                    aVar = new a(new w(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, r10.o0.d(z2.v(2131231789, "com.teslacoilsw.launcher"), n0.f85193c), cVar, EmptyList.f71733a), true, b70.h.f17594a, true);
                    kVar2 = kVar;
                } else {
                    Iterator it = list.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            next = cVar;
                            break;
                        } else {
                            next = it.next();
                            if (Intrinsics.b(((e20.k) next).f52040b, str2)) {
                                break;
                            }
                        }
                    }
                    e20.k kVarB = (e20.k) next;
                    if (kVarB == null) {
                        kotlin.text.b bVarB = f56824a.b(str2);
                        if (bVarB != null) {
                            kVar2 = kVar;
                            aVar2 = new com.teslacoilsw.launcher.search.hero.a((String) ((MatcherMatchResult$groupValues$1) bVarB.a()).get(1), (String) ((MatcherMatchResult$groupValues$1) bVarB.a()).get(2), Long.parseLong((String) ((MatcherMatchResult$groupValues$1) bVarB.a()).get(3)));
                        } else {
                            kVar2 = kVar;
                            aVar2 = null;
                        }
                        if (aVar2 == null) {
                            g9.b("Card being updated...", null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, tVar3, 6, 0, 131070);
                            tVar3.p(false);
                            tVar3.p(false);
                            t1 t1VarU = tVar3.u();
                            if (t1VarU != null) {
                                t1VarU.f81583d = new z(str2, function02, i5, 2);
                                return;
                            }
                            return;
                        }
                        EmptyList emptyList = EmptyList.f71733a;
                        kVarB = zg.a.b(emptyList, new u10.c("App card", aVar2, emptyList, 8));
                    } else {
                        kVar2 = kVar;
                    }
                    e0 e0Var = kVarB.f52041c;
                    boolean z13 = kVarB.f52042d;
                    List list3 = kVarB.f52039a;
                    ArrayList arrayList = new ArrayList();
                    Iterator it2 = list3.iterator();
                    while (it2.hasNext()) {
                        String str3 = ((ConditionSetId) it2.next()).f45529a;
                        Iterator it3 = list2.iterator();
                        while (true) {
                            if (!it3.hasNext()) {
                                next2 = null;
                                break;
                            } else {
                                next2 = it3.next();
                                if (Intrinsics.b(((ConditionSetRecord) next2).f45532a, str3)) {
                                    break;
                                }
                            }
                        }
                        ConditionSetRecord conditionSetRecord = (ConditionSetRecord) next2;
                        Pair pair = conditionSetRecord == null ? null : new Pair(new ConditionSetId(str3), conditionSetRecord);
                        if (pair != null) {
                            arrayList.add(pair);
                        }
                    }
                    aVar = new a(e0Var, z13, MapsKt.r0(arrayList), b(str2, e0Var.a(), list));
                }
                Object objF = a2.c.f(-704555738, tVar3, false);
                if (objF == obj) {
                    objF = androidx.compose.runtime.d.k(aVar);
                    tVar3.m0(objF);
                }
                e1 e1Var = (e1) objF;
                tVar3.p(false);
                a aVar3 = (a) e1Var.getValue();
                boolean z14 = !aVar.equals((a) e1Var.getValue());
                tVar3.b0(-704472710);
                int i13 = i12 & 14;
                boolean zH2 = tVar3.h(list) | (i13 == 4);
                Object objP3 = tVar3.P();
                if (zH2 || objP3 == obj) {
                    objP3 = new q(21, list, str2, e1Var);
                    tVar3.m0(objP3);
                }
                Function1 function1 = (Function1) objP3;
                tVar3.p(false);
                tVar3.b0(-704466367);
                jx.k kVar4 = kVar2;
                boolean zH3 = ((i12 & 112) == 32) | tVar3.h(j0Var) | tVar3.h(dVar) | (i13 == 4) | tVar3.h(kVar4) | tVar3.h(context);
                Object objP4 = tVar3.P();
                if (zH3 || objP4 == obj) {
                    z12 = false;
                    Object bVar = new b(function0, j0Var, e1Var, dVar, str2, kVar4, context);
                    tVar3.m0(bVar);
                    objP4 = bVar;
                } else {
                    z12 = false;
                }
                tVar3.p(z12);
                c(aVar3, z14, function1, function0, tVar, (Function0) ((KFunction) objP4), tVar3, (i12 << 6) & 7168);
                function02 = function0;
                tVar3.p(z12);
                str2 = str;
            }
        }
        t1 t1VarU2 = tVar3.u();
        if (t1VarU2 != null) {
            t1VarU2.f81583d = new z(str2, function02, i5, 3);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x003d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final boolean b(String str, String str2, List list) {
        Object next;
        String strI = l2.I(str2);
        if (!r70.k.U0(strI)) {
            Iterator it = list.iterator();
            while (true) {
                if (!it.hasNext()) {
                    next = null;
                    break;
                }
                next = it.next();
                e20.k kVar = (e20.k) next;
                if (l2.I(kVar.f52041c.a()).equals(strI)) {
                    boolean z11 = !(str == null ? false : Intrinsics.b(kVar.f52040b, str));
                    if (z11) {
                        break;
                    }
                }
            }
            if (next == null) {
                return true;
            }
        }
        return false;
    }

    public static final void c(a aVar, boolean z11, Function1 function1, Function0 function0, Function0 function02, Function0 function03, o oVar, int i5) {
        int i11;
        boolean z12;
        Function1 function12;
        Function0 function04;
        Function0 function05;
        Function0 function06;
        l0 l0Var;
        p1.t tVar;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-136877376);
        if ((i5 & 6) == 0) {
            i11 = (tVar2.h(aVar) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            z12 = z11;
            i11 |= tVar2.g(z12) ? 32 : 16;
        } else {
            z12 = z11;
        }
        if ((i5 & 384) == 0) {
            function12 = function1;
            i11 |= tVar2.h(function12) ? 256 : 128;
        } else {
            function12 = function1;
        }
        if ((i5 & 3072) == 0) {
            function04 = function0;
            i11 |= tVar2.h(function04) ? 2048 : 1024;
        } else {
            function04 = function0;
        }
        if ((i5 & 24576) == 0) {
            function05 = function02;
            i11 |= tVar2.h(function05) ? 16384 : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        } else {
            function05 = function02;
        }
        if ((196608 & i5) == 0) {
            function06 = function03;
            i11 |= tVar2.h(function06) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        } else {
            function06 = function03;
        }
        if ((74899 & i11) == 74898 && tVar2.E()) {
            tVar2.V();
            tVar = tVar2;
        } else {
            l0 l0VarP = i0.p(new z0[0], tVar2);
            tVar2.b0(-641079622);
            boolean zH = ((i11 & 112) == 32) | tVar2.h(aVar) | ((i11 & 896) == 256) | ((i11 & 7168) == 2048) | ((57344 & i11) == 16384) | ((i11 & 458752) == 131072) | tVar2.h(l0VarP);
            Object objP = tVar2.P();
            if (zH || objP == n.f81514a) {
                l0Var = l0VarP;
                o3 o3Var = new o3(aVar, z12, function12, function04, function05, function06, l0Var);
                tVar2.m0(o3Var);
                objP = o3Var;
            } else {
                l0Var = l0VarP;
            }
            tVar2.p(false);
            tVar = tVar2;
            ps.j0.d(l0Var, "CardDetailsScreen", null, null, null, null, null, null, null, (Function1) objP, tVar, 48, 1020);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new f1(aVar, z11, function1, function0, function02, function03, i5);
        }
    }

    public static final void d(a aVar, Function1 function1, ConditionModel conditionModel) {
        ConditionSetRecord conditionSetRecord;
        ConditionSetRecord conditionSetRecord2 = (ConditionSetRecord) b70.g.X0(aVar.f56793c.values());
        if (conditionSetRecord2 != null) {
            conditionSetRecord = new ConditionSetRecord(conditionSetRecord2.f45532a, b70.g.u1(conditionSetRecord2.f45533b, conditionModel));
        } else {
            conditionSetRecord = new ConditionSetRecord(UUID.randomUUID().toString(), ul.b.P(conditionModel));
        }
        function1.invoke(a.a(aVar, null, false, b70.k.e0(new Pair(new ConditionSetId(conditionSetRecord.f45532a), conditionSetRecord)), false, 11));
    }

    public static final boolean e(a aVar) {
        if (!aVar.f56794d) {
            return false;
        }
        e0 e0Var = aVar.f56791a;
        if (e0Var instanceof w) {
            w wVar = (w) e0Var;
            return (wVar.f90429e == null && wVar.f90430f.isEmpty()) ? false : true;
        }
        if ((e0Var instanceof u10.c) || (e0Var instanceof u10.z) || (e0Var instanceof p0) || (e0Var instanceof q0) || (e0Var instanceof w0) || (e0Var instanceof c0) || (e0Var instanceof h0)) {
            return true;
        }
        if ((e0Var instanceof u10.f) || (e0Var instanceof r0) || (e0Var instanceof m)) {
            return false;
        }
        throw new NoWhenBranchMatchedException();
    }
}
