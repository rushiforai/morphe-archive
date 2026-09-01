package defpackage;

import com.medium.android.data.preferences.DarkMode;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class oh3 extends p4d implements e55 {
    public final /* synthetic */ int b;
    public /* synthetic */ boolean c;
    public /* synthetic */ Object d;
    public /* synthetic */ Object e;
    public /* synthetic */ Object f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ oh3(int i, int i2, n92 n92Var) {
        super(i, n92Var);
        this.b = i2;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        boolean z;
        switch (this.b) {
            case 0:
                dne dneVar = (dne) this.d;
                zy4 zy4Var = (zy4) this.e;
                boolean z2 = this.c;
                DarkMode darkMode = (DarkMode) this.f;
                br7.v(obj);
                boolean z3 = true;
                if (dneVar != dne.SMALLEST) {
                    z = true;
                } else {
                    z = true;
                    z3 = false;
                }
                return new lh3(z3, dneVar != dne.LARGEST ? z : false, dneVar, zy4Var, darkMode, Boolean.valueOf(z2));
            default:
                ncd ncdVar = (ncd) this.d;
                rcd rcdVar = (rcd) this.e;
                xcd xcdVar = (xcd) this.f;
                boolean z4 = this.c;
                br7.v(obj);
                return new ycd(ncdVar, rcdVar, xcdVar, z4);
        }
    }

    @Override // defpackage.e55
    public final Object s(Object obj, Object obj2, Object obj3, Object obj4, Object obj5) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        int i2 = 5;
        switch (i) {
            case 0:
                boolean zBooleanValue = ((Boolean) obj3).booleanValue();
                oh3 oh3Var = new oh3(i2, 0, (n92) obj5);
                oh3Var.d = (dne) obj;
                oh3Var.e = (zy4) obj2;
                oh3Var.c = zBooleanValue;
                oh3Var.f = (DarkMode) obj4;
                return oh3Var.invokeSuspend(c1eVar);
            default:
                boolean zBooleanValue2 = ((Boolean) obj4).booleanValue();
                oh3 oh3Var2 = new oh3(i2, 1, (n92) obj5);
                oh3Var2.d = (ncd) obj;
                oh3Var2.e = (rcd) obj2;
                oh3Var2.f = (xcd) obj3;
                oh3Var2.c = zBooleanValue2;
                return oh3Var2.invokeSuspend(c1eVar);
        }
    }
}
