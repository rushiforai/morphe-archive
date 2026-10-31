package c3;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public final /* synthetic */ class d2 implements a7.d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19255a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f19256b;

    public /* synthetic */ d2(Object obj, int i5) {
        this.f19255a = i5;
        this.f19256b = obj;
    }

    @Override // a7.d
    public final Bundle a() {
        switch (this.f19255a) {
            case 0:
                Map mapD = ((y1.f) this.f19256b).d();
                Bundle bundle = new Bundle();
                for (Map.Entry entry : mapD.entrySet()) {
                    String str = (String) entry.getKey();
                    List list = (List) entry.getValue();
                    bundle.putParcelableArrayList(str, list instanceof ArrayList ? (ArrayList) list : new ArrayList<>(list));
                }
                return bundle;
            default:
                return g.o.V((g.o) this.f19256b);
        }
    }
}
