package androidx.compose.ui.viewinterop;

import android.content.Context;
import android.view.View;
import androidx.compose.ui.Modifier$Node;
import androidx.compose.ui.focus.FocusTargetNode$FocusTargetElement;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import b0.l0;
import b2.r;
import b2.t;
import b3.i;
import b3.j1;
import b3.k;
import b3.l;
import b4.c;
import b4.m;
import b4.p;
import b4.q;
import b4.s;
import b4.x;
import c3.q2;
import c3.z1;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import g2.z;
import h6.a0;
import i6.h;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import p1.n1;
import p1.o;
import p1.t1;
import y1.e;
import y1.g;
import y3.n;

/* loaded from: classes.dex */
public abstract class a {
    /* JADX WARN: Removed duplicated region for block: B:23:0x0041  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0046  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x005c  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x008c  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x0170  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x017c  */
    /* JADX WARN: Removed duplicated region for block: B:83:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(Function1 function1, t tVar, Function1 function12, Function1 function13, Function1 function14, o oVar, int i5, int i11) {
        int i12;
        t tVar2;
        int i13;
        Function1 function15;
        int i14;
        Function1 function16;
        t tVar3;
        Function1 function17;
        Function1 function18;
        t1 t1VarU;
        Function1 function19;
        t tVar4;
        Function1 function110 = c.f17452m;
        p1.t tVar5 = (p1.t) oVar;
        tVar5.d0(-180024211);
        if ((i5 & 6) == 0) {
            i12 = (tVar5.h(function1) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        int i15 = i11 & 2;
        if (i15 != 0) {
            i12 |= 48;
        } else {
            if ((i5 & 48) == 0) {
                tVar2 = tVar;
                i12 |= tVar5.f(tVar2) ? 32 : 16;
            }
            i13 = i11 & 4;
            if (i13 == 0) {
                i12 |= 384;
            } else {
                if ((i5 & 384) == 0) {
                    function15 = function12;
                    i12 |= tVar5.h(function15) ? 256 : 128;
                }
                i14 = i11 & 8;
                if (i14 == 0) {
                    if ((i5 & 3072) == 0) {
                        function16 = function13;
                        i12 |= tVar5.h(function16) ? 2048 : 1024;
                    }
                    if ((i5 & 24576) == 0) {
                        i12 |= tVar5.h(function14) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
                    }
                    if (tVar5.S(i12 & 1, (i12 & 9363) == 9362)) {
                        tVar5.V();
                        tVar3 = tVar2;
                        function17 = function15;
                        function18 = function16;
                    } else {
                        t tVar6 = i15 != 0 ? r.f17024a : tVar2;
                        if (i13 != 0) {
                            function15 = null;
                        }
                        if (i14 == 0) {
                            function110 = function16;
                        }
                        int iHashCode = Long.hashCode(tVar5.T);
                        t tVarThen = tVar6.then(FocusGroupPropertiesElement.f14176b);
                        FocusTargetNode$FocusTargetElement focusTargetNode$FocusTargetElement = new j1() { // from class: androidx.compose.ui.focus.FocusTargetNode$FocusTargetElement
                            @Override // b3.j1
                            public final Modifier$Node create() {
                                return new z(0, 7, null);
                            }

                            public final boolean equals(Object obj) {
                                return obj == this;
                            }

                            public final int hashCode() {
                                return 1739042953;
                            }

                            @Override // b3.j1
                            public final void inspectableProperties(q2 q2Var) {
                                q2Var.d("focusTarget");
                            }

                            @Override // b3.j1
                            public final /* bridge */ /* synthetic */ void update(Modifier$Node modifier$Node) {
                            }
                        };
                        t tVarI = fg.a.I(tVarThen.then(focusTargetNode$FocusTargetElement).then(FocusTargetPropertiesElement.f14177b).then(focusTargetNode$FocusTargetElement), tVar5);
                        y3.c cVar = (y3.c) tVar5.j(z1.f19497h);
                        n nVar = (n) tVar5.j(z1.n);
                        n1 n1VarL = tVar5.l();
                        a0 a0Var = (a0) tVar5.j(h.f61404a);
                        a7.h hVar = (a7.h) tVar5.j(b7.a.a());
                        if (function15 != null) {
                            tVar5.b0(1313943160);
                            Function0 function0D = d(function1, tVar5, i12 & 14);
                            tVar5.f0();
                            if (tVar5.S) {
                                tVar5.k(function0D);
                            } else {
                                tVar5.p0();
                            }
                            function19 = function15;
                            e(tVar5, tVarI, iHashCode, cVar, a0Var, hVar, nVar, n1VarL);
                            p1.a0.j(function19, q.f17509k, tVar5);
                            p1.a0.j(function14, q.f17510l, tVar5);
                            p1.a0.j(function110, q.f17511m, tVar5);
                            tVar5.p(true);
                            tVar5.p(false);
                            tVar4 = tVar6;
                        } else {
                            function19 = function15;
                            tVar5.b0(1314800527);
                            Function0 function0D2 = d(function1, tVar5, i12 & 14);
                            tVar4 = tVar6;
                            tVar5.W(null, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, 1, null);
                            tVar5.f81568r = true;
                            if (tVar5.S) {
                                tVar5.k(function0D2);
                            } else {
                                tVar5.p0();
                            }
                            e(tVar5, tVarI, iHashCode, cVar, a0Var, hVar, nVar, n1VarL);
                            p1.a0.j(function14, b4.r.f17516k, tVar5);
                            p1.a0.j(function110, b4.r.f17517l, tVar5);
                            tVar5.p(true);
                            tVar5.p(false);
                        }
                        tVar3 = tVar4;
                        function17 = function19;
                        function18 = function110;
                    }
                    t1VarU = tVar5.u();
                    if (t1VarU == null) {
                        t1VarU.f81583d = new l0(function1, tVar3, function17, function18, function14, i5, i11, 1);
                        return;
                    }
                    return;
                }
                i12 |= 3072;
                function16 = function13;
                if ((i5 & 24576) == 0) {
                }
                if (tVar5.S(i12 & 1, (i12 & 9363) == 9362)) {
                }
                t1VarU = tVar5.u();
                if (t1VarU == null) {
                }
            }
            function15 = function12;
            i14 = i11 & 8;
            if (i14 == 0) {
            }
            function16 = function13;
            if ((i5 & 24576) == 0) {
            }
            if (tVar5.S(i12 & 1, (i12 & 9363) == 9362)) {
            }
            t1VarU = tVar5.u();
            if (t1VarU == null) {
            }
        }
        tVar2 = tVar;
        i13 = i11 & 4;
        if (i13 == 0) {
        }
        function15 = function12;
        i14 = i11 & 8;
        if (i14 == 0) {
        }
        function16 = function13;
        if ((i5 & 24576) == 0) {
        }
        if (tVar5.S(i12 & 1, (i12 & 9363) == 9362)) {
        }
        t1VarU = tVar5.u();
        if (t1VarU == null) {
        }
    }

    public static final void b(Function1 function1, t tVar, Function1 function12, o oVar, int i5, int i11) {
        int i12;
        t tVar2;
        Function1 function13;
        c cVar = c.f17452m;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(-1783766393);
        if ((i5 & 6) == 0) {
            i12 = (tVar3.h(function1) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        int i13 = i11 & 2;
        if (i13 != 0) {
            i12 |= 48;
        } else if ((i5 & 48) == 0) {
            i12 |= tVar3.f(tVar) ? 32 : 16;
        }
        int i14 = i11 & 4;
        if (i14 != 0) {
            i12 |= 384;
        } else if ((i5 & 384) == 0) {
            i12 |= tVar3.h(function12) ? 256 : 128;
        }
        if (tVar3.S(i12 & 1, (i12 & 147) != 146)) {
            if (i13 != 0) {
                tVar = r.f17024a;
            }
            t tVar4 = tVar;
            Function1 function14 = i14 != 0 ? cVar : function12;
            a(function1, tVar4, null, cVar, function14, tVar3, (i12 & 14) | 3072 | (i12 & 112) | (57344 & (i12 << 6)), 4);
            tVar2 = tVar4;
            function13 = function14;
        } else {
            tVar3.V();
            tVar2 = tVar;
            function13 = function12;
        }
        t1 t1VarU = tVar3.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new p(function1, tVar2, function13, i5, i11);
        }
    }

    public static final x c(LayoutNode layoutNode) {
        m interopViewFactoryHolder = layoutNode.getInteropViewFactoryHolder();
        if (interopViewFactoryHolder != null) {
            return (x) interopViewFactoryHolder;
        }
        throw a2.c.r("Required value was null.");
    }

    public static final Function0 d(Function1 function1, o oVar, int i5) {
        p1.t tVar = (p1.t) oVar;
        int iHashCode = Long.hashCode(tVar.T);
        Context context = (Context) tVar.j(AndroidCompositionLocals_androidKt.f14166b);
        androidx.compose.runtime.a aVarI = p1.a0.i(tVar);
        e eVar = (e) tVar.j(g.f96570a);
        View view = (View) tVar.j(AndroidCompositionLocals_androidKt.f14170f);
        boolean zH = ((((i5 & 14) ^ 6) > 4 && tVar.f(function1)) || (i5 & 6) == 4) | tVar.h(context) | tVar.h(aVarI) | tVar.h(eVar) | tVar.d(iHashCode) | tVar.h(view);
        Object objP = tVar.P();
        if (zH || objP == p1.n.f81514a) {
            s sVar = new s(context, function1, aVarI, eVar, iHashCode, view);
            tVar.m0(sVar);
            objP = sVar;
        }
        return (Function0) objP;
    }

    public static final void e(o oVar, t tVar, int i5, y3.c cVar, a0 a0Var, a7.h hVar, n nVar, n1 n1Var) {
        l.Po.getClass();
        p1.a0.j(n1Var, k.f17274f, oVar);
        p1.a0.j(tVar, q.n, oVar);
        p1.a0.j(cVar, q.o, oVar);
        p1.a0.j(a0Var, q.f17512p, oVar);
        p1.a0.j(hVar, q.f17513q, oVar);
        p1.a0.j(nVar, q.f17514r, oVar);
        i iVar = k.f17278j;
        p1.t tVar2 = (p1.t) oVar;
        if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(i5))) {
            a2.c.u(i5, tVar2, i5, iVar);
        }
    }
}
