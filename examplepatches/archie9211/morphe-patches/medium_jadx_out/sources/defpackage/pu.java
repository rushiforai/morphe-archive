package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pu extends b2 {
    public final /* synthetic */ int c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ pu(List list, int i) {
        super(list);
        this.c = i;
    }

    @Override // defpackage.xu
    public final rn0 w() {
        switch (this.c) {
            case 0:
                return new zu1((List) this.b, 0);
            case 1:
                return new se5((List) this.b, 0);
            case 2:
                return new zu1((List) this.b, 2);
            case 3:
                return new se5((List) this.b, 1);
            case 4:
                return new se5((List) this.b, 2);
            case 5:
                return new a4c((List) this.b);
            default:
                return new zu1((List) this.b, 3);
        }
    }
}
