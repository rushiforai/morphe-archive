package defpackage;

import com.drew.metadata.photoshop.PhotoshopDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class qs1 implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ms1 b;
    public final /* synthetic */ ek8 c;

    public /* synthetic */ qs1(int i, ms1 ms1Var, ek8 ek8Var) {
        this.a = i;
        this.b = ms1Var;
        this.c = ek8Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        uob uobVar = w12.a;
        final ek8 ek8Var = this.c;
        final ms1 ms1Var = this.b;
        Object[] objArr = 0;
        char c = 1;
        switch (i) {
            case 0:
                r28 r28Var = (r28) obj;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                r28Var.getClass();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p65) x12Var).f(r28Var) ? 4 : 2;
                }
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                    p65Var.S();
                } else {
                    String str = ms1Var.g;
                    hl0 hl0Var = hl0.M;
                    boolean zF = p65Var.f(ek8Var) | p65Var.f(ms1Var);
                    Object objM = p65Var.M();
                    if (zF || objM == uobVar) {
                        final char c2 = c == true ? 1 : 0;
                        objM = new m45() { // from class: os1
                            @Override // defpackage.m45
                            public final Object invoke() {
                                int i2 = c2;
                                c1e c1eVar2 = c1e.a;
                                ms1 ms1Var2 = ms1Var;
                                ek8 ek8Var2 = ek8Var;
                                switch (i2) {
                                    case 0:
                                        ek8Var2.l(ms1Var2.h, ms1Var2.l);
                                        break;
                                    default:
                                        ek8Var2.k(ms1Var2.e, ms1Var2.l);
                                        break;
                                }
                                return c1eVar2;
                            }
                        };
                        p65Var.j0(objM);
                    }
                    d46.a(str, hl0Var, r28Var, null, null, null, null, 0.0f, 0, null, (m45) objM, p65Var, ((iIntValue << 6) & 896) | 48, 0, 2040);
                }
                break;
            default:
                r28 r28Var2 = (r28) obj;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                r28Var2.getClass();
                if ((iIntValue2 & 6) == 0) {
                    iIntValue2 |= ((p65) x12Var2).f(r28Var2) ? 4 : 2;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 19) != 18)) {
                    p65Var2.S();
                } else {
                    int i2 = iIntValue2;
                    String str2 = ms1Var.j;
                    hl0 hl0Var2 = hl0.M;
                    boolean zF2 = p65Var2.f(ek8Var) | p65Var2.f(ms1Var);
                    Object objM2 = p65Var2.M();
                    if (zF2 || objM2 == uobVar) {
                        final Object[] objArr2 = objArr == true ? 1 : 0;
                        objM2 = new m45() { // from class: os1
                            @Override // defpackage.m45
                            public final Object invoke() {
                                int i22 = objArr2;
                                c1e c1eVar2 = c1e.a;
                                ms1 ms1Var2 = ms1Var;
                                ek8 ek8Var2 = ek8Var;
                                switch (i22) {
                                    case 0:
                                        ek8Var2.l(ms1Var2.h, ms1Var2.l);
                                        break;
                                    default:
                                        ek8Var2.k(ms1Var2.e, ms1Var2.l);
                                        break;
                                }
                                return c1eVar2;
                            }
                        };
                        p65Var2.j0(objM2);
                    }
                    hp7.o(str2, hl0Var2, r28Var2, null, null, 0.0f, 0, null, (m45) objM2, p65Var2, ((i2 << 6) & 896) | 48, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
                }
                break;
        }
        return c1eVar;
    }
}
