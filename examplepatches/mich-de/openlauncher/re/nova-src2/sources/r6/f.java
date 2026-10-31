package r6;

import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.t2;
import androidx.recyclerview.widget.u2;
import com.google.android.material.datepicker.l;

/* loaded from: classes2.dex */
public final class f extends u2 {

    /* renamed from: f, reason: collision with root package name */
    public final RecyclerView f85536f;

    /* renamed from: g, reason: collision with root package name */
    public final t2 f85537g;

    /* renamed from: h, reason: collision with root package name */
    public final l f85538h;

    public f(RecyclerView recyclerView) {
        super(recyclerView);
        this.f85537g = this.f15142e;
        this.f85538h = new l(this, 4);
        this.f85536f = recyclerView;
    }

    @Override // androidx.recyclerview.widget.u2
    public final a5.b j() {
        return this.f85538h;
    }
}
