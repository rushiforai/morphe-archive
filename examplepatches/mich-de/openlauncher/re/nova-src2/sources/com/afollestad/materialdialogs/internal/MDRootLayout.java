package com.afollestad.materialdialogs.internal;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.widget.AdapterView;
import android.widget.ScrollView;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.z1;
import d9.h;
import d9.k;
import e9.a;
import e9.b;
import p10.c0;

/* loaded from: classes2.dex */
public class MDRootLayout extends ViewGroup {

    /* renamed from: s, reason: collision with root package name */
    public static final /* synthetic */ int f20159s = 0;

    /* renamed from: a, reason: collision with root package name */
    public View f20160a;

    /* renamed from: b, reason: collision with root package name */
    public View f20161b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f20162c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f20163d;

    /* renamed from: e, reason: collision with root package name */
    public final MDButton[] f20164e;

    /* renamed from: f, reason: collision with root package name */
    public int f20165f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f20166g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f20167h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f20168i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f20169j;

    /* renamed from: k, reason: collision with root package name */
    public final int f20170k;

    /* renamed from: l, reason: collision with root package name */
    public final int f20171l;

    /* renamed from: m, reason: collision with root package name */
    public final int f20172m;
    public int n;
    public final int o;

    /* renamed from: p, reason: collision with root package name */
    public final Paint f20173p;

    /* renamed from: q, reason: collision with root package name */
    public b f20174q;

    /* renamed from: r, reason: collision with root package name */
    public final int f20175r;

    public MDRootLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f20162c = false;
        this.f20163d = false;
        this.f20164e = new MDButton[3];
        this.f20165f = 2;
        this.f20166g = false;
        this.f20167h = true;
        this.n = 1;
        Resources resources = context.getResources();
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, k.f49073a, 0, 0);
        this.f20168i = typedArrayObtainStyledAttributes.getBoolean(0, true);
        typedArrayObtainStyledAttributes.recycle();
        this.f20170k = resources.getDimensionPixelSize(2131166046);
        this.f20171l = resources.getDimensionPixelSize(2131166021);
        this.o = resources.getDimensionPixelSize(2131166026);
        this.f20172m = resources.getDimensionPixelSize(2131166022);
        this.f20173p = new Paint();
        this.f20175r = resources.getDimensionPixelSize(2131166036);
        this.f20173p.setColor(c0.U(context, 2130969649, 0));
        setWillNotDraw(false);
    }

    public static boolean b(View view) {
        boolean z11 = (view == null || view.getVisibility() == 8) ? false : true;
        return (z11 && (view instanceof MDButton)) ? ((MDButton) view).getText().toString().trim().length() > 0 : z11;
    }

    public final void a(ViewGroup viewGroup, boolean z11) {
        if (this.f20174q == null) {
            b bVar = new b(this, viewGroup, z11);
            this.f20174q = bVar;
            viewGroup.getViewTreeObserver().addOnScrollChangedListener(this.f20174q);
            bVar.onScrollChanged();
        }
    }

    public final void c(View view, boolean z11) {
        View childAt;
        if (view == null) {
            return;
        }
        boolean z12 = false;
        if (view instanceof ScrollView) {
            ViewGroup viewGroup = (ScrollView) view;
            if (viewGroup.getChildCount() != 0) {
                if ((viewGroup.getMeasuredHeight() - viewGroup.getPaddingTop()) - viewGroup.getPaddingBottom() < viewGroup.getChildAt(0).getMeasuredHeight()) {
                    a(viewGroup, z11);
                    return;
                }
            }
            if (z11) {
                this.f20162c = false;
            }
            this.f20163d = false;
            return;
        }
        if (view instanceof AdapterView) {
            AdapterView adapterView = (AdapterView) view;
            if (adapterView.getLastVisiblePosition() != -1) {
                boolean z13 = adapterView.getFirstVisiblePosition() == 0;
                boolean z14 = adapterView.getLastVisiblePosition() == adapterView.getCount() - 1;
                if (!z13 || !z14 || adapterView.getChildCount() <= 0 || adapterView.getChildAt(0).getTop() < adapterView.getPaddingTop() || adapterView.getChildAt(adapterView.getChildCount() - 1).getBottom() > adapterView.getHeight() - adapterView.getPaddingBottom()) {
                    a(adapterView, z11);
                    return;
                }
            }
            if (z11) {
                this.f20162c = false;
            }
            this.f20163d = false;
            return;
        }
        if (view instanceof WebView) {
            view.getViewTreeObserver().addOnPreDrawListener(new a(this, view, z11));
            return;
        }
        if (view instanceof RecyclerView) {
            RecyclerView recyclerView = (RecyclerView) view;
            if (recyclerView.getAdapter() != null && recyclerView.getLayoutManager() != null) {
                z1 layoutManager = recyclerView.getLayoutManager();
                int itemCount = recyclerView.getAdapter().getItemCount();
                if (!(layoutManager instanceof LinearLayoutManager)) {
                    throw new h("Material Dialogs currently only supports LinearLayoutManager. Please report any new layout managers.");
                }
                int iFindLastVisibleItemPosition = ((LinearLayoutManager) layoutManager).findLastVisibleItemPosition();
                if (iFindLastVisibleItemPosition != -1 && (iFindLastVisibleItemPosition != itemCount - 1 || (recyclerView.getChildCount() > 0 && recyclerView.getChildAt(recyclerView.getChildCount() - 1).getBottom() > recyclerView.getHeight() - recyclerView.getPaddingBottom()))) {
                    z12 = true;
                }
            }
            if (z11) {
                this.f20162c = z12;
            }
            this.f20163d = z12;
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup2 = (ViewGroup) view;
            View view2 = null;
            if (viewGroup2.getChildCount() == 0) {
                childAt = null;
            } else {
                for (int childCount = viewGroup2.getChildCount() - 1; childCount >= 0; childCount--) {
                    childAt = viewGroup2.getChildAt(childCount);
                    if (childAt.getVisibility() == 0 && childAt.getTop() == 0) {
                        break;
                    }
                }
                childAt = null;
            }
            c(childAt, z11);
            if (viewGroup2.getChildCount() != 0) {
                int childCount2 = viewGroup2.getChildCount() - 1;
                while (true) {
                    if (childCount2 < 0) {
                        break;
                    }
                    View childAt2 = viewGroup2.getChildAt(childCount2);
                    if (childAt2.getVisibility() == 0 && childAt2.getBottom() == viewGroup2.getMeasuredHeight()) {
                        view2 = childAt2;
                        break;
                    }
                    childCount2--;
                }
            }
            if (view2 != childAt) {
                c(view2, false);
            }
        }
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        Canvas canvas2;
        super.onDraw(canvas);
        View view = this.f20161b;
        if (view != null) {
            if (this.f20162c) {
                canvas2 = canvas;
                canvas2.drawRect(0.0f, r0 - this.f20175r, getMeasuredWidth(), view.getTop(), this.f20173p);
            } else {
                canvas2 = canvas;
            }
            if (this.f20163d) {
                canvas2.drawRect(0.0f, this.f20161b.getBottom(), getMeasuredWidth(), r15 + this.f20175r, this.f20173p);
            }
        }
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        for (int i5 = 0; i5 < getChildCount(); i5++) {
            View childAt = getChildAt(i5);
            if (childAt.getId() == 2131429033) {
                this.f20160a = childAt;
            } else {
                int id2 = childAt.getId();
                MDButton[] mDButtonArr = this.f20164e;
                if (id2 == 2131427611) {
                    mDButtonArr[0] = (MDButton) childAt;
                } else if (childAt.getId() == 2131427610) {
                    mDButtonArr[1] = (MDButton) childAt;
                } else if (childAt.getId() == 2131427612) {
                    mDButtonArr[2] = (MDButton) childAt;
                } else {
                    this.f20161b = childAt;
                }
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int i14;
        int measuredWidth;
        int measuredWidth2;
        int measuredWidth3;
        int measuredWidth4;
        int measuredWidth5;
        int i15;
        int measuredWidth6;
        int measuredWidth7;
        int measuredWidth8;
        if (b(this.f20160a)) {
            int measuredHeight = this.f20160a.getMeasuredHeight() + i11;
            this.f20160a.layout(i5, i11, i12, measuredHeight);
            i11 = measuredHeight;
        } else if (!this.f20169j && this.f20167h) {
            i11 += this.f20170k;
        }
        if (b(this.f20161b)) {
            View view = this.f20161b;
            view.layout(i5, i11, i12, view.getMeasuredHeight() + i11);
        }
        boolean z12 = this.f20166g;
        MDButton[] mDButtonArr = this.f20164e;
        if (z12) {
            int measuredHeight2 = i13 - this.f20171l;
            for (MDButton mDButton : mDButtonArr) {
                if (b(mDButton)) {
                    mDButton.layout(i5, measuredHeight2 - mDButton.getMeasuredHeight(), i12, measuredHeight2);
                    measuredHeight2 -= mDButton.getMeasuredHeight();
                }
            }
        } else {
            if (this.f20167h) {
                i13 -= this.f20171l;
            }
            int i16 = i13 - this.f20172m;
            boolean zB = b(mDButtonArr[2]);
            int measuredWidth9 = this.o;
            if (zB) {
                if (this.n == 3) {
                    measuredWidth7 = i5 + measuredWidth9;
                    measuredWidth8 = mDButtonArr[2].getMeasuredWidth() + measuredWidth7;
                    i14 = -1;
                } else {
                    int i17 = i12 - measuredWidth9;
                    measuredWidth7 = i17 - mDButtonArr[2].getMeasuredWidth();
                    measuredWidth8 = i17;
                    i14 = measuredWidth7;
                }
                mDButtonArr[2].layout(measuredWidth7, i16, measuredWidth8, i13);
                measuredWidth9 += mDButtonArr[2].getMeasuredWidth();
            } else {
                i14 = -1;
            }
            if (b(mDButtonArr[1])) {
                int i18 = this.n;
                if (i18 == 3) {
                    measuredWidth6 = measuredWidth9 + i5;
                    measuredWidth5 = mDButtonArr[1].getMeasuredWidth() + measuredWidth6;
                } else if (i18 == 1) {
                    measuredWidth5 = i12 - measuredWidth9;
                    measuredWidth6 = measuredWidth5 - mDButtonArr[1].getMeasuredWidth();
                } else {
                    int i19 = i5 + this.o;
                    measuredWidth5 = mDButtonArr[1].getMeasuredWidth() + i19;
                    i15 = i19;
                    measuredWidth = measuredWidth5;
                    mDButtonArr[1].layout(i15, i16, measuredWidth5, i13);
                }
                i15 = measuredWidth6;
                measuredWidth = -1;
                mDButtonArr[1].layout(i15, i16, measuredWidth5, i13);
            } else {
                measuredWidth = -1;
            }
            if (b(mDButtonArr[0])) {
                int i21 = this.n;
                if (i21 == 3) {
                    measuredWidth4 = i12 - this.o;
                    measuredWidth3 = measuredWidth4 - mDButtonArr[0].getMeasuredWidth();
                } else if (i21 == 1) {
                    measuredWidth3 = i5 + this.o;
                    measuredWidth4 = mDButtonArr[0].getMeasuredWidth() + measuredWidth3;
                } else {
                    if (measuredWidth != -1 || i14 == -1) {
                        if (i14 == -1 && measuredWidth != -1) {
                            measuredWidth2 = mDButtonArr[0].getMeasuredWidth();
                        } else if (i14 == -1) {
                            measuredWidth = ((i12 - i5) / 2) - (mDButtonArr[0].getMeasuredWidth() / 2);
                            measuredWidth2 = mDButtonArr[0].getMeasuredWidth();
                        }
                        i14 = measuredWidth2 + measuredWidth;
                    } else {
                        measuredWidth = i14 - mDButtonArr[0].getMeasuredWidth();
                    }
                    measuredWidth3 = measuredWidth;
                    measuredWidth4 = i14;
                }
                mDButtonArr[0].layout(measuredWidth3, i16, measuredWidth4, i13);
            }
        }
        c(this.f20161b, true);
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00ae  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0102  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onMeasure(int i5, int i11) {
        boolean z11;
        boolean z12;
        int measuredHeight;
        int i12;
        int measuredHeight2;
        int i13;
        int size = View.MeasureSpec.getSize(i5);
        int size2 = View.MeasureSpec.getSize(i11);
        this.f20167h = true;
        int i14 = this.f20165f;
        MDButton[] mDButtonArr = this.f20164e;
        int measuredHeight3 = 0;
        if (i14 == 1) {
            z12 = true;
            z11 = false;
        } else if (i14 == 3) {
            z12 = false;
            z11 = false;
        } else {
            int measuredWidth = 0;
            z11 = false;
            for (MDButton mDButton : mDButtonArr) {
                if (mDButton != null && b(mDButton)) {
                    mDButton.a(false, false);
                    measureChild(mDButton, i5, i11);
                    measuredWidth += mDButton.getMeasuredWidth();
                    z11 = true;
                }
            }
            z12 = measuredWidth > size - (getContext().getResources().getDimensionPixelSize(2131166045) * 2);
        }
        this.f20166g = z12;
        if (z12) {
            measuredHeight = 0;
            for (MDButton mDButton2 : mDButtonArr) {
                if (mDButton2 != null && b(mDButton2)) {
                    mDButton2.a(true, false);
                    measureChild(mDButton2, i5, i11);
                    measuredHeight += mDButton2.getMeasuredHeight();
                    z11 = true;
                }
            }
        } else {
            measuredHeight = 0;
        }
        if (!z11) {
            i12 = this.f20171l * 2;
            measuredHeight2 = size2;
        } else {
            if (this.f20166g) {
                measuredHeight2 = size2 - measuredHeight;
                i12 = this.f20171l * 2;
                i13 = i12;
                if (!b(this.f20160a)) {
                    this.f20160a.measure(View.MeasureSpec.makeMeasureSpec(size, 1073741824), 0);
                    measuredHeight2 -= this.f20160a.getMeasuredHeight();
                } else if (!this.f20169j) {
                    i12 += this.f20170k;
                }
                if (b(this.f20161b)) {
                    measuredHeight3 = measuredHeight2;
                } else {
                    this.f20161b.measure(View.MeasureSpec.makeMeasureSpec(size, 1073741824), View.MeasureSpec.makeMeasureSpec(measuredHeight2 - i13, Integer.MIN_VALUE));
                    if (this.f20161b.getMeasuredHeight() > measuredHeight2 - i12) {
                        this.f20167h = false;
                    } else if (!this.f20168i || b(this.f20160a) || z11) {
                        this.f20167h = true;
                        measuredHeight3 = measuredHeight2 - (this.f20161b.getMeasuredHeight() + i12);
                    } else {
                        this.f20167h = false;
                        measuredHeight3 = measuredHeight2 - (this.f20161b.getMeasuredHeight() + i13);
                    }
                }
                setMeasuredDimension(size, size2 - measuredHeight3);
            }
            measuredHeight2 = size2 - this.f20172m;
            i12 = this.f20171l * 2;
        }
        i13 = 0;
        if (!b(this.f20160a)) {
        }
        if (b(this.f20161b)) {
        }
        setMeasuredDimension(size, size2 - measuredHeight3);
    }
}
