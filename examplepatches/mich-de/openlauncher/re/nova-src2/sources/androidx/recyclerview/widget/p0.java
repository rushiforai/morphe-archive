package androidx.recyclerview.widget;

/* loaded from: classes2.dex */
public abstract class p0 extends n0 {
    private int mDefaultDragDirs;
    private int mDefaultSwipeDirs;

    public p0(int i5, int i11) {
        this.mDefaultSwipeDirs = i11;
        this.mDefaultDragDirs = i5;
    }

    public int getDragDirs(RecyclerView recyclerView, s2 s2Var) {
        return this.mDefaultDragDirs;
    }

    @Override // androidx.recyclerview.widget.n0
    public int getMovementFlags(RecyclerView recyclerView, s2 s2Var) {
        return n0.makeMovementFlags(getDragDirs(recyclerView, s2Var), getSwipeDirs(recyclerView, s2Var));
    }

    public int getSwipeDirs(RecyclerView recyclerView, s2 s2Var) {
        return this.mDefaultSwipeDirs;
    }

    public void setDefaultDragDirs(int i5) {
        this.mDefaultDragDirs = i5;
    }

    public void setDefaultSwipeDirs(int i5) {
        this.mDefaultSwipeDirs = i5;
    }
}
