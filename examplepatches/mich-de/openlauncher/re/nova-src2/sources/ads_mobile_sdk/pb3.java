package ads_mobile_sdk;

import android.content.Context;
import android.view.View;
import java.util.ArrayList;
import java.util.HashMap;

/* loaded from: classes2.dex */
public final class pb3 implements b.j1 {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f8155a = new ArrayList();

    @Override // b.j1
    public final void a(HashMap map) {
    }

    @Override // b.j1
    public final void b(HashMap map) {
    }

    @Override // b.j1
    public final synchronized void a(HashMap map, Context context, View view) {
        map.put("vst", new ArrayList(this.f8155a));
        this.f8155a.clear();
    }
}
