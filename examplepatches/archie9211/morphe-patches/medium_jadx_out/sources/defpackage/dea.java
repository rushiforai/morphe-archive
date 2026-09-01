package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dea implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ tj9 b;

    public /* synthetic */ dea(tj9 tj9Var, int i) {
        this.a = i;
        this.b = tj9Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        tj9 tj9Var = this.b;
        switch (i) {
            case 0:
                String str = tj9Var.e;
                if (str == null || muc.b0(str)) {
                    return null;
                }
                return str;
            default:
                String str2 = tj9Var.d;
                if (str2 == null || muc.b0(str2)) {
                    return null;
                }
                return str2;
        }
    }
}
