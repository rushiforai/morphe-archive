package defpackage;

import java.lang.reflect.Type;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public final class pi6 implements m45 {
    public final /* synthetic */ int a;
    public final ri6 b;

    public /* synthetic */ pi6(ri6 ri6Var, int i) {
        this.a = i;
        this.b = ri6Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        List listD1;
        yq6 yq6VarK0;
        int i = this.a;
        ri6 ri6Var = this.b;
        switch (i) {
            case 0:
                return bpe.d(ri6Var.a());
            default:
                r39 r39VarA = ri6Var.a();
                int i2 = ri6Var.b;
                vg6 vg6Var = ri6Var.a;
                if (r39VarA instanceof yq6) {
                    f41 f41VarY = vg6Var.y();
                    y05 y05Var = bpe.a;
                    if (f41VarY.M() != null) {
                        yv2 yv2VarH = f41VarY.h();
                        yv2VarH.getClass();
                        yq6VarK0 = ((y28) yv2VarH).k0();
                    } else {
                        yq6VarK0 = null;
                    }
                    if (g76.L(yq6VarK0, r39VarA) && vg6Var.y().j() == e41.FAKE_OVERRIDE) {
                        yv2 yv2VarH2 = vg6Var.y().h();
                        yv2VarH2.getClass();
                        Class clsJ = bpe.j((y28) yv2VarH2);
                        if (clsJ != null) {
                            return clsJ;
                        }
                        rd6.r("Cannot determine receiver Java type of inherited declaration: ", r39VarA);
                        return null;
                    }
                }
                v41 v41VarV = vg6Var.v();
                if (!(v41VarV instanceof bqe)) {
                    if (!(v41VarV instanceof aqe)) {
                        return (Type) v41VarV.a().get(i2);
                    }
                    Class[] clsArr = (Class[]) ((Collection) ((aqe) v41VarV).d.get(i2)).toArray(new Class[0]);
                    Type[] typeArr = (Type[]) Arrays.copyOf(clsArr, clsArr.length);
                    int length = typeArr.length;
                    if (length != 0) {
                        return length != 1 ? new qi6(typeArr) : (Type) k80.K0(typeArr);
                    }
                    throw new in6("Expected at least 1 type for compound type");
                }
                if (vg6Var.B()) {
                    bqe bqeVar = (bqe) v41VarV;
                    n46 n46VarD = bqeVar.d(i2 + 1);
                    int i3 = bqeVar.d(0).b + 1;
                    listD1 = bu1.d1(bqeVar.b.a(), new n46(n46VarD.a - i3, n46VarD.b - i3, 1));
                } else {
                    bqe bqeVar2 = (bqe) v41VarV;
                    listD1 = bu1.d1(bqeVar2.b.a(), bqeVar2.d(i2));
                }
                Type[] typeArr2 = (Type[]) listD1.toArray(new Type[0]);
                Type[] typeArr3 = (Type[]) Arrays.copyOf(typeArr2, typeArr2.length);
                int length2 = typeArr3.length;
                if (length2 != 0) {
                    return length2 != 1 ? new qi6(typeArr3) : (Type) k80.K0(typeArr3);
                }
                throw new in6("Expected at least 1 type for compound type");
        }
    }
}
