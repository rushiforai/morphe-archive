package o9;

import android.graphics.Rect;
import android.util.ArrayMap;
import android.view.View;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final class u extends ya.a {

    /* renamed from: h, reason: collision with root package name */
    public ArrayList f80144h;

    /* renamed from: e, reason: collision with root package name */
    public final ArrayMap f80141e = new ArrayMap();

    /* renamed from: f, reason: collision with root package name */
    public final ArrayMap f80142f = new ArrayMap();

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f80143g = new ArrayList();

    /* renamed from: i, reason: collision with root package name */
    public boolean f80145i = false;

    public final void a(View view, ya.a aVar) {
        this.f80141e.put(view, aVar);
        this.f80142f.put(view, new ya.a());
        this.f80143g.add(view);
    }

    public final int b() {
        return this.f97097c * this.f97098d;
    }

    public final void c(ArrayList arrayList, Rect rect) {
        Iterator it = arrayList.iterator();
        boolean z11 = true;
        while (it.hasNext()) {
            ya.a aVar = (ya.a) this.f80141e.get((View) it.next());
            if (z11) {
                int i5 = aVar.f97095a;
                int i11 = aVar.f97096b;
                rect.set(i5, i11, aVar.f97097c + i5, aVar.f97098d + i11);
                z11 = false;
            } else {
                int i12 = aVar.f97095a;
                int i13 = aVar.f97096b;
                rect.union(i12, i13, aVar.f97097c + i12, aVar.f97098d + i13);
            }
        }
    }

    public final void d() {
        ArrayMap arrayMap = this.f80142f;
        for (View view : arrayMap.keySet()) {
            ya.a aVar = (ya.a) this.f80141e.get(view);
            ya.a aVar2 = (ya.a) arrayMap.get(view);
            aVar.getClass();
            aVar.f97095a = aVar2.f97095a;
            aVar.f97096b = aVar2.f97096b;
            aVar.f97097c = aVar2.f97097c;
            aVar.f97098d = aVar2.f97098d;
        }
    }

    public final void e() {
        ArrayMap arrayMap = this.f80141e;
        for (View view : arrayMap.keySet()) {
            ya.a aVar = (ya.a) this.f80142f.get(view);
            ya.a aVar2 = (ya.a) arrayMap.get(view);
            aVar.getClass();
            aVar.f97095a = aVar2.f97095a;
            aVar.f97096b = aVar2.f97096b;
            aVar.f97097c = aVar2.f97097c;
            aVar.f97098d = aVar2.f97098d;
        }
    }
}
