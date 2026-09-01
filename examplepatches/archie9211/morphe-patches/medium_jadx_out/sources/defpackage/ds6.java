package defpackage;

import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import java.lang.reflect.Modifier;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public final class ds6 implements m45 {
    public final /* synthetic */ int a = 0;
    public final n0c b;
    public final gs6 c;

    public ds6(gs6 gs6Var, n0c n0cVar) {
        this.c = gs6Var;
        this.b = n0cVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r10v1, types: [r86, u55, zm1] */
    /* JADX WARN: Type inference failed for: r8v24 */
    /* JADX WARN: Type inference failed for: r8v4 */
    /* JADX WARN: Type inference failed for: r8v5, types: [gs6] */
    /* JADX WARN: Type inference failed for: r8v6, types: [gs6] */
    /* JADX WARN: Type inference failed for: r9v1, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r9v2, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r9v3 */
    /* JADX WARN: Type inference failed for: r9v4, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r9v5, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r9v6 */
    @Override // defpackage.m45
    public final Object invoke() throws Throwable {
        q0b q0bVar;
        y28 y28Var;
        Class cls;
        ArrayList arrayList;
        List listS;
        ?? arrayList2;
        ?? r9;
        ?? r8;
        f09 f09Var;
        List listD;
        int i = this.a;
        n0c n0cVar = this.b;
        switch (i) {
            case 0:
                ky kyVar = cd7.e;
                gs6 gs6Var = this.c;
                q0b q0bVar2 = gs6Var.o;
                n0c n0cVar2 = gs6Var.b;
                y28 y28Var2 = gs6Var.n;
                Constructor<?>[] declaredConstructors = q0bVar2.a.getDeclaredConstructors();
                declaredConstructors.getClass();
                boolean z = false;
                List<t0b> listO0 = szb.O0(new srd(new zh4(k80.b0(declaredConstructors), false, l0b.a), m0b.a));
                ArrayList arrayList3 = new ArrayList(listO0.size());
                for (t0b t0bVar : listO0) {
                    r86 r86VarO0 = r86.O0(y28Var2, k50.h0(n0cVar2, t0bVar), z, rz5.I(t0bVar));
                    n0c n0cVar3 = new n0c((k96) n0cVar2.b, new jl1(n0cVar2, r86VarO0, t0bVar, y28Var2.g0().size()), (vq6) n0cVar2.d);
                    Constructor constructor = t0bVar.a;
                    Type[] genericParameterTypes = constructor.getGenericParameterTypes();
                    genericParameterTypes.getClass();
                    if (genericParameterTypes.length == 0) {
                        listD = ey3.a;
                    } else {
                        Class declaringClass = constructor.getDeclaringClass();
                        if (declaringClass.getDeclaringClass() != null && !Modifier.isStatic(declaringClass.getModifiers())) {
                            genericParameterTypes = (Type[]) k80.m0(1, genericParameterTypes.length, genericParameterTypes);
                        }
                        Annotation[][] parameterAnnotations = constructor.getParameterAnnotations();
                        if (parameterAnnotations.length < genericParameterTypes.length) {
                            ik4.o("Illegal generic signature: ", constructor);
                            return null;
                        }
                        if (parameterAnnotations.length > genericParameterTypes.length) {
                            parameterAnnotations = (Annotation[][]) k80.m0(parameterAnnotations.length - genericParameterTypes.length, parameterAnnotations.length, parameterAnnotations);
                        }
                        listD = t0bVar.d(genericParameterTypes, parameterAnnotations, constructor.isVarArgs());
                    }
                    sv0 sv0VarU = ts6.u(n0cVar3, r86VarO0, listD);
                    List listG0 = y28Var2.g0();
                    listG0.getClass();
                    ArrayList typeParameters = t0bVar.getTypeParameters();
                    ArrayList arrayList4 = new ArrayList(cu1.k0(typeParameters, 10));
                    Iterator it2 = typeParameters.iterator();
                    while (it2.hasNext()) {
                        gs6 gs6Var2 = gs6Var;
                        swd swdVarB = ((vwd) n0cVar3.c).b((e1b) it2.next());
                        swdVarB.getClass();
                        arrayList4.add(swdVarB);
                        gs6Var = gs6Var2;
                    }
                    r86VarO0.M0((List) sv0VarU.c, pr7.p(t0bVar.e()), bu1.Q0(arrayList4, listG0));
                    r86VarO0.F0(false);
                    r86VarO0.G0(sv0VarU.b);
                    r86VarO0.H0(y28Var2.T());
                    arrayList3.add(r86VarO0);
                    gs6Var = gs6Var;
                    z = false;
                }
                gs6 gs6Var3 = gs6Var;
                boolean zG = q0bVar2.g();
                Class cls2 = q0bVar2.a;
                if (zG) {
                    Object obj = n0cVar2.b;
                    r86 r86VarO02 = r86.O0(y28Var2, kyVar, true, rz5.I(q0bVar2));
                    ArrayList<c1b> arrayListF = q0bVar2.f();
                    ArrayList arrayList5 = new ArrayList(arrayListF.size());
                    boolean z2 = false;
                    Object obj2 = null;
                    v96 v96VarE0 = gx1.e0(lxd.COMMON, false, null, 6);
                    int i2 = 0;
                    for (c1b c1bVar : arrayListF) {
                        ArrayList arrayList6 = arrayList5;
                        Class cls3 = cls2;
                        r86 r86Var = r86VarO02;
                        arrayList6.add(new lqe(r86Var, null, i2, kyVar, c1bVar.c(), ((ku3) n0cVar2.e).K(c1bVar.f(), v96VarE0), false, false, false, null, rz5.I(c1bVar)));
                        arrayList3 = arrayList3;
                        arrayList5 = arrayList6;
                        r86VarO02 = r86Var;
                        i2++;
                        q0bVar2 = q0bVar2;
                        cls2 = cls3;
                        y28Var2 = y28Var2;
                        v96VarE0 = v96VarE0;
                        z2 = false;
                        obj2 = null;
                    }
                    q0bVar = q0bVar2;
                    y28Var = y28Var2;
                    cls = cls2;
                    ArrayList arrayList7 = arrayList5;
                    zm1 zm1Var = r86VarO02;
                    arrayList = arrayList3;
                    zm1Var.G0(z2);
                    g93 visibility = y28Var.getVisibility();
                    visibility.getClass();
                    if (visibility.equals(b96.b)) {
                        visibility = b96.c;
                        visibility.getClass();
                    }
                    zm1Var.L0(arrayList7, visibility);
                    zm1Var.F0(z2);
                    zm1Var.H0(y28Var.T());
                    String strS = vp7.s(zm1Var, 2);
                    if (arrayList.isEmpty()) {
                        arrayList.add(zm1Var);
                        Object obj3 = n0cVar.b;
                    } else {
                        Iterator it3 = arrayList.iterator();
                        while (it3.hasNext()) {
                            if (vp7.s((zm1) it3.next(), 2).equals(strS)) {
                            }
                        }
                        arrayList.add(zm1Var);
                        Object obj32 = n0cVar.b;
                    }
                } else {
                    q0bVar = q0bVar2;
                    y28Var = y28Var2;
                    cls = cls2;
                    arrayList = arrayList3;
                }
                y28Var.getClass();
                n0cVar.getClass();
                cd7 cd7Var = ((k96) n0cVar.b).k;
                if (arrayList.isEmpty()) {
                    boolean zIsAnnotation = cls.isAnnotation();
                    cls.isInterface();
                    if (zIsAnnotation) {
                        Object obj4 = n0cVar2.b;
                        ku3 ku3Var = (ku3) n0cVar2.e;
                        y28 y28Var3 = y28Var;
                        ?? O0 = r86.O0(y28Var3, kyVar, true, rz5.I(q0bVar));
                        if (zIsAnnotation) {
                            List listD2 = q0bVar.d();
                            arrayList2 = new ArrayList(listD2.size());
                            v96 v96VarE02 = gx1.e0(lxd.COMMON, true, null, 6);
                            ArrayList arrayList8 = new ArrayList();
                            ArrayList<z0b> arrayList9 = new ArrayList();
                            for (Object obj5 : listD2) {
                                if (g76.L(((z0b) obj5).c(), de6.b)) {
                                    arrayList8.add(obj5);
                                } else {
                                    arrayList9.add(obj5);
                                }
                            }
                            arrayList8.size();
                            z0b z0bVar = (z0b) bu1.z0(arrayList8);
                            if (z0bVar != null) {
                                d1b d1bVarF = z0bVar.f();
                                if (d1bVarF instanceof j0b) {
                                    j0b j0bVar = (j0b) d1bVarF;
                                    f09Var = new f09(ku3Var.J(j0bVar, v96VarE02, true), ku3Var.K(j0bVar.b, v96VarE02));
                                } else {
                                    f09Var = new f09(ku3Var.K(d1bVarF, v96VarE02), null);
                                }
                                ?? r82 = gs6Var3;
                                r82.v(arrayList2, O0, 0, z0bVar, (mn6) f09Var.a, (mn6) f09Var.b);
                                r8 = r82;
                            } else {
                                r8 = gs6Var3;
                            }
                            int i3 = z0bVar != null ? 1 : 0;
                            int i4 = 0;
                            for (z0b z0bVar2 : arrayList9) {
                                r8.v(arrayList2, O0, i4 + i3, z0bVar2, ku3Var.K(z0bVar2.f(), v96VarE02), null);
                                i4++;
                            }
                        } else {
                            arrayList2 = Collections.EMPTY_LIST;
                        }
                        O0.G0(false);
                        g93 visibility2 = y28Var3.getVisibility();
                        visibility2.getClass();
                        if (visibility2.equals(b96.b)) {
                            visibility2 = b96.c;
                            visibility2.getClass();
                        }
                        O0.L0(arrayList2, visibility2);
                        O0.F0(true);
                        O0.H0(y28Var3.T());
                        r9 = O0;
                    } else {
                        r9 = 0;
                    }
                    listS = d46.S(r9);
                } else {
                    listS = arrayList;
                }
                return bu1.m1(cd7Var.p(n0cVar, listS));
            default:
                this.c.n.getClass();
                n0cVar.getClass();
                return bu1.q1(new ArrayList());
        }
    }

    public ds6(n0c n0cVar, gs6 gs6Var) {
        this.b = n0cVar;
        this.c = gs6Var;
    }
}
