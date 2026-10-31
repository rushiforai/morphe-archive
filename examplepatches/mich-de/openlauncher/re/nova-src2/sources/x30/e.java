package x30;

import android.view.View;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.ListAdapter;
import android.widget.ListView;

/* loaded from: classes4.dex */
public abstract class e extends ListView {

    /* renamed from: k, reason: collision with root package name */
    public static final b f95041k = new b();

    /* renamed from: a, reason: collision with root package name */
    public int f95042a;

    /* renamed from: b, reason: collision with root package name */
    public int f95043b;

    /* renamed from: c, reason: collision with root package name */
    public int f95044c;

    /* renamed from: d, reason: collision with root package name */
    public int f95045d;

    /* renamed from: e, reason: collision with root package name */
    public int f95046e;

    /* renamed from: f, reason: collision with root package name */
    public int f95047f;

    /* renamed from: g, reason: collision with root package name */
    public int f95048g;

    /* renamed from: h, reason: collision with root package name */
    public g f95049h;

    /* renamed from: i, reason: collision with root package name */
    public AdapterView.OnItemClickListener f95050i;

    /* renamed from: j, reason: collision with root package name */
    public AdapterView.OnItemLongClickListener f95051j;

    public final void a() {
        if (getChildCount() > 0) {
            requestLayout();
            invalidate();
        }
    }

    @Override // android.widget.ListView, android.widget.AbsListView, android.view.View
    public void onMeasure(int i5, int i11) {
        g gVar;
        super.onMeasure(i5, i11);
        int mode = View.MeasureSpec.getMode(i5);
        int size = View.MeasureSpec.getSize(i5);
        if (mode == 0) {
            int i12 = this.f95046e;
            size = (i12 > 0 ? getPaddingRight() + getPaddingLeft() + i12 : getPaddingLeft() + getPaddingRight()) + getVerticalScrollbarWidth();
        }
        int paddingLeft = (size - getPaddingLeft()) - getPaddingRight();
        int i13 = this.f95042a;
        int i14 = this.f95044c;
        int i15 = this.f95045d;
        int i16 = this.f95047f;
        int i17 = this.f95048g;
        if (i17 != -1) {
            this.f95042a = i17;
        } else if (i16 > 0) {
            this.f95042a = (paddingLeft + i14) / (i16 + i14);
        } else {
            this.f95042a = 2;
        }
        if (this.f95042a <= 0) {
            this.f95042a = 1;
        }
        if (i15 != 0) {
            int i18 = this.f95042a;
            int i19 = i18 - 1;
            int i21 = (paddingLeft - (i18 * i16)) - (i19 * i14);
            if (i15 == 1) {
                this.f95046e = i16;
                if (i18 > 1) {
                    this.f95043b = (i21 / i19) + i14;
                } else {
                    this.f95043b = i14 + i21;
                }
            } else if (i15 == 2) {
                this.f95046e = (i21 / i18) + i16;
                this.f95043b = i14;
            } else if (i15 == 3) {
                this.f95046e = i16;
                if (i18 > 1) {
                    this.f95043b = (i21 / (i18 + 1)) + i14;
                } else {
                    this.f95043b = i14 + i21;
                }
            }
        } else {
            this.f95046e = i16;
            this.f95043b = i14;
        }
        int i22 = this.f95042a;
        if (i13 == i22 || (gVar = this.f95049h) == null) {
            return;
        }
        gVar.c(i22);
    }

    @Override // android.widget.AdapterView
    public final void setOnItemClickListener(AdapterView.OnItemClickListener onItemClickListener) {
        if (onItemClickListener != null) {
            this.f95050i = onItemClickListener;
            super.setOnItemClickListener(f95041k);
        } else {
            this.f95050i = null;
            super.setOnItemClickListener(null);
        }
    }

    @Override // android.widget.AdapterView
    public final void setOnItemLongClickListener(AdapterView.OnItemLongClickListener onItemLongClickListener) {
        if (onItemLongClickListener != null) {
            this.f95051j = onItemLongClickListener;
            super.setOnItemLongClickListener(f95041k);
        } else {
            this.f95051j = null;
            super.setOnItemLongClickListener(null);
        }
    }

    @Override // android.widget.AbsListView
    public final void setRecyclerListener(AbsListView.RecyclerListener recyclerListener) {
        d dVar = new d();
        dVar.f95040a = recyclerListener;
        super.setRecyclerListener(dVar);
    }

    @Override // android.widget.AdapterView
    public final void setAdapter(ListAdapter listAdapter) {
        if (!(listAdapter instanceof g)) {
            setAdapter((ListAdapter) new g(this, listAdapter, (a) listAdapter));
        } else {
            this.f95049h = (g) listAdapter;
            super.setAdapter(listAdapter);
        }
    }
}
