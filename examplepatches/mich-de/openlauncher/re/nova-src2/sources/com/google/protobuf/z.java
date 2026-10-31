package com.google.protobuf;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public final class z {
    public static Object a(Object obj, q qVar, l0 l0Var, y yVar, b0 b0Var, Object obj2, f2 f2Var) throws InvalidProtocolBufferException {
        Object objValueOf;
        Object objG;
        List arrayList;
        int iE = l0Var.e();
        k0 k0Var = l0Var.f34890d;
        if (k0Var.isRepeated() && k0Var.isPacked()) {
            switch (l0Var.c().ordinal()) {
                case 0:
                    arrayList = new ArrayList();
                    qVar.m(arrayList);
                    break;
                case 1:
                    arrayList = new ArrayList();
                    qVar.v(arrayList);
                    break;
                case 2:
                    arrayList = new ArrayList();
                    qVar.B(arrayList);
                    break;
                case 3:
                    arrayList = new ArrayList();
                    qVar.V(arrayList);
                    break;
                case 4:
                    arrayList = new ArrayList();
                    qVar.z(arrayList);
                    break;
                case 5:
                    arrayList = new ArrayList();
                    qVar.t(arrayList);
                    break;
                case 6:
                    arrayList = new ArrayList();
                    qVar.r(arrayList);
                    break;
                case 7:
                    arrayList = new ArrayList();
                    qVar.i(arrayList);
                    break;
                case 8:
                case 9:
                case 10:
                case 11:
                default:
                    throw new IllegalStateException("Type cannot be packed: " + k0Var.c());
                case 12:
                    arrayList = new ArrayList();
                    qVar.T(arrayList);
                    break;
                case 13:
                    ArrayList arrayList2 = new ArrayList();
                    qVar.o(arrayList2);
                    obj2 = c2.k(obj, iE, arrayList2, k0Var.a(), obj2, f2Var);
                    arrayList = arrayList2;
                    break;
                case 14:
                    arrayList = new ArrayList();
                    qVar.G(arrayList);
                    break;
                case 15:
                    arrayList = new ArrayList();
                    qVar.I(arrayList);
                    break;
                case 16:
                    arrayList = new ArrayList();
                    qVar.K(arrayList);
                    break;
                case 17:
                    arrayList = new ArrayList();
                    qVar.M(arrayList);
                    break;
            }
            b0Var.x(k0Var, arrayList);
            return obj2;
        }
        if (l0Var.c() != t2.f34976f) {
            switch (l0Var.c().ordinal()) {
                case 0:
                    objValueOf = Double.valueOf(qVar.l());
                    break;
                case 1:
                    objValueOf = Float.valueOf(qVar.u());
                    break;
                case 2:
                    objValueOf = Long.valueOf(qVar.A());
                    break;
                case 3:
                    objValueOf = Long.valueOf(qVar.U());
                    break;
                case 4:
                    objValueOf = Integer.valueOf(qVar.y());
                    break;
                case 5:
                    objValueOf = Long.valueOf(qVar.s());
                    break;
                case 6:
                    objValueOf = Integer.valueOf(qVar.q());
                    break;
                case 7:
                    objValueOf = Boolean.valueOf(qVar.h());
                    break;
                case 8:
                    objValueOf = qVar.N();
                    break;
                case 9:
                    if (!l0Var.f()) {
                        Object objG2 = b0Var.g(k0Var);
                        if (objG2 instanceof n0) {
                            x1 x1Var = x1.f35001c;
                            x1Var.getClass();
                            b2 b2VarA = x1Var.a(objG2.getClass());
                            if (!((n0) objG2).isMutable()) {
                                Object objD = b2VarA.d();
                                b2VarA.a(objD, objG2);
                                b0Var.x(k0Var, objD);
                                objG2 = objD;
                            }
                            qVar.d(objG2, b2VarA, yVar);
                            return obj2;
                        }
                    }
                    objValueOf = qVar.w(l0Var.d().getClass(), yVar);
                    break;
                case 10:
                    if (!l0Var.f()) {
                        Object objG3 = b0Var.g(k0Var);
                        if (objG3 instanceof n0) {
                            x1 x1Var2 = x1.f35001c;
                            x1Var2.getClass();
                            b2 b2VarA2 = x1Var2.a(objG3.getClass());
                            if (!((n0) objG3).isMutable()) {
                                Object objD2 = b2VarA2.d();
                                b2VarA2.a(objD2, objG3);
                                b0Var.x(k0Var, objD2);
                                objG3 = objD2;
                            }
                            qVar.f(objG3, b2VarA2, yVar);
                            return obj2;
                        }
                    }
                    objValueOf = qVar.D(l0Var.d().getClass(), yVar);
                    break;
                case 11:
                    objValueOf = qVar.j();
                    break;
                case 12:
                    objValueOf = Integer.valueOf(qVar.S());
                    break;
                case 13:
                    throw new IllegalStateException("Shouldn't reach here.");
                case 14:
                    objValueOf = Integer.valueOf(qVar.F());
                    break;
                case 15:
                    objValueOf = Long.valueOf(qVar.H());
                    break;
                case 16:
                    objValueOf = Integer.valueOf(qVar.J());
                    break;
                case 17:
                    objValueOf = Long.valueOf(qVar.L());
                    break;
                default:
                    objValueOf = null;
                    break;
            }
        } else {
            int iY = qVar.y();
            if (k0Var.a().findValueByNumber(iY) == null) {
                return c2.n(obj, iE, iY, obj2, f2Var);
            }
            objValueOf = Integer.valueOf(iY);
        }
        if (l0Var.f()) {
            b0Var.a(k0Var, objValueOf);
            return obj2;
        }
        int iOrdinal = l0Var.c().ordinal();
        if ((iOrdinal == 9 || iOrdinal == 10) && (objG = b0Var.g(k0Var)) != null) {
            objValueOf = ((o1) objG).toBuilder().mergeFrom((o1) objValueOf).buildPartial();
        }
        b0Var.x(k0Var, objValueOf);
        return obj2;
    }

    public static void b(h1 h1Var, Map.Entry entry) {
        k0 k0Var = (k0) entry.getKey();
        if (k0Var.isRepeated()) {
            switch (k0Var.c().ordinal()) {
                case 0:
                    c2.q(k0Var.getNumber(), (List) entry.getValue(), h1Var, k0Var.isPacked());
                    break;
                case 1:
                    c2.u(k0Var.getNumber(), (List) entry.getValue(), h1Var, k0Var.isPacked());
                    break;
                case 2:
                    c2.x(k0Var.getNumber(), (List) entry.getValue(), h1Var, k0Var.isPacked());
                    break;
                case 3:
                    c2.F(k0Var.getNumber(), (List) entry.getValue(), h1Var, k0Var.isPacked());
                    break;
                case 4:
                    c2.w(k0Var.getNumber(), (List) entry.getValue(), h1Var, k0Var.isPacked());
                    break;
                case 5:
                    c2.t(k0Var.getNumber(), (List) entry.getValue(), h1Var, k0Var.isPacked());
                    break;
                case 6:
                    c2.s(k0Var.getNumber(), (List) entry.getValue(), h1Var, k0Var.isPacked());
                    break;
                case 7:
                    c2.o(k0Var.getNumber(), (List) entry.getValue(), h1Var, k0Var.isPacked());
                    break;
                case 8:
                    c2.D(k0Var.getNumber(), (List) entry.getValue(), h1Var);
                    break;
                case 9:
                    List list = (List) entry.getValue();
                    if (list != null && !list.isEmpty()) {
                        c2.v(k0Var.getNumber(), (List) entry.getValue(), h1Var, x1.f35001c.a(list.get(0).getClass()));
                        break;
                    }
                    break;
                case 10:
                    List list2 = (List) entry.getValue();
                    if (list2 != null && !list2.isEmpty()) {
                        c2.y(k0Var.getNumber(), (List) entry.getValue(), h1Var, x1.f35001c.a(list2.get(0).getClass()));
                        break;
                    }
                    break;
                case 11:
                    c2.p(k0Var.getNumber(), (List) entry.getValue(), h1Var);
                    break;
                case 12:
                    c2.E(k0Var.getNumber(), (List) entry.getValue(), h1Var, k0Var.isPacked());
                    break;
                case 13:
                    c2.w(k0Var.getNumber(), (List) entry.getValue(), h1Var, k0Var.isPacked());
                    break;
                case 14:
                    c2.z(k0Var.getNumber(), (List) entry.getValue(), h1Var, k0Var.isPacked());
                    break;
                case 15:
                    c2.A(k0Var.getNumber(), (List) entry.getValue(), h1Var, k0Var.isPacked());
                    break;
                case 16:
                    c2.B(k0Var.getNumber(), (List) entry.getValue(), h1Var, k0Var.isPacked());
                    break;
                case 17:
                    c2.C(k0Var.getNumber(), (List) entry.getValue(), h1Var, k0Var.isPacked());
                    break;
            }
        }
        switch (k0Var.c().ordinal()) {
            case 0:
                ((t) h1Var.f34871a).R(k0Var.getNumber(), Double.doubleToRawLongBits(((Double) entry.getValue()).doubleValue()));
                break;
            case 1:
                ((t) h1Var.f34871a).P(k0Var.getNumber(), Float.floatToRawIntBits(((Float) entry.getValue()).floatValue()));
                break;
            case 2:
                ((t) h1Var.f34871a).e0(k0Var.getNumber(), ((Long) entry.getValue()).longValue());
                break;
            case 3:
                ((t) h1Var.f34871a).e0(k0Var.getNumber(), ((Long) entry.getValue()).longValue());
                break;
            case 4:
                ((t) h1Var.f34871a).T(k0Var.getNumber(), ((Integer) entry.getValue()).intValue());
                break;
            case 5:
                ((t) h1Var.f34871a).R(k0Var.getNumber(), ((Long) entry.getValue()).longValue());
                break;
            case 6:
                ((t) h1Var.f34871a).P(k0Var.getNumber(), ((Integer) entry.getValue()).intValue());
                break;
            case 7:
                ((t) h1Var.f34871a).L(k0Var.getNumber(), ((Boolean) entry.getValue()).booleanValue());
                break;
            case 8:
                ((t) h1Var.f34871a).Z(k0Var.getNumber(), (String) entry.getValue());
                break;
            case 9:
                h1Var.a(k0Var.getNumber(), entry.getValue(), x1.f35001c.a(entry.getValue().getClass()));
                break;
            case 10:
                int number = k0Var.getNumber();
                Object value = entry.getValue();
                ((t) h1Var.f34871a).V(number, (o1) value, x1.f35001c.a(entry.getValue().getClass()));
                break;
            case 11:
                ((t) h1Var.f34871a).N(k0Var.getNumber(), (l) entry.getValue());
                break;
            case 12:
                ((t) h1Var.f34871a).c0(k0Var.getNumber(), ((Integer) entry.getValue()).intValue());
                break;
            case 13:
                ((t) h1Var.f34871a).T(k0Var.getNumber(), ((Integer) entry.getValue()).intValue());
                break;
            case 14:
                ((t) h1Var.f34871a).P(k0Var.getNumber(), ((Integer) entry.getValue()).intValue());
                break;
            case 15:
                ((t) h1Var.f34871a).R(k0Var.getNumber(), ((Long) entry.getValue()).longValue());
                break;
            case 16:
                int number2 = k0Var.getNumber();
                int iIntValue = ((Integer) entry.getValue()).intValue();
                ((t) h1Var.f34871a).c0(number2, (iIntValue >> 31) ^ (iIntValue << 1));
                break;
            case 17:
                int number3 = k0Var.getNumber();
                long jLongValue = ((Long) entry.getValue()).longValue();
                ((t) h1Var.f34871a).e0(number3, (jLongValue >> 63) ^ (jLongValue << 1));
                break;
        }
    }
}
