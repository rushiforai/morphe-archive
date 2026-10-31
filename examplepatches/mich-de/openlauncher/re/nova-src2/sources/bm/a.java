package bm;

import ab.e0;
import android.animation.AnimatorInflater;
import android.view.View;
import androidx.recyclerview.widget.s2;
import com.android.launcher3.BubbleTextView;
import com.android.launcher3.allapps.AllAppsRecyclerView;
import java.util.Collections;
import java.util.HashSet;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public int f18056a;

    /* renamed from: b, reason: collision with root package name */
    public int f18057b;

    /* renamed from: c, reason: collision with root package name */
    public Object f18058c;

    /* renamed from: d, reason: collision with root package name */
    public Object f18059d;

    /* renamed from: e, reason: collision with root package name */
    public final Object f18060e;

    /* renamed from: f, reason: collision with root package name */
    public final Object f18061f;

    /* renamed from: g, reason: collision with root package name */
    public Object f18062g;

    public a(AllAppsRecyclerView allAppsRecyclerView) {
        this.f18056a = -1;
        this.f18058c = allAppsRecyclerView;
        allAppsRecyclerView.addOnChildAttachStateChangeListener(new q9.h(this));
        this.f18060e = new int[10];
        this.f18061f = new bh.c();
        this.f18062g = new a90.d(this, 3);
    }

    public void a(k kVar) {
        if (((HashSet) this.f18059d).contains(kVar.f18089a)) {
            throw new IllegalArgumentException("Components are not allowed to depend on interfaces they themselves provide.");
        }
        ((HashSet) this.f18060e).add(kVar);
    }

    public b b() {
        if (((e) this.f18062g) != null) {
            return new b((String) this.f18058c, new HashSet((HashSet) this.f18059d), new HashSet((HashSet) this.f18060e), this.f18056a, this.f18057b, (e) this.f18062g, (HashSet) this.f18061f);
        }
        throw new IllegalStateException("Missing required property: factory.");
    }

    public void c(int i5) {
        if (!(this.f18056a == 0)) {
            throw new IllegalStateException("Instantiation type has already been set.");
        }
        this.f18056a = i5;
    }

    public void d(boolean z11) {
        s2 s2Var = (s2) this.f18059d;
        if (s2Var != null) {
            s2Var.itemView.setActivated(z11);
            ((s2) this.f18059d).setIsRecyclable(!z11);
            if (z11) {
                View view = ((s2) this.f18059d).itemView;
                if (!(view instanceof BubbleTextView) || ((BubbleTextView) view).f20886y == 0) {
                    return;
                }
                view.setStateListAnimator(AnimatorInflater.loadStateListAnimator(view.getContext(), ((BubbleTextView) ((s2) this.f18059d).itemView).f20886y));
            }
        }
    }

    public a(Class cls, Class[] clsArr) {
        this.f18058c = null;
        HashSet hashSet = new HashSet();
        this.f18059d = hashSet;
        this.f18060e = new HashSet();
        this.f18056a = 0;
        this.f18057b = 0;
        this.f18061f = new HashSet();
        hashSet.add(r.a(cls));
        for (Class cls2 : clsArr) {
            e0.q(cls2, "Null interface");
            ((HashSet) this.f18059d).add(r.a(cls2));
        }
    }

    public a(r rVar, r[] rVarArr) {
        this.f18058c = null;
        HashSet hashSet = new HashSet();
        this.f18059d = hashSet;
        this.f18060e = new HashSet();
        this.f18056a = 0;
        this.f18057b = 0;
        this.f18061f = new HashSet();
        hashSet.add(rVar);
        for (r rVar2 : rVarArr) {
            e0.q(rVar2, "Null interface");
        }
        Collections.addAll((HashSet) this.f18059d, rVarArr);
    }
}
