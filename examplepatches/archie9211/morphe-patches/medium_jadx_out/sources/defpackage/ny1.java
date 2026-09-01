package defpackage;

import android.os.Bundle;
import androidx.navigation.fragment.NavHostFragment;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ny1 implements dpb {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ ny1(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.dpb
    public final Bundle a() {
        f09[] f09VarArr;
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return xy1.h((xy1) obj);
            case 1:
                Map mapC = ((rob) obj).c();
                Bundle bundle = new Bundle();
                for (Map.Entry entry : mapC.entrySet()) {
                    String str = (String) entry.getKey();
                    List list = (List) entry.getValue();
                    bundle.putParcelableArrayList(str, list instanceof ArrayList ? (ArrayList) list : new ArrayList<>(list));
                }
                return bundle;
            case 2:
                m15 m15Var = (m15) obj;
                while (m15.n(m15Var.m(), vx6.CREATED)) {
                }
                m15Var.b.e(ux6.ON_STOP);
                return new Bundle();
            case 3:
                return ((f25) obj).W();
            case 4:
                Bundle bundleH = ((db8) obj).h();
                if (bundleH != null) {
                    return bundleH;
                }
                Bundle bundle2 = Bundle.EMPTY;
                bundle2.getClass();
                return bundle2;
            case 5:
                int i2 = ((NavHostFragment) obj).o0;
                if (i2 != 0) {
                    return xz5.E(new f09("android-support-nav:fragment:graphId", Integer.valueOf(i2)));
                }
                Bundle bundle3 = Bundle.EMPTY;
                bundle3.getClass();
                return bundle3;
            default:
                iq1 iq1Var = (iq1) obj;
                for (Map.Entry entry2 : ei7.W((LinkedHashMap) iq1Var.e).entrySet()) {
                    iq1Var.Q((String) entry2.getKey(), ((xpc) entry2.getValue()).getValue());
                }
                for (Map.Entry entry3 : ei7.W((LinkedHashMap) iq1Var.c).entrySet()) {
                    iq1Var.Q((String) entry3.getKey(), ((dpb) entry3.getValue()).a());
                }
                LinkedHashMap linkedHashMap = (LinkedHashMap) iq1Var.b;
                if (linkedHashMap.isEmpty()) {
                    f09VarArr = new f09[0];
                } else {
                    ArrayList arrayList = new ArrayList(linkedHashMap.size());
                    for (Map.Entry entry4 : linkedHashMap.entrySet()) {
                        arrayList.add(new f09((String) entry4.getKey(), entry4.getValue()));
                    }
                    f09VarArr = (f09[]) arrayList.toArray(new f09[0]);
                }
                return xz5.E((f09[]) Arrays.copyOf(f09VarArr, f09VarArr.length));
        }
    }
}
