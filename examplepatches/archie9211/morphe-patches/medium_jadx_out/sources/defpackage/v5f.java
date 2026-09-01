package defpackage;

import java.io.File;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v5f extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ v5f(int i, Object obj) {
        super(0);
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                n71 n71Var = (n71) obj;
                return Boolean.valueOf(((pkf) n71Var.c).p((File) n71Var.b));
            default:
                return ((hd8) obj).I0();
        }
    }
}
