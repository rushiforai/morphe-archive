package h6;

import java.util.Iterator;
import java.util.LinkedHashMap;

/* loaded from: classes.dex */
public final class n1 {

    /* renamed from: a, reason: collision with root package name */
    public final LinkedHashMap f59410a = new LinkedHashMap();

    public final void a() {
        LinkedHashMap linkedHashMap = this.f59410a;
        Iterator it = linkedHashMap.values().iterator();
        while (it.hasNext()) {
            ((f1) it.next()).clear$lifecycle_viewmodel_release();
        }
        linkedHashMap.clear();
    }
}
