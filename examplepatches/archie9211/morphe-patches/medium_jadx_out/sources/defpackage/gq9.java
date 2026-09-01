package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class gq9 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ mq9 b;
    public final /* synthetic */ iq9 c;
    public final /* synthetic */ l78 d;

    public /* synthetic */ gq9(iq9 iq9Var, mq9 mq9Var, l78 l78Var, int i) {
        this.a = i;
        this.c = iq9Var;
        this.b = mq9Var;
        this.d = l78Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        l78 l78Var = this.d;
        mq9 mq9Var = this.b;
        iq9 iq9Var = this.c;
        switch (i) {
            case 0:
                l78Var.setValue(Boolean.FALSE);
                String str = mq9Var.d;
                if (str == null) {
                    ay0.e("Don't show the Publication follow state without providing a publication id");
                } else {
                    iq9Var.D(str, mq9Var.s);
                }
                break;
            case 1:
                l78Var.setValue(Boolean.FALSE);
                String str2 = mq9Var.c;
                iq9Var.A(mq9Var.s, mq9Var.a, str2);
                break;
            case 2:
                l78Var.setValue(Boolean.FALSE);
                String str3 = mq9Var.c;
                iq9Var.t(mq9Var.s, mq9Var.a, str3);
                break;
            case 3:
                l78Var.setValue(Boolean.FALSE);
                String str4 = mq9Var.d;
                if (str4 == null) {
                    ay0.e("Don't show the Collection mute state without providing a collection id");
                } else {
                    iq9Var.q(mq9Var.s, mq9Var.a, str4);
                }
                break;
            case 4:
                l78Var.setValue(Boolean.FALSE);
                String str5 = mq9Var.d;
                if (str5 == null) {
                    ay0.e("Don't show the Collection mute state without providing a collection id");
                } else {
                    iq9Var.u(mq9Var.s, mq9Var.a, str5);
                }
                break;
            case 5:
                l78Var.setValue(Boolean.FALSE);
                iq9Var.i(mq9Var.s, mq9Var.a, mq9Var.c);
                break;
            case 6:
                l78Var.setValue(Boolean.FALSE);
                iq9Var.B(mq9Var.a, mq9Var.s);
                break;
            case 7:
                l78Var.setValue(Boolean.FALSE);
                iq9Var.C(mq9Var.a, mq9Var.s);
                break;
            case 8:
                l78Var.setValue(Boolean.FALSE);
                iq9Var.H(mq9Var.a, mq9Var.s);
                break;
            case 9:
                l78Var.setValue(Boolean.FALSE);
                iq9Var.e(mq9Var.a, mq9Var.s);
                break;
            case 10:
                l78Var.setValue(Boolean.FALSE);
                iq9Var.h(mq9Var.a, mq9Var.s);
                break;
            case 11:
                l78Var.setValue(Boolean.FALSE);
                iq9Var.n(mq9Var.a, mq9Var.s);
                break;
            case 12:
                l78Var.setValue(Boolean.FALSE);
                iq9Var.p(mq9Var.g);
                break;
            case 13:
                l78Var.setValue(Boolean.FALSE);
                iq9Var.L(mq9Var.a, mq9Var.s);
                break;
            case 14:
                l78Var.setValue(Boolean.FALSE);
                String str6 = mq9Var.a;
                String str7 = mq9Var.d;
                if (str7 == null) {
                    ay0.e("Don't show the PostFeaturingState without providing a publication id");
                } else {
                    iq9Var.b(mq9Var.s, str6, str7);
                }
                break;
            case 15:
                l78Var.setValue(Boolean.FALSE);
                String str8 = mq9Var.a;
                String str9 = mq9Var.d;
                if (str9 == null) {
                    ay0.e("Don't show the PostFeaturingState without providing a publication id");
                } else {
                    iq9Var.c(mq9Var.s, str8, str9);
                }
                break;
            default:
                l78Var.setValue(Boolean.FALSE);
                String str10 = mq9Var.d;
                if (str10 == null) {
                    ay0.e("Don't show the Publication follow state without providing a publication id");
                } else {
                    iq9Var.w(str10, mq9Var.s);
                }
                break;
        }
        return null;
    }

    public /* synthetic */ gq9(mq9 mq9Var, iq9 iq9Var, l78 l78Var, int i) {
        this.a = i;
        this.b = mq9Var;
        this.c = iq9Var;
        this.d = l78Var;
    }
}
