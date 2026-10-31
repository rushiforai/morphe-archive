package f1;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FloatCompanionObject;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public abstract class n2 {

    /* renamed from: a, reason: collision with root package name */
    public static final float f53795a;

    /* renamed from: b, reason: collision with root package name */
    public static final float f53796b = 48;

    /* renamed from: c, reason: collision with root package name */
    public static final float f53797c;

    static {
        float f11 = 8;
        f53795a = f11;
        f53797c = f11;
    }

    public static final void a(c0.r0 r0Var, p1.e1 e1Var, e0.a2 a2Var, b2.t tVar, x1.e eVar, p1.o oVar, int i5) {
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(1077393800);
        int i11 = i5 | (tVar2.f(r0Var) ? 4 : 2) | (tVar2.f(a2Var) ? 256 : 128) | (tVar2.f(tVar) ? 2048 : 1024) | (tVar2.h(eVar) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE);
        if (tVar2.S(i11 & 1, (i11 & 9363) != 9362)) {
            c0.c2 c2VarD = c0.f2.d(r0Var, "DropDownMenu", tVar2, (i11 & 14) | 48);
            FloatCompanionObject floatCompanionObject = FloatCompanionObject.f71855a;
            c0.i2 i2Var = c0.f.f18784i;
            c0.g2 g2Var = c2VarD.f18730a;
            p1.e1 e1Var2 = c2VarD.f18733d;
            boolean zBooleanValue = ((Boolean) g2Var.c()).booleanValue();
            tVar2.b0(-1833869404);
            float f11 = zBooleanValue ? 1.0f : 0.8f;
            tVar2.p(false);
            Float fValueOf = Float.valueOf(f11);
            p1.s2 s2Var = (p1.s2) e1Var2;
            boolean zBooleanValue2 = ((Boolean) s2Var.getValue()).booleanValue();
            tVar2.b0(-1833869404);
            float f12 = zBooleanValue2 ? 1.0f : 0.8f;
            tVar2.p(false);
            Float fValueOf2 = Float.valueOf(f12);
            c0.w1 w1VarF = c2VarD.f();
            tVar2.b0(445475263);
            Boolean bool = Boolean.FALSE;
            Boolean bool2 = Boolean.TRUE;
            c0.h2 h2VarI = w1VarF.c(bool, bool2) ? c0.f.i(120, 0, c0.b0.f18711b, 2) : c0.f.i(1, 74, null, 4);
            tVar2.p(false);
            c0.y1 y1VarC = c0.f2.c(c2VarD, fValueOf, fValueOf2, h2VarI, i2Var, tVar2, 0);
            boolean zBooleanValue3 = ((Boolean) c2VarD.f18730a.c()).booleanValue();
            tVar2.b0(-1578341192);
            float f13 = zBooleanValue3 ? 1.0f : 0.0f;
            tVar2.p(false);
            Float fValueOf3 = Float.valueOf(f13);
            boolean zBooleanValue4 = ((Boolean) s2Var.getValue()).booleanValue();
            tVar2.b0(-1578341192);
            float f14 = zBooleanValue4 ? 1.0f : 0.0f;
            tVar2.p(false);
            Float fValueOf4 = Float.valueOf(f14);
            c0.w1 w1VarF2 = c2VarD.f();
            tVar2.b0(701003475);
            c0.h2 h2VarI2 = w1VarF2.c(bool, bool2) ? c0.f.i(30, 0, null, 6) : c0.f.i(75, 0, null, 6);
            tVar2.p(false);
            c0.y1 y1VarC2 = c0.f2.c(c2VarD, fValueOf3, fValueOf4, h2VarI2, i2Var, tVar2, 0);
            boolean zF = tVar2.f(y1VarC) | tVar2.f(y1VarC2);
            Object objP = tVar2.P();
            if (zF || objP == p1.n.f81514a) {
                objP = new m2(e1Var, y1VarC, y1VarC2, 0);
                tVar2.m0(objP);
            }
            vh.a.a(androidx.compose.ui.graphics.a.a(b2.r.f17024a, (Function1) objP), null, 0L, null, f53795a, x1.f.d(-707086267, new b10.b0(14, tVar, a2Var, eVar), tVar2), tVar2, 1769472, 30);
            tVar2 = tVar2;
        } else {
            tVar2.V();
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new aw.d(r0Var, e1Var, a2Var, tVar, eVar, i5);
        }
    }
}
