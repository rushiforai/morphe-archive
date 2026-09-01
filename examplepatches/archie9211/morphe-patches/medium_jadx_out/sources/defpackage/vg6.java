package defpackage;

import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import kotlin.reflect.full.IllegalCallableAccessException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class vg6 implements rg6, yj6 {
    public final k1b a = no7.y(null, new sg6(this, 0));
    public final k1b b = no7.y(null, new sg6(this, 2));
    public final k1b c = no7.y(null, new sg6(this, 3));
    public final k1b d = no7.y(null, new sg6(this, 4));
    public final k1b e = no7.y(null, new sg6(this, 5));
    public final k1b f = no7.y(null, new sg6(this, 6));
    public final vq6 g = vx0.d0(yw6.PUBLICATION, new sg6(this, 7));

    public final boolean A() {
        return g76.L(getName(), "<init>") && w().e().isAnnotation();
    }

    public abstract boolean B();

    @Override // defpackage.rg6
    public final Object call(Object... objArr) throws IllegalCallableAccessException {
        objArr.getClass();
        try {
            return v().call(objArr);
        } catch (IllegalAccessException e) {
            throw new IllegalCallableAccessException(e);
        }
    }

    @Override // defpackage.qg6
    public final List getAnnotations() {
        Object objInvoke = this.a.invoke();
        objInvoke.getClass();
        return (List) objInvoke;
    }

    @Override // defpackage.rg6
    public final List getParameters() {
        Object objInvoke = this.c.invoke();
        objInvoke.getClass();
        return (List) objInvoke;
    }

    @Override // defpackage.rg6
    public final qj6 getReturnType() {
        Object objInvoke = this.d.invoke();
        objInvoke.getClass();
        return (qj6) objInvoke;
    }

    @Override // defpackage.rg6
    public final List getTypeParameters() {
        Object objInvoke = this.e.invoke();
        objInvoke.getClass();
        return (List) objInvoke;
    }

    @Override // defpackage.rg6
    public final ck6 getVisibility() {
        g93 visibility = y().getVisibility();
        visibility.getClass();
        y05 y05Var = bpe.a;
        if (visibility.equals(h93.e)) {
            return ck6.PUBLIC;
        }
        if (visibility.equals(h93.c)) {
            return ck6.PROTECTED;
        }
        if (visibility.equals(h93.d)) {
            return ck6.INTERNAL;
        }
        if (visibility.equals(h93.a) || visibility.equals(h93.b)) {
            return ck6.PRIVATE;
        }
        return null;
    }

    @Override // defpackage.rg6
    public final boolean isAbstract() {
        return y().o() == c28.ABSTRACT;
    }

    @Override // defpackage.rg6
    public final boolean isFinal() {
        return y().o() == c28.FINAL;
    }

    @Override // defpackage.rg6
    public final boolean isOpen() {
        return y().o() == c28.OPEN;
    }

    public abstract v41 v();

    public abstract ph6 w();

    public abstract v41 x();

    public abstract f41 y();

    public final int z(ri6 ri6Var) {
        if (!((Boolean) this.g.getValue()).booleanValue()) {
            ay0.e("Check if parametersNeedMFVCFlattening is true before");
            return 0;
        }
        if (!bpe.g(ri6Var.e())) {
            return 1;
        }
        ArrayList arrayListX = kk7.x(lk7.r(ri6Var.e().a));
        arrayListX.getClass();
        return arrayListX.size();
    }

    @Override // defpackage.rg6
    public final Object callBy(Map map) throws IllegalCallableAccessException {
        Object objU;
        map.getClass();
        boolean zA = A();
        boolean z = false;
        String str = mgKMENwrbHf.NIRXAjG;
        if (zA) {
            List<ri6> parameters = getParameters();
            ArrayList arrayList = new ArrayList(cu1.k0(parameters, 10));
            for (ri6 ri6Var : parameters) {
                if (map.containsKey(ri6Var)) {
                    objU = map.get(ri6Var);
                    if (objU == null) {
                        lg8.f(41, ri6Var, "Annotation argument value cannot be null (");
                        return null;
                    }
                } else if (ri6Var.f()) {
                    objU = null;
                } else {
                    if (!ri6Var.k()) {
                        ik4.h(str, ri6Var);
                        return null;
                    }
                    objU = u(ri6Var.e());
                }
                arrayList.add(objU);
            }
            v41 v41VarX = x();
            if (v41VarX == null) {
                rd6.n("This callable does not support a default call: ", y());
                return null;
            }
            try {
                return v41VarX.call(arrayList.toArray(new Object[0]));
            } catch (IllegalAccessException e) {
                throw new IllegalCallableAccessException(e);
            }
        }
        List<ri6> parameters2 = getParameters();
        if (parameters2.isEmpty()) {
            try {
                return v().call(isSuspend() ? new n92[]{null} : new n92[0]);
            } catch (IllegalAccessException e2) {
                throw new IllegalCallableAccessException(e2);
            }
        }
        int size = (isSuspend() ? 1 : 0) + parameters2.size();
        Object[] objArr = (Object[]) ((Object[]) this.f.invoke()).clone();
        if (isSuspend()) {
            objArr[parameters2.size()] = null;
        }
        boolean zBooleanValue = ((Boolean) this.g.getValue()).booleanValue();
        int i = 0;
        for (ri6 ri6Var2 : parameters2) {
            int iZ = zBooleanValue ? z(ri6Var2) : 1;
            if (map.containsKey(ri6Var2)) {
                objArr[ri6Var2.b] = map.get(ri6Var2);
            } else if (ri6Var2.f()) {
                if (zBooleanValue) {
                    int i2 = i + iZ;
                    for (int i3 = i; i3 < i2; i3++) {
                        int i4 = (i3 / 32) + size;
                        Object obj = objArr[i4];
                        obj.getClass();
                        objArr[i4] = Integer.valueOf(((Integer) obj).intValue() | (1 << (i3 % 32)));
                    }
                } else {
                    int i5 = (i / 32) + size;
                    Object obj2 = objArr[i5];
                    obj2.getClass();
                    objArr[i5] = Integer.valueOf(((Integer) obj2).intValue() | (1 << (i % 32)));
                }
                z = true;
            } else if (!ri6Var2.k()) {
                ik4.h(str, ri6Var2);
                return null;
            }
            if (ri6Var2.c == oi6.VALUE) {
                i += iZ;
            }
        }
        if (!z) {
            try {
                return v().call(Arrays.copyOf(objArr, size));
            } catch (IllegalAccessException e3) {
                throw new IllegalCallableAccessException(e3);
            }
        }
        v41 v41VarX2 = x();
        if (v41VarX2 == null) {
            rd6.n("This callable does not support a default call: ", y());
            return null;
        }
        try {
            return v41VarX2.call(objArr);
        } catch (IllegalAccessException e4) {
            throw new IllegalCallableAccessException(e4);
        }
    }

    public static Object u(vj6 vj6Var) {
        Class clsT = vx0.T(f76.E(vj6Var));
        if (clsT.isArray()) {
            Object objNewInstance = Array.newInstance(clsT.getComponentType(), 0);
            objNewInstance.getClass();
            return objNewInstance;
        }
        throw new zb2(pUlNWdybf.TnB + clsT.getSimpleName() + ", because it is not an array type");
    }
}
