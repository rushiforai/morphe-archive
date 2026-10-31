package androidx.recyclerview.widget;

import android.animation.TimeInterpolator;
import android.animation.ValueAnimator;
import android.annotation.SuppressLint;
import android.view.View;
import android.view.ViewPropertyAnimator;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.WeakHashMap;

/* loaded from: classes.dex */
public class p extends v2 {
    private static final boolean DEBUG = false;
    private static TimeInterpolator sDefaultInterpolator;
    ArrayList<s2> mAddAnimations;
    ArrayList<ArrayList<s2>> mAdditionsList;
    ArrayList<s2> mChangeAnimations;
    ArrayList<ArrayList<n>> mChangesList;
    ArrayList<s2> mMoveAnimations;
    ArrayList<ArrayList<o>> mMovesList;
    private ArrayList<s2> mPendingAdditions;
    private ArrayList<n> mPendingChanges;
    private ArrayList<o> mPendingMoves;
    private ArrayList<s2> mPendingRemovals;
    ArrayList<s2> mRemoveAnimations;

    public p() {
        this.mSupportsChangeAnimations = true;
        this.mPendingRemovals = new ArrayList<>();
        this.mPendingAdditions = new ArrayList<>();
        this.mPendingMoves = new ArrayList<>();
        this.mPendingChanges = new ArrayList<>();
        this.mAdditionsList = new ArrayList<>();
        this.mMovesList = new ArrayList<>();
        this.mChangesList = new ArrayList<>();
        this.mAddAnimations = new ArrayList<>();
        this.mMoveAnimations = new ArrayList<>();
        this.mRemoveAnimations = new ArrayList<>();
        this.mChangeAnimations = new ArrayList<>();
    }

    public final void a(s2 s2Var, List list) {
        for (int size = list.size() - 1; size >= 0; size--) {
            n nVar = (n) list.get(size);
            if (b(nVar, s2Var) && nVar.f15056a == null && nVar.f15057b == null) {
                list.remove(nVar);
            }
        }
    }

    @Override // androidx.recyclerview.widget.v2
    public boolean animateAdd(s2 s2Var) {
        c(s2Var);
        s2Var.itemView.setAlpha(0.0f);
        this.mPendingAdditions.add(s2Var);
        return true;
    }

    public void animateAddImpl(s2 s2Var) {
        View view = s2Var.itemView;
        ViewPropertyAnimator viewPropertyAnimatorAnimate = view.animate();
        this.mAddAnimations.add(s2Var);
        viewPropertyAnimatorAnimate.alpha(1.0f).setDuration(getAddDuration()).setListener(new k(this, s2Var, view, viewPropertyAnimatorAnimate)).start();
    }

    @Override // androidx.recyclerview.widget.v2
    @SuppressLint({"UnknownNullness"})
    public boolean animateChange(s2 s2Var, s2 s2Var2, int i5, int i11, int i12, int i13) {
        if (s2Var == s2Var2) {
            return animateMove(s2Var, i5, i11, i12, i13);
        }
        float translationX = s2Var.itemView.getTranslationX();
        float translationY = s2Var.itemView.getTranslationY();
        float alpha = s2Var.itemView.getAlpha();
        c(s2Var);
        int i14 = (int) ((i12 - i5) - translationX);
        int i15 = (int) ((i13 - i11) - translationY);
        s2Var.itemView.setTranslationX(translationX);
        s2Var.itemView.setTranslationY(translationY);
        s2Var.itemView.setAlpha(alpha);
        if (s2Var2 != null) {
            c(s2Var2);
            s2Var2.itemView.setTranslationX(-i14);
            s2Var2.itemView.setTranslationY(-i15);
            s2Var2.itemView.setAlpha(0.0f);
        }
        this.mPendingChanges.add(new n(s2Var, s2Var2, i5, i11, i12, i13));
        return true;
    }

    public void animateChangeImpl(n nVar) {
        p pVar;
        n nVar2;
        s2 s2Var = nVar.f15056a;
        View view = s2Var == null ? null : s2Var.itemView;
        s2 s2Var2 = nVar.f15057b;
        View view2 = s2Var2 != null ? s2Var2.itemView : null;
        if (view != null) {
            ViewPropertyAnimator duration = view.animate().setDuration(getChangeDuration());
            this.mChangeAnimations.add(nVar.f15056a);
            duration.translationX(nVar.f15060e - nVar.f15058c);
            duration.translationY(nVar.f15061f - nVar.f15059d);
            pVar = this;
            nVar2 = nVar;
            duration.alpha(0.0f).setListener(new m(pVar, nVar2, duration, view, 0)).start();
        } else {
            pVar = this;
            nVar2 = nVar;
        }
        if (view2 != null) {
            ViewPropertyAnimator viewPropertyAnimatorAnimate = view2.animate();
            pVar.mChangeAnimations.add(nVar2.f15057b);
            viewPropertyAnimatorAnimate.translationX(0.0f).translationY(0.0f).setDuration(getChangeDuration()).alpha(1.0f).setListener(new m(pVar, nVar2, viewPropertyAnimatorAnimate, view2, 1)).start();
        }
    }

    @Override // androidx.recyclerview.widget.v2
    @SuppressLint({"UnknownNullness"})
    public boolean animateMove(s2 s2Var, int i5, int i11, int i12, int i13) {
        View view = s2Var.itemView;
        int translationX = i5 + ((int) view.getTranslationX());
        int translationY = i11 + ((int) s2Var.itemView.getTranslationY());
        c(s2Var);
        int i14 = i12 - translationX;
        int i15 = i13 - translationY;
        if (i14 == 0 && i15 == 0) {
            dispatchMoveFinished(s2Var);
            return false;
        }
        if (i14 != 0) {
            view.setTranslationX(-i14);
        }
        if (i15 != 0) {
            view.setTranslationY(-i15);
        }
        this.mPendingMoves.add(new o(s2Var, translationX, translationY, i12, i13));
        return true;
    }

    public void animateMoveImpl(s2 s2Var, int i5, int i11, int i12, int i13) {
        View view = s2Var.itemView;
        int i14 = i12 - i5;
        int i15 = i13 - i11;
        if (i14 != 0) {
            view.animate().translationX(0.0f);
        }
        if (i15 != 0) {
            view.animate().translationY(0.0f);
        }
        ViewPropertyAnimator viewPropertyAnimatorAnimate = view.animate();
        this.mMoveAnimations.add(s2Var);
        viewPropertyAnimatorAnimate.setDuration(getMoveDuration()).setListener(new l(this, s2Var, i14, view, i15, viewPropertyAnimatorAnimate)).start();
    }

    @Override // androidx.recyclerview.widget.v2
    @SuppressLint({"UnknownNullness"})
    public boolean animateRemove(s2 s2Var) {
        c(s2Var);
        this.mPendingRemovals.add(s2Var);
        return true;
    }

    public final boolean b(n nVar, s2 s2Var) {
        boolean z11 = false;
        if (nVar.f15057b == s2Var) {
            nVar.f15057b = null;
        } else {
            if (nVar.f15056a != s2Var) {
                return false;
            }
            nVar.f15056a = null;
            z11 = true;
        }
        s2Var.itemView.setAlpha(1.0f);
        s2Var.itemView.setTranslationX(0.0f);
        s2Var.itemView.setTranslationY(0.0f);
        dispatchChangeFinished(s2Var, z11);
        return true;
    }

    public final void c(s2 s2Var) {
        if (sDefaultInterpolator == null) {
            sDefaultInterpolator = new ValueAnimator().getInterpolator();
        }
        s2Var.itemView.animate().setInterpolator(sDefaultInterpolator);
        endAnimation(s2Var);
    }

    @Override // androidx.recyclerview.widget.u1
    public boolean canReuseUpdatedViewHolder(s2 s2Var, List<Object> list) {
        return !list.isEmpty() || canReuseUpdatedViewHolder(s2Var);
    }

    public void cancelAll(List<s2> list) {
        for (int size = list.size() - 1; size >= 0; size--) {
            list.get(size).itemView.animate().cancel();
        }
    }

    public void dispatchFinishedWhenDone() {
        if (isRunning()) {
            return;
        }
        dispatchAnimationsFinished();
    }

    @Override // androidx.recyclerview.widget.u1
    public void endAnimation(s2 s2Var) {
        View view = s2Var.itemView;
        view.animate().cancel();
        int size = this.mPendingMoves.size();
        while (true) {
            size--;
            if (size < 0) {
                break;
            }
            if (this.mPendingMoves.get(size).f15062a == s2Var) {
                view.setTranslationY(0.0f);
                view.setTranslationX(0.0f);
                dispatchMoveFinished(s2Var);
                this.mPendingMoves.remove(size);
            }
        }
        a(s2Var, this.mPendingChanges);
        if (this.mPendingRemovals.remove(s2Var)) {
            view.setAlpha(1.0f);
            dispatchRemoveFinished(s2Var);
        }
        if (this.mPendingAdditions.remove(s2Var)) {
            view.setAlpha(1.0f);
            dispatchAddFinished(s2Var);
        }
        for (int size2 = this.mChangesList.size() - 1; size2 >= 0; size2--) {
            ArrayList<n> arrayList = this.mChangesList.get(size2);
            a(s2Var, arrayList);
            if (arrayList.isEmpty()) {
                this.mChangesList.remove(size2);
            }
        }
        for (int size3 = this.mMovesList.size() - 1; size3 >= 0; size3--) {
            ArrayList<o> arrayList2 = this.mMovesList.get(size3);
            int size4 = arrayList2.size() - 1;
            while (true) {
                if (size4 < 0) {
                    break;
                }
                if (arrayList2.get(size4).f15062a == s2Var) {
                    view.setTranslationY(0.0f);
                    view.setTranslationX(0.0f);
                    dispatchMoveFinished(s2Var);
                    arrayList2.remove(size4);
                    if (arrayList2.isEmpty()) {
                        this.mMovesList.remove(size3);
                    }
                } else {
                    size4--;
                }
            }
        }
        for (int size5 = this.mAdditionsList.size() - 1; size5 >= 0; size5--) {
            ArrayList<s2> arrayList3 = this.mAdditionsList.get(size5);
            if (arrayList3.remove(s2Var)) {
                view.setAlpha(1.0f);
                dispatchAddFinished(s2Var);
                if (arrayList3.isEmpty()) {
                    this.mAdditionsList.remove(size5);
                }
            }
        }
        this.mRemoveAnimations.remove(s2Var);
        this.mAddAnimations.remove(s2Var);
        this.mChangeAnimations.remove(s2Var);
        this.mMoveAnimations.remove(s2Var);
        dispatchFinishedWhenDone();
    }

    @Override // androidx.recyclerview.widget.u1
    public void endAnimations() {
        int size = this.mPendingMoves.size();
        while (true) {
            size--;
            if (size < 0) {
                break;
            }
            o oVar = this.mPendingMoves.get(size);
            View view = oVar.f15062a.itemView;
            view.setTranslationY(0.0f);
            view.setTranslationX(0.0f);
            dispatchMoveFinished(oVar.f15062a);
            this.mPendingMoves.remove(size);
        }
        for (int size2 = this.mPendingRemovals.size() - 1; size2 >= 0; size2--) {
            dispatchRemoveFinished(this.mPendingRemovals.get(size2));
            this.mPendingRemovals.remove(size2);
        }
        int size3 = this.mPendingAdditions.size();
        while (true) {
            size3--;
            if (size3 < 0) {
                break;
            }
            s2 s2Var = this.mPendingAdditions.get(size3);
            s2Var.itemView.setAlpha(1.0f);
            dispatchAddFinished(s2Var);
            this.mPendingAdditions.remove(size3);
        }
        for (int size4 = this.mPendingChanges.size() - 1; size4 >= 0; size4--) {
            n nVar = this.mPendingChanges.get(size4);
            s2 s2Var2 = nVar.f15056a;
            if (s2Var2 != null) {
                b(nVar, s2Var2);
            }
            s2 s2Var3 = nVar.f15057b;
            if (s2Var3 != null) {
                b(nVar, s2Var3);
            }
        }
        this.mPendingChanges.clear();
        if (isRunning()) {
            for (int size5 = this.mMovesList.size() - 1; size5 >= 0; size5--) {
                ArrayList<o> arrayList = this.mMovesList.get(size5);
                for (int size6 = arrayList.size() - 1; size6 >= 0; size6--) {
                    o oVar2 = arrayList.get(size6);
                    View view2 = oVar2.f15062a.itemView;
                    view2.setTranslationY(0.0f);
                    view2.setTranslationX(0.0f);
                    dispatchMoveFinished(oVar2.f15062a);
                    arrayList.remove(size6);
                    if (arrayList.isEmpty()) {
                        this.mMovesList.remove(arrayList);
                    }
                }
            }
            for (int size7 = this.mAdditionsList.size() - 1; size7 >= 0; size7--) {
                ArrayList<s2> arrayList2 = this.mAdditionsList.get(size7);
                for (int size8 = arrayList2.size() - 1; size8 >= 0; size8--) {
                    s2 s2Var4 = arrayList2.get(size8);
                    s2Var4.itemView.setAlpha(1.0f);
                    dispatchAddFinished(s2Var4);
                    arrayList2.remove(size8);
                    if (arrayList2.isEmpty()) {
                        this.mAdditionsList.remove(arrayList2);
                    }
                }
            }
            for (int size9 = this.mChangesList.size() - 1; size9 >= 0; size9--) {
                ArrayList<n> arrayList3 = this.mChangesList.get(size9);
                for (int size10 = arrayList3.size() - 1; size10 >= 0; size10--) {
                    n nVar2 = arrayList3.get(size10);
                    s2 s2Var5 = nVar2.f15056a;
                    if (s2Var5 != null) {
                        b(nVar2, s2Var5);
                    }
                    s2 s2Var6 = nVar2.f15057b;
                    if (s2Var6 != null) {
                        b(nVar2, s2Var6);
                    }
                    if (arrayList3.isEmpty()) {
                        this.mChangesList.remove(arrayList3);
                    }
                }
            }
            cancelAll(this.mRemoveAnimations);
            cancelAll(this.mMoveAnimations);
            cancelAll(this.mAddAnimations);
            cancelAll(this.mChangeAnimations);
            dispatchAnimationsFinished();
        }
    }

    @Override // androidx.recyclerview.widget.u1
    public boolean isRunning() {
        return (this.mPendingAdditions.isEmpty() && this.mPendingChanges.isEmpty() && this.mPendingMoves.isEmpty() && this.mPendingRemovals.isEmpty() && this.mMoveAnimations.isEmpty() && this.mRemoveAnimations.isEmpty() && this.mAddAnimations.isEmpty() && this.mChangeAnimations.isEmpty() && this.mMovesList.isEmpty() && this.mAdditionsList.isEmpty() && this.mChangesList.isEmpty()) ? false : true;
    }

    @Override // androidx.recyclerview.widget.u1
    public void runPendingAnimations() {
        boolean zIsEmpty = this.mPendingRemovals.isEmpty();
        boolean zIsEmpty2 = this.mPendingMoves.isEmpty();
        boolean zIsEmpty3 = this.mPendingChanges.isEmpty();
        boolean zIsEmpty4 = this.mPendingAdditions.isEmpty();
        if (zIsEmpty && zIsEmpty2 && zIsEmpty4 && zIsEmpty3) {
            return;
        }
        Iterator<s2> it = this.mPendingRemovals.iterator();
        while (it.hasNext()) {
            s2 next = it.next();
            View view = next.itemView;
            ViewPropertyAnimator viewPropertyAnimatorAnimate = view.animate();
            this.mRemoveAnimations.add(next);
            viewPropertyAnimatorAnimate.setDuration(getRemoveDuration()).alpha(0.0f).setListener(new k(this, next, viewPropertyAnimatorAnimate, view)).start();
        }
        this.mPendingRemovals.clear();
        int i5 = 0;
        if (!zIsEmpty2) {
            ArrayList<o> arrayList = new ArrayList<>();
            arrayList.addAll(this.mPendingMoves);
            this.mMovesList.add(arrayList);
            this.mPendingMoves.clear();
            j jVar = new j(i5, this, arrayList);
            if (zIsEmpty) {
                jVar.run();
            } else {
                View view2 = arrayList.get(0).f15062a.itemView;
                long removeDuration = getRemoveDuration();
                WeakHashMap weakHashMap = a5.a1.f250a;
                view2.postOnAnimationDelayed(jVar, removeDuration);
            }
        }
        if (!zIsEmpty3) {
            ArrayList<n> arrayList2 = new ArrayList<>();
            arrayList2.addAll(this.mPendingChanges);
            this.mChangesList.add(arrayList2);
            this.mPendingChanges.clear();
            j jVar2 = new j(1, this, arrayList2);
            if (zIsEmpty) {
                jVar2.run();
            } else {
                View view3 = arrayList2.get(0).f15056a.itemView;
                long removeDuration2 = getRemoveDuration();
                WeakHashMap weakHashMap2 = a5.a1.f250a;
                view3.postOnAnimationDelayed(jVar2, removeDuration2);
            }
        }
        if (zIsEmpty4) {
            return;
        }
        ArrayList<s2> arrayList3 = new ArrayList<>();
        arrayList3.addAll(this.mPendingAdditions);
        this.mAdditionsList.add(arrayList3);
        this.mPendingAdditions.clear();
        j jVar3 = new j(2, this, arrayList3);
        if (zIsEmpty && zIsEmpty2 && zIsEmpty3) {
            jVar3.run();
            return;
        }
        long jMax = Math.max(!zIsEmpty2 ? getMoveDuration() : 0L, zIsEmpty3 ? 0L : getChangeDuration()) + (!zIsEmpty ? getRemoveDuration() : 0L);
        View view4 = arrayList3.get(0).itemView;
        WeakHashMap weakHashMap3 = a5.a1.f250a;
        view4.postOnAnimationDelayed(jVar3, jMax);
    }
}
