package defpackage;

import java.util.Collection;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class w1 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Collection b;

    public /* synthetic */ w1(int i, Collection collection) {
        this.a = i;
        this.b = collection;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        boolean zContains;
        int i = this.a;
        Collection<?> collection = this.b;
        switch (i) {
            case 0:
                zContains = collection.contains(obj);
                break;
            case 1:
                zContains = collection.contains(obj);
                break;
            case 2:
                zContains = collection.contains(obj);
                break;
            default:
                zContains = ((List) obj).retainAll(collection);
                break;
        }
        return Boolean.valueOf(zContains);
    }
}
