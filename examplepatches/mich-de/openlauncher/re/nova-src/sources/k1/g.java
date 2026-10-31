package k1;

import android.content.Context;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.LinkedHashMap;

/* loaded from: classes.dex */
public final class g extends ViewGroup {

    /* renamed from: a, reason: collision with root package name */
    public final int f70828a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f70829b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f70830c;

    /* renamed from: d, reason: collision with root package name */
    public final x7.c f70831d;

    /* renamed from: e, reason: collision with root package name */
    public int f70832e;

    public g(Context context) {
        super(context);
        this.f70828a = 5;
        ArrayList arrayList = new ArrayList();
        this.f70829b = arrayList;
        ArrayList arrayList2 = new ArrayList();
        this.f70830c = arrayList2;
        this.f70831d = new x7.c(4);
        setClipChildren(false);
        i iVar = new i(context);
        addView(iVar);
        arrayList.add(iVar);
        arrayList2.add(iVar);
        this.f70832e = 1;
        setTag(2131428144, Boolean.TRUE);
    }

    public final i a(h hVar) {
        x7.c cVar = this.f70831d;
        LinkedHashMap linkedHashMap = (LinkedHashMap) cVar.f95126a;
        LinkedHashMap linkedHashMap2 = (LinkedHashMap) cVar.f95126a;
        LinkedHashMap linkedHashMap3 = (LinkedHashMap) cVar.f95127b;
        i iVar = (i) linkedHashMap.get(hVar);
        if (iVar != null) {
            return iVar;
        }
        i iVar2 = (i) b70.d.G0(this.f70830c);
        if (iVar2 == null) {
            int i5 = this.f70832e;
            ArrayList arrayList = this.f70829b;
            if (i5 > ul.b.K(arrayList)) {
                iVar2 = new i(getContext());
                addView(iVar2);
                arrayList.add(iVar2);
            } else {
                iVar2 = (i) arrayList.get(this.f70832e);
                h hVar2 = (h) linkedHashMap3.get(iVar2);
                if (hVar2 != null) {
                    hVar2.q();
                    i iVar3 = (i) linkedHashMap2.get(hVar2);
                    if (iVar3 != null) {
                    }
                    linkedHashMap2.remove(hVar2);
                    iVar2.b();
                }
            }
            int i11 = this.f70832e;
            if (i11 < this.f70828a - 1) {
                this.f70832e = i11 + 1;
            } else {
                this.f70832e = 0;
            }
        }
        linkedHashMap2.put(hVar, iVar2);
        linkedHashMap3.put(iVar2, hVar);
        return iVar2;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
    }

    @Override // android.view.View
    public final void onMeasure(int i5, int i11) {
        setMeasuredDimension(0, 0);
    }

    @Override // android.view.View, android.view.ViewParent
    public final void requestLayout() {
    }
}
