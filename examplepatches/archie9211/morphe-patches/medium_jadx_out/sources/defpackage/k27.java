package defpackage;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Handler;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListAdapter;
import android.widget.PopupWindow;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class k27 implements p9c {
    public static final Method A;
    public static final Method B;
    public static final Method C;
    public final Context a;
    public ListAdapter b;
    public ym3 c;
    public int f;
    public int g;
    public boolean i;
    public boolean j;
    public boolean k;
    public h27 n;
    public View o;
    public AdapterView.OnItemClickListener p;
    public AdapterView.OnItemSelectedListener q;
    public final Handler v;
    public Rect x;
    public boolean y;
    public final p20 z;
    public final int d = -2;
    public int e = -2;
    public final int h = PhotoshopDirectory.TAG_XML;
    public int l = 0;
    public final int m = Integer.MAX_VALUE;
    public final g27 r = new g27(this, 1);
    public final j27 s = new j27(this);
    public final i27 t = new i27(this);
    public final g27 u = new g27(this, 0);
    public final Rect w = new Rect();

    static {
        int i = Build.VERSION.SDK_INT;
        Class cls = Boolean.TYPE;
        if (i <= 28) {
            try {
                A = PopupWindow.class.getDeclaredMethod("setClipToScreenEnabled", cls);
            } catch (NoSuchMethodException unused) {
                Log.i("ListPopupWindow", "Could not find method setClipToScreenEnabled() on PopupWindow. Oh well.");
            }
            try {
                C = PopupWindow.class.getDeclaredMethod("setEpicenterBounds", Rect.class);
            } catch (NoSuchMethodException unused2) {
                Log.i("ListPopupWindow", "Could not find method setEpicenterBounds(Rect) on PopupWindow. Oh well.");
            }
        }
        if (Build.VERSION.SDK_INT <= 23) {
            try {
                B = PopupWindow.class.getDeclaredMethod("getMaxAvailableHeight", View.class, Integer.TYPE, cls);
            } catch (NoSuchMethodException unused3) {
                Log.i("ListPopupWindow", "Could not find method getMaxAvailableHeight(View, int, boolean) on PopupWindow. Oh well.");
            }
        }
    }

    public k27(Context context, AttributeSet attributeSet, int i, int i2) {
        int resourceId;
        this.a = context;
        this.v = new Handler(context.getMainLooper());
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, esa.o, i, 0);
        this.f = typedArrayObtainStyledAttributes.getDimensionPixelOffset(0, 0);
        int dimensionPixelOffset = typedArrayObtainStyledAttributes.getDimensionPixelOffset(1, 0);
        this.g = dimensionPixelOffset;
        if (dimensionPixelOffset != 0) {
            this.i = true;
        }
        typedArrayObtainStyledAttributes.recycle();
        p20 p20Var = new p20(context, attributeSet, i, 0);
        TypedArray typedArrayObtainStyledAttributes2 = context.obtainStyledAttributes(attributeSet, esa.s, i, 0);
        if (typedArrayObtainStyledAttributes2.hasValue(2)) {
            p20Var.setOverlapAnchor(typedArrayObtainStyledAttributes2.getBoolean(2, false));
        }
        p20Var.setBackgroundDrawable((!typedArrayObtainStyledAttributes2.hasValue(0) || (resourceId = typedArrayObtainStyledAttributes2.getResourceId(0, 0)) == 0) ? typedArrayObtainStyledAttributes2.getDrawable(0) : guc.E(context, resourceId));
        typedArrayObtainStyledAttributes2.recycle();
        this.z = p20Var;
        p20Var.setInputMethodMode(1);
    }

    @Override // defpackage.p9c
    public final boolean a() {
        return this.z.isShowing();
    }

    public final int b() {
        return this.f;
    }

    public final void c(int i) {
        this.f = i;
    }

    @Override // defpackage.p9c
    public final void dismiss() {
        p20 p20Var = this.z;
        p20Var.dismiss();
        p20Var.setContentView(null);
        this.c = null;
        this.v.removeCallbacks(this.r);
    }

    @Override // defpackage.p9c
    public final void e() {
        int i;
        int iA;
        int paddingBottom;
        ym3 ym3Var;
        ym3 ym3Var2 = this.c;
        Context context = this.a;
        p20 p20Var = this.z;
        if (ym3Var2 == null) {
            ym3 ym3VarP = p(context, !this.y);
            this.c = ym3VarP;
            ym3VarP.setAdapter(this.b);
            this.c.setOnItemClickListener(this.p);
            this.c.setFocusable(true);
            this.c.setFocusableInTouchMode(true);
            this.c.setOnItemSelectedListener(new d27(this));
            this.c.setOnScrollListener(this.t);
            AdapterView.OnItemSelectedListener onItemSelectedListener = this.q;
            if (onItemSelectedListener != null) {
                this.c.setOnItemSelectedListener(onItemSelectedListener);
            }
            p20Var.setContentView(this.c);
        }
        Drawable background = p20Var.getBackground();
        Rect rect = this.w;
        if (background != null) {
            background.getPadding(rect);
            int i2 = rect.top;
            i = rect.bottom + i2;
            if (!this.i) {
                this.g = -i2;
            }
        } else {
            rect.setEmpty();
            i = 0;
        }
        boolean z = p20Var.getInputMethodMode() == 2;
        View view = this.o;
        int i3 = this.g;
        if (Build.VERSION.SDK_INT <= 23) {
            Method method = B;
            if (method != null) {
                try {
                    iA = ((Integer) method.invoke(p20Var, view, Integer.valueOf(i3), Boolean.valueOf(z))).intValue();
                } catch (Exception unused) {
                    Log.i("ListPopupWindow", "Could not call getMaxAvailableHeightMethod(View, int, boolean) on PopupWindow. Using the public version.");
                    iA = p20Var.getMaxAvailableHeight(view, i3);
                }
            } else {
                iA = p20Var.getMaxAvailableHeight(view, i3);
            }
        } else {
            iA = e27.a(p20Var, view, i3, z);
        }
        int i4 = this.d;
        if (i4 == -1) {
            paddingBottom = iA + i;
        } else {
            int i5 = this.e;
            int iA2 = this.c.a(i5 != -2 ? i5 != -1 ? View.MeasureSpec.makeMeasureSpec(i5, 1073741824) : View.MeasureSpec.makeMeasureSpec(context.getResources().getDisplayMetrics().widthPixels - (rect.left + rect.right), 1073741824) : View.MeasureSpec.makeMeasureSpec(context.getResources().getDisplayMetrics().widthPixels - (rect.left + rect.right), Integer.MIN_VALUE), iA);
            paddingBottom = iA2 + (iA2 > 0 ? this.c.getPaddingBottom() + this.c.getPaddingTop() + i : 0);
        }
        boolean z2 = p20Var.getInputMethodMode() == 2;
        p20Var.setWindowLayoutType(this.h);
        if (p20Var.isShowing()) {
            if (this.o.isAttachedToWindow()) {
                int width = this.e;
                if (width == -1) {
                    width = -1;
                } else if (width == -2) {
                    width = this.o.getWidth();
                }
                if (i4 == -1) {
                    i4 = z2 ? paddingBottom : -1;
                    int i6 = this.e;
                    if (z2) {
                        p20Var.setWidth(i6 == -1 ? -1 : 0);
                        p20Var.setHeight(0);
                    } else {
                        p20Var.setWidth(i6 == -1 ? -1 : 0);
                        p20Var.setHeight(-1);
                    }
                } else if (i4 == -2) {
                    i4 = paddingBottom;
                }
                p20Var.setOutsideTouchable(true);
                int i7 = width;
                p20Var.update(this.o, this.f, this.g, i7 < 0 ? -1 : i7, i4 < 0 ? -1 : i4);
                return;
            }
            return;
        }
        int width2 = this.e;
        if (width2 == -1) {
            width2 = -1;
        } else if (width2 == -2) {
            width2 = this.o.getWidth();
        }
        if (i4 == -1) {
            i4 = -1;
        } else if (i4 == -2) {
            i4 = paddingBottom;
        }
        p20Var.setWidth(width2);
        p20Var.setHeight(i4);
        if (Build.VERSION.SDK_INT <= 28) {
            Method method2 = A;
            if (method2 != null) {
                try {
                    method2.invoke(p20Var, Boolean.TRUE);
                } catch (Exception unused2) {
                    Log.i("ListPopupWindow", "Could not call setClipToScreenEnabled() on PopupWindow. Oh well.");
                }
            }
        } else {
            f27.b(p20Var, true);
        }
        p20Var.setOutsideTouchable(true);
        p20Var.setTouchInterceptor(this.s);
        if (this.k) {
            p20Var.setOverlapAnchor(this.j);
        }
        if (Build.VERSION.SDK_INT <= 28) {
            Method method3 = C;
            if (method3 != null) {
                try {
                    method3.invoke(p20Var, this.x);
                } catch (Exception e) {
                    Log.e("ListPopupWindow", "Could not invoke setEpicenterBounds on PopupWindow", e);
                }
            }
        } else {
            f27.a(p20Var, this.x);
        }
        p20Var.showAsDropDown(this.o, this.f, this.g, this.l);
        this.c.setSelection(-1);
        if ((!this.y || this.c.isInTouchMode()) && (ym3Var = this.c) != null) {
            ym3Var.setListSelectionHidden(true);
            ym3Var.requestLayout();
        }
        if (this.y) {
            return;
        }
        this.v.post(this.u);
    }

    public final Drawable g() {
        return this.z.getBackground();
    }

    public final void i(Drawable drawable) {
        this.z.setBackgroundDrawable(drawable);
    }

    @Override // defpackage.p9c
    public final ym3 j() {
        return this.c;
    }

    public final void k(int i) {
        this.g = i;
        this.i = true;
    }

    public final int n() {
        if (this.i) {
            return this.g;
        }
        return 0;
    }

    public void o(ListAdapter listAdapter) {
        h27 h27Var = this.n;
        if (h27Var == null) {
            this.n = new h27(0, this);
        } else {
            ListAdapter listAdapter2 = this.b;
            if (listAdapter2 != null) {
                listAdapter2.unregisterDataSetObserver(h27Var);
            }
        }
        this.b = listAdapter;
        if (listAdapter != null) {
            listAdapter.registerDataSetObserver(this.n);
        }
        ym3 ym3Var = this.c;
        if (ym3Var != null) {
            ym3Var.setAdapter(this.b);
        }
    }

    public ym3 p(Context context, boolean z) {
        return new ym3(context, z);
    }

    public final void q(int i) {
        Drawable background = this.z.getBackground();
        if (background == null) {
            this.e = i;
            return;
        }
        Rect rect = this.w;
        background.getPadding(rect);
        this.e = rect.left + rect.right + i;
    }
}
