package androidx.compose.animation;

import a5.d1;
import androidx.compose.runtime.d;
import androidx.compose.runtime.snapshots.SnapshotStateList;
import androidx.compose.ui.Modifier$Node;
import b0.f1;
import b0.g1;
import b0.k;
import b0.k0;
import b0.s1;
import b0.v;
import b0.w;
import b2.f;
import b2.r;
import b2.t;
import b3.i;
import b3.j1;
import b3.l;
import c0.c2;
import c0.f2;
import c0.g2;
import c0.v1;
import c3.q2;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ListIterator;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import p1.a0;
import p1.e1;
import p1.n;
import p1.n1;
import p1.o;
import p1.s2;
import p1.t1;
import x1.e;
import z.o0;
import z.z0;

/* loaded from: classes2.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final long f13869a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int f13870b = 0;

    static {
        long j11 = Integer.MIN_VALUE;
        f13869a = (j11 & 4294967295L) | (j11 << 32);
    }

    public static final void a(c2 c2Var, t tVar, Function1 function1, f fVar, Function1 function12, e eVar, o oVar, int i5) {
        int i11;
        Function1 function13;
        p1.t tVar2;
        g2 g2Var;
        w wVar;
        SnapshotStateList snapshotStateList;
        final w wVar2;
        final v1 v1VarB;
        boolean z11;
        Function1 function14 = function1;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(511725103);
        if ((i5 & 6) == 0) {
            i11 = (tVar3.f(c2Var) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar3.f(tVar) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= tVar3.h(function14) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i11 |= tVar3.f(fVar) ? 2048 : 1024;
        }
        if ((i5 & 24576) == 0) {
            i11 |= tVar3.h(function12) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        e eVar2 = eVar;
        if ((196608 & i5) == 0) {
            i11 |= tVar3.h(eVar2) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if (tVar3.S(i11 & 1, (74899 & i11) != 74898)) {
            int i12 = i11 & 14;
            boolean z12 = i12 == 4;
            Object objP = tVar3.P();
            Object obj = n.f81514a;
            if (z12 || objP == obj) {
                objP = new w(c2Var, fVar);
                tVar3.m0(objP);
            }
            w wVar3 = (w) objP;
            boolean z13 = i12 == 4;
            Object objP2 = tVar3.P();
            if (z13 || objP2 == obj) {
                objP2 = d.i(c2Var.f18730a.c());
                tVar3.m0(objP2);
            }
            SnapshotStateList snapshotStateList2 = (SnapshotStateList) objP2;
            boolean z14 = i12 == 4;
            Object objP3 = tVar3.P();
            if (z14 || objP3 == obj) {
                long[] jArr = z0.f97875a;
                objP3 = new o0();
                tVar3.m0(objP3);
            }
            o0 o0Var = (o0) objP3;
            g2 g2Var2 = c2Var.f18730a;
            e1 e1Var = c2Var.f18733d;
            if (!snapshotStateList2.contains(g2Var2.c())) {
                snapshotStateList2.clear();
                snapshotStateList2.add(g2Var2.c());
            }
            s2 s2Var = (s2) e1Var;
            if (Intrinsics.b(g2Var2.c(), s2Var.getValue())) {
                if (snapshotStateList2.size() != 1 || !Intrinsics.b(snapshotStateList2.get(0), g2Var2.c())) {
                    snapshotStateList2.clear();
                    snapshotStateList2.add(g2Var2.c());
                }
                if (o0Var.f97870e != 1 || o0Var.b(g2Var2.c())) {
                    o0Var.g();
                }
                wVar3.f16267b = fVar;
            }
            if (Intrinsics.b(g2Var2.c(), s2Var.getValue()) || snapshotStateList2.contains(s2Var.getValue())) {
                g2Var = g2Var2;
            } else {
                ListIterator listIterator = snapshotStateList2.listIterator();
                int i13 = 0;
                while (true) {
                    c70.a aVar = (c70.a) listIterator;
                    g2Var = g2Var2;
                    if (!aVar.hasNext()) {
                        i13 = -1;
                        break;
                    } else {
                        if (Intrinsics.b(function12.invoke(aVar.next()), function12.invoke(s2Var.getValue()))) {
                            break;
                        }
                        i13++;
                        g2Var2 = g2Var;
                    }
                }
                if (i13 == -1) {
                    snapshotStateList2.add(s2Var.getValue());
                } else {
                    snapshotStateList2.set(i13, s2Var.getValue());
                    Unit unit = Unit.f71706a;
                }
            }
            if (o0Var.b(s2Var.getValue()) && o0Var.b(g2Var.c())) {
                tVar3.b0(1969054067);
                tVar3.p(false);
                function13 = function14;
                wVar = wVar3;
            } else {
                tVar3.b0(1966468977);
                o0Var.g();
                int size = snapshotStateList2.size();
                int i14 = 0;
                while (i14 < size) {
                    Object obj2 = snapshotStateList2.get(i14);
                    o0Var.m(obj2, x1.f.d(-23915175, new k(c2Var, obj2, function14, wVar3, snapshotStateList2, eVar2), tVar3));
                    i14++;
                    function14 = function14;
                    eVar2 = eVar;
                }
                function13 = function14;
                wVar = wVar3;
                tVar3.p(false);
            }
            boolean zF = tVar3.f(c2Var.f()) | tVar3.f(wVar);
            Object objP4 = tVar3.P();
            if (zF || objP4 == obj) {
                objP4 = (k0) function13.invoke(wVar);
                tVar3.m0(objP4);
            }
            k0 k0Var = (k0) objP4;
            c2 c2Var2 = wVar.f16266a;
            boolean zF2 = tVar3.f(wVar);
            Object objP5 = tVar3.P();
            if (zF2 || objP5 == obj) {
                objP5 = d.k(Boolean.FALSE);
                tVar3.m0(objP5);
            }
            e1 e1Var2 = (e1) objP5;
            final e1 e1VarM = d.m(k0Var.f16164d, tVar3);
            if (Intrinsics.b(c2Var2.f18730a.c(), ((s2) c2Var2.f18733d).getValue())) {
                e1Var2.setValue(Boolean.FALSE);
            } else if (e1VarM.getValue() != null) {
                e1Var2.setValue(Boolean.TRUE);
            }
            boolean zBooleanValue = ((Boolean) e1Var2.getValue()).booleanValue();
            t tVar4 = r.f17024a;
            if (zBooleanValue) {
                tVar3.b0(1353180665);
                w wVar4 = wVar;
                snapshotStateList = snapshotStateList2;
                tVar2 = tVar3;
                wVar2 = wVar4;
                v1VarB = f2.b(wVar4.f16266a, c0.f.f18789p, null, tVar2, 0, 2);
                boolean zF3 = tVar2.f(v1VarB);
                Object objP6 = tVar2.P();
                if (zF3 || objP6 == obj) {
                    objP6 = fg.a.h(tVar4);
                    tVar2.m0(objP6);
                }
                tVar4 = (t) objP6;
                tVar2.p(false);
            } else {
                snapshotStateList = snapshotStateList2;
                tVar2 = tVar3;
                wVar2 = wVar;
                tVar2.b0(1353446707);
                tVar2.p(false);
                v1VarB = null;
            }
            t tVarThen = tVar.then(tVar4.then(new j1(v1VarB, e1VarM, wVar2) { // from class: androidx.compose.animation.AnimatedContentTransitionScopeImpl$SizeModifierElement

                /* renamed from: b, reason: collision with root package name */
                public final v1 f13857b;

                /* renamed from: c, reason: collision with root package name */
                public final e1 f13858c;

                /* renamed from: d, reason: collision with root package name */
                public final w f13859d;

                {
                    this.f13857b = v1VarB;
                    this.f13858c = e1VarM;
                    this.f13859d = wVar2;
                }

                @Override // b3.j1
                public final Modifier$Node create() {
                    v vVar = new v();
                    vVar.f16252a = this.f13857b;
                    vVar.f16253b = this.f13858c;
                    vVar.f16254c = this.f13859d;
                    vVar.f16255d = a.f13869a;
                    return vVar;
                }

                public final boolean equals(Object obj3) {
                    if (!(obj3 instanceof AnimatedContentTransitionScopeImpl$SizeModifierElement)) {
                        return false;
                    }
                    AnimatedContentTransitionScopeImpl$SizeModifierElement animatedContentTransitionScopeImpl$SizeModifierElement = (AnimatedContentTransitionScopeImpl$SizeModifierElement) obj3;
                    return Intrinsics.b(animatedContentTransitionScopeImpl$SizeModifierElement.f13857b, this.f13857b) && animatedContentTransitionScopeImpl$SizeModifierElement.f13858c.equals(this.f13858c);
                }

                public final int hashCode() {
                    int iHashCode = this.f13859d.hashCode() * 31;
                    v1 v1Var = this.f13857b;
                    return this.f13858c.hashCode() + ((iHashCode + (v1Var != null ? v1Var.hashCode() : 0)) * 31);
                }

                @Override // b3.j1
                public final void inspectableProperties(q2 q2Var) {
                    q2Var.f19405a = "sizeTransform";
                    d1 d1Var = q2Var.f19407c;
                    d1Var.b("sizeAnimation", this.f13857b);
                    d1Var.b("sizeTransform", this.f13858c);
                    d1Var.b("scope", this.f13859d);
                }

                @Override // b3.j1
                public final void update(Modifier$Node modifier$Node) {
                    v vVar = (v) modifier$Node;
                    vVar.f16252a = this.f13857b;
                    vVar.f16253b = this.f13858c;
                    vVar.f16254c = this.f13859d;
                }
            }));
            Object objP7 = tVar2.P();
            if (objP7 == obj) {
                objP7 = new b0.o(wVar2);
                tVar2.m0(objP7);
            }
            b0.o oVar2 = (b0.o) objP7;
            int iHashCode = Long.hashCode(tVar2.T);
            n1 n1VarL = tVar2.l();
            t tVarI = fg.a.I(tVarThen, tVar2);
            l.Po.getClass();
            Function0 function0 = b3.k.f17270b;
            tVar2.f0();
            if (tVar2.S) {
                tVar2.k(function0);
            } else {
                tVar2.p0();
            }
            a0.j(oVar2, b3.k.f17275g, tVar2);
            a0.j(n1VarL, b3.k.f17274f, tVar2);
            i iVar = b3.k.f17278j;
            if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, tVar2, iHashCode, iVar);
            }
            a0.j(tVarI, b3.k.f17272d, tVar2);
            tVar2.b0(-860173498);
            int size2 = snapshotStateList.size();
            int i15 = 0;
            while (i15 < size2) {
                SnapshotStateList snapshotStateList3 = snapshotStateList;
                Object obj3 = snapshotStateList3.get(i15);
                tVar2.Z(-2026002954, function12.invoke(obj3));
                Function2 function2 = (Function2) o0Var.d(obj3);
                if (function2 == null) {
                    tVar2.b0(1618454323);
                    z11 = false;
                    tVar2.p(false);
                } else {
                    z11 = false;
                    tVar2.b0(-2026001778);
                    function2.invoke(tVar2, 0);
                    tVar2.p(false);
                    Unit unit2 = Unit.f71706a;
                }
                tVar2.p(z11);
                i15++;
                snapshotStateList = snapshotStateList3;
            }
            tVar2.p(false);
            tVar2.p(true);
        } else {
            function13 = function14;
            tVar2 = tVar3;
            tVar2.V();
        }
        t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new b0.l(c2Var, tVar, function13, fVar, function12, eVar, i5);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0046  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x004b  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0063  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0114  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0124  */
    /* JADX WARN: Removed duplicated region for block: B:95:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void b(Object obj, t tVar, Function1 function1, f fVar, String str, Function1 function12, e eVar, o oVar, int i5, int i11) {
        int i12;
        t tVar2;
        int i13;
        Function1 function13;
        int i14;
        int i15;
        String str2;
        int i16;
        f fVar2;
        Function1 function14;
        t tVar3;
        Function1 function15;
        t1 t1VarU;
        Function1 function16;
        Function1 function17;
        p1.t tVar4 = (p1.t) oVar;
        tVar4.d0(1501828832);
        if ((i5 & 6) == 0) {
            i12 = ((i5 & 8) == 0 ? tVar4.f(obj) : tVar4.h(obj) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        int i17 = i11 & 2;
        if (i17 != 0) {
            i12 |= 48;
        } else {
            if ((i5 & 48) == 0) {
                tVar2 = tVar;
                i12 |= tVar4.f(tVar2) ? 32 : 16;
            }
            i13 = i11 & 4;
            if (i13 == 0) {
                i12 |= 384;
            } else {
                if ((i5 & 384) == 0) {
                    function13 = function1;
                    i12 |= tVar4.h(function13) ? 256 : 128;
                }
                i14 = i12 | 3072;
                i15 = i11 & 16;
                if (i15 != 0) {
                    i14 = i12 | 27648;
                } else {
                    if ((i5 & 24576) == 0) {
                        str2 = str;
                        i14 |= tVar4.f(str2) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
                    }
                    i16 = i11 & 32;
                    if (i16 != 0) {
                        if ((196608 & i5) == 0) {
                            i14 |= tVar4.h(function12) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
                        }
                        if ((1572864 & i5) == 0) {
                            i14 |= tVar4.h(eVar) ? 1048576 : 524288;
                        }
                        if (tVar4.S(i14 & 1, (599187 & i14) != 599186)) {
                            t tVar5 = i17 != 0 ? r.f17024a : tVar2;
                            Object obj2 = n.f81514a;
                            if (i13 != 0) {
                                Object objP = tVar4.P();
                                if (objP == obj2) {
                                    objP = b0.c.f16061k;
                                    tVar4.m0(objP);
                                }
                                function16 = (Function1) objP;
                            } else {
                                function16 = function13;
                            }
                            if (i15 != 0) {
                                str2 = "AnimatedContent";
                            }
                            if (i16 != 0) {
                                Object objP2 = tVar4.P();
                                if (objP2 == obj2) {
                                    objP2 = b0.c.f16062l;
                                    tVar4.m0(objP2);
                                }
                                function17 = (Function1) objP2;
                            } else {
                                function17 = function12;
                            }
                            c2 c2VarE = f2.e(obj, str2, tVar4, (i14 & 14) | ((i14 >> 9) & 112), 0);
                            int i18 = i14 >> 3;
                            b2.k kVar = b2.d.f16997a;
                            Function1 function18 = function17;
                            a(c2VarE, tVar5, function16, kVar, function18, eVar, tVar4, (i14 & 8176) | (57344 & i18) | (i18 & 458752));
                            tVar3 = tVar5;
                            function15 = function16;
                            fVar2 = kVar;
                            function14 = function18;
                        } else {
                            tVar4.V();
                            fVar2 = fVar;
                            function14 = function12;
                            tVar3 = tVar2;
                            function15 = function13;
                        }
                        String str3 = str2;
                        t1VarU = tVar4.u();
                        if (t1VarU != null) {
                            t1VarU.f81583d = new b0.d(obj, tVar3, function15, fVar2, str3, function14, eVar, i5, i11);
                            return;
                        }
                        return;
                    }
                    i14 |= 196608;
                    if ((1572864 & i5) == 0) {
                    }
                    if (tVar4.S(i14 & 1, (599187 & i14) != 599186)) {
                    }
                    String str32 = str2;
                    t1VarU = tVar4.u();
                    if (t1VarU != null) {
                    }
                }
                str2 = str;
                i16 = i11 & 32;
                if (i16 != 0) {
                }
                if ((1572864 & i5) == 0) {
                }
                if (tVar4.S(i14 & 1, (599187 & i14) != 599186)) {
                }
                String str322 = str2;
                t1VarU = tVar4.u();
                if (t1VarU != null) {
                }
            }
            function13 = function1;
            i14 = i12 | 3072;
            i15 = i11 & 16;
            if (i15 != 0) {
            }
            str2 = str;
            i16 = i11 & 32;
            if (i16 != 0) {
            }
            if ((1572864 & i5) == 0) {
            }
            if (tVar4.S(i14 & 1, (599187 & i14) != 599186)) {
            }
            String str3222 = str2;
            t1VarU = tVar4.u();
            if (t1VarU != null) {
            }
        }
        tVar2 = tVar;
        i13 = i11 & 4;
        if (i13 == 0) {
        }
        function13 = function1;
        i14 = i12 | 3072;
        i15 = i11 & 16;
        if (i15 != 0) {
        }
        str2 = str;
        i16 = i11 & 32;
        if (i16 != 0) {
        }
        if ((1572864 & i5) == 0) {
        }
        if (tVar4.S(i14 & 1, (599187 & i14) != 599186)) {
        }
        String str32222 = str2;
        t1VarU = tVar4.u();
        if (t1VarU != null) {
        }
    }

    public static final k0 c(f1 f1Var, g1 g1Var) {
        return new k0(f1Var, g1Var, (s1) null, 12);
    }
}
