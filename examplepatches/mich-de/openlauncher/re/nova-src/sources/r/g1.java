package r;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListAdapter;
import android.widget.ListView;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;

/* loaded from: classes2.dex */
public class g1 extends ListView {

    /* renamed from: a, reason: collision with root package name */
    public final Rect f84709a;

    /* renamed from: b, reason: collision with root package name */
    public int f84710b;

    /* renamed from: c, reason: collision with root package name */
    public int f84711c;

    /* renamed from: d, reason: collision with root package name */
    public int f84712d;

    /* renamed from: e, reason: collision with root package name */
    public int f84713e;

    /* renamed from: f, reason: collision with root package name */
    public int f84714f;

    /* renamed from: g, reason: collision with root package name */
    public e1 f84715g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f84716h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f84717i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f84718j;

    /* renamed from: k, reason: collision with root package name */
    public e5.e f84719k;

    /* renamed from: l, reason: collision with root package name */
    public o7.g0 f84720l;

    public g1(Context context, boolean z11) {
        super(context, null, 2130969131);
        this.f84709a = new Rect();
        this.f84710b = 0;
        this.f84711c = 0;
        this.f84712d = 0;
        this.f84713e = 0;
        this.f84717i = z11;
        setCacheColorHint(0);
    }

    public final int a(int i5, int i11) {
        int listPaddingTop = getListPaddingTop();
        int listPaddingBottom = getListPaddingBottom();
        int dividerHeight = getDividerHeight();
        Drawable divider = getDivider();
        ListAdapter adapter = getAdapter();
        if (adapter == null) {
            return listPaddingTop + listPaddingBottom;
        }
        int measuredHeight = listPaddingTop + listPaddingBottom;
        if (dividerHeight <= 0 || divider == null) {
            dividerHeight = 0;
        }
        int count = adapter.getCount();
        int i12 = 0;
        View view = null;
        for (int i13 = 0; i13 < count; i13++) {
            int itemViewType = adapter.getItemViewType(i13);
            if (itemViewType != i12) {
                view = null;
                i12 = itemViewType;
            }
            view = adapter.getView(i13, view, this);
            ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
            if (layoutParams == null) {
                layoutParams = generateDefaultLayoutParams();
                view.setLayoutParams(layoutParams);
            }
            int i14 = layoutParams.height;
            view.measure(i5, i14 > 0 ? View.MeasureSpec.makeMeasureSpec(i14, 1073741824) : View.MeasureSpec.makeMeasureSpec(0, 0));
            view.forceLayout();
            if (i13 > 0) {
                measuredHeight += dividerHeight;
            }
            measuredHeight += view.getMeasuredHeight();
            if (measuredHeight >= i11) {
                return i11;
            }
        }
        return measuredHeight;
    }

    /* JADX WARN: Removed duplicated region for block: B:82:0x014c  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0162  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0167  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x017d  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean b(MotionEvent motionEvent, int i5) throws IllegalAccessException, IllegalArgumentException {
        boolean z11;
        boolean zA;
        View childAt;
        View childAt2;
        int actionMasked = motionEvent.getActionMasked();
        boolean z12 = false;
        if (actionMasked == 1) {
            z11 = false;
        } else {
            if (actionMasked != 2) {
                z11 = actionMasked != 3;
                if (z11 || z12) {
                    this.f84718j = false;
                    setPressed(false);
                    drawableStateChanged();
                    childAt2 = getChildAt(this.f84714f - getFirstVisiblePosition());
                    if (childAt2 != null) {
                        childAt2.setPressed(false);
                    }
                }
                if (z11) {
                    e5.e eVar = this.f84719k;
                    if (eVar != null) {
                        if (eVar.f52189p) {
                            eVar.d();
                        }
                        eVar.f52189p = false;
                    }
                } else {
                    if (this.f84719k == null) {
                        this.f84719k = new e5.e(this);
                    }
                    e5.e eVar2 = this.f84719k;
                    boolean z13 = eVar2.f52189p;
                    eVar2.f52189p = true;
                    eVar2.onTouch(this, motionEvent);
                }
                return z11;
            }
            z11 = true;
        }
        int iFindPointerIndex = motionEvent.findPointerIndex(i5);
        if (iFindPointerIndex >= 0) {
            int x11 = (int) motionEvent.getX(iFindPointerIndex);
            int y11 = (int) motionEvent.getY(iFindPointerIndex);
            int iPointToPosition = pointToPosition(x11, y11);
            if (iPointToPosition == -1) {
                z12 = true;
            } else {
                View childAt3 = getChildAt(iPointToPosition - getFirstVisiblePosition());
                float f11 = x11;
                float f12 = y11;
                this.f84718j = true;
                int i11 = Build.VERSION.SDK_INT;
                b1.a(this, f11, f12);
                if (!isPressed()) {
                    setPressed(true);
                }
                layoutChildren();
                int i12 = this.f84714f;
                if (i12 != -1 && (childAt = getChildAt(i12 - getFirstVisiblePosition())) != null && childAt != childAt3 && childAt.isPressed()) {
                    childAt.setPressed(false);
                }
                this.f84714f = iPointToPosition;
                b1.a(childAt3, f11 - childAt3.getLeft(), f12 - childAt3.getTop());
                if (!childAt3.isPressed()) {
                    childAt3.setPressed(true);
                }
                Drawable selector = getSelector();
                boolean z14 = (selector == null || iPointToPosition == -1) ? false : true;
                if (z14) {
                    selector.setVisible(false, false);
                }
                int left = childAt3.getLeft();
                int top = childAt3.getTop();
                int right = childAt3.getRight();
                int bottom = childAt3.getBottom();
                Rect rect = this.f84709a;
                rect.set(left, top, right, bottom);
                rect.left -= this.f84710b;
                rect.top -= this.f84711c;
                rect.right += this.f84712d;
                rect.bottom += this.f84713e;
                if (i11 >= 33) {
                    zA = d1.a(this);
                } else {
                    Field field = f1.f84704a;
                    if (field != null) {
                        try {
                            zA = field.getBoolean(this);
                        } catch (IllegalAccessException e3) {
                            e3.printStackTrace();
                        }
                    } else {
                        zA = false;
                    }
                }
                if (childAt3.isEnabled() != zA) {
                    boolean z15 = !zA;
                    if (Build.VERSION.SDK_INT >= 33) {
                        d1.b(this, z15);
                    } else {
                        Field field2 = f1.f84704a;
                        if (field2 != null) {
                            try {
                                field2.set(this, Boolean.valueOf(z15));
                            } catch (IllegalAccessException e11) {
                                e11.printStackTrace();
                            }
                        }
                    }
                    if (iPointToPosition != -1) {
                        refreshDrawableState();
                    }
                }
                if (z14) {
                    float fExactCenterX = rect.exactCenterX();
                    float fExactCenterY = rect.exactCenterY();
                    selector.setVisible(getVisibility() == 0, false);
                    selector.setHotspot(fExactCenterX, fExactCenterY);
                }
                Drawable selector2 = getSelector();
                if (selector2 != null && iPointToPosition != -1) {
                    selector2.setHotspot(f11, f12);
                }
                e1 e1Var = this.f84715g;
                if (e1Var != null) {
                    e1Var.f84702b = false;
                }
                refreshDrawableState();
                if (actionMasked == 1) {
                    performItemClick(childAt3, iPointToPosition, getItemIdAtPosition(iPointToPosition));
                }
                z11 = true;
                z12 = false;
            }
        }
        if (z11) {
            this.f84718j = false;
            setPressed(false);
            drawableStateChanged();
            childAt2 = getChildAt(this.f84714f - getFirstVisiblePosition());
            if (childAt2 != null) {
            }
        }
        if (z11) {
        }
        return z11;
    }

    public final void c(boolean z11) {
        this.f84716h = z11;
    }

    @Override // android.widget.ListView, android.widget.AbsListView, android.view.ViewGroup, android.view.View
    public final void dispatchDraw(Canvas canvas) {
        Drawable selector;
        Rect rect = this.f84709a;
        if (!rect.isEmpty() && (selector = getSelector()) != null) {
            selector.setBounds(rect);
            selector.draw(canvas);
        }
        super.dispatchDraw(canvas);
    }

    @Override // android.widget.AbsListView, android.view.ViewGroup, android.view.View
    public final void drawableStateChanged() {
        if (this.f84720l != null) {
            return;
        }
        super.drawableStateChanged();
        e1 e1Var = this.f84715g;
        if (e1Var != null) {
            e1Var.f84702b = true;
        }
        Drawable selector = getSelector();
        if (selector != null && this.f84718j && isPressed()) {
            selector.setState(getDrawableState());
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean hasFocus() {
        return this.f84717i || super.hasFocus();
    }

    @Override // android.view.View
    public final boolean hasWindowFocus() {
        return this.f84717i || super.hasWindowFocus();
    }

    @Override // android.view.View
    public final boolean isFocused() {
        return this.f84717i || super.isFocused();
    }

    @Override // android.view.View
    public final boolean isInTouchMode() {
        return (this.f84717i && this.f84716h) || super.isInTouchMode();
    }

    @Override // android.widget.ListView, android.widget.AbsListView, android.widget.AdapterView, android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        this.f84720l = null;
        super.onDetachedFromWindow();
    }

    @Override // android.view.View
    public boolean onHoverEvent(MotionEvent motionEvent) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        int i5 = Build.VERSION.SDK_INT;
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 10 && this.f84720l == null) {
            o7.g0 g0Var = new o7.g0(this, 8);
            this.f84720l = g0Var;
            post(g0Var);
        }
        boolean zOnHoverEvent = super.onHoverEvent(motionEvent);
        if (actionMasked != 9 && actionMasked != 7) {
            setSelection(-1);
            return zOnHoverEvent;
        }
        int iPointToPosition = pointToPosition((int) motionEvent.getX(), (int) motionEvent.getY());
        if (iPointToPosition != -1 && iPointToPosition != getSelectedItemPosition()) {
            View childAt = getChildAt(iPointToPosition - getFirstVisiblePosition());
            if (childAt.isEnabled()) {
                requestFocus();
                if (i5 < 30 || !c1.f84686d) {
                    setSelectionFromTop(iPointToPosition, childAt.getTop() - getTop());
                } else {
                    try {
                        c1.f84683a.invoke(this, Integer.valueOf(iPointToPosition), childAt, Boolean.FALSE, -1, -1);
                        c1.f84684b.invoke(this, Integer.valueOf(iPointToPosition));
                        c1.f84685c.invoke(this, Integer.valueOf(iPointToPosition));
                    } catch (IllegalAccessException e3) {
                        e3.printStackTrace();
                    } catch (InvocationTargetException e11) {
                        e11.printStackTrace();
                    }
                }
            }
            Drawable selector = getSelector();
            if (selector != null && this.f84718j && isPressed()) {
                selector.setState(getDrawableState());
            }
        }
        return zOnHoverEvent;
    }

    @Override // android.widget.AbsListView, android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        if (motionEvent.getAction() == 0) {
            this.f84714f = pointToPosition((int) motionEvent.getX(), (int) motionEvent.getY());
        }
        o7.g0 g0Var = this.f84720l;
        if (g0Var != null) {
            g1 g1Var = (g1) g0Var.f79668b;
            g1Var.f84720l = null;
            g1Var.removeCallbacks(g0Var);
        }
        return super.onTouchEvent(motionEvent);
    }

    @Override // android.widget.AbsListView
    public final void setSelector(Drawable drawable) {
        e1 e1Var = null;
        if (drawable != null) {
            e1 e1Var2 = new e1();
            Drawable drawable2 = e1Var2.f84701a;
            if (drawable2 != null) {
                drawable2.setCallback(null);
            }
            e1Var2.f84701a = drawable;
            drawable.setCallback(e1Var2);
            e1Var2.f84702b = true;
            e1Var = e1Var2;
        }
        this.f84715g = e1Var;
        super.setSelector(e1Var);
        Rect rect = new Rect();
        if (drawable != null) {
            drawable.getPadding(rect);
        }
        this.f84710b = rect.left;
        this.f84711c = rect.top;
        this.f84712d = rect.right;
        this.f84713e = rect.bottom;
    }
}
