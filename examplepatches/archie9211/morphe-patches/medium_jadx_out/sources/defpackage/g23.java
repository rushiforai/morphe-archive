package defpackage;

import android.animation.Animator;
import android.content.Context;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import com.drew.imaging.avi.hzjl.bPUi;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.ListIterator;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class g23 {
    public final ViewGroup a;
    public final ArrayList b;
    public final ArrayList c;
    public boolean d;
    public boolean e;

    public g23(ViewGroup viewGroup) {
        viewGroup.getClass();
        this.a = viewGroup;
        this.b = new ArrayList();
        this.c = new ArrayList();
    }

    public static final g23 f(ViewGroup viewGroup, f25 f25Var) {
        viewGroup.getClass();
        f25Var.getClass();
        f25Var.G().getClass();
        Object tag = viewGroup.getTag(R.id.special_effects_controller_view_tag);
        if (tag instanceof g23) {
            return (g23) tag;
        }
        g23 g23Var = new g23(viewGroup);
        viewGroup.setTag(R.id.special_effects_controller_view_tag, g23Var);
        return g23Var;
    }

    public final void a(flc flcVar, clc clcVar, s25 s25Var) {
        synchronized (this.b) {
            a61 a61Var = new a61();
            blc blcVarD = d(s25Var.c);
            if (blcVarD != null) {
                blcVarD.c(flcVar, clcVar);
                return;
            }
            final blc blcVar = new blc(flcVar, clcVar, s25Var, a61Var);
            this.b.add(blcVar);
            final int i = 0;
            blcVar.d.add(new Runnable(this) { // from class: alc
                public final /* synthetic */ g23 b;

                {
                    this.b = this;
                }

                @Override // java.lang.Runnable
                public final void run() {
                    int i2 = i;
                    blc blcVar2 = blcVar;
                    g23 g23Var = this.b;
                    switch (i2) {
                        case 0:
                            if (g23Var.b.contains(blcVar2)) {
                                flc flcVar2 = blcVar2.a;
                                View view = blcVar2.c.G;
                                view.getClass();
                                flcVar2.applyState(view);
                            }
                            break;
                        default:
                            g23Var.b.remove(blcVar2);
                            g23Var.c.remove(blcVar2);
                            break;
                    }
                }
            });
            final int i2 = 1;
            blcVar.d.add(new Runnable(this) { // from class: alc
                public final /* synthetic */ g23 b;

                {
                    this.b = this;
                }

                @Override // java.lang.Runnable
                public final void run() {
                    int i22 = i2;
                    blc blcVar2 = blcVar;
                    g23 g23Var = this.b;
                    switch (i22) {
                        case 0:
                            if (g23Var.b.contains(blcVar2)) {
                                flc flcVar2 = blcVar2.a;
                                View view = blcVar2.c.G;
                                view.getClass();
                                flcVar2.applyState(view);
                            }
                            break;
                        default:
                            g23Var.b.remove(blcVar2);
                            g23Var.c.remove(blcVar2);
                            break;
                    }
                }
            });
        }
    }

    public final blc d(j15 j15Var) {
        Object next;
        Iterator it2 = this.b.iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            blc blcVar = (blc) next;
            if (blcVar.c.equals(j15Var) && !blcVar.f) {
                break;
            }
        }
        return (blc) next;
    }

    public final void e() {
        if (f25.I(2)) {
            Log.v("FragmentManager", "SpecialEffectsController: Forcing all operations to complete");
        }
        ViewGroup viewGroup = this.a;
        WeakHashMap weakHashMap = ute.a;
        boolean zIsAttachedToWindow = viewGroup.isAttachedToWindow();
        synchronized (this.b) {
            try {
                g();
                Iterator it2 = this.b.iterator();
                while (it2.hasNext()) {
                    ((blc) it2.next()).d();
                }
                for (blc blcVar : new ArrayList(this.c)) {
                    if (f25.I(2)) {
                        Log.v("FragmentManager", "SpecialEffectsController: " + (zIsAttachedToWindow ? "" : "Container " + this.a + " is not attached to window. ") + "Cancelling running operation " + blcVar);
                    }
                    blcVar.a();
                }
                for (blc blcVar2 : new ArrayList(this.b)) {
                    if (f25.I(2)) {
                        Log.v("FragmentManager", "SpecialEffectsController: " + (zIsAttachedToWindow ? "" : "Container " + this.a + " is not attached to window. ") + "Cancelling pending operation " + blcVar2);
                    }
                    blcVar2.a();
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void g() {
        for (blc blcVar : this.b) {
            if (blcVar.b == clc.ADDING) {
                View viewT = blcVar.c.T();
                dlc dlcVar = flc.Companion;
                int visibility = viewT.getVisibility();
                dlcVar.getClass();
                blcVar.c(dlc.b(visibility), clc.NONE);
            }
        }
    }

    public final void b(ArrayList arrayList, boolean z) {
        Object obj;
        Object next;
        ArrayList arrayList2;
        int i;
        String str;
        boolean z2;
        g23 g23Var = this;
        Iterator it2 = arrayList.iterator();
        while (true) {
            obj = null;
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            blc blcVar = (blc) next;
            dlc dlcVar = flc.Companion;
            View view = blcVar.c.G;
            view.getClass();
            dlcVar.getClass();
            flc flcVarA = dlc.a(view);
            flc flcVar = flc.VISIBLE;
            if (flcVarA == flcVar && blcVar.a != flcVar) {
                break;
            }
        }
        blc blcVar2 = (blc) next;
        ListIterator listIterator = arrayList.listIterator(arrayList.size());
        while (true) {
            if (!listIterator.hasPrevious()) {
                break;
            }
            Object objPrevious = listIterator.previous();
            blc blcVar3 = (blc) objPrevious;
            dlc dlcVar2 = flc.Companion;
            View view2 = blcVar3.c.G;
            view2.getClass();
            dlcVar2.getClass();
            flc flcVarA2 = dlc.a(view2);
            flc flcVar2 = flc.VISIBLE;
            if (flcVarA2 != flcVar2 && blcVar3.a == flcVar2) {
                obj = objPrevious;
                break;
            }
        }
        blc blcVar4 = (blc) obj;
        int i2 = 2;
        if (f25.I(2)) {
            Log.v("FragmentManager", "Executing operations from " + blcVar2 + " to " + blcVar4);
        }
        ArrayList<c23> arrayList3 = new ArrayList();
        ArrayList<d23> arrayList4 = new ArrayList();
        ArrayList arrayList5 = new ArrayList(arrayList);
        j15 j15Var = ((blc) bu1.H0(arrayList)).c;
        Iterator it3 = arrayList.iterator();
        while (it3.hasNext()) {
            f15 f15Var = ((blc) it3.next()).c.J;
            f15 f15Var2 = j15Var.J;
            f15Var.b = f15Var2.b;
            f15Var.c = f15Var2.c;
            f15Var.d = f15Var2.d;
            f15Var.e = f15Var2.e;
        }
        Iterator it4 = arrayList.iterator();
        while (it4.hasNext()) {
            blc blcVar5 = (blc) it4.next();
            a61 a61Var = new a61();
            blcVar5.d();
            LinkedHashSet linkedHashSet = blcVar5.e;
            linkedHashSet.add(a61Var);
            arrayList3.add(new c23(blcVar5, a61Var, z));
            a61 a61Var2 = new a61();
            blcVar5.d();
            linkedHashSet.add(a61Var2);
            arrayList4.add(new d23(blcVar5, a61Var2));
            blcVar5.d.add(new fi2(arrayList5, blcVar5, g23Var));
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        ArrayList arrayList6 = new ArrayList();
        for (Object obj2 : arrayList4) {
            if (!((d23) obj2).l()) {
                arrayList6.add(obj2);
            }
        }
        ArrayList arrayList7 = new ArrayList();
        Iterator it5 = arrayList6.iterator();
        while (it5.hasNext()) {
            ((d23) it5.next()).getClass();
        }
        Iterator it6 = arrayList7.iterator();
        while (it6.hasNext()) {
            ((d23) it6.next()).getClass();
        }
        for (d23 d23Var : arrayList4) {
            linkedHashMap.put((blc) d23Var.a, Boolean.FALSE);
            d23Var.d();
        }
        boolean zContainsValue = linkedHashMap.containsValue(Boolean.TRUE);
        ViewGroup viewGroup = g23Var.a;
        Context context = viewGroup.getContext();
        ArrayList<c23> arrayList8 = new ArrayList();
        boolean z3 = false;
        for (c23 c23Var : arrayList3) {
            if (c23Var.l()) {
                c23Var.d();
            } else {
                context.getClass();
                s26 s26VarU = c23Var.u(context);
                if (s26VarU == null) {
                    c23Var.d();
                } else {
                    Animator animator = (Animator) s26VarU.c;
                    if (animator == null) {
                        arrayList8.add(c23Var);
                    } else {
                        blc blcVar6 = (blc) c23Var.a;
                        i = i2;
                        j15 j15Var2 = blcVar6.c;
                        arrayList2 = arrayList8;
                        if (g76.L(linkedHashMap.get(blcVar6), Boolean.TRUE)) {
                            if (f25.I(i)) {
                                Log.v("FragmentManager", "Ignoring Animator set on " + j15Var2 + " as this Fragment was involved in a Transition.");
                            }
                            c23Var.d();
                            g23Var = this;
                            arrayList8 = arrayList2;
                            i2 = i;
                        } else {
                            z3 = true;
                            if (blcVar6.a == flc.GONE) {
                                str = " has started.";
                                z2 = true;
                            } else {
                                str = " has started.";
                                z2 = false;
                            }
                            if (z2) {
                                arrayList5.remove(blcVar6);
                            }
                            View view3 = j15Var2.G;
                            viewGroup.startViewTransition(view3);
                            String str2 = str;
                            ArrayList arrayList9 = arrayList5;
                            g23Var = this;
                            animator.addListener(new e23(g23Var, view3, z2, blcVar6, c23Var));
                            animator.setTarget(view3);
                            animator.start();
                            if (f25.I(i)) {
                                Log.v("FragmentManager", "Animator from operation " + blcVar6 + str2);
                            }
                            ((a61) c23Var.b).a(new lt(animator, 6, blcVar6));
                            arrayList8 = arrayList2;
                            i2 = i;
                            arrayList5 = arrayList9;
                        }
                    }
                }
            }
            arrayList2 = arrayList8;
            i = i2;
            g23Var = this;
            arrayList8 = arrayList2;
            i2 = i;
        }
        int i3 = i2;
        ArrayList<blc> arrayList10 = arrayList5;
        for (c23 c23Var2 : arrayList8) {
            blc blcVar7 = (blc) c23Var2.a;
            j15 j15Var3 = blcVar7.c;
            if (zContainsValue) {
                if (f25.I(i3)) {
                    Log.v("FragmentManager", "Ignoring Animation set on " + j15Var3 + " as Animations cannot run alongside Transitions.");
                }
                c23Var2.d();
            } else if (z3) {
                if (f25.I(i3)) {
                    Log.v("FragmentManager", "Ignoring Animation set on " + j15Var3 + CspinKvYN.TZDQfxHUS);
                }
                c23Var2.d();
            } else {
                View view4 = j15Var3.G;
                context.getClass();
                s26 s26VarU2 = c23Var2.u(context);
                if (s26VarU2 == null) {
                    ygf.f("Required value was null.");
                    return;
                }
                Animation animation = (Animation) s26VarU2.b;
                if (animation == null) {
                    ygf.f("Required value was null.");
                    return;
                }
                if (blcVar7.a != flc.REMOVED) {
                    view4.startAnimation(animation);
                    c23Var2.d();
                } else {
                    viewGroup.startViewTransition(view4);
                    n15 n15Var = new n15(animation, viewGroup, view4);
                    n15Var.setAnimationListener(new f23(blcVar7, g23Var, view4, c23Var2));
                    view4.startAnimation(n15Var);
                    if (f25.I(i3)) {
                        Log.v("FragmentManager", "Animation from operation " + blcVar7 + " has started.");
                    }
                }
                ((a61) c23Var2.b).a(new wh2(view4, this, c23Var2, blcVar7, 2));
                g23Var = this;
            }
        }
        for (blc blcVar8 : arrayList10) {
            View view5 = blcVar8.c.G;
            flc flcVar3 = blcVar8.a;
            view5.getClass();
            flcVar3.applyState(view5);
        }
        arrayList10.clear();
        if (f25.I(i3)) {
            Log.v("FragmentManager", "Completed executing operations from " + blcVar2 + " to " + blcVar4);
        }
    }

    public final void c() {
        if (this.e) {
            return;
        }
        ViewGroup viewGroup = this.a;
        WeakHashMap weakHashMap = ute.a;
        if (!viewGroup.isAttachedToWindow()) {
            e();
            this.d = false;
            return;
        }
        synchronized (this.b) {
            try {
                if (!this.b.isEmpty()) {
                    ArrayList<blc> arrayList = new ArrayList(this.c);
                    this.c.clear();
                    for (blc blcVar : arrayList) {
                        if (f25.I(2)) {
                            Log.v("FragmentManager", "SpecialEffectsController: Cancelling operation " + blcVar);
                        }
                        blcVar.a();
                        if (!blcVar.g) {
                            this.c.add(blcVar);
                        }
                    }
                    g();
                    ArrayList arrayList2 = new ArrayList(this.b);
                    this.b.clear();
                    this.c.addAll(arrayList2);
                    if (f25.I(2)) {
                        Log.v(bPUi.XTilwTV, "SpecialEffectsController: Executing pending operations");
                    }
                    Iterator it2 = arrayList2.iterator();
                    while (it2.hasNext()) {
                        ((blc) it2.next()).d();
                    }
                    b(arrayList2, this.d);
                    this.d = false;
                    if (f25.I(2)) {
                        Log.v("FragmentManager", "SpecialEffectsController: Finished executing pending operations");
                    }
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }
}
