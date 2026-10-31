package r6;

import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.View;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.o2;
import androidx.recyclerview.widget.v1;

/* loaded from: classes2.dex */
public final class d extends v1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f85531a;

    /* renamed from: b, reason: collision with root package name */
    public Drawable f85532b;

    /* renamed from: c, reason: collision with root package name */
    public int f85533c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f85534d = true;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f85535e;

    public /* synthetic */ d(Object obj, int i5) {
        this.f85531a = i5;
        this.f85535e = obj;
    }

    public boolean b(RecyclerView recyclerView, View view) {
        recyclerView.getChildViewHolder(view);
        return false;
    }

    public boolean d(RecyclerView recyclerView, View view) {
        recyclerView.getChildViewHolder(view);
        return false;
    }

    @Override // androidx.recyclerview.widget.v1
    public final void getItemOffsets(Rect rect, View view, RecyclerView recyclerView, o2 o2Var) {
        switch (this.f85531a) {
            case 0:
                if (b(recyclerView, view)) {
                    rect.bottom = this.f85533c;
                    break;
                }
                break;
            default:
                if (d(recyclerView, view)) {
                    rect.bottom = this.f85533c;
                    break;
                }
                break;
        }
    }

    @Override // androidx.recyclerview.widget.v1
    public final void onDrawOver(Canvas canvas, RecyclerView recyclerView, o2 o2Var) {
        switch (this.f85531a) {
            case 0:
                if (this.f85532b != null) {
                    int childCount = recyclerView.getChildCount();
                    int width = recyclerView.getWidth();
                    for (int i5 = 0; i5 < childCount; i5++) {
                        View childAt = recyclerView.getChildAt(i5);
                        if (b(recyclerView, childAt)) {
                            int height = childAt.getHeight() + ((int) childAt.getY());
                            this.f85532b.setBounds(0, height, width, this.f85533c + height);
                            this.f85532b.draw(canvas);
                        }
                    }
                    break;
                }
                break;
            default:
                if (this.f85532b != null) {
                    int childCount2 = recyclerView.getChildCount();
                    int width2 = recyclerView.getWidth();
                    for (int i11 = 0; i11 < childCount2; i11++) {
                        View childAt2 = recyclerView.getChildAt(i11);
                        if (d(recyclerView, childAt2)) {
                            int height2 = childAt2.getHeight() + ((int) childAt2.getY());
                            this.f85532b.setBounds(0, height2, width2, this.f85533c + height2);
                            this.f85532b.draw(canvas);
                        }
                    }
                    break;
                }
                break;
        }
    }
}
