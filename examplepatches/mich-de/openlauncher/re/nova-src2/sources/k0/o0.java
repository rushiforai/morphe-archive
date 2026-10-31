package k0;

import androidx.compose.ui.node.LayoutNode;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public abstract class o0 {

    /* renamed from: a, reason: collision with root package name */
    public static final e0 f70693a = new e0(b2.d.f17006j);

    public static final void a(b2.t tVar, h hVar, b2.j jVar, int i5, int i11, x1.e eVar, p1.o oVar, int i12) {
        x1.e eVar2;
        int i13;
        int i14;
        g gVar = k.f70655a;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-1303174015);
        int i15 = (tVar2.f(tVar) ? 4 : 2) | i12 | 224256;
        if (tVar2.S(i15 & 1, (599187 & i15) != 599186)) {
            b(tVar, hVar, t0.f70746c, eVar, tVar2, (i15 & 14) | 14380464);
            eVar2 = eVar;
            jVar = b2.d.f17006j;
            i13 = Integer.MAX_VALUE;
            i14 = Integer.MAX_VALUE;
        } else {
            eVar2 = eVar;
            tVar2.V();
            i13 = i5;
            i14 = i11;
        }
        b2.j jVar2 = jVar;
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.b0(tVar, hVar, jVar2, i13, i14, eVar2, i12);
        }
    }

    public static final void b(b2.t tVar, h hVar, t0 t0Var, x1.e eVar, p1.o oVar, int i5) {
        int i11;
        int i12;
        boolean z11;
        Object obj;
        e eVar2 = k.f70657c;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-1956591841);
        if ((i5 & 6) == 0) {
            i11 = (tVar2.f(tVar) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar2.f(hVar) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= tVar2.f(eVar2) ? 256 : 128;
        }
        int i13 = i5 & 3072;
        b2.j jVar = b2.d.f17006j;
        if (i13 == 0) {
            i11 |= tVar2.f(jVar) ? 2048 : 1024;
        }
        if ((i5 & 24576) == 0) {
            i11 |= tVar2.d(LayoutNode.NotPlacedPlaceOrder) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i5) == 0) {
            i11 |= tVar2.d(LayoutNode.NotPlacedPlaceOrder) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((1572864 & i5) == 0) {
            i11 |= tVar2.f(t0Var) ? 1048576 : 524288;
        }
        if ((12582912 & i5) == 0) {
            i11 |= tVar2.h(eVar) ? 8388608 : 4194304;
        }
        int i14 = i11;
        if (tVar2.S(i14 & 1, (i14 & 4793491) != 4793490)) {
            int i15 = i14 & 3670016;
            boolean z12 = i15 == 1048576;
            Object objP = tVar2.P();
            p1.g1 g1Var = p1.n.f81514a;
            if (z12 || objP == g1Var) {
                objP = new q0((p0) t0Var.f13368a);
                tVar2.m0(objP);
            }
            q0 q0Var = (q0) objP;
            int i16 = i14 >> 3;
            boolean zF = ((((i16 & 14) ^ 6) > 4 && tVar2.f(hVar)) || (i16 & 6) == 4) | ((((i16 & 112) ^ 48) > 32 && tVar2.f(eVar2)) || (i16 & 48) == 32) | ((((i16 & 896) ^ 384) > 256 && tVar2.f(jVar)) || (i16 & 384) == 256) | ((((i16 & 7168) ^ 3072) > 2048 && tVar2.d(LayoutNode.NotPlacedPlaceOrder)) || (i16 & 3072) == 2048) | ((((57344 & i16) ^ 24576) > 16384 && tVar2.d(LayoutNode.NotPlacedPlaceOrder)) || (i16 & 24576) == 16384) | tVar2.f(q0Var);
            Object objP2 = tVar2.P();
            if (zF || objP2 == g1Var) {
                i12 = i15;
                s0 s0Var = new s0(hVar, eVar2, hVar.a(), new e0(jVar), 0, q0Var);
                tVar2.m0(s0Var);
                objP2 = s0Var;
            } else {
                i12 = i15;
            }
            s0 s0Var2 = (s0) objP2;
            boolean z13 = (i12 == 1048576) | ((i14 & 29360128) == 8388608) | ((i14 & 458752) == 131072);
            Object objP3 = tVar2.P();
            if (z13 || objP3 == g1Var) {
                ArrayList arrayList = new ArrayList();
                z11 = true;
                arrayList.add(new x1.e(new b00.i0(eVar, 17), true, -1192950673));
                t0Var.getClass();
                tVar2.m0(arrayList);
                obj = arrayList;
            } else {
                z11 = true;
                obj = objP3;
            }
            x1.e eVar3 = new x1.e(new b0.g((List) obj, 7), z11, 1271844412);
            boolean zF2 = tVar2.f(s0Var2);
            Object objP4 = tVar2.P();
            if (zF2 || objP4 == g1Var) {
                objP4 = new z2.a1(s0Var2);
                tVar2.m0(objP4);
            }
            z2.r0 r0Var = (z2.r0) objP4;
            int iHashCode = Long.hashCode(tVar2.T);
            p1.n1 n1VarL = tVar2.l();
            b2.t tVarI = fg.a.I(tVar, tVar2);
            b3.l.Po.getClass();
            Function0 function0 = b3.k.f17270b;
            tVar2.f0();
            if (tVar2.S) {
                tVar2.k(function0);
            } else {
                tVar2.p0();
            }
            p1.a0.j(r0Var, b3.k.f17275g, tVar2);
            p1.a0.j(n1VarL, b3.k.f17274f, tVar2);
            b3.i iVar = b3.k.f17278j;
            if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, tVar2, iHashCode, iVar);
            }
            p1.a0.j(tVarI, b3.k.f17272d, tVar2);
            h6.c1.y(0, eVar3, tVar2, true);
        } else {
            tVar2.V();
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new b20.f(tVar, hVar, t0Var, eVar, i5);
        }
    }
}
