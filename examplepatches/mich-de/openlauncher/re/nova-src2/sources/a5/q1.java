package a5;

import android.os.Build;
import android.view.WindowInsets;
import android.view.WindowInsetsAnimation;
import android.view.WindowInsetsAnimation$Callback;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

/* loaded from: classes.dex */
public final class q1 extends WindowInsetsAnimation$Callback {

    /* renamed from: a, reason: collision with root package name */
    public final l1 f349a;

    /* renamed from: b, reason: collision with root package name */
    public List f350b;

    /* renamed from: c, reason: collision with root package name */
    public ArrayList f351c;

    /* renamed from: d, reason: collision with root package name */
    public final HashMap f352d;

    public q1(l1 l1Var) {
        super(l1Var.f316a);
        this.f352d = new HashMap();
        this.f349a = l1Var;
    }

    public final t1 a(WindowInsetsAnimation windowInsetsAnimation) {
        t1 t1Var = (t1) this.f352d.get(windowInsetsAnimation);
        if (t1Var == null) {
            t1Var = new t1(0, null, 0L);
            if (Build.VERSION.SDK_INT >= 30) {
                t1Var.f369a = new r1(windowInsetsAnimation);
            }
            this.f352d.put(windowInsetsAnimation, t1Var);
        }
        return t1Var;
    }

    public final void onEnd(WindowInsetsAnimation windowInsetsAnimation) {
        this.f349a.d(a(windowInsetsAnimation));
        this.f352d.remove(windowInsetsAnimation);
    }

    public final void onPrepare(WindowInsetsAnimation windowInsetsAnimation) {
        a(windowInsetsAnimation);
        this.f349a.e();
    }

    public final WindowInsets onProgress(WindowInsets windowInsets, List list) {
        ArrayList arrayList = this.f351c;
        if (arrayList == null) {
            ArrayList arrayList2 = new ArrayList(list.size());
            this.f351c = arrayList2;
            this.f350b = Collections.unmodifiableList(arrayList2);
        } else {
            arrayList.clear();
        }
        for (int size = list.size() - 1; size >= 0; size--) {
            WindowInsetsAnimation windowInsetsAnimationK = f0.k(list.get(size));
            t1 t1VarA = a(windowInsetsAnimationK);
            t1VarA.f369a.d(windowInsetsAnimationK.getFraction());
            this.f351c.add(t1VarA);
        }
        return this.f349a.f(h2.g(null, windowInsets), this.f350b).f();
    }

    public final WindowInsetsAnimation.Bounds onStart(WindowInsetsAnimation windowInsetsAnimation, WindowInsetsAnimation.Bounds bounds) {
        return this.f349a.g(a(windowInsetsAnimation), c10.a.D(bounds)).C();
    }
}
