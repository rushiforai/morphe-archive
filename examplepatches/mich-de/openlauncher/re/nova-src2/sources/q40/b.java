package q40;

import android.view.View;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b extends ArrayList {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ c f83653a;

    public b(c cVar) {
        this.f83653a = cVar;
    }

    @Override // java.util.ArrayList, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        View element = (View) obj;
        Intrinsics.g(element, "element");
        Iterator it = this.f83653a.f83654a.iterator();
        while (it.hasNext()) {
            ((p40.f) it.next()).a(element, true);
        }
        return super.add(element);
    }

    @Override // java.util.ArrayList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final /* bridge */ boolean contains(Object obj) {
        if (obj instanceof View) {
            return super.contains((View) obj);
        }
        return false;
    }

    @Override // java.util.ArrayList, java.util.AbstractList, java.util.List
    public final /* bridge */ int indexOf(Object obj) {
        if (obj instanceof View) {
            return super.indexOf((View) obj);
        }
        return -1;
    }

    @Override // java.util.ArrayList, java.util.AbstractList, java.util.List
    public final /* bridge */ int lastIndexOf(Object obj) {
        if (obj instanceof View) {
            return super.lastIndexOf((View) obj);
        }
        return -1;
    }

    @Override // java.util.ArrayList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final /* bridge */ boolean remove(Object obj) {
        if (obj instanceof View) {
            return super.remove((View) obj);
        }
        return false;
    }

    @Override // java.util.ArrayList, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        Object objRemove = super.remove(i5);
        Intrinsics.f(objRemove, "super.removeAt(index)");
        View view = (View) objRemove;
        Iterator it = this.f83653a.f83654a.iterator();
        while (it.hasNext()) {
            ((p40.f) it.next()).a(view, false);
        }
        return view;
    }
}
