package androidx.recyclerview.widget;

import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public abstract class u1 {
    public static final int FLAG_APPEARED_IN_PRE_LAYOUT = 4096;
    public static final int FLAG_CHANGED = 2;
    public static final int FLAG_INVALIDATED = 4;
    public static final int FLAG_MOVED = 2048;
    public static final int FLAG_REMOVED = 8;
    private s1 mListener = null;
    private ArrayList<r1> mFinishedListeners = new ArrayList<>();
    private long mAddDuration = 120;
    private long mRemoveDuration = 120;
    private long mMoveDuration = 250;
    private long mChangeDuration = 250;

    public static int buildAdapterChangeFlagsForAnimations(s2 s2Var) {
        int i5 = s2Var.mFlags;
        int i11 = i5 & 14;
        if (s2Var.isInvalid()) {
            return 4;
        }
        if ((i5 & 4) == 0) {
            int oldPosition = s2Var.getOldPosition();
            int absoluteAdapterPosition = s2Var.getAbsoluteAdapterPosition();
            if (oldPosition != -1 && absoluteAdapterPosition != -1 && oldPosition != absoluteAdapterPosition) {
                return i11 | 2048;
            }
        }
        return i11;
    }

    public abstract boolean animateAppearance(s2 s2Var, t1 t1Var, t1 t1Var2);

    public abstract boolean animateChange(s2 s2Var, s2 s2Var2, t1 t1Var, t1 t1Var2);

    public abstract boolean animateDisappearance(s2 s2Var, t1 t1Var, t1 t1Var2);

    public abstract boolean animatePersistence(s2 s2Var, t1 t1Var, t1 t1Var2);

    public abstract boolean canReuseUpdatedViewHolder(s2 s2Var, List list);

    public final void dispatchAnimationFinished(s2 s2Var) {
        onAnimationFinished(s2Var);
        s1 s1Var = this.mListener;
        if (s1Var != null) {
            RecyclerView recyclerView = ((k1) s1Var).f15030a;
            s2Var.setIsRecyclable(true);
            if (s2Var.mShadowedHolder != null && s2Var.mShadowingHolder == null) {
                s2Var.mShadowedHolder = null;
            }
            s2Var.mShadowingHolder = null;
            if (s2Var.shouldBeKeptAsChild() || recyclerView.removeAnimatingView(s2Var.itemView) || !s2Var.isTmpDetached()) {
                return;
            }
            recyclerView.removeDetachedView(s2Var.itemView, false);
        }
    }

    public final void dispatchAnimationStarted(s2 s2Var) {
        onAnimationStarted(s2Var);
    }

    public final void dispatchAnimationsFinished() {
        if (this.mFinishedListeners.size() <= 0) {
            this.mFinishedListeners.clear();
        } else {
            b.c0.y(this.mFinishedListeners.get(0));
            throw null;
        }
    }

    public abstract void endAnimation(s2 s2Var);

    public abstract void endAnimations();

    public long getAddDuration() {
        return this.mAddDuration;
    }

    public long getChangeDuration() {
        return this.mChangeDuration;
    }

    public long getMoveDuration() {
        return this.mMoveDuration;
    }

    public long getRemoveDuration() {
        return this.mRemoveDuration;
    }

    public abstract boolean isRunning();

    public final boolean isRunning(r1 r1Var) {
        boolean zIsRunning = isRunning();
        if (r1Var != null) {
            if (!zIsRunning) {
                r1Var.a();
                return zIsRunning;
            }
            this.mFinishedListeners.add(r1Var);
        }
        return zIsRunning;
    }

    public t1 obtainHolderInfo() {
        return new t1();
    }

    public void onAnimationFinished(s2 s2Var) {
    }

    public void onAnimationStarted(s2 s2Var) {
    }

    public t1 recordPostLayoutInformation(o2 o2Var, s2 s2Var) {
        t1 t1VarObtainHolderInfo = obtainHolderInfo();
        t1VarObtainHolderInfo.a(s2Var);
        return t1VarObtainHolderInfo;
    }

    public t1 recordPreLayoutInformation(o2 o2Var, s2 s2Var, int i5, List<Object> list) {
        t1 t1VarObtainHolderInfo = obtainHolderInfo();
        t1VarObtainHolderInfo.a(s2Var);
        return t1VarObtainHolderInfo;
    }

    public abstract void runPendingAnimations();

    public void setAddDuration(long j11) {
        this.mAddDuration = j11;
    }

    public void setChangeDuration(long j11) {
        this.mChangeDuration = j11;
    }

    public void setListener(s1 s1Var) {
        this.mListener = s1Var;
    }

    public void setMoveDuration(long j11) {
        this.mMoveDuration = j11;
    }

    public void setRemoveDuration(long j11) {
        this.mRemoveDuration = j11;
    }
}
