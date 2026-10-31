package androidx.recyclerview.widget;

import android.os.Trace;
import android.view.View;
import android.view.ViewGroup;
import java.util.List;
import java.util.WeakHashMap;

/* loaded from: classes.dex */
public abstract class m1 {
    private final n1 mObservable = new n1();
    private boolean mHasStableIds = false;
    private l1 mStateRestorationPolicy = l1.f15041a;

    public final void bindViewHolder(s2 s2Var, int i5) {
        boolean z11 = s2Var.mBindingAdapter == null;
        if (z11) {
            s2Var.mPosition = i5;
            if (hasStableIds()) {
                s2Var.mItemId = getItemId(i5);
            }
            s2Var.setFlags(1, 519);
            int i11 = w4.i.f93753a;
            Trace.beginSection("RV OnBindView");
        }
        s2Var.mBindingAdapter = this;
        if (RecyclerView.sDebugAssertionsEnabled) {
            if (s2Var.itemView.getParent() == null) {
                View view = s2Var.itemView;
                WeakHashMap weakHashMap = a5.a1.f250a;
                if (view.isAttachedToWindow() != s2Var.isTmpDetached()) {
                    throw new IllegalStateException("Temp-detached state out of sync with reality. holder.isTmpDetached(): " + s2Var.isTmpDetached() + ", attached to window: " + s2Var.itemView.isAttachedToWindow() + ", holder: " + s2Var);
                }
            }
            if (s2Var.itemView.getParent() == null) {
                View view2 = s2Var.itemView;
                WeakHashMap weakHashMap2 = a5.a1.f250a;
                if (view2.isAttachedToWindow()) {
                    throw new IllegalStateException("Attempting to bind attached holder with no parent (AKA temp detached): " + s2Var);
                }
            }
        }
        onBindViewHolder(s2Var, i5, s2Var.getUnmodifiedPayloads());
        if (z11) {
            s2Var.clearPayload();
            ViewGroup.LayoutParams layoutParams = s2Var.itemView.getLayoutParams();
            if (layoutParams instanceof a2) {
                ((a2) layoutParams).f14882c = true;
            }
            int i12 = w4.i.f93753a;
            Trace.endSection();
        }
    }

    public boolean canRestoreState() {
        int iOrdinal = this.mStateRestorationPolicy.ordinal();
        if (iOrdinal != 1) {
            if (iOrdinal == 2) {
                return false;
            }
        } else if (getItemCount() <= 0) {
            return false;
        }
        return true;
    }

    public final s2 createViewHolder(ViewGroup viewGroup, int i5) {
        try {
            int i11 = w4.i.f93753a;
            Trace.beginSection("RV CreateView");
            s2 s2VarOnCreateViewHolder = onCreateViewHolder(viewGroup, i5);
            if (s2VarOnCreateViewHolder.itemView.getParent() != null) {
                throw new IllegalStateException("ViewHolder views must not be attached when created. Ensure that you are not passing 'true' to the attachToRoot parameter of LayoutInflater.inflate(..., boolean attachToRoot)");
            }
            s2VarOnCreateViewHolder.mItemViewType = i5;
            Trace.endSection();
            return s2VarOnCreateViewHolder;
        } catch (Throwable th2) {
            int i12 = w4.i.f93753a;
            Trace.endSection();
            throw th2;
        }
    }

    public int findRelativeAdapterPositionIn(m1 m1Var, s2 s2Var, int i5) {
        if (m1Var == this) {
            return i5;
        }
        return -1;
    }

    public abstract int getItemCount();

    public long getItemId(int i5) {
        return -1L;
    }

    public int getItemViewType(int i5) {
        return 0;
    }

    public final l1 getStateRestorationPolicy() {
        return this.mStateRestorationPolicy;
    }

    public final boolean hasObservers() {
        return this.mObservable.a();
    }

    public final boolean hasStableIds() {
        return this.mHasStableIds;
    }

    public final void notifyDataSetChanged() {
        this.mObservable.b();
    }

    public final void notifyItemChanged(int i5) {
        this.mObservable.d(i5, 1, null);
    }

    public final void notifyItemInserted(int i5) {
        this.mObservable.e(i5, 1);
    }

    public final void notifyItemMoved(int i5, int i11) {
        this.mObservable.c(i5, i11);
    }

    public final void notifyItemRangeChanged(int i5, int i11) {
        this.mObservable.d(i5, i11, null);
    }

    public final void notifyItemRangeInserted(int i5, int i11) {
        this.mObservable.e(i5, i11);
    }

    public final void notifyItemRangeRemoved(int i5, int i11) {
        this.mObservable.f(i5, i11);
    }

    public final void notifyItemRemoved(int i5) {
        this.mObservable.f(i5, 1);
    }

    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
    }

    public abstract void onBindViewHolder(s2 s2Var, int i5);

    public void onBindViewHolder(s2 s2Var, int i5, List<Object> list) {
        onBindViewHolder(s2Var, i5);
    }

    public abstract s2 onCreateViewHolder(ViewGroup viewGroup, int i5);

    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
    }

    public boolean onFailedToRecycleView(s2 s2Var) {
        return false;
    }

    public void onViewAttachedToWindow(s2 s2Var) {
    }

    public void onViewDetachedFromWindow(s2 s2Var) {
    }

    public void onViewRecycled(s2 s2Var) {
    }

    public void registerAdapterDataObserver(o1 o1Var) {
        this.mObservable.registerObserver(o1Var);
    }

    public void setHasStableIds(boolean z11) {
        if (hasObservers()) {
            throw new IllegalStateException("Cannot change whether this adapter has stable IDs while the adapter has registered observers.");
        }
        this.mHasStableIds = z11;
    }

    public void setStateRestorationPolicy(l1 l1Var) {
        this.mStateRestorationPolicy = l1Var;
        this.mObservable.g();
    }

    public void unregisterAdapterDataObserver(o1 o1Var) {
        this.mObservable.unregisterObserver(o1Var);
    }

    public final void notifyItemChanged(int i5, Object obj) {
        this.mObservable.d(i5, 1, obj);
    }

    public final void notifyItemRangeChanged(int i5, int i11, Object obj) {
        this.mObservable.d(i5, i11, obj);
    }
}
