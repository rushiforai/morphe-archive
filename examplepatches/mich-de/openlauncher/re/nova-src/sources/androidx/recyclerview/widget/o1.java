package androidx.recyclerview.widget;

/* loaded from: classes.dex */
public abstract class o1 {
    public abstract void onChanged();

    public void onItemRangeChanged(int i5, int i11) {
    }

    public void onItemRangeInserted(int i5, int i11) {
    }

    public void onItemRangeMoved(int i5, int i11, int i12) {
    }

    public void onItemRangeRemoved(int i5, int i11) {
    }

    public void onStateRestorationPolicyChanged() {
    }

    public void onItemRangeChanged(int i5, int i11, Object obj) {
        onItemRangeChanged(i5, i11);
    }
}
