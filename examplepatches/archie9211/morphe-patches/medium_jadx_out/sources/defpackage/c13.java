package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class c13 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ List b;

    public /* synthetic */ c13(List list, int i) {
        this.a = i;
        this.b = list;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        List list = this.b;
        switch (i) {
            case 0:
                Object obj = list.get(2);
                obj.getClass();
                return (Integer) obj;
            case 1:
                return list;
            default:
                return Integer.valueOf(list.size());
        }
    }
}
