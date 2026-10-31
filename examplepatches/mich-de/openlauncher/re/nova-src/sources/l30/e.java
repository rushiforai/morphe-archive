package l30;

import android.content.Context;
import android.content.res.Resources;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ListAdapter;
import r.t1;

/* loaded from: classes.dex */
public final class e extends t1 implements f {
    public final Context C;
    public ListAdapter D;
    public FrameLayout E;

    public e(Context context, int i5) {
        super(context, null, i5, 0);
        this.D = null;
        this.C = context;
    }

    public static e q(Context context, boolean z11) {
        return z11 ? new e(context, 2130968612) : new e(context, 2130969827);
    }

    @Override // r.t1
    public final void j(ListAdapter listAdapter) {
        this.D = listAdapter;
        super.j(listAdapter);
    }

    @Override // r.t1, q.a0
    public final void show() {
        Context context = this.C;
        g.a(context, this);
        if (this.f84864e == -2) {
            int i5 = 0;
            int iK = v30.a.f92041e ? 0 : w20.e.k(16);
            ListAdapter listAdapter = this.D;
            int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
            int iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(0, 0);
            int count = listAdapter.getCount();
            Resources resources = context.getResources();
            int iMax = Math.max(resources.getDisplayMetrics().widthPixels / 2, resources.getDimensionPixelSize(2131165207));
            int i11 = 0;
            int i12 = 0;
            View view = null;
            while (true) {
                if (i5 >= count) {
                    iMax = i11;
                    break;
                }
                int itemViewType = listAdapter.getItemViewType(i5);
                if (itemViewType != i12) {
                    view = null;
                    i12 = itemViewType;
                }
                if (this.E == null) {
                    this.E = new FrameLayout(context);
                }
                view = listAdapter.getView(i5, view, this.E);
                view.measure(iMakeMeasureSpec, iMakeMeasureSpec2);
                int measuredWidth = view.getMeasuredWidth();
                if (measuredWidth >= iMax) {
                    break;
                }
                if (measuredWidth > i11) {
                    i11 = measuredWidth;
                }
                i5++;
            }
            this.f84864e = iMax + iK;
        }
        super.show();
    }
}
