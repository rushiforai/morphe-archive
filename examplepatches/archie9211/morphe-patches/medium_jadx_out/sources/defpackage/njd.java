package defpackage;

import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PointF;
import android.graphics.RectF;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class njd extends tn0 {
    public final StringBuilder D;
    public final StringBuilder E;
    public final StringBuilder F;
    public final StringBuilder G;
    public final RectF H;
    public final Matrix I;
    public final ao6 J;
    public final ao6 K;
    public final HashMap L;
    public final ab7 M;
    public final ArrayList N;
    public final ArrayList O;
    public final zu1 P;
    public final rc7 Q;
    public final bc7 R;
    public final dkd S;
    public final zu1 T;
    public final zu1 U;
    public final zu1 V;
    public final zu1 W;
    public final zu1 X;
    public final zu1 Y;
    public final zu1 Z;
    public final zu1 a0;

    public njd(rc7 rc7Var, wo6 wo6Var) {
        n0c n0cVar;
        n0c n0cVar2;
        pu puVar;
        n0c n0cVar3;
        pu puVar2;
        n0c n0cVar4;
        pu puVar3;
        iq1 iq1Var;
        pu puVar4;
        iq1 iq1Var2;
        qu quVar;
        iq1 iq1Var3;
        qu quVar2;
        iq1 iq1Var4;
        pu puVar5;
        iq1 iq1Var5;
        pu puVar6;
        super(rc7Var, wo6Var);
        this.D = new StringBuilder(2);
        this.E = new StringBuilder(0);
        this.F = new StringBuilder(0);
        this.G = new StringBuilder(0);
        this.H = new RectF();
        this.I = new Matrix();
        ao6 ao6Var = new ao6(1, 1);
        ao6Var.setStyle(Paint.Style.FILL);
        this.J = ao6Var;
        ao6 ao6Var2 = new ao6(1, 2);
        ao6Var2.setStyle(Paint.Style.STROKE);
        this.K = ao6Var2;
        this.L = new HashMap();
        this.M = new ab7((Object) null);
        this.N = new ArrayList();
        this.O = new ArrayList();
        this.S = dkd.INDEX;
        this.Q = rc7Var;
        this.R = wo6Var.b;
        zu1 zu1Var = new zu1((List) wo6Var.q.b, 3);
        this.P = zu1Var;
        zu1Var.a(this);
        d(zu1Var);
        s26 s26Var = wo6Var.r;
        if (s26Var != null && (iq1Var5 = (iq1) s26Var.b) != null && (puVar6 = (pu) iq1Var5.b) != null) {
            rn0 rn0VarW = puVar6.w();
            this.T = (zu1) rn0VarW;
            rn0VarW.a(this);
            d(rn0VarW);
        }
        if (s26Var != null && (iq1Var4 = (iq1) s26Var.b) != null && (puVar5 = (pu) iq1Var4.c) != null) {
            rn0 rn0VarW2 = puVar5.w();
            this.U = (zu1) rn0VarW2;
            rn0VarW2.a(this);
            d(rn0VarW2);
        }
        if (s26Var != null && (iq1Var3 = (iq1) s26Var.b) != null && (quVar2 = (qu) iq1Var3.d) != null) {
            zu1 zu1VarW = quVar2.w();
            this.V = zu1VarW;
            zu1VarW.a(this);
            d(zu1VarW);
        }
        if (s26Var != null && (iq1Var2 = (iq1) s26Var.b) != null && (quVar = (qu) iq1Var2.e) != null) {
            zu1 zu1VarW2 = quVar.w();
            this.W = zu1VarW2;
            zu1VarW2.a(this);
            d(zu1VarW2);
        }
        if (s26Var != null && (iq1Var = (iq1) s26Var.b) != null && (puVar4 = (pu) iq1Var.f) != null) {
            rn0 rn0VarW3 = puVar4.w();
            this.X = (zu1) rn0VarW3;
            rn0VarW3.a(this);
            d(rn0VarW3);
        }
        if (s26Var != null && (n0cVar4 = (n0c) s26Var.c) != null && (puVar3 = (pu) n0cVar4.b) != null) {
            rn0 rn0VarW4 = puVar3.w();
            this.Y = (zu1) rn0VarW4;
            rn0VarW4.a(this);
            d(rn0VarW4);
        }
        if (s26Var != null && (n0cVar3 = (n0c) s26Var.c) != null && (puVar2 = (pu) n0cVar3.c) != null) {
            rn0 rn0VarW5 = puVar2.w();
            this.Z = (zu1) rn0VarW5;
            rn0VarW5.a(this);
            d(rn0VarW5);
        }
        if (s26Var != null && (n0cVar2 = (n0c) s26Var.c) != null && (puVar = (pu) n0cVar2.d) != null) {
            rn0 rn0VarW6 = puVar.w();
            this.a0 = (zu1) rn0VarW6;
            rn0VarW6.a(this);
            d(rn0VarW6);
        }
        if (s26Var == null || (n0cVar = (n0c) s26Var.c) == null) {
            return;
        }
        this.S = (dkd) n0cVar.e;
    }

    public static void q(String str, Paint paint, Canvas canvas) {
        if (paint.getColor() == 0) {
            return;
        }
        if (paint.getStyle() == Paint.Style.STROKE && paint.getStrokeWidth() == 0.0f) {
            return;
        }
        canvas.drawText(str, 0, str.length(), 0.0f, 0.0f, paint);
    }

    public static void r(Path path, Paint paint, Canvas canvas) {
        if (paint.getColor() == 0) {
            return;
        }
        if (paint.getStyle() == Paint.Style.STROKE && paint.getStrokeWidth() == 0.0f) {
            return;
        }
        canvas.drawPath(path, paint);
    }

    @Override // defpackage.tn0, defpackage.qm3
    public final void c(RectF rectF, Matrix matrix, boolean z) {
        super.c(rectF, matrix, z);
        bc7 bc7Var = this.R;
        rectF.set(0.0f, 0.0f, bc7Var.k.width(), bc7Var.k.height());
    }

    /* JADX WARN: Code restructure failed: missing block: B:148:0x04a0, code lost:
    
        r3.insert(0, r6);
        r5 = r5 + 1;
        r1 = r24;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:101:0x0317  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0286  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x030f  */
    @Override // defpackage.tn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void i(android.graphics.Canvas r31, android.graphics.Matrix r32, int r33, defpackage.bn3 r34) {
        /*
            Method dump skipped, instruction units count: 1319
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.njd.i(android.graphics.Canvas, android.graphics.Matrix, int, bn3):void");
    }

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$PrimitiveArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    public final String o(int i, String str) {
        int iCodePointAt = str.codePointAt(i);
        int iCharCount = Character.charCount(iCodePointAt) + i;
        while (iCharCount < str.length()) {
            int iCodePointAt2 = str.codePointAt(iCharCount);
            if (Character.getType(iCodePointAt2) != 16 && Character.getType(iCodePointAt2) != 27 && Character.getType(iCodePointAt2) != 6 && Character.getType(iCodePointAt2) != 28 && Character.getType(iCodePointAt2) != 8 && Character.getType(iCodePointAt2) != 19) {
                break;
            }
            iCharCount += Character.charCount(iCodePointAt2);
            iCodePointAt = (iCodePointAt * 31) + iCodePointAt2;
        }
        long j = iCodePointAt;
        ab7 ab7Var = this.M;
        if (ab7Var.g(j) >= 0) {
            return (String) ab7Var.d(j);
        }
        StringBuilder sb = this.D;
        sb.setLength(0);
        while (i < iCharCount) {
            int iCodePointAt3 = str.codePointAt(i);
            sb.appendCodePoint(iCodePointAt3);
            i += Character.charCount(iCodePointAt3);
        }
        String string = sb.toString();
        ab7Var.i(j, string);
        return string;
    }

    public final void p(qi3 qi3Var, int i, int i2) {
        ao6 ao6Var = this.J;
        zu1 zu1Var = this.T;
        if (zu1Var == null || !t(i2)) {
            ao6Var.setColor(qi3Var.h);
        } else {
            ao6Var.setColor(((Integer) zu1Var.d()).intValue());
        }
        zu1 zu1Var2 = this.U;
        ao6 ao6Var2 = this.K;
        if (zu1Var2 == null || !t(i2)) {
            ao6Var2.setColor(qi3Var.i);
        } else {
            ao6Var2.setColor(((Integer) zu1Var2.d()).intValue());
        }
        zu1 zu1Var3 = this.w.p;
        int iIntValue = 100;
        int iIntValue2 = zu1Var3 == null ? 100 : ((Integer) zu1Var3.d()).intValue();
        zu1 zu1Var4 = this.X;
        if (zu1Var4 != null && t(i2)) {
            iIntValue = ((Integer) zu1Var4.d()).intValue();
        }
        int iRound = Math.round((((iIntValue / 100.0f) * ((iIntValue2 * 255.0f) / 100.0f)) * i) / 255.0f);
        ao6Var.setAlpha(iRound);
        ao6Var2.setAlpha(iRound);
        zu1 zu1Var5 = this.V;
        if (zu1Var5 == null || !t(i2)) {
            ao6Var2.setStrokeWidth(gpe.c() * qi3Var.j);
        } else {
            ao6Var2.setStrokeWidth(((Float) zu1Var5.d()).floatValue());
        }
    }

    public final mjd s(int i) {
        ArrayList arrayList = this.O;
        for (int size = arrayList.size(); size < i; size++) {
            mjd mjdVar = new mjd();
            mjdVar.a = "";
            mjdVar.b = 0.0f;
            arrayList.add(mjdVar);
        }
        return (mjd) arrayList.get(i - 1);
    }

    public final boolean t(int i) {
        zu1 zu1Var;
        int length = ((qi3) this.P.d()).a.length();
        zu1 zu1Var2 = this.Y;
        if (zu1Var2 == null || (zu1Var = this.Z) == null) {
            return true;
        }
        int iMin = Math.min(((Integer) zu1Var2.d()).intValue(), ((Integer) zu1Var.d()).intValue());
        int iMax = Math.max(((Integer) zu1Var2.d()).intValue(), ((Integer) zu1Var.d()).intValue());
        zu1 zu1Var3 = this.a0;
        if (zu1Var3 != null) {
            int iIntValue = ((Integer) zu1Var3.d()).intValue();
            iMin += iIntValue;
            iMax += iIntValue;
        }
        if (this.S == dkd.INDEX) {
            return i >= iMin && i < iMax;
        }
        float f = (i / length) * 100.0f;
        return f >= ((float) iMin) && f < ((float) iMax);
    }

    public final boolean u(Canvas canvas, qi3 qi3Var, int i, float f) {
        PointF pointF = qi3Var.l;
        PointF pointF2 = qi3Var.m;
        float fC = gpe.c();
        float f2 = (i * qi3Var.f * fC) + (pointF == null ? 0.0f : (qi3Var.f * fC) + pointF.y);
        if (this.Q.r && pointF2 != null && pointF != null && f2 >= pointF.y + pointF2.y + qi3Var.c) {
            return false;
        }
        float f3 = pointF == null ? 0.0f : pointF.x;
        float f4 = pointF2 != null ? pointF2.x : 0.0f;
        int i2 = ljd.a[qi3Var.d.ordinal()];
        if (i2 == 1) {
            canvas.translate(f3, f2);
            return true;
        }
        if (i2 == 2) {
            canvas.translate((f3 + f4) - f, f2);
            return true;
        }
        if (i2 != 3) {
            return true;
        }
        canvas.translate(((f4 / 2.0f) + f3) - (f / 2.0f), f2);
        return true;
    }

    public final List v(String str, float f, vy4 vy4Var, float f2, float f3, boolean z) {
        float fMeasureText;
        int i = 0;
        int i2 = 0;
        boolean z2 = false;
        int i3 = 0;
        float f4 = 0.0f;
        float f5 = 0.0f;
        float f6 = 0.0f;
        for (int i4 = 0; i4 < str.length(); i4++) {
            char cCharAt = str.charAt(i4);
            if (z) {
                int iA = wy4.a(cCharAt, vy4Var.a, vy4Var.c);
                xkc xkcVar = this.R.h;
                xkcVar.getClass();
                wy4 wy4Var = (wy4) s42.L(xkcVar, iA);
                if (wy4Var != null) {
                    fMeasureText = (gpe.c() * ((float) wy4Var.c) * f2) + f3;
                }
            } else {
                fMeasureText = this.J.measureText(str.substring(i4, i4 + 1)) + f3;
            }
            if (cCharAt == ' ') {
                z2 = true;
                f6 = fMeasureText;
            } else if (z2) {
                z2 = false;
                i3 = i4;
                f5 = fMeasureText;
            } else {
                f5 += fMeasureText;
            }
            f4 += fMeasureText;
            if (f > 0.0f && f4 >= f && cCharAt != ' ') {
                i++;
                mjd mjdVarS = s(i);
                if (i3 == i2) {
                    mjdVarS.a = str.substring(i2, i4).trim();
                    mjdVarS.b = (f4 - fMeasureText) - ((r10.length() - r8.length()) * f6);
                    i2 = i4;
                    i3 = i2;
                    f4 = fMeasureText;
                    f5 = f4;
                } else {
                    mjdVarS.a = str.substring(i2, i3 - 1).trim();
                    mjdVarS.b = ((f4 - f5) - ((r8.length() - r14.length()) * f6)) - f6;
                    f4 = f5;
                    i2 = i3;
                }
            }
        }
        if (f4 > 0.0f) {
            i++;
            mjd mjdVarS2 = s(i);
            mjdVarS2.a = str.substring(i2);
            mjdVarS2.b = f4;
        }
        return this.O.subList(0, i);
    }
}
