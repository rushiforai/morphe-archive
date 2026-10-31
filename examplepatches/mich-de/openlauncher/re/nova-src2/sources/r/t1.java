package r;

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
import androidx.compose.ui.node.LayoutNode;
import e10.z2;
import java.lang.reflect.Method;

/* loaded from: classes.dex */
public class t1 implements q.a0 {
    public static final Method A;
    public static final Method B;

    /* renamed from: a, reason: collision with root package name */
    public final Context f84860a;

    /* renamed from: b, reason: collision with root package name */
    public ListAdapter f84861b;

    /* renamed from: c, reason: collision with root package name */
    public g1 f84862c;

    /* renamed from: f, reason: collision with root package name */
    public int f84865f;

    /* renamed from: g, reason: collision with root package name */
    public int f84866g;

    /* renamed from: i, reason: collision with root package name */
    public boolean f84868i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f84869j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f84870k;
    public q1 n;
    public View o;

    /* renamed from: p, reason: collision with root package name */
    public AdapterView.OnItemClickListener f84873p;

    /* renamed from: q, reason: collision with root package name */
    public AdapterView.OnItemSelectedListener f84874q;

    /* renamed from: v, reason: collision with root package name */
    public final Handler f84879v;

    /* renamed from: x, reason: collision with root package name */
    public Rect f84881x;

    /* renamed from: y, reason: collision with root package name */
    public boolean f84882y;

    /* renamed from: z, reason: collision with root package name */
    public final u f84883z;

    /* renamed from: d, reason: collision with root package name */
    public final int f84863d = -2;

    /* renamed from: e, reason: collision with root package name */
    public int f84864e = -2;

    /* renamed from: h, reason: collision with root package name */
    public final int f84867h = 1002;

    /* renamed from: l, reason: collision with root package name */
    public int f84871l = 0;

    /* renamed from: m, reason: collision with root package name */
    public final int f84872m = LayoutNode.NotPlacedPlaceOrder;

    /* renamed from: r, reason: collision with root package name */
    public final p1 f84875r = new p1(this, 1);

    /* renamed from: s, reason: collision with root package name */
    public final s1 f84876s = new s1(this);

    /* renamed from: t, reason: collision with root package name */
    public final r1 f84877t = new r1(this);

    /* renamed from: u, reason: collision with root package name */
    public final p1 f84878u = new p1(this, 0);

    /* renamed from: w, reason: collision with root package name */
    public final Rect f84880w = new Rect();

    static {
        if (Build.VERSION.SDK_INT <= 28) {
            try {
                A = PopupWindow.class.getDeclaredMethod("setClipToScreenEnabled", Boolean.TYPE);
            } catch (NoSuchMethodException unused) {
                Log.i("ListPopupWindow", "Could not find method setClipToScreenEnabled() on PopupWindow. Oh well.");
            }
            try {
                B = PopupWindow.class.getDeclaredMethod("setEpicenterBounds", Rect.class);
            } catch (NoSuchMethodException unused2) {
                Log.i("ListPopupWindow", "Could not find method setEpicenterBounds(Rect) on PopupWindow. Oh well.");
            }
        }
    }

    public t1(Context context, AttributeSet attributeSet, int i5, int i11) {
        int resourceId;
        this.f84860a = context;
        this.f84879v = new Handler(context.getMainLooper());
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, l.a.o, i5, 0);
        this.f84865f = typedArrayObtainStyledAttributes.getDimensionPixelOffset(0, 0);
        int dimensionPixelOffset = typedArrayObtainStyledAttributes.getDimensionPixelOffset(1, 0);
        this.f84866g = dimensionPixelOffset;
        if (dimensionPixelOffset != 0) {
            this.f84868i = true;
        }
        typedArrayObtainStyledAttributes.recycle();
        u uVar = new u(context, attributeSet, i5, 0);
        TypedArray typedArrayObtainStyledAttributes2 = context.obtainStyledAttributes(attributeSet, l.a.f72904s, i5, 0);
        if (typedArrayObtainStyledAttributes2.hasValue(2)) {
            uVar.setOverlapAnchor(typedArrayObtainStyledAttributes2.getBoolean(2, false));
        }
        uVar.setBackgroundDrawable((!typedArrayObtainStyledAttributes2.hasValue(0) || (resourceId = typedArrayObtainStyledAttributes2.getResourceId(0, 0)) == 0) ? typedArrayObtainStyledAttributes2.getDrawable(0) : z2.b0(context, resourceId));
        typedArrayObtainStyledAttributes2.recycle();
        this.f84883z = uVar;
        uVar.setInputMethodMode(1);
    }

    public final int a() {
        return this.f84865f;
    }

    public final void b(int i5) {
        this.f84865f = i5;
    }

    public final Drawable d() {
        return this.f84883z.getBackground();
    }

    @Override // q.a0
    public final void dismiss() {
        u uVar = this.f84883z;
        uVar.dismiss();
        uVar.setContentView(null);
        this.f84862c = null;
        this.f84879v.removeCallbacks(this.f84875r);
    }

    public final void f(int i5) {
        this.f84866g = i5;
        this.f84868i = true;
    }

    public final int i() {
        if (this.f84868i) {
            return this.f84866g;
        }
        return 0;
    }

    @Override // q.a0
    public final boolean isShowing() {
        return this.f84883z.isShowing();
    }

    public void j(ListAdapter listAdapter) {
        q1 q1Var = this.n;
        if (q1Var == null) {
            this.n = new q1(this);
        } else {
            ListAdapter listAdapter2 = this.f84861b;
            if (listAdapter2 != null) {
                listAdapter2.unregisterDataSetObserver(q1Var);
            }
        }
        this.f84861b = listAdapter;
        if (listAdapter != null) {
            listAdapter.registerDataSetObserver(this.n);
        }
        g1 g1Var = this.f84862c;
        if (g1Var != null) {
            g1Var.setAdapter(this.f84861b);
        }
    }

    @Override // q.a0
    public final g1 k() {
        return this.f84862c;
    }

    public final void l(Drawable drawable) {
        this.f84883z.setBackgroundDrawable(drawable);
    }

    public g1 m(Context context, boolean z11) {
        return new g1(context, z11);
    }

    public final void n(int i5) {
        Drawable background = this.f84883z.getBackground();
        if (background == null) {
            this.f84864e = i5;
            return;
        }
        Rect rect = this.f84880w;
        background.getPadding(rect);
        this.f84864e = rect.left + rect.right + i5;
    }

    public final void o() {
        this.f84883z.setInputMethodMode(2);
    }

    public final void p() {
        this.f84882y = true;
        this.f84883z.setFocusable(true);
    }

    @Override // q.a0
    public void show() {
        int i5;
        int paddingBottom;
        g1 g1Var;
        g1 g1Var2 = this.f84862c;
        Context context = this.f84860a;
        u uVar = this.f84883z;
        if (g1Var2 == null) {
            g1 g1VarM = m(context, !this.f84882y);
            this.f84862c = g1VarM;
            g1VarM.setAdapter(this.f84861b);
            this.f84862c.setOnItemClickListener(this.f84873p);
            this.f84862c.setFocusable(true);
            this.f84862c.setFocusableInTouchMode(true);
            this.f84862c.setOnItemSelectedListener(new m1(this, 0));
            this.f84862c.setOnScrollListener(this.f84877t);
            AdapterView.OnItemSelectedListener onItemSelectedListener = this.f84874q;
            if (onItemSelectedListener != null) {
                this.f84862c.setOnItemSelectedListener(onItemSelectedListener);
            }
            uVar.setContentView(this.f84862c);
        }
        Drawable background = uVar.getBackground();
        Rect rect = this.f84880w;
        if (background != null) {
            background.getPadding(rect);
            int i11 = rect.top;
            i5 = rect.bottom + i11;
            if (!this.f84868i) {
                this.f84866g = -i11;
            }
        } else {
            rect.setEmpty();
            i5 = 0;
        }
        int iA = n1.a(uVar, this.o, this.f84866g, uVar.getInputMethodMode() == 2);
        int i12 = this.f84863d;
        if (i12 == -1) {
            paddingBottom = iA + i5;
        } else {
            int i13 = this.f84864e;
            int iA2 = this.f84862c.a(i13 != -2 ? i13 != -1 ? View.MeasureSpec.makeMeasureSpec(i13, 1073741824) : View.MeasureSpec.makeMeasureSpec(context.getResources().getDisplayMetrics().widthPixels - (rect.left + rect.right), 1073741824) : View.MeasureSpec.makeMeasureSpec(context.getResources().getDisplayMetrics().widthPixels - (rect.left + rect.right), Integer.MIN_VALUE), iA);
            paddingBottom = iA2 + (iA2 > 0 ? this.f84862c.getPaddingBottom() + this.f84862c.getPaddingTop() + i5 : 0);
        }
        boolean z11 = uVar.getInputMethodMode() == 2;
        uVar.setWindowLayoutType(this.f84867h);
        if (uVar.isShowing()) {
            if (this.o.isAttachedToWindow()) {
                int width = this.f84864e;
                if (width == -1) {
                    width = -1;
                } else if (width == -2) {
                    width = this.o.getWidth();
                }
                if (i12 == -1) {
                    i12 = z11 ? paddingBottom : -1;
                    if (z11) {
                        uVar.setWidth(this.f84864e == -1 ? -1 : 0);
                        uVar.setHeight(0);
                    } else {
                        uVar.setWidth(this.f84864e == -1 ? -1 : 0);
                        uVar.setHeight(-1);
                    }
                } else if (i12 == -2) {
                    i12 = paddingBottom;
                }
                uVar.setOutsideTouchable(true);
                int i14 = width;
                View view = this.o;
                int i15 = this.f84865f;
                int i16 = this.f84866g;
                int i17 = i14 < 0 ? -1 : i14;
                if (i12 < 0) {
                    i12 = -1;
                }
                uVar.update(view, i15, i16, i17, i12);
                return;
            }
            return;
        }
        int width2 = this.f84864e;
        if (width2 == -1) {
            width2 = -1;
        } else if (width2 == -2) {
            width2 = this.o.getWidth();
        }
        if (i12 == -1) {
            i12 = -1;
        } else if (i12 == -2) {
            i12 = paddingBottom;
        }
        uVar.setWidth(width2);
        uVar.setHeight(i12);
        if (Build.VERSION.SDK_INT <= 28) {
            Method method = A;
            if (method != null) {
                try {
                    method.invoke(uVar, Boolean.TRUE);
                } catch (Exception unused) {
                    Log.i("ListPopupWindow", "Could not call setClipToScreenEnabled() on PopupWindow. Oh well.");
                }
            }
        } else {
            o1.b(uVar, true);
        }
        uVar.setOutsideTouchable(true);
        uVar.setTouchInterceptor(this.f84876s);
        if (this.f84870k) {
            uVar.setOverlapAnchor(this.f84869j);
        }
        if (Build.VERSION.SDK_INT <= 28) {
            Method method2 = B;
            if (method2 != null) {
                try {
                    method2.invoke(uVar, this.f84881x);
                } catch (Exception e3) {
                    Log.e("ListPopupWindow", "Could not invoke setEpicenterBounds on PopupWindow", e3);
                }
            }
        } else {
            o1.a(uVar, this.f84881x);
        }
        uVar.showAsDropDown(this.o, this.f84865f, this.f84866g, this.f84871l);
        this.f84862c.setSelection(-1);
        if ((!this.f84882y || this.f84862c.isInTouchMode()) && (g1Var = this.f84862c) != null) {
            g1Var.c(true);
            g1Var.requestLayout();
        }
        if (this.f84882y) {
            return;
        }
        this.f84879v.post(this.f84878u);
    }
}
