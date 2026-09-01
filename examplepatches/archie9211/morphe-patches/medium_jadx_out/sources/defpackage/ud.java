package defpackage;

import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ud extends hj5 {
    public final /* synthetic */ int n0;
    public float o0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ud(qpc qpcVar, opc opcVar, int i) {
        super(qpcVar, opcVar);
        this.n0 = i;
    }

    @Override // defpackage.hj5, defpackage.c62, defpackage.sya
    public final void apply() {
        int i = this.n0;
        qpc qpcVar = this.k0;
        ArrayList arrayList = this.m0;
        switch (i) {
            case 0:
                Iterator it2 = arrayList.iterator();
                while (it2.hasNext()) {
                    c62 c62VarB = qpcVar.b(it2.next());
                    c62VarB.g();
                    Object obj = this.N;
                    if (obj != null) {
                        c62VarB.o(obj);
                    } else {
                        Object obj2 = this.O;
                        if (obj2 != null) {
                            c62VarB.d0 = mpc.START_TO_END;
                            c62VarB.O = obj2;
                        } else {
                            c62VarB.o(0);
                        }
                    }
                    Object obj3 = this.P;
                    if (obj3 != null) {
                        c62VarB.d0 = mpc.END_TO_START;
                        c62VarB.P = obj3;
                    } else {
                        Object obj4 = this.Q;
                        if (obj4 != null) {
                            c62VarB.i(obj4);
                        } else {
                            c62VarB.i(0);
                        }
                    }
                    float f = this.o0;
                    if (f != 0.5f) {
                        c62VarB.h = f;
                    }
                }
                break;
            default:
                Iterator it3 = arrayList.iterator();
                while (it3.hasNext()) {
                    c62 c62VarB2 = qpcVar.b(it3.next());
                    c62VarB2.h();
                    Object obj5 = this.R;
                    if (obj5 != null) {
                        c62VarB2.p(obj5);
                    } else {
                        Object obj6 = this.S;
                        if (obj6 != null) {
                            c62VarB2.d0 = mpc.TOP_TO_BOTTOM;
                            c62VarB2.S = obj6;
                        } else {
                            c62VarB2.p(0);
                        }
                    }
                    Object obj7 = this.U;
                    if (obj7 != null) {
                        c62VarB2.d0 = mpc.BOTTOM_TO_TOP;
                        c62VarB2.U = obj7;
                    } else {
                        Object obj8 = this.V;
                        if (obj8 != null) {
                            c62VarB2.e(obj8);
                        } else {
                            c62VarB2.e(0);
                        }
                    }
                    float f2 = this.o0;
                    if (f2 != 0.5f) {
                        c62VarB2.i = f2;
                    }
                }
                break;
        }
    }
}
