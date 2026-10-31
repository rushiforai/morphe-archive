package q9;

import android.content.ComponentName;
import android.os.UserHandle;
import android.view.View;
import android.view.ViewGroup;
import com.android.launcher3.BubbleTextView;
import com.android.launcher3.CellLayout;
import com.android.launcher3.util.ComponentKey;
import com.teslacoilsw.launcher.launcher3.allapps.AllAppsPagedViewRecyclerView;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.function.Consumer;
import ya.g0;

/* loaded from: classes.dex */
public final class p {

    /* renamed from: f, reason: collision with root package name */
    public int f83866f;

    /* renamed from: a, reason: collision with root package name */
    public final g0 f83861a = new g0((String) null, (UserHandle) null);

    /* renamed from: b, reason: collision with root package name */
    public final ga.a f83862b = new ga.a();

    /* renamed from: c, reason: collision with root package name */
    public ga.a[] f83863c = ga.a.D;

    /* renamed from: d, reason: collision with root package name */
    public final CopyOnWriteArrayList f83864d = new CopyOnWriteArrayList();

    /* renamed from: e, reason: collision with root package name */
    public final ArrayList f83865e = new ArrayList();

    /* renamed from: g, reason: collision with root package name */
    public int f83867g = 0;

    /* renamed from: h, reason: collision with root package name */
    public boolean f83868h = false;

    public static void f(ViewGroup viewGroup, Consumer consumer) {
        if (viewGroup instanceof CellLayout) {
            viewGroup = ((CellLayout) viewGroup).P;
        }
        int childCount = viewGroup.getChildCount();
        int i5 = 0;
        if (childCount > 0 && (viewGroup instanceof AllAppsPagedViewRecyclerView)) {
            ViewGroup viewGroup2 = (ViewGroup) viewGroup.getChildAt(0);
            while (i5 < viewGroup2.getChildCount()) {
                f((ViewGroup) viewGroup2.getChildAt(i5), consumer);
                i5++;
            }
            return;
        }
        while (i5 < childCount) {
            View childAt = viewGroup.getChildAt(i5);
            if (childAt instanceof BubbleTextView) {
                consumer.accept((BubbleTextView) childAt);
            }
            i5++;
        }
    }

    public final void a(o oVar) {
        this.f83864d.add(oVar);
    }

    public final ga.a b(ComponentKey componentKey) {
        ComponentName componentName = componentKey.f21251a;
        ga.a aVar = this.f83862b;
        aVar.f57279y = componentName;
        aVar.o = componentKey.f21252b;
        int iBinarySearch = Arrays.binarySearch(this.f83863c, aVar, ga.a.E);
        if (iBinarySearch < 0) {
            return null;
        }
        return this.f83863c[iBinarySearch];
    }

    public final ga.a c(Object obj) {
        if (obj instanceof ga.a) {
            if (!(obj instanceof ga.c)) {
                return (ga.a) obj;
            }
            return null;
        }
        if (obj instanceof ga.j) {
            ga.j jVar = (ga.j) obj;
            if (fg.a.F(jVar.f57322x)) {
                for (ga.a aVar : this.f83863c) {
                    if (jVar.f57322x.getComponent().equals(aVar.f57279y) && jVar.o.equals(aVar.o)) {
                        return aVar;
                    }
                }
            }
        }
        return null;
    }

    public final void d() {
        if (this.f83867g != 0) {
            this.f83868h = true;
            return;
        }
        Iterator it = this.f83864d.iterator();
        while (it.hasNext()) {
            ((o) it.next()).a();
        }
    }

    public final void e(Consumer consumer) {
        ArrayList arrayList = this.f83865e;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            f((ViewGroup) arrayList.get(size), consumer);
        }
    }
}
