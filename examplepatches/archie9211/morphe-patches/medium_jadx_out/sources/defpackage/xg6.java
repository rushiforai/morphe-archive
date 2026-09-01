package defpackage;

import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import kotlin.Metadata;

/* JADX INFO: loaded from: classes5.dex */
public final class xg6 implements m45 {
    public final /* synthetic */ int a;
    public final dh6 b;

    public xg6(dh6 dh6Var, ah6 ah6Var) {
        this.a = 7;
        this.b = dh6Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        y28 y28VarF;
        int i = this.a;
        dh6 dh6Var = this.b;
        switch (i) {
            case 0:
                return new ah6(dh6Var);
            case 1:
                return dh6Var.v(dh6Var.a().T().H(), nh6.DECLARED);
            case 2:
                ev7 ev7VarJ0 = dh6Var.a().j0();
                ev7VarJ0.getClass();
                return dh6Var.v(ev7VarJ0, nh6.DECLARED);
            case 3:
                return dh6Var.v(dh6Var.a().T().H(), nh6.INHERITED);
            case 4:
                ev7 ev7VarJ02 = dh6Var.a().j0();
                ev7VarJ02.getClass();
                return dh6Var.v(ev7VarJ02, nh6.INHERITED);
            case 5:
                HashSet hashSet = dh6.d;
                mn1 mn1VarD = dh6Var.D();
                Class cls = dh6Var.b;
                k1b k1bVar = ((ah6) dh6Var.c.getValue()).a;
                fj6 fj6Var = mh6.b[0];
                Object objInvoke = k1bVar.invoke();
                objInvoke.getClass();
                vmb vmbVar = (vmb) objInvoke;
                i93 i93Var = vmbVar.a;
                b38 b38Var = i93Var.b;
                if (mn1VarD.c && cls.isAnnotationPresent(Metadata.class)) {
                    hn1 hn1Var = i93Var.t;
                    Set set = hn1.c;
                    y28VarF = hn1Var.a(mn1VarD, null);
                } else {
                    y28VarF = d46.F(b38Var, mn1VarD);
                }
                if (y28VarF != null) {
                    return y28VarF;
                }
                if (cls.isSynthetic()) {
                    return dh6.C(mn1VarD, vmbVar);
                }
                h1b h1bVarF = mo7.F(cls);
                xm6 xm6Var = h1bVarF != null ? (xm6) h1bVarF.b.d : null;
                switch (xm6Var != null ? bh6.a[xm6Var.ordinal()] : -1) {
                    case -1:
                    case 6:
                        lg8.x("Unresolved class: ", cls, " (kind = ", xm6Var);
                        return null;
                    case 0:
                    default:
                        ygf.a();
                        return null;
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                        return dh6.C(mn1VarD, vmbVar);
                    case 5:
                        lg8.x("Unknown class: ", cls, " (kind = ", xm6Var);
                        return null;
                }
            case 6:
                Annotation[] annotations = dh6Var.b.getAnnotations();
                annotations.getClass();
                ArrayList arrayList = new ArrayList();
                for (Annotation annotation : annotations) {
                    if (!dh6.d.contains(vx0.T(vx0.P(annotation)).getName())) {
                        arrayList.add(annotation);
                    }
                }
                return bpe.l(arrayList);
            case 7:
                Class cls2 = dh6Var.b;
                if (cls2.isAnonymousClass()) {
                    return null;
                }
                mn1 mn1VarD2 = dh6Var.D();
                if (!mn1VarD2.c) {
                    String strB = mn1VarD2.f().b();
                    strB.getClass();
                    return strB;
                }
                String simpleName = cls2.getSimpleName();
                Method enclosingMethod = cls2.getEnclosingMethod();
                if (enclosingMethod != null) {
                    return muc.s0(simpleName, enclosingMethod.getName() + '$', simpleName);
                }
                Constructor<?> enclosingConstructor = cls2.getEnclosingConstructor();
                if (enclosingConstructor == null) {
                    int iY = muc.Y(simpleName, '$', 0, 6);
                    return iY == -1 ? simpleName : simpleName.substring(iY + 1, simpleName.length());
                }
                return muc.s0(simpleName, enclosingConstructor.getName() + '$', simpleName);
            case 8:
                if (dh6Var.b.isAnonymousClass()) {
                    return null;
                }
                mn1 mn1VarD3 = dh6Var.D();
                if (mn1VarD3.c) {
                    return null;
                }
                return mn1VarD3.a().a.a;
            default:
                Collection collectionQ = dh6Var.q();
                ArrayList arrayList2 = new ArrayList(cu1.k0(collectionQ, 10));
                Iterator it2 = collectionQ.iterator();
                while (it2.hasNext()) {
                    arrayList2.add(new sh6(dh6Var, (p72) it2.next()));
                }
                return arrayList2;
        }
    }

    public /* synthetic */ xg6(dh6 dh6Var, int i) {
        this.a = i;
        this.b = dh6Var;
    }
}
