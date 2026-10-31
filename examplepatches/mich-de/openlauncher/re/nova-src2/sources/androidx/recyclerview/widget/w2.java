package androidx.recyclerview.widget;

/* loaded from: classes2.dex */
public final class w2 extends e2 {

    /* renamed from: a, reason: collision with root package name */
    public boolean f15163a = false;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ x2 f15164b;

    public w2(x2 x2Var) {
        this.f15164b = x2Var;
    }

    @Override // androidx.recyclerview.widget.e2
    public final void onScrollStateChanged(RecyclerView recyclerView, int i5) {
        super.onScrollStateChanged(recyclerView, i5);
        if (i5 == 0 && this.f15163a) {
            this.f15163a = false;
            this.f15164b.snapToTargetExistingView();
        }
    }

    @Override // androidx.recyclerview.widget.e2
    public final void onScrolled(RecyclerView recyclerView, int i5, int i11) {
        if (i5 == 0 && i11 == 0) {
            return;
        }
        this.f15163a = true;
    }
}
