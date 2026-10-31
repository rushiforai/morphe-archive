package ps;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.util.Log;
import android.util.TypedValue;
import androidx.compose.ui.ZIndexElement;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import b10.a2;
import c0.b1;
import c3.z1;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.instabridge.mobilesdk.internal.ui.screens.i1;
import com.stripe.android.stripe3ds2.transactions.MessageExtension;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import e00.d2;
import e00.p6;
import e00.z4;
import e10.z2;
import f1.d3;
import f1.t0;
import f1.u0;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.lang.reflect.InvocationTargetException;
import java.util.Iterator;
import java.util.List;
import k0.i2;
import k0.o1;
import k0.p1;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import l1.d1;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import p1.e1;
import p1.g1;
import p1.n1;
import p1.s2;
import p1.t1;
import p1.y2;
import p6.a1;

/* loaded from: classes4.dex */
public abstract class f0 {
    public static final void a(m0.b bVar, t00.h hVar, int i5, b2.t tVar, x1.e eVar, p1.o oVar, int i11) {
        int i12;
        b2.t tVarA;
        b2.t tVar2;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(957100967);
        if ((i11 & 6) == 0) {
            i12 = (tVar3.f(bVar) ? 4 : 2) | i11;
        } else {
            i12 = i11;
        }
        if ((i11 & 48) == 0) {
            i12 |= tVar3.h(hVar) ? 32 : 16;
        }
        if ((i11 & 384) == 0) {
            i12 |= tVar3.d(i5) ? 256 : 128;
        }
        int i13 = i12 | 3072;
        if ((i11 & 24576) == 0) {
            i13 |= tVar3.h(eVar) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((i13 & 9363) == 9362 && tVar3.E()) {
            tVar3.V();
            tVar2 = tVar;
        } else {
            Integer num = (Integer) ((s2) hVar.f88353e).getValue();
            boolean z11 = num != null && i5 == num.intValue();
            g1 g1Var = p1.n.f81514a;
            b2.r rVar = b2.r.f17024a;
            if (z11) {
                tVar3.b0(516686066);
                ZIndexElement zIndexElement = new ZIndexElement();
                tVar3.b0(-398972540);
                boolean zH = tVar3.h(hVar);
                Object objP = tVar3.P();
                if (zH || objP == g1Var) {
                    objP = new t00.r(hVar, 0);
                    tVar3.m0(objP);
                }
                tVar3.p(false);
                tVarA = androidx.compose.ui.graphics.a.a(zIndexElement, (Function1) objP);
                tVar3.p(false);
            } else {
                Integer num2 = (Integer) ((s2) hVar.f88357i).getValue();
                if (num2 != null && i5 == num2.intValue()) {
                    tVar3.b0(516900524);
                    ZIndexElement zIndexElement2 = new ZIndexElement();
                    tVar3.b0(-398965622);
                    boolean zH2 = tVar3.h(hVar);
                    Object objP2 = tVar3.P();
                    if (zH2 || objP2 == g1Var) {
                        objP2 = new t00.r(hVar, 1);
                        tVar3.m0(objP2);
                    }
                    tVar3.p(false);
                    tVarA = androidx.compose.ui.graphics.a.a(zIndexElement2, (Function1) objP2);
                    tVar3.p(false);
                } else {
                    tVar3.b0(517062375);
                    tVar3.p(false);
                    tVarA = m0.b.a(bVar, rVar, 7);
                }
            }
            k0.x xVarA = k0.w.a(k0.k.f70657c, b2.d.f17009m, tVar3, 0);
            int iHashCode = Long.hashCode(tVar3.T);
            n1 n1VarL = tVar3.l();
            b2.t tVarI = fg.a.I(tVarA, tVar3);
            b3.l.Po.getClass();
            Function0 function0 = b3.k.f17270b;
            tVar3.f0();
            if (tVar3.S) {
                tVar3.k(function0);
            } else {
                tVar3.p0();
            }
            p1.a0.j(xVarA, b3.k.f17275g, tVar3);
            p1.a0.j(n1VarL, b3.k.f17274f, tVar3);
            b3.i iVar = b3.k.f17278j;
            if (tVar3.S || !Intrinsics.b(tVar3.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, tVar3, iHashCode, iVar);
            }
            p1.a0.j(tVarI, b3.k.f17272d, tVar3);
            eVar.invoke(k0.z.f70781a, Boolean.valueOf(z11), tVar3, Integer.valueOf(((i13 >> 6) & 896) | 6));
            tVar3.p(true);
            tVar2 = rVar;
        }
        t1 t1VarU = tVar3.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.b0(bVar, hVar, i5, tVar2, eVar, i11);
        }
    }

    public static final void b(lw.l state, b2.t tVar, float f11, Function0 onDismissed, x1.e eVar, p1.o oVar, int i5, int i11) {
        float f12;
        b2.t tVar2;
        lw.e eVar2;
        Continuation continuation;
        b2.t tVar3;
        float f13;
        Intrinsics.g(state, "state");
        Intrinsics.g(onDismissed, "onDismissed");
        p1.t tVar4 = (p1.t) oVar;
        tVar4.d0(562638930);
        int i12 = (tVar4.h(state) ? 4 : 2) | i5 | 48;
        if ((i5 & 384) == 0) {
            if ((i11 & 4) == 0) {
                f12 = f11;
                int i13 = tVar4.c(f12) ? 256 : 128;
                i12 |= i13;
            } else {
                f12 = f11;
            }
            i12 |= i13;
        } else {
            f12 = f11;
        }
        if ((i5 & 3072) == 0) {
            i12 |= tVar4.h(onDismissed) ? 2048 : 1024;
        }
        if ((i12 & 9363) == 9362 && tVar4.E()) {
            tVar4.V();
            tVar3 = tVar;
            f13 = f12;
        } else {
            tVar4.X();
            if ((i5 & 1) == 0 || tVar4.B()) {
                int i14 = i11 & 4;
                tVar2 = b2.r.f17024a;
                if (i14 != 0) {
                    f12 = hw.r.l(tVar4).f60763b;
                    i12 &= -897;
                }
            } else {
                tVar4.V();
                if ((i11 & 4) != 0) {
                    i12 &= -897;
                }
                tVar2 = tVar;
            }
            float f14 = f12;
            tVar4.q();
            dd.a aVarA = dd.c.a(tVar4);
            long jB = i2.s.b(0.32f, i2.s.f61136b);
            tVar4.b0(769413883);
            long jH = ((t0) tVar4.j(u0.f54013a)).h();
            tVar4.b0(-392358919);
            Object objP = tVar4.P();
            g1 g1Var = p1.n.f81514a;
            if (objP == g1Var) {
                objP = new lw.e(s0.h.e(f14, f14, 0.0f, 0.0f, 12), jH, jB);
                tVar4.m0(objP);
            }
            lw.e eVar3 = (lw.e) objP;
            tVar4.p(false);
            tVar4.p(false);
            Unit unit = Unit.f71706a;
            tVar4.b0(-1310521416);
            int i15 = i12 & 14;
            boolean z11 = i15 == 4 || tVar4.h(state);
            Object objP2 = tVar4.P();
            Continuation continuation2 = null;
            if (z11 || objP2 == g1Var) {
                objP2 = new iv.b(state, continuation2, 28);
                tVar4.m0(objP2);
            }
            tVar4.p(false);
            p1.o0.f(unit, (Function2) objP2, tVar4);
            y2 y2VarB = c0.h.b(((d3) state.f75147a.f53424b.f54115e.getValue()) == d3.f53457b ? i2.s.c(eVar3.f75126c) : 0.0f, c0.f.i(0, 0, null, 7), "StatusBarColorAlpha", null, tVar4, 3120, 20);
            Float fValueOf = Float.valueOf(((Number) y2VarB.getValue()).floatValue());
            tVar4.b0(-1310508480);
            boolean zF = tVar4.f(aVarA) | tVar4.h(eVar3) | tVar4.f(y2VarB);
            Object objP3 = tVar4.P();
            if (zF || objP3 == g1Var) {
                eVar2 = eVar3;
                objP3 = new q6.l(aVarA, eVar2, y2VarB, continuation2, 9);
                continuation = null;
                tVar4.m0(objP3);
            } else {
                eVar2 = eVar3;
                continuation = null;
            }
            tVar4.p(false);
            p1.o0.e(aVarA, fValueOf, (Function2) objP3, tVar4);
            tVar4.b0(-1310501978);
            boolean zF2 = tVar4.f(aVarA);
            Object objP4 = tVar4.P();
            if (zF2 || objP4 == g1Var) {
                objP4 = new iv.b(aVarA, continuation, 29);
                tVar4.m0(objP4);
            }
            tVar4.p(false);
            p1.o0.f(aVarA, (Function2) objP4, tVar4);
            tVar3 = tVar2;
            wh.f.q(state, eVar2, tVar3, onDismissed, eVar, tVar4, i15 | 392 | (i12 & 7168) | 24576);
            f13 = f14;
        }
        t1 t1VarU = tVar4.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new d2(state, tVar3, f13, onDismissed, eVar, i5, i11);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:101:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0056  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x007e  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0098  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00c0  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00c2  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x00c6  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00cb  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x00d4  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x00da  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x00f7  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0109  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x012e  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0153  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x018d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void c(List list, b2.t tVar, boolean z11, o1 o1Var, Function2 function2, Function2 function22, x1.e eVar, p1.o oVar, int i5, int i11) {
        int i12;
        boolean z12;
        int i13;
        o1 o1Var2;
        int i14;
        Function2 function23;
        x1.e eVar2;
        o1 p1Var;
        Object obj;
        Function2 function24;
        m0.b0 b0VarA;
        Object objP;
        t70.j0 j0Var;
        q2.a aVar;
        boolean zF;
        Object objP2;
        t00.h hVar;
        boolean zH;
        Object objP3;
        o1 o1Var3;
        Function2 function25;
        t1 t1VarU;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-1490406246);
        if ((i5 & 6) == 0) {
            i12 = (tVar2.h(list) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        if ((i5 & 48) == 0) {
            i12 |= tVar2.f(tVar) ? 32 : 16;
        }
        int i15 = i11 & 4;
        if (i15 != 0) {
            i12 |= 384;
        } else {
            if ((i5 & 384) == 0) {
                z12 = z11;
                i12 |= tVar2.g(z12) ? 256 : 128;
            }
            i13 = i11 & 8;
            if (i13 == 0) {
                i12 |= 3072;
            } else {
                if ((i5 & 3072) == 0) {
                    o1Var2 = o1Var;
                    i12 |= tVar2.f(o1Var2) ? 2048 : 1024;
                }
                if ((i5 & 24576) == 0) {
                    i12 |= tVar2.h(function2) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
                }
                i14 = i11 & 32;
                if (i14 == 0) {
                    if ((196608 & i5) == 0) {
                        function23 = function22;
                        i12 |= tVar2.h(function23) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
                    }
                    if ((1572864 & i5) != 0) {
                        eVar2 = eVar;
                        i12 |= tVar2.h(eVar2) ? 1048576 : 524288;
                    } else {
                        eVar2 = eVar;
                    }
                    if ((i12 & 599187) == 599186 || !tVar2.E()) {
                        boolean z13 = i15 == 0 ? true : z12;
                        if (i13 == 0) {
                            float f11 = 0;
                            p1Var = new p1(f11, f11, f11, f11);
                        } else {
                            p1Var = o1Var2;
                        }
                        obj = p1.n.f81514a;
                        if (i14 == 0) {
                            tVar2.b0(-147213909);
                            Object objP4 = tVar2.P();
                            if (objP4 == obj) {
                                objP4 = new t00.s(0);
                                tVar2.m0(objP4);
                            }
                            tVar2.p(false);
                            function24 = (Function2) objP4;
                        } else {
                            function24 = function23;
                        }
                        b0VarA = m0.d0.a(tVar2);
                        tVar2.b0(531450113);
                        objP = tVar2.P();
                        if (objP == obj) {
                            objP = p1.o0.i(EmptyCoroutineContext.f71803a, tVar2);
                            tVar2.m0(objP);
                        }
                        j0Var = (t70.j0) objP;
                        aVar = (q2.a) tVar2.j(z1.f19501l);
                        tVar2.b0(621224209);
                        zF = tVar2.f(b0VarA);
                        objP2 = tVar2.P();
                        if (!zF || objP2 == obj) {
                            objP2 = new t00.h(b0VarA, aVar, j0Var, function2);
                            tVar2.m0(objP2);
                        }
                        hVar = (t00.h) objP2;
                        tVar2.p(false);
                        tVar2.b0(621231004);
                        zH = tVar2.h(hVar) | tVar2.f(b0VarA);
                        objP3 = tVar2.P();
                        if (!zH || objP3 == obj) {
                            objP3 = new pu.q(hVar, b0VarA, null, 24);
                            tVar2.m0(objP3);
                        }
                        tVar2.p(false);
                        p1.o0.f(hVar, (Function2) objP3, tVar2);
                        tVar2.p(false);
                        i2.a(null, null, x1.f.d(544332144, new t00.t(tVar, hVar, z13, p1Var, list, function24, eVar2), tVar2), tVar2, 3072, 7);
                        z12 = z13;
                        o1Var3 = p1Var;
                        function25 = function24;
                    } else {
                        tVar2.V();
                        o1Var3 = o1Var2;
                        function25 = function23;
                    }
                    t1VarU = tVar2.u();
                    if (t1VarU == null) {
                        t1VarU.f81583d = new i1(list, tVar, z12, o1Var3, function2, function25, eVar, i5, i11);
                        return;
                    }
                    return;
                }
                i12 |= 196608;
                function23 = function22;
                if ((1572864 & i5) != 0) {
                }
                if ((i12 & 599187) == 599186) {
                    if (i15 == 0) {
                    }
                    if (i13 == 0) {
                    }
                    obj = p1.n.f81514a;
                    if (i14 == 0) {
                    }
                    b0VarA = m0.d0.a(tVar2);
                    tVar2.b0(531450113);
                    objP = tVar2.P();
                    if (objP == obj) {
                    }
                    j0Var = (t70.j0) objP;
                    aVar = (q2.a) tVar2.j(z1.f19501l);
                    tVar2.b0(621224209);
                    zF = tVar2.f(b0VarA);
                    objP2 = tVar2.P();
                    if (!zF) {
                        objP2 = new t00.h(b0VarA, aVar, j0Var, function2);
                        tVar2.m0(objP2);
                        hVar = (t00.h) objP2;
                        tVar2.p(false);
                        tVar2.b0(621231004);
                        zH = tVar2.h(hVar) | tVar2.f(b0VarA);
                        objP3 = tVar2.P();
                        if (!zH) {
                            objP3 = new pu.q(hVar, b0VarA, null, 24);
                            tVar2.m0(objP3);
                            tVar2.p(false);
                            p1.o0.f(hVar, (Function2) objP3, tVar2);
                            tVar2.p(false);
                            i2.a(null, null, x1.f.d(544332144, new t00.t(tVar, hVar, z13, p1Var, list, function24, eVar2), tVar2), tVar2, 3072, 7);
                            z12 = z13;
                            o1Var3 = p1Var;
                            function25 = function24;
                        }
                    }
                }
                t1VarU = tVar2.u();
                if (t1VarU == null) {
                }
            }
            o1Var2 = o1Var;
            if ((i5 & 24576) == 0) {
            }
            i14 = i11 & 32;
            if (i14 == 0) {
            }
            function23 = function22;
            if ((1572864 & i5) != 0) {
            }
            if ((i12 & 599187) == 599186) {
            }
            t1VarU = tVar2.u();
            if (t1VarU == null) {
            }
        }
        z12 = z11;
        i13 = i11 & 8;
        if (i13 == 0) {
        }
        o1Var2 = o1Var;
        if ((i5 & 24576) == 0) {
        }
        i14 = i11 & 32;
        if (i14 == 0) {
        }
        function23 = function22;
        if ((1572864 & i5) != 0) {
        }
        if ((i12 & 599187) == 599186) {
        }
        t1VarU = tVar2.u();
        if (t1VarU == null) {
        }
    }

    public static final void d(b2.t tVar, y3.f fVar, p1.o oVar, int i5, int i11) {
        int i12;
        b2.t tVarI;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(1354851612);
        int i13 = i11 & 1;
        if (i13 != 0) {
            i12 = i5 | 6;
        } else if ((i5 & 6) == 0) {
            i12 = (tVar2.f(tVar) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        if (((i12 | 16) & 19) == 18 && tVar2.E()) {
            tVar2.V();
        } else {
            tVar2.X();
            int i14 = i5 & 1;
            b2.r rVar = b2.r.f17024a;
            if (i14 == 0 || tVar2.B()) {
                if (i13 != 0) {
                    tVar = rVar;
                }
                y3.i iVar = (y3.i) tVar2.j(g0.f82877b);
                fVar = iVar != null ? new y3.f(y3.i.a(iVar.f96604a)) : null;
            } else {
                tVar2.V();
            }
            tVar2.q();
            if (fVar == null || (tVarI = androidx.compose.foundation.layout.e.i(rVar, fVar.f96602a, 0.0f, 2)) == null) {
                tVarI = rVar;
            }
            b2.t tVarG = i2.g(androidx.compose.foundation.layout.d.l(androidx.compose.foundation.layout.e.e(tVar.then(tVarI), 1.0f), 0.0f, 64, 1));
            z2.r0 r0VarD = k0.p.d(b2.d.f17001e, false);
            int iHashCode = Long.hashCode(tVar2.T);
            n1 n1VarL = tVar2.l();
            b2.t tVarI2 = fg.a.I(tVarG, tVar2);
            b3.l.Po.getClass();
            Function0 function0 = b3.k.f17270b;
            tVar2.f0();
            if (tVar2.S) {
                tVar2.k(function0);
            } else {
                tVar2.p0();
            }
            p1.a0.j(r0VarD, b3.k.f17275g, tVar2);
            p1.a0.j(n1VarL, b3.k.f17274f, tVar2);
            b3.i iVar2 = b3.k.f17278j;
            if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, tVar2, iHashCode, iVar2);
            }
            p1.a0.j(tVarI2, b3.k.f17272d, tVar2);
            i0.c(androidx.compose.foundation.layout.e.o(rVar, 48), 0L, 0L, 0.0f, tVar2, 6, 14);
            tVar2.p(true);
        }
        b2.t tVar3 = tVar;
        y3.f fVar2 = fVar;
        t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new p6(i5, i11, 2, tVar3, fVar2);
        }
    }

    public static final void e(int i5, Function0 function0, Function1 function1, p1.o oVar) {
        p1.t tVar;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(1205630013);
        if ((((tVar2.h(function1) ? 32 : 16) | i5) & 19) == 18 && tVar2.E()) {
            tVar2.V();
            tVar = tVar2;
        } else {
            tVar = tVar2;
            jy.k.a(function0, u00.j.f90252a, null, null, u00.j.f90253b, null, 0L, 0.0f, 0L, 0L, 0L, null, x1.f.d(-1855206998, new u00.w(48, i2.s.b(0.5f, ((d1) tVar2.j(l1.g1.f73330a)).f73162q), function1), tVar2), tVar, 196662, 3072, 8156);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new h00.e(function0, function1, i5, 4);
        }
    }

    public static final void f(boolean z11, Function0 function0, p1.o oVar, int i5) {
        e1 e1Var;
        p0.b bVar;
        e1 e1Var2;
        e1 e1Var3;
        e1 e1Var4;
        long j11;
        e1 e1Var5;
        e1 e1Var6;
        e1 e1Var7;
        e1 e1Var8;
        Continuation continuation;
        p0.b bVar2;
        e1 e1Var9;
        Function0 function02 = function0;
        p1.t tVar = (p1.t) oVar;
        tVar.d0(-1482139216);
        int i11 = (tVar.h(function02) ? 4 : 2) | i5 | (tVar.g(z11) ? 32 : 16);
        if ((i11 & 19) == 18 && tVar.E()) {
            tVar.V();
        } else {
            Context context = (Context) tVar.j(AndroidCompositionLocals_androidKt.f14166b);
            Object objP = tVar.P();
            g1 g1Var = p1.n.f81514a;
            if (objP == g1Var) {
                objP = p1.o0.i(EmptyCoroutineContext.f71803a, tVar);
                tVar.m0(objP);
            }
            t70.j0 j0Var = (t70.j0) objP;
            tVar.b0(1121039295);
            Object objP2 = tVar.P();
            if (objP2 == g1Var) {
                objP2 = new sx.d(22);
                tVar.m0(objP2);
            }
            boolean z12 = false;
            tVar.p(false);
            p0.b bVarC = p0.b0.c((Function0) objP2, tVar, 390);
            tVar.b0(1121040651);
            Object objP3 = tVar.P();
            if (objP3 == g1Var) {
                objP3 = androidx.compose.runtime.d.k(new ux.i(false, 7));
                tVar.m0(objP3);
            }
            e1 e1Var10 = (e1) objP3;
            Object objF = a2.c.f(1121043208, tVar, false);
            if (objF == g1Var) {
                objF = androidx.compose.runtime.d.k(new ux.l(z12, 31));
                tVar.m0(objF);
            }
            e1 e1Var11 = (e1) objF;
            Object objF2 = a2.c.f(1121045705, tVar, false);
            if (objF2 == g1Var) {
                objF2 = androidx.compose.runtime.d.k(new ux.k(false, 7));
                tVar.m0(objF2);
            }
            e1 e1Var12 = (e1) objF2;
            Object objF3 = a2.c.f(1121048266, tVar, false);
            if (objF3 == g1Var) {
                objF3 = androidx.compose.runtime.d.k(new ux.j(null, true));
                tVar.m0(objF3);
            }
            e1 e1Var13 = (e1) objF3;
            Object objF4 = a2.c.f(1121059256, tVar, false);
            if (objF4 == g1Var) {
                objF4 = Long.valueOf(System.currentTimeMillis());
                tVar.m0(objF4);
            }
            long jLongValue = ((Number) objF4).longValue();
            tVar.p(false);
            tVar.b0(1121061369);
            Object objP4 = tVar.P();
            if (objP4 == g1Var) {
                objP4 = androidx.compose.runtime.d.k(Long.valueOf(jLongValue));
                tVar.m0(objP4);
            }
            e1 e1Var14 = (e1) objP4;
            Object objF5 = a2.c.f(1121063411, tVar, false);
            if (objF5 == g1Var) {
                objF5 = androidx.compose.runtime.d.k(Boolean.FALSE);
                tVar.m0(objF5);
            }
            e1 e1Var15 = (e1) objF5;
            Object objF6 = a2.c.f(1121065555, tVar, false);
            if (objF6 == g1Var) {
                objF6 = androidx.compose.runtime.d.k(Boolean.FALSE);
                tVar.m0(objF6);
            }
            e1 e1Var16 = (e1) objF6;
            tVar.p(false);
            Unit unit = Unit.f71706a;
            tVar.b0(1121069736);
            boolean z13 = (i11 & 112) == 32;
            Object objP5 = tVar.P();
            if (z13 || objP5 == g1Var) {
                objP5 = new lw.c(z11, (Continuation) null, 8);
                tVar.m0(objP5);
            }
            tVar.p(false);
            p1.o0.f(unit, (Function2) objP5, tVar);
            tVar.b0(1121083833);
            boolean zF = tVar.f(bVarC);
            Object objP6 = tVar.P();
            if (zF || objP6 == g1Var) {
                objP6 = new tx.h0(bVarC, e1Var14, (Continuation) null, 10);
                tVar.m0(objP6);
            }
            tVar.p(false);
            p1.o0.f(bVarC, (Function2) objP6, tVar);
            tVar.b0(1121105718);
            boolean zF2 = tVar.f(bVarC);
            Object objP7 = tVar.P();
            if (zF2 || objP7 == g1Var) {
                e1Var = e1Var13;
                objP7 = new io.ktor.utils.io.g0(e1Var15, bVarC, jLongValue, 4);
                bVar = bVarC;
                e1Var2 = e1Var10;
                e1Var3 = e1Var15;
                e1Var4 = e1Var11;
                j11 = jLongValue;
                tVar.m0(objP7);
            } else {
                bVar = bVarC;
                e1Var2 = e1Var10;
                e1Var = e1Var13;
                e1Var3 = e1Var15;
                e1Var4 = e1Var11;
                j11 = jLongValue;
            }
            tVar.p(false);
            p1.o0.b(unit, (Function1) objP7, tVar);
            tVar.b0(1121123805);
            boolean zH = tVar.h(context);
            Object objP8 = tVar.P();
            if (zH || objP8 == g1Var) {
                b1 b1Var = new b1(context, e1Var2, e1Var4, e1Var12, (Continuation) null, 24);
                e1 e1Var17 = e1Var4;
                e1Var5 = e1Var;
                e1Var6 = e1Var17;
                objP8 = b1Var;
                e1Var7 = e1Var2;
                tVar.m0(objP8);
            } else {
                e1 e1Var18 = e1Var4;
                e1Var5 = e1Var;
                e1Var6 = e1Var18;
                e1Var7 = e1Var2;
            }
            tVar.p(false);
            p1.o0.f(unit, (Function2) objP8, tVar);
            tVar.b0(1121159902);
            Object objP9 = tVar.P();
            if (objP9 == g1Var) {
                e1Var8 = e1Var7;
                continuation = null;
                objP9 = new z4(2, continuation, 22);
                tVar.m0(objP9);
            } else {
                e1Var8 = e1Var7;
                continuation = null;
            }
            tVar.p(false);
            p1.o0.f(unit, (Function2) objP9, tVar);
            tVar.b0(1121181268);
            boolean zF3 = tVar.f(bVar);
            Object objP10 = tVar.P();
            if (zF3 || objP10 == g1Var) {
                bVar2 = bVar;
                e1Var9 = e1Var16;
                objP10 = new a2(e1Var9, bVar2, e1Var5, continuation, 10);
                tVar.m0(objP10);
            } else {
                bVar2 = bVar;
                e1Var9 = e1Var16;
            }
            tVar.p(false);
            p1.o0.f(unit, (Function2) objP10, tVar);
            function02 = function0;
            j0.g(x1.f.d(997374138, new ux.w(bVar2, e1Var8, e1Var6, e1Var12, e1Var5, bVar2.k() == 3, z11, function02, j0Var, e1Var3, j11, e1Var9), tVar), tVar, 6);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new bu.w(z11, i5, function02);
        }
    }

    public static void g(int i5, int i11) {
        String strF;
        if (i5 < 0 || i5 >= i11) {
            if (i5 < 0) {
                strF = i0.f("%s (%s) must not be negative", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, Integer.valueOf(i5));
            } else {
                if (i11 < 0) {
                    throw new IllegalArgumentException(b.c0.h(i11, "negative size: "));
                }
                strF = i0.f("%s (%s) must be less than size (%s)", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, Integer.valueOf(i5), Integer.valueOf(i11));
            }
            throw new IndexOutOfBoundsException(strF);
        }
    }

    public static void h(int i5, int i11, int i12) {
        if (i5 < 0 || i11 < i5 || i11 > i12) {
            throw new IndexOutOfBoundsException((i5 < 0 || i5 > i12) ? j(i5, i12, "start index") : (i11 < 0 || i11 > i12) ? j(i11, i12, "end index") : i0.f("end index (%s) must not be less than start index (%s)", Integer.valueOf(i11), Integer.valueOf(i5)));
        }
    }

    public static void i(p6.i0 i0Var, String str, List list, x1.e eVar, int i5) {
        if ((i5 & 2) != 0) {
            list = EmptyList.f71733a;
        }
        EmptyList<p6.z> emptyList = EmptyList.f71733a;
        p6.b1 b1Var = i0Var.f82182f;
        b1Var.getClass();
        q6.j jVar = new q6.j((q6.i) b1Var.b(a1.g(q6.i.class)), str, eVar);
        for (p6.e eVar2 : list) {
            jVar.f82163c.put(eVar2.f82149a, eVar2.f82150b);
        }
        for (p6.z navDeepLink : emptyList) {
            Intrinsics.g(navDeepLink, "navDeepLink");
            jVar.f82164d.add(navDeepLink);
        }
        i0Var.f82184h.add(jVar.a());
    }

    public static String j(int i5, int i11, String str) {
        if (i5 < 0) {
            return i0.f("%s (%s) must not be negative", str, Integer.valueOf(i5));
        }
        if (i11 >= 0) {
            return i0.f("%s (%s) must not be greater than size (%s)", str, Integer.valueOf(i5), Integer.valueOf(i11));
        }
        throw new IllegalArgumentException(b.c0.h(i11, "negative size: "));
    }

    public static boolean k(String current, String str) {
        Intrinsics.g(current, "current");
        if (current.equals(str)) {
            return true;
        }
        if (current.length() != 0) {
            int i5 = 0;
            int i11 = 0;
            int i12 = 0;
            while (true) {
                if (i5 < current.length()) {
                    char cCharAt = current.charAt(i5);
                    int i13 = i12 + 1;
                    if (i12 == 0 && cCharAt != '(') {
                        break;
                    }
                    if (cCharAt != '(') {
                        if (cCharAt == ')' && i11 - 1 == 0 && i12 != current.length() - 1) {
                            break;
                        }
                    } else {
                        i11++;
                    }
                    i5++;
                    i12 = i13;
                } else if (i11 == 0) {
                    String strSubstring = current.substring(1, current.length() - 1);
                    Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
                    return Intrinsics.b(r70.k.u1(strSubstring).toString(), str);
                }
            }
        }
        return false;
    }

    public static ColorStateList m(Context context, TypedArray typedArray, int i5) {
        int resourceId;
        ColorStateList colorStateListB;
        return (!typedArray.hasValue(i5) || (resourceId = typedArray.getResourceId(i5, 0)) == 0 || (colorStateListB = o4.a.b(context, resourceId)) == null) ? typedArray.getColorStateList(i5) : colorStateListB;
    }

    public static ColorStateList n(Context context, x7.u uVar, int i5) {
        int resourceId;
        ColorStateList colorStateListB;
        TypedArray typedArray = (TypedArray) uVar.f95209b;
        return (!typedArray.hasValue(i5) || (resourceId = typedArray.getResourceId(i5, 0)) == 0 || (colorStateListB = o4.a.b(context, resourceId)) == null) ? uVar.k(i5) : colorStateListB;
    }

    public static int o(Context context, TypedArray typedArray, int i5, int i11) {
        TypedValue typedValue = new TypedValue();
        if (!typedArray.getValue(i5, typedValue) || typedValue.type != 2) {
            return typedArray.getDimensionPixelSize(i5, i11);
        }
        TypedArray typedArrayObtainStyledAttributes = context.getTheme().obtainStyledAttributes(new int[]{typedValue.data});
        int dimensionPixelSize = typedArrayObtainStyledAttributes.getDimensionPixelSize(0, i11);
        typedArrayObtainStyledAttributes.recycle();
        return dimensionPixelSize;
    }

    public static Drawable p(Context context, TypedArray typedArray, int i5) {
        int resourceId;
        Drawable drawableB0;
        return (!typedArray.hasValue(i5) || (resourceId = typedArray.getResourceId(i5, 0)) == 0 || (drawableB0 = z2.b0(context, resourceId)) == null) ? typedArray.getDrawable(i5) : drawableB0;
    }

    public static int q(Object obj) {
        if (Build.VERSION.SDK_INT >= 28) {
            return a5.l.c(obj);
        }
        try {
            return ((Integer) obj.getClass().getMethod("getResId", null).invoke(obj, null)).intValue();
        } catch (IllegalAccessException e3) {
            Log.e("IconCompat", "Unable to get icon resource", e3);
            return 0;
        } catch (NoSuchMethodException e11) {
            Log.e("IconCompat", "Unable to get icon resource", e11);
            return 0;
        } catch (InvocationTargetException e12) {
            Log.e("IconCompat", "Unable to get icon resource", e12);
            return 0;
        }
    }

    public static String r(Object obj) {
        if (Build.VERSION.SDK_INT >= 28) {
            return a5.l.d(obj);
        }
        try {
            return (String) obj.getClass().getMethod("getResPackage", null).invoke(obj, null);
        } catch (IllegalAccessException e3) {
            Log.e("IconCompat", "Unable to get icon package", e3);
            return null;
        } catch (NoSuchMethodException e11) {
            Log.e("IconCompat", "Unable to get icon package", e11);
            return null;
        } catch (InvocationTargetException e12) {
            Log.e("IconCompat", "Unable to get icon package", e12);
            return null;
        }
    }

    public static int s(Object obj) {
        if (Build.VERSION.SDK_INT >= 28) {
            return a5.l.j(obj);
        }
        try {
            return ((Integer) obj.getClass().getMethod("getType", null).invoke(obj, null)).intValue();
        } catch (IllegalAccessException e3) {
            Log.e("IconCompat", "Unable to get icon type " + obj, e3);
            return -1;
        } catch (NoSuchMethodException e11) {
            Log.e("IconCompat", "Unable to get icon type " + obj, e11);
            return -1;
        } catch (InvocationTargetException e12) {
            Log.e("IconCompat", "Unable to get icon type " + obj, e12);
            return -1;
        }
    }

    public static Uri t(Object obj) {
        if (Build.VERSION.SDK_INT >= 28) {
            return a5.l.k(obj);
        }
        try {
            return (Uri) obj.getClass().getMethod("getUri", null).invoke(obj, null);
        } catch (IllegalAccessException e3) {
            Log.e("IconCompat", "Unable to get icon uri", e3);
            return null;
        } catch (NoSuchMethodException e11) {
            Log.e("IconCompat", "Unable to get icon uri", e11);
            return null;
        } catch (InvocationTargetException e12) {
            Log.e("IconCompat", "Unable to get icon uri", e12);
            return null;
        }
    }

    public static boolean v(Context context) {
        return context.getResources().getConfiguration().fontScale >= 1.3f;
    }

    public static JSONArray w(List list) throws JSONException {
        if (list == null) {
            return null;
        }
        JSONArray jSONArray = new JSONArray();
        Iterator it = list.iterator();
        while (it.hasNext()) {
            MessageExtension messageExtension = (MessageExtension) it.next();
            messageExtension.getClass();
            JSONObject jSONObjectPut = new JSONObject().put(PendingUpgradeStore.KEY_NAME, messageExtension.f45209a).put("id", messageExtension.f45210b).put("criticalityIndicator", messageExtension.f45211c).put("data", new JSONObject(messageExtension.f45212d));
            Intrinsics.f(jSONObjectPut, "put(...)");
            jSONArray.put(jSONObjectPut);
        }
        return jSONArray;
    }

    public static final long x(long j11, long j12) {
        int iD;
        int iF = m3.o0.f(j11);
        int iE = m3.o0.e(j11);
        if ((m3.o0.f(j12) < m3.o0.e(j11)) && (m3.o0.f(j11) < m3.o0.e(j12))) {
            if ((m3.o0.f(j12) <= m3.o0.f(j11)) && (m3.o0.e(j11) <= m3.o0.e(j12))) {
                iF = m3.o0.f(j12);
                iE = iF;
            } else {
                if ((m3.o0.f(j11) <= m3.o0.f(j12)) && (m3.o0.e(j12) <= m3.o0.e(j11))) {
                    iD = m3.o0.d(j12);
                } else {
                    int iF2 = m3.o0.f(j12);
                    if (iF >= m3.o0.e(j12) || iF2 > iF) {
                        iE = m3.o0.f(j12);
                    } else {
                        iF = m3.o0.f(j12);
                        iD = m3.o0.d(j12);
                    }
                }
                iE -= iD;
            }
        } else if (iE > m3.o0.f(j12)) {
            iF -= m3.o0.d(j12);
            iD = m3.o0.d(j12);
            iE -= iD;
        }
        return z2.u(iF, iE);
    }

    public abstract void l(String str, Throwable th2);

    public abstract void u();
}
