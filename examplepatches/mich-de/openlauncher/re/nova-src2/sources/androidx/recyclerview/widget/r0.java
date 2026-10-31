package androidx.recyclerview.widget;

import android.animation.ValueAnimator;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.util.Log;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewParent;
import androidx.core.view.GestureDetectorCompat;
import java.util.ArrayList;
import java.util.WeakHashMap;

/* loaded from: classes2.dex */
public final class r0 extends v1 implements b2 {
    public Rect A;
    public long B;

    /* renamed from: d, reason: collision with root package name */
    public float f15088d;

    /* renamed from: e, reason: collision with root package name */
    public float f15089e;

    /* renamed from: f, reason: collision with root package name */
    public float f15090f;

    /* renamed from: g, reason: collision with root package name */
    public float f15091g;

    /* renamed from: h, reason: collision with root package name */
    public float f15092h;

    /* renamed from: i, reason: collision with root package name */
    public float f15093i;

    /* renamed from: j, reason: collision with root package name */
    public float f15094j;

    /* renamed from: k, reason: collision with root package name */
    public float f15095k;

    /* renamed from: m, reason: collision with root package name */
    public final p0 f15097m;
    public int o;

    /* renamed from: q, reason: collision with root package name */
    public int f15099q;

    /* renamed from: r, reason: collision with root package name */
    public RecyclerView f15100r;

    /* renamed from: t, reason: collision with root package name */
    public VelocityTracker f15102t;

    /* renamed from: u, reason: collision with root package name */
    public ArrayList f15103u;

    /* renamed from: v, reason: collision with root package name */
    public ArrayList f15104v;

    /* renamed from: x, reason: collision with root package name */
    public GestureDetectorCompat f15106x;

    /* renamed from: y, reason: collision with root package name */
    public o0 f15107y;

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f15085a = new ArrayList();

    /* renamed from: b, reason: collision with root package name */
    public final float[] f15086b = new float[2];

    /* renamed from: c, reason: collision with root package name */
    public s2 f15087c = null;

    /* renamed from: l, reason: collision with root package name */
    public int f15096l = -1;
    public int n = 0;

    /* renamed from: p, reason: collision with root package name */
    public final ArrayList f15098p = new ArrayList();

    /* renamed from: s, reason: collision with root package name */
    public final ai.h f15101s = new ai.h(this, 9);

    /* renamed from: w, reason: collision with root package name */
    public View f15105w = null;

    /* renamed from: z, reason: collision with root package name */
    public final j0 f15108z = new j0(this);

    public r0(p0 p0Var) {
        this.f15097m = p0Var;
    }

    public static boolean j(View view, float f11, float f12, float f13, float f14) {
        return f11 >= f13 && f11 <= f13 + ((float) view.getWidth()) && f12 >= f14 && f12 <= f14 + ((float) view.getHeight());
    }

    public final void b(RecyclerView recyclerView) {
        RecyclerView recyclerView2 = this.f15100r;
        if (recyclerView2 == recyclerView) {
            return;
        }
        j0 j0Var = this.f15108z;
        if (recyclerView2 != null) {
            recyclerView2.removeItemDecoration(this);
            this.f15100r.removeOnItemTouchListener(j0Var);
            this.f15100r.removeOnChildAttachStateChangeListener(this);
            ArrayList arrayList = this.f15098p;
            int size = arrayList.size();
            while (true) {
                size--;
                if (size < 0) {
                    break;
                }
                k0 k0Var = (k0) arrayList.get(0);
                k0Var.f15022g.cancel();
                this.f15097m.clearView(this.f15100r, k0Var.f15020e);
            }
            arrayList.clear();
            this.f15105w = null;
            VelocityTracker velocityTracker = this.f15102t;
            if (velocityTracker != null) {
                velocityTracker.recycle();
                this.f15102t = null;
            }
            o0 o0Var = this.f15107y;
            if (o0Var != null) {
                o0Var.f15067a = false;
                this.f15107y = null;
            }
            if (this.f15106x != null) {
                this.f15106x = null;
            }
        }
        this.f15100r = recyclerView;
        if (recyclerView != null) {
            Resources resources = recyclerView.getResources();
            this.f15090f = resources.getDimension(2131165591);
            this.f15091g = resources.getDimension(2131165590);
            this.f15099q = ViewConfiguration.get(this.f15100r.getContext()).getScaledTouchSlop();
            this.f15100r.addItemDecoration(this);
            this.f15100r.addOnItemTouchListener(j0Var);
            this.f15100r.addOnChildAttachStateChangeListener(this);
            this.f15107y = new o0(this);
            this.f15106x = new GestureDetectorCompat(this.f15100r.getContext(), this.f15107y);
        }
    }

    public final int d(s2 s2Var, int i5) {
        if ((i5 & 12) == 0) {
            return 0;
        }
        int i11 = this.f15092h > 0.0f ? 8 : 4;
        VelocityTracker velocityTracker = this.f15102t;
        p0 p0Var = this.f15097m;
        if (velocityTracker != null && this.f15096l > -1) {
            velocityTracker.computeCurrentVelocity(1000, p0Var.getSwipeVelocityThreshold(this.f15091g));
            float xVelocity = this.f15102t.getXVelocity(this.f15096l);
            float yVelocity = this.f15102t.getYVelocity(this.f15096l);
            int i12 = xVelocity > 0.0f ? 8 : 4;
            float fAbs = Math.abs(xVelocity);
            if ((i12 & i5) != 0 && i11 == i12 && fAbs >= p0Var.getSwipeEscapeVelocity(this.f15090f) && fAbs > Math.abs(yVelocity)) {
                return i12;
            }
        }
        float swipeThreshold = p0Var.getSwipeThreshold(s2Var) * this.f15100r.getWidth();
        if ((i5 & i11) == 0 || Math.abs(this.f15092h) <= swipeThreshold) {
            return 0;
        }
        return i11;
    }

    public final void e(int i5, int i11, MotionEvent motionEvent) {
        int absoluteMovementFlags;
        View viewH;
        if (this.f15087c == null && i5 == 2 && this.n != 2) {
            p0 p0Var = this.f15097m;
            if (p0Var.isItemViewSwipeEnabled() && this.f15100r.getScrollState() != 1) {
                z1 layoutManager = this.f15100r.getLayoutManager();
                int i12 = this.f15096l;
                s2 childViewHolder = null;
                if (i12 != -1) {
                    int iFindPointerIndex = motionEvent.findPointerIndex(i12);
                    float x11 = motionEvent.getX(iFindPointerIndex) - this.f15088d;
                    float y11 = motionEvent.getY(iFindPointerIndex) - this.f15089e;
                    float fAbs = Math.abs(x11);
                    float fAbs2 = Math.abs(y11);
                    float f11 = this.f15099q;
                    if ((fAbs >= f11 || fAbs2 >= f11) && ((fAbs <= fAbs2 || !layoutManager.canScrollHorizontally()) && ((fAbs2 <= fAbs || !layoutManager.canScrollVertically()) && (viewH = h(motionEvent)) != null))) {
                        childViewHolder = this.f15100r.getChildViewHolder(viewH);
                    }
                }
                if (childViewHolder == null || (absoluteMovementFlags = (p0Var.getAbsoluteMovementFlags(this.f15100r, childViewHolder) & 65280) >> 8) == 0) {
                    return;
                }
                float x12 = motionEvent.getX(i11);
                float y12 = motionEvent.getY(i11);
                float f12 = x12 - this.f15088d;
                float f13 = y12 - this.f15089e;
                float fAbs3 = Math.abs(f12);
                float fAbs4 = Math.abs(f13);
                float f14 = this.f15099q;
                if (fAbs3 >= f14 || fAbs4 >= f14) {
                    if (fAbs3 > fAbs4) {
                        if (f12 < 0.0f && (absoluteMovementFlags & 4) == 0) {
                            return;
                        }
                        if (f12 > 0.0f && (absoluteMovementFlags & 8) == 0) {
                            return;
                        }
                    } else {
                        if (f13 < 0.0f && (absoluteMovementFlags & 1) == 0) {
                            return;
                        }
                        if (f13 > 0.0f && (absoluteMovementFlags & 2) == 0) {
                            return;
                        }
                    }
                    this.f15093i = 0.0f;
                    this.f15092h = 0.0f;
                    this.f15096l = motionEvent.getPointerId(0);
                    m(childViewHolder, 1);
                }
            }
        }
    }

    public final int f(s2 s2Var, int i5) {
        if ((i5 & 3) == 0) {
            return 0;
        }
        int i11 = this.f15093i > 0.0f ? 2 : 1;
        VelocityTracker velocityTracker = this.f15102t;
        p0 p0Var = this.f15097m;
        if (velocityTracker != null && this.f15096l > -1) {
            velocityTracker.computeCurrentVelocity(1000, p0Var.getSwipeVelocityThreshold(this.f15091g));
            float xVelocity = this.f15102t.getXVelocity(this.f15096l);
            float yVelocity = this.f15102t.getYVelocity(this.f15096l);
            int i12 = yVelocity > 0.0f ? 2 : 1;
            float fAbs = Math.abs(yVelocity);
            if ((i12 & i5) != 0 && i12 == i11 && fAbs >= p0Var.getSwipeEscapeVelocity(this.f15090f) && fAbs > Math.abs(xVelocity)) {
                return i12;
            }
        }
        float swipeThreshold = p0Var.getSwipeThreshold(s2Var) * this.f15100r.getHeight();
        if ((i5 & i11) == 0 || Math.abs(this.f15093i) <= swipeThreshold) {
            return 0;
        }
        return i11;
    }

    public final void g(s2 s2Var, boolean z11) {
        ArrayList arrayList = this.f15098p;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            k0 k0Var = (k0) arrayList.get(size);
            if (k0Var.f15020e == s2Var) {
                k0Var.f15026k |= z11;
                if (!k0Var.f15027l) {
                    k0Var.f15022g.cancel();
                }
                arrayList.remove(size);
                return;
            }
        }
    }

    @Override // androidx.recyclerview.widget.v1
    public final void getItemOffsets(Rect rect, View view, RecyclerView recyclerView, o2 o2Var) {
        rect.setEmpty();
    }

    public final View h(MotionEvent motionEvent) {
        float x11 = motionEvent.getX();
        float y11 = motionEvent.getY();
        s2 s2Var = this.f15087c;
        if (s2Var != null) {
            View view = s2Var.itemView;
            if (j(view, x11, y11, this.f15094j + this.f15092h, this.f15095k + this.f15093i)) {
                return view;
            }
        }
        ArrayList arrayList = this.f15098p;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            k0 k0Var = (k0) arrayList.get(size);
            View view2 = k0Var.f15020e.itemView;
            if (j(view2, x11, y11, k0Var.f15024i, k0Var.f15025j)) {
                return view2;
            }
        }
        return this.f15100r.findChildViewUnder(x11, y11);
    }

    public final void i(float[] fArr) {
        if ((this.o & 12) != 0) {
            fArr[0] = (this.f15094j + this.f15092h) - this.f15087c.itemView.getLeft();
        } else {
            fArr[0] = this.f15087c.itemView.getTranslationX();
        }
        if ((this.o & 3) != 0) {
            fArr[1] = (this.f15095k + this.f15093i) - this.f15087c.itemView.getTop();
        } else {
            fArr[1] = this.f15087c.itemView.getTranslationY();
        }
    }

    public final void k(s2 s2Var) {
        int i5;
        int i11;
        int i12;
        if (this.f15100r.isLayoutRequested()) {
            return;
        }
        char c11 = 2;
        if (this.n != 2) {
            return;
        }
        p0 p0Var = this.f15097m;
        float moveThreshold = p0Var.getMoveThreshold(s2Var);
        int i13 = (int) (this.f15094j + this.f15092h);
        int i14 = (int) (this.f15095k + this.f15093i);
        if (Math.abs(i14 - s2Var.itemView.getTop()) >= s2Var.itemView.getHeight() * moveThreshold || Math.abs(i13 - s2Var.itemView.getLeft()) >= s2Var.itemView.getWidth() * moveThreshold) {
            ArrayList arrayList = this.f15103u;
            if (arrayList == null) {
                this.f15103u = new ArrayList();
                this.f15104v = new ArrayList();
            } else {
                arrayList.clear();
                this.f15104v.clear();
            }
            int boundingBoxMargin = p0Var.getBoundingBoxMargin();
            int iRound = Math.round(this.f15094j + this.f15092h) - boundingBoxMargin;
            int iRound2 = Math.round(this.f15095k + this.f15093i) - boundingBoxMargin;
            int i15 = boundingBoxMargin * 2;
            int width = s2Var.itemView.getWidth() + iRound + i15;
            int height = s2Var.itemView.getHeight() + iRound2 + i15;
            int i16 = (iRound + width) / 2;
            int i17 = (iRound2 + height) / 2;
            z1 layoutManager = this.f15100r.getLayoutManager();
            int childCount = layoutManager.getChildCount();
            int i18 = 0;
            while (i18 < childCount) {
                char c12 = c11;
                View childAt = layoutManager.getChildAt(i18);
                if (childAt != s2Var.itemView && childAt.getBottom() >= iRound2 && childAt.getTop() <= height && childAt.getRight() >= iRound && childAt.getLeft() <= width) {
                    s2 childViewHolder = this.f15100r.getChildViewHolder(childAt);
                    i5 = i16;
                    if (p0Var.canDropOver(this.f15100r, this.f15087c, childViewHolder)) {
                        int iAbs = Math.abs(i5 - ((childAt.getRight() + childAt.getLeft()) / 2));
                        int iAbs2 = Math.abs(i17 - ((childAt.getBottom() + childAt.getTop()) / 2));
                        int i19 = (iAbs2 * iAbs2) + (iAbs * iAbs);
                        int size = this.f15103u.size();
                        i11 = iRound;
                        i12 = iRound2;
                        int i21 = 0;
                        int i22 = 0;
                        while (i21 < size) {
                            int i23 = size;
                            if (i19 <= ((Integer) this.f15104v.get(i21)).intValue()) {
                                break;
                            }
                            i22++;
                            i21++;
                            size = i23;
                        }
                        this.f15103u.add(i22, childViewHolder);
                        this.f15104v.add(i22, Integer.valueOf(i19));
                    }
                    i18++;
                    c11 = c12;
                    iRound = i11;
                    i16 = i5;
                    iRound2 = i12;
                } else {
                    i5 = i16;
                }
                i11 = iRound;
                i12 = iRound2;
                i18++;
                c11 = c12;
                iRound = i11;
                i16 = i5;
                iRound2 = i12;
            }
            ArrayList arrayList2 = this.f15103u;
            if (arrayList2.size() == 0) {
                return;
            }
            s2 s2VarChooseDropTarget = p0Var.chooseDropTarget(s2Var, arrayList2, i13, i14);
            if (s2VarChooseDropTarget == null) {
                this.f15103u.clear();
                this.f15104v.clear();
                return;
            }
            int absoluteAdapterPosition = s2VarChooseDropTarget.getAbsoluteAdapterPosition();
            int absoluteAdapterPosition2 = s2Var.getAbsoluteAdapterPosition();
            if (p0Var.onMove(this.f15100r, s2Var, s2VarChooseDropTarget)) {
                this.f15097m.onMoved(this.f15100r, s2Var, absoluteAdapterPosition2, s2VarChooseDropTarget, absoluteAdapterPosition, i13, i14);
            }
        }
    }

    public final void l(View view) {
        if (view == this.f15105w) {
            this.f15105w = null;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0047  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00bc A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00e1  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00f3  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00f5  */
    /* JADX WARN: Type inference failed for: r16v2 */
    /* JADX WARN: Type inference failed for: r16v3 */
    /* JADX WARN: Type inference failed for: r16v5 */
    /* JADX WARN: Type inference failed for: r16v6 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void m(s2 s2Var, int i5) {
        p0 p0Var;
        boolean z11;
        boolean z12;
        int iF;
        VelocityTracker velocityTracker;
        ?? r16;
        float fSignum;
        if (s2Var == this.f15087c && i5 == this.n) {
            return;
        }
        this.B = Long.MIN_VALUE;
        int i11 = this.n;
        g(s2Var, true);
        this.n = i5;
        if (i5 == 2) {
            if (s2Var == null) {
                throw new IllegalArgumentException("Must pass a ViewHolder when dragging");
            }
            this.f15105w = s2Var.itemView;
        }
        int i12 = (1 << ((i5 * 8) + 8)) - 1;
        s2 s2Var2 = this.f15087c;
        p0 p0Var2 = this.f15097m;
        if (s2Var2 != null) {
            if (s2Var2.itemView.getParent() == null) {
                p0Var = p0Var2;
                z11 = false;
                l(s2Var2.itemView);
                p0Var.clearView(this.f15100r, s2Var2);
                z12 = false;
            } else if (i11 != 2 && this.n != 2) {
                int movementFlags = p0Var2.getMovementFlags(this.f15100r, s2Var2);
                RecyclerView recyclerView = this.f15100r;
                WeakHashMap weakHashMap = a5.a1.f250a;
                int iConvertToAbsoluteDirection = (p0Var2.convertToAbsoluteDirection(movementFlags, recyclerView.getLayoutDirection()) & 65280) >> 8;
                if (iConvertToAbsoluteDirection == 0) {
                    iF = 0;
                    velocityTracker = this.f15102t;
                    if (velocityTracker != null) {
                        velocityTracker.recycle();
                        this.f15102t = null;
                    }
                    int i13 = 4;
                    float fSignum2 = 0.0f;
                    if (iF == 1 || iF == 2) {
                        r16 = 0;
                        fSignum = Math.signum(this.f15093i) * this.f15100r.getHeight();
                    } else if (iF == 4 || iF == 8 || iF == 16 || iF == 32) {
                        r16 = 0;
                        fSignum = 0.0f;
                        fSignum2 = Math.signum(this.f15092h) * this.f15100r.getWidth();
                    } else {
                        fSignum = 0.0f;
                        r16 = 0;
                    }
                    if (i11 != 2) {
                        i13 = 8;
                    } else if (iF > 0) {
                        i13 = 2;
                    }
                    float[] fArr = this.f15086b;
                    i(fArr);
                    float f11 = fSignum2;
                    float f12 = fSignum;
                    float f13 = fArr[r16];
                    float f14 = fArr[1];
                    z11 = r16;
                    p0Var = p0Var2;
                    k0 k0Var = new k0(this, s2Var2, i11, f13, f14, f11, f12, iF, s2Var2);
                    long animationDuration = p0Var.getAnimationDuration(this.f15100r, i13, f11 - f13, f12 - f14);
                    ValueAnimator valueAnimator = k0Var.f15022g;
                    valueAnimator.setDuration(animationDuration);
                    this.f15098p.add(k0Var);
                    s2Var2.setIsRecyclable(z11);
                    valueAnimator.start();
                    z12 = true;
                } else {
                    int i14 = (movementFlags & 65280) >> 8;
                    if (Math.abs(this.f15092h) > Math.abs(this.f15093i)) {
                        iF = d(s2Var2, iConvertToAbsoluteDirection);
                        if (iF <= 0) {
                            iF = f(s2Var2, iConvertToAbsoluteDirection);
                            if (iF <= 0) {
                            }
                        } else if ((i14 & iF) == 0) {
                            iF = n0.convertToRelativeDirection(iF, this.f15100r.getLayoutDirection());
                        }
                        velocityTracker = this.f15102t;
                        if (velocityTracker != null) {
                        }
                        int i132 = 4;
                        float fSignum22 = 0.0f;
                        if (iF == 1) {
                            r16 = 0;
                            fSignum = Math.signum(this.f15093i) * this.f15100r.getHeight();
                            if (i11 != 2) {
                            }
                            float[] fArr2 = this.f15086b;
                            i(fArr2);
                            float f112 = fSignum22;
                            float f122 = fSignum;
                            float f132 = fArr2[r16];
                            float f142 = fArr2[1];
                            z11 = r16;
                            p0Var = p0Var2;
                            k0 k0Var2 = new k0(this, s2Var2, i11, f132, f142, f112, f122, iF, s2Var2);
                            long animationDuration2 = p0Var.getAnimationDuration(this.f15100r, i132, f112 - f132, f122 - f142);
                            ValueAnimator valueAnimator2 = k0Var2.f15022g;
                            valueAnimator2.setDuration(animationDuration2);
                            this.f15098p.add(k0Var2);
                            s2Var2.setIsRecyclable(z11);
                            valueAnimator2.start();
                            z12 = true;
                        }
                    } else {
                        iF = f(s2Var2, iConvertToAbsoluteDirection);
                        if (iF <= 0) {
                            iF = d(s2Var2, iConvertToAbsoluteDirection);
                            if (iF > 0) {
                                if ((i14 & iF) == 0) {
                                    iF = n0.convertToRelativeDirection(iF, this.f15100r.getLayoutDirection());
                                }
                            }
                        }
                        velocityTracker = this.f15102t;
                        if (velocityTracker != null) {
                        }
                        int i1322 = 4;
                        float fSignum222 = 0.0f;
                        if (iF == 1) {
                        }
                    }
                }
            }
            this.f15087c = null;
        } else {
            p0Var = p0Var2;
            z11 = false;
            z12 = false;
        }
        if (s2Var != null) {
            this.o = (p0Var.getAbsoluteMovementFlags(this.f15100r, s2Var) & i12) >> (this.n * 8);
            this.f15094j = s2Var.itemView.getLeft();
            this.f15095k = s2Var.itemView.getTop();
            this.f15087c = s2Var;
            if (i5 == 2) {
                s2Var.itemView.performHapticFeedback(z11 ? 1 : 0);
            }
        }
        ViewParent parent = this.f15100r.getParent();
        if (parent != null) {
            if (this.f15087c != null) {
                z11 = true;
            }
            parent.requestDisallowInterceptTouchEvent(z11);
        }
        if (!z12) {
            this.f15100r.getLayoutManager().requestSimpleAnimationsInNextLayout();
        }
        p0Var.onSelectedChanged(this.f15087c, this.n);
        this.f15100r.invalidate();
    }

    public final void n(s2 s2Var) {
        if (!this.f15097m.hasDragFlag(this.f15100r, s2Var)) {
            Log.e("ItemTouchHelper", "Start drag has been called but dragging is not enabled");
            return;
        }
        if (s2Var.itemView.getParent() != this.f15100r) {
            Log.e("ItemTouchHelper", "Start drag has been called with a view holder which is not a child of the RecyclerView which is controlled by this ItemTouchHelper.");
            return;
        }
        VelocityTracker velocityTracker = this.f15102t;
        if (velocityTracker != null) {
            velocityTracker.recycle();
        }
        this.f15102t = VelocityTracker.obtain();
        this.f15093i = 0.0f;
        this.f15092h = 0.0f;
        m(s2Var, 2);
    }

    public final void o(int i5, int i11, MotionEvent motionEvent) {
        float x11 = motionEvent.getX(i11);
        float y11 = motionEvent.getY(i11);
        float f11 = x11 - this.f15088d;
        this.f15092h = f11;
        this.f15093i = y11 - this.f15089e;
        if ((i5 & 4) == 0) {
            this.f15092h = Math.max(0.0f, f11);
        }
        if ((i5 & 8) == 0) {
            this.f15092h = Math.min(0.0f, this.f15092h);
        }
        if ((i5 & 1) == 0) {
            this.f15093i = Math.max(0.0f, this.f15093i);
        }
        if ((i5 & 2) == 0) {
            this.f15093i = Math.min(0.0f, this.f15093i);
        }
    }

    @Override // androidx.recyclerview.widget.b2
    public final void onChildViewAttachedToWindow(View view) {
    }

    @Override // androidx.recyclerview.widget.b2
    public final void onChildViewDetachedFromWindow(View view) {
        l(view);
        s2 childViewHolder = this.f15100r.getChildViewHolder(view);
        if (childViewHolder == null) {
            return;
        }
        s2 s2Var = this.f15087c;
        if (s2Var != null && childViewHolder == s2Var) {
            m(null, 0);
            return;
        }
        g(childViewHolder, false);
        if (this.f15085a.remove(childViewHolder.itemView)) {
            this.f15097m.clearView(this.f15100r, childViewHolder);
        }
    }

    @Override // androidx.recyclerview.widget.v1
    public final void onDraw(Canvas canvas, RecyclerView recyclerView, o2 o2Var) {
        float f11;
        float f12;
        if (this.f15087c != null) {
            float[] fArr = this.f15086b;
            i(fArr);
            float f13 = fArr[0];
            f12 = fArr[1];
            f11 = f13;
        } else {
            f11 = 0.0f;
            f12 = 0.0f;
        }
        this.f15097m.onDraw(canvas, recyclerView, this.f15087c, this.f15098p, this.n, f11, f12);
    }

    @Override // androidx.recyclerview.widget.v1
    public final void onDrawOver(Canvas canvas, RecyclerView recyclerView, o2 o2Var) {
        float f11;
        float f12;
        if (this.f15087c != null) {
            float[] fArr = this.f15086b;
            i(fArr);
            float f13 = fArr[0];
            f12 = fArr[1];
            f11 = f13;
        } else {
            f11 = 0.0f;
            f12 = 0.0f;
        }
        this.f15097m.onDrawOver(canvas, recyclerView, this.f15087c, this.f15098p, this.n, f11, f12);
    }
}
