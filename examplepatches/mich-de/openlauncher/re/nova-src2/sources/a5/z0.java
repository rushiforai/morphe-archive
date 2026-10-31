package a5;

import android.util.SparseArray;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.WeakHashMap;

/* loaded from: classes2.dex */
public final class z0 {

    /* renamed from: d, reason: collision with root package name */
    public static final ArrayList f386d = new ArrayList();

    /* renamed from: a, reason: collision with root package name */
    public WeakHashMap f387a;

    /* renamed from: b, reason: collision with root package name */
    public SparseArray f388b;

    /* renamed from: c, reason: collision with root package name */
    public WeakReference f389c;

    public static z0 a(View view) {
        z0 z0Var = (z0) view.getTag(2131428987);
        if (z0Var != null) {
            return z0Var;
        }
        z0 z0Var2 = new z0();
        z0Var2.f387a = null;
        z0Var2.f388b = null;
        z0Var2.f389c = null;
        view.setTag(2131428987, z0Var2);
        return z0Var2;
    }

    public final boolean b(View view, KeyEvent keyEvent) {
        if (keyEvent.getAction() == 0) {
            WeakHashMap weakHashMap = this.f387a;
            if (weakHashMap != null) {
                weakHashMap.clear();
            }
            ArrayList arrayList = f386d;
            if (!arrayList.isEmpty()) {
                synchronized (arrayList) {
                    try {
                        if (this.f387a == null) {
                            this.f387a = new WeakHashMap();
                        }
                        for (int size = arrayList.size() - 1; size >= 0; size--) {
                            ArrayList arrayList2 = f386d;
                            View view2 = (View) ((WeakReference) arrayList2.get(size)).get();
                            if (view2 == null) {
                                arrayList2.remove(size);
                            } else {
                                this.f387a.put(view2, Boolean.TRUE);
                                for (ViewParent parent = view2.getParent(); parent instanceof View; parent = parent.getParent()) {
                                    this.f387a.put((View) parent, Boolean.TRUE);
                                }
                            }
                        }
                    } finally {
                    }
                }
            }
        }
        View viewC = c(view);
        if (keyEvent.getAction() == 0) {
            int keyCode = keyEvent.getKeyCode();
            if (viewC != null && !KeyEvent.isModifierKey(keyCode)) {
                if (this.f388b == null) {
                    this.f388b = new SparseArray();
                }
                this.f388b.put(keyCode, new WeakReference(viewC));
            }
        }
        return viewC != null;
    }

    public final View c(View view) {
        int size;
        WeakHashMap weakHashMap = this.f387a;
        if (weakHashMap == null || !weakHashMap.containsKey(view)) {
            return null;
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            for (int childCount = viewGroup.getChildCount() - 1; childCount >= 0; childCount--) {
                View viewC = c(viewGroup.getChildAt(childCount));
                if (viewC != null) {
                    return viewC;
                }
            }
        }
        ArrayList arrayList = (ArrayList) view.getTag(2131428988);
        if (arrayList == null || arrayList.size() - 1 < 0) {
            return null;
        }
        arrayList.get(size).getClass();
        throw new ClassCastException();
    }
}
