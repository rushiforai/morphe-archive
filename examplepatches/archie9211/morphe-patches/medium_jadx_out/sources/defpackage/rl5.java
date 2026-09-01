package defpackage;

import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rl5 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ArrayList b;

    public /* synthetic */ rl5(int i, ArrayList arrayList) {
        this.a = i;
        this.b = arrayList;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        Object next;
        int i = this.a;
        ArrayList arrayList = this.b;
        switch (i) {
            case 0:
                arrayList.get(((Number) obj).intValue());
                break;
            case 1:
                arrayList.get(((Number) obj).intValue());
                break;
            case 2:
                arrayList.get(((Number) obj).intValue());
                break;
            case 3:
                c47 c47Var = (c47) arrayList.get(((Number) obj).intValue());
                c47Var.getClass();
                break;
            case 4:
                arrayList.get(((Number) obj).intValue());
                break;
            case 5:
                arrayList.get(((Number) obj).intValue());
                break;
            case 6:
                arrayList.get(((Number) obj).intValue());
                break;
            case 7:
                arrayList.get(((Number) obj).intValue());
                break;
            case 8:
                String str = (String) obj;
                str.getClass();
                ArrayList arrayList2 = new ArrayList();
                for (Object obj2 : arrayList) {
                    if (obj2 instanceof sfb) {
                        arrayList2.add(obj2);
                    }
                }
                Iterator it2 = arrayList2.iterator();
                while (true) {
                    if (it2.hasNext()) {
                        next = it2.next();
                        if (g76.L(((sfb) next).a, str)) {
                        }
                    } else {
                        next = null;
                    }
                }
                sfb sfbVar = (sfb) next;
                if (sfbVar != null) {
                }
                break;
            case 9:
                arrayList.get(((Number) obj).intValue());
                break;
            case 10:
                arrayList.get(((Number) obj).intValue());
                break;
            case 11:
                arrayList.get(((Number) obj).intValue());
                break;
            case 12:
                arrayList.get(((Number) obj).intValue());
                break;
            case 13:
                arrayList.get(((Number) obj).intValue());
                break;
            case 14:
                arrayList.get(((Number) obj).intValue());
                break;
            case 15:
                arrayList.get(((Number) obj).intValue());
                break;
            case 16:
                arrayList.get(((Number) obj).intValue());
                break;
            default:
                arrayList.get(((Number) obj).intValue());
                break;
        }
        return null;
    }
}
