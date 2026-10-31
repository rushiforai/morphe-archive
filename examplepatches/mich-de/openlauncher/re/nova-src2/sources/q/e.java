package q;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;
import android.os.Build;
import android.os.Handler;
import android.util.Log;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.HeaderViewListAdapter;
import android.widget.ListAdapter;
import android.widget.PopupWindow;
import android.widget.TextView;
import h6.c1;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import r.g1;
import r.u1;
import r.v1;
import r.x1;

/* loaded from: classes2.dex */
public final class e extends s implements View.OnKeyListener, PopupWindow.OnDismissListener {

    /* renamed from: b, reason: collision with root package name */
    public final Context f83194b;

    /* renamed from: c, reason: collision with root package name */
    public final int f83195c;

    /* renamed from: d, reason: collision with root package name */
    public final int f83196d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f83197e;

    /* renamed from: f, reason: collision with root package name */
    public final Handler f83198f;
    public View n;
    public View o;

    /* renamed from: p, reason: collision with root package name */
    public int f83206p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f83207q;

    /* renamed from: r, reason: collision with root package name */
    public boolean f83208r;

    /* renamed from: s, reason: collision with root package name */
    public int f83209s;

    /* renamed from: t, reason: collision with root package name */
    public int f83210t;

    /* renamed from: v, reason: collision with root package name */
    public boolean f83212v;

    /* renamed from: w, reason: collision with root package name */
    public v f83213w;

    /* renamed from: x, reason: collision with root package name */
    public ViewTreeObserver f83214x;

    /* renamed from: y, reason: collision with root package name */
    public PopupWindow.OnDismissListener f83215y;

    /* renamed from: z, reason: collision with root package name */
    public boolean f83216z;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f83199g = new ArrayList();

    /* renamed from: h, reason: collision with root package name */
    public final ArrayList f83200h = new ArrayList();

    /* renamed from: i, reason: collision with root package name */
    public final d9.d f83201i = new d9.d(this, 2);

    /* renamed from: j, reason: collision with root package name */
    public final eb.f f83202j = new eb.f(this, 6);

    /* renamed from: k, reason: collision with root package name */
    public final c f83203k = new c(this, 0);

    /* renamed from: l, reason: collision with root package name */
    public int f83204l = 0;

    /* renamed from: m, reason: collision with root package name */
    public int f83205m = 0;

    /* renamed from: u, reason: collision with root package name */
    public boolean f83211u = false;

    public e(Context context, View view, int i5, boolean z11) {
        this.f83194b = context;
        this.n = view;
        this.f83196d = i5;
        this.f83197e = z11;
        this.f83206p = view.getLayoutDirection() != 1 ? 1 : 0;
        Resources resources = context.getResources();
        this.f83195c = Math.max(resources.getDisplayMetrics().widthPixels / 2, resources.getDimensionPixelSize(2131165207));
        this.f83198f = new Handler();
    }

    @Override // q.w
    public final boolean a(c0 c0Var) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Iterator it = this.f83200h.iterator();
        while (it.hasNext()) {
            d dVar = (d) it.next();
            if (c0Var == dVar.f83192b) {
                dVar.f83191a.f84862c.requestFocus();
                return true;
            }
        }
        if (!c0Var.hasVisibleItems()) {
            return false;
        }
        i(c0Var);
        v vVar = this.f83213w;
        if (vVar != null) {
            vVar.m(c0Var);
        }
        return true;
    }

    @Override // q.w
    public final void b(k kVar, boolean z11) {
        ArrayList arrayList = this.f83200h;
        int size = arrayList.size();
        int i5 = 0;
        while (true) {
            if (i5 >= size) {
                i5 = -1;
                break;
            } else if (kVar == ((d) arrayList.get(i5)).f83192b) {
                break;
            } else {
                i5++;
            }
        }
        if (i5 < 0) {
            return;
        }
        int i11 = i5 + 1;
        if (i11 < arrayList.size()) {
            ((d) arrayList.get(i11)).f83192b.c(false);
        }
        d dVar = (d) arrayList.remove(i5);
        k kVar2 = dVar.f83192b;
        x1 x1Var = dVar.f83191a;
        r.u uVar = x1Var.f84883z;
        kVar2.r(this);
        if (this.f83216z) {
            u1.b(uVar, null);
            uVar.setAnimationStyle(0);
        }
        x1Var.dismiss();
        int size2 = arrayList.size();
        if (size2 > 0) {
            this.f83206p = ((d) arrayList.get(size2 - 1)).f83193c;
        } else {
            this.f83206p = this.n.getLayoutDirection() == 1 ? 0 : 1;
        }
        if (size2 != 0) {
            if (z11) {
                ((d) arrayList.get(0)).f83192b.c(false);
                return;
            }
            return;
        }
        dismiss();
        v vVar = this.f83213w;
        if (vVar != null) {
            vVar.b(kVar, true);
        }
        ViewTreeObserver viewTreeObserver = this.f83214x;
        if (viewTreeObserver != null) {
            if (viewTreeObserver.isAlive()) {
                this.f83214x.removeGlobalOnLayoutListener(this.f83201i);
            }
            this.f83214x = null;
        }
        this.o.removeOnAttachStateChangeListener(this.f83202j);
        this.f83215y.onDismiss();
    }

    @Override // q.w
    public final void c() {
        Iterator it = this.f83200h.iterator();
        while (it.hasNext()) {
            ListAdapter adapter = ((d) it.next()).f83191a.f84862c.getAdapter();
            if (adapter instanceof HeaderViewListAdapter) {
                adapter = ((HeaderViewListAdapter) adapter).getWrappedAdapter();
            }
            ((h) adapter).notifyDataSetChanged();
        }
    }

    @Override // q.a0
    public final void dismiss() {
        ArrayList arrayList = this.f83200h;
        int size = arrayList.size();
        if (size > 0) {
            d[] dVarArr = (d[]) arrayList.toArray(new d[size]);
            for (int i5 = size - 1; i5 >= 0; i5--) {
                d dVar = dVarArr[i5];
                if (dVar.f83191a.f84883z.isShowing()) {
                    dVar.f83191a.dismiss();
                }
            }
        }
    }

    @Override // q.w
    public final boolean g() {
        return false;
    }

    @Override // q.w
    public final void h(v vVar) {
        this.f83213w = vVar;
    }

    @Override // q.s
    public final void i(k kVar) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        kVar.b(this, this.f83194b);
        if (isShowing()) {
            s(kVar);
        } else {
            this.f83199g.add(kVar);
        }
    }

    @Override // q.a0
    public final boolean isShowing() {
        ArrayList arrayList = this.f83200h;
        return arrayList.size() > 0 && ((d) arrayList.get(0)).f83191a.f84883z.isShowing();
    }

    @Override // q.a0
    public final g1 k() {
        ArrayList arrayList = this.f83200h;
        if (arrayList.isEmpty()) {
            return null;
        }
        return ((d) c1.l(arrayList, 1)).f83191a.f84862c;
    }

    @Override // q.s
    public final void l(View view) {
        if (this.n != view) {
            this.n = view;
            this.f83205m = Gravity.getAbsoluteGravity(this.f83204l, view.getLayoutDirection());
        }
    }

    @Override // q.s
    public final void m(boolean z11) {
        this.f83211u = z11;
    }

    @Override // q.s
    public final void n(int i5) {
        if (this.f83204l != i5) {
            this.f83204l = i5;
            this.f83205m = Gravity.getAbsoluteGravity(i5, this.n.getLayoutDirection());
        }
    }

    @Override // q.s
    public final void o(int i5) {
        this.f83207q = true;
        this.f83209s = i5;
    }

    @Override // android.widget.PopupWindow.OnDismissListener
    public final void onDismiss() {
        d dVar;
        ArrayList arrayList = this.f83200h;
        int size = arrayList.size();
        int i5 = 0;
        while (true) {
            if (i5 >= size) {
                dVar = null;
                break;
            }
            dVar = (d) arrayList.get(i5);
            if (!dVar.f83191a.f84883z.isShowing()) {
                break;
            } else {
                i5++;
            }
        }
        if (dVar != null) {
            dVar.f83192b.c(false);
        }
    }

    @Override // android.view.View.OnKeyListener
    public final boolean onKey(View view, int i5, KeyEvent keyEvent) {
        if (keyEvent.getAction() != 1 || i5 != 82) {
            return false;
        }
        dismiss();
        return true;
    }

    @Override // q.s
    public final void p(PopupWindow.OnDismissListener onDismissListener) {
        this.f83215y = onDismissListener;
    }

    @Override // q.s
    public final void q(boolean z11) {
        this.f83212v = z11;
    }

    @Override // q.s
    public final void r(int i5) {
        this.f83208r = true;
        this.f83210t = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:55:0x00fe  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0157  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x015a  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0190  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void s(k kVar) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        boolean z11;
        int i5;
        d dVar;
        View childAt;
        int i11;
        int i12;
        MenuItem item;
        h hVar;
        int headersCount;
        int firstVisiblePosition;
        Context context = this.f83194b;
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(context);
        h hVar2 = new h(kVar, layoutInflaterFrom, this.f83197e, 2131623947);
        if (!isShowing() && this.f83211u) {
            hVar2.f83227c = true;
        } else if (isShowing()) {
            int size = kVar.f83237f.size();
            int i13 = 0;
            while (true) {
                if (i13 >= size) {
                    z11 = false;
                    break;
                }
                MenuItem item2 = kVar.getItem(i13);
                if (item2.isVisible() && item2.getIcon() != null) {
                    z11 = true;
                    break;
                }
                i13++;
            }
            hVar2.f83227c = z11;
        }
        int iJ = s.j(hVar2, context, this.f83195c);
        x1 x1Var = new x1(context, null, this.f83196d, 0);
        x1Var.C = this.f83203k;
        x1Var.f84873p = this;
        x1Var.f84883z.setOnDismissListener(this);
        x1Var.o = this.n;
        x1Var.f84871l = this.f83205m;
        x1Var.p();
        x1Var.o();
        x1Var.j(hVar2);
        x1Var.n(iJ);
        x1Var.f84871l = this.f83205m;
        ArrayList arrayList = this.f83200h;
        if (arrayList.size() > 0) {
            dVar = (d) c1.l(arrayList, 1);
            k kVar2 = dVar.f83192b;
            int size2 = kVar2.f83237f.size();
            int i14 = 0;
            while (true) {
                if (i14 >= size2) {
                    item = null;
                    break;
                }
                item = kVar2.getItem(i14);
                if (item.hasSubMenu() && kVar == item.getSubMenu()) {
                    break;
                } else {
                    i14++;
                }
            }
            if (item == null) {
                i5 = 1;
                childAt = null;
            } else {
                g1 g1Var = dVar.f83191a.f84862c;
                ListAdapter adapter = g1Var.getAdapter();
                if (adapter instanceof HeaderViewListAdapter) {
                    HeaderViewListAdapter headerViewListAdapter = (HeaderViewListAdapter) adapter;
                    headersCount = headerViewListAdapter.getHeadersCount();
                    hVar = (h) headerViewListAdapter.getWrappedAdapter();
                } else {
                    hVar = (h) adapter;
                    headersCount = 0;
                }
                int count = hVar.getCount();
                int i15 = 0;
                i5 = 1;
                while (true) {
                    if (i15 >= count) {
                        i15 = -1;
                        break;
                    } else if (item == hVar.getItem(i15)) {
                        break;
                    } else {
                        i15++;
                    }
                }
                if (i15 != -1 && (firstVisiblePosition = (i15 + headersCount) - g1Var.getFirstVisiblePosition()) >= 0 && firstVisiblePosition < g1Var.getChildCount()) {
                    childAt = g1Var.getChildAt(firstVisiblePosition);
                }
            }
            if (childAt == null) {
                int i16 = Build.VERSION.SDK_INT;
                r.u uVar = x1Var.f84883z;
                if (i16 <= 28) {
                    Method method = x1.D;
                    if (method != null) {
                        try {
                            method.invoke(uVar, Boolean.FALSE);
                        } catch (Exception unused) {
                            Log.i("MenuPopupWindow", "Could not invoke setTouchModal() on PopupWindow. Oh well.");
                        }
                    }
                } else {
                    v1.a(uVar, false);
                }
                u1.a(x1Var.f84883z, null);
                g1 g1Var2 = ((d) arrayList.get(arrayList.size() - 1)).f83191a.f84862c;
                int[] iArr = new int[2];
                g1Var2.getLocationOnScreen(iArr);
                Rect rect = new Rect();
                this.o.getWindowVisibleDisplayFrame(rect);
                if (this.f83206p == i5) {
                    if (g1Var2.getWidth() + iArr[0] + iJ > rect.right) {
                        i12 = 0;
                        i11 = 1;
                    } else {
                        i11 = 1;
                        i12 = 1;
                    }
                } else if (iArr[0] - iJ < 0) {
                }
                boolean z12 = i12 == i11;
                this.f83206p = i12;
                x1Var.o = childAt;
                if ((this.f83205m & 5) != 5) {
                    iJ = z12 ? childAt.getWidth() : 0 - iJ;
                } else if (!z12) {
                    iJ = 0 - childAt.getWidth();
                }
                x1Var.f84865f = iJ;
                x1Var.f84870k = true;
                x1Var.f84869j = true;
                x1Var.f(0);
            } else {
                if (this.f83207q) {
                    x1Var.f84865f = this.f83209s;
                }
                if (this.f83208r) {
                    x1Var.f(this.f83210t);
                }
                Rect rect2 = this.f83291a;
                x1Var.f84881x = rect2 != null ? new Rect(rect2) : null;
            }
            arrayList.add(new d(x1Var, kVar, this.f83206p));
            x1Var.show();
            g1 g1Var3 = x1Var.f84862c;
            g1Var3.setOnKeyListener(this);
            if (dVar == null || !this.f83212v || kVar.f83244m == null) {
                return;
            }
            FrameLayout frameLayout = (FrameLayout) layoutInflaterFrom.inflate(2131623954, (ViewGroup) g1Var3, false);
            TextView textView = (TextView) frameLayout.findViewById(16908310);
            frameLayout.setEnabled(false);
            textView.setText(kVar.f83244m);
            g1Var3.addHeaderView(frameLayout, null, false);
            x1Var.show();
            return;
        }
        i5 = 1;
        dVar = null;
        childAt = null;
        if (childAt == null) {
        }
        arrayList.add(new d(x1Var, kVar, this.f83206p));
        x1Var.show();
        g1 g1Var32 = x1Var.f84862c;
        g1Var32.setOnKeyListener(this);
        if (dVar == null) {
        }
    }

    @Override // q.a0
    public final void show() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        if (isShowing()) {
            return;
        }
        ArrayList arrayList = this.f83199g;
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            s((k) it.next());
        }
        arrayList.clear();
        View view = this.n;
        this.o = view;
        if (view != null) {
            boolean z11 = this.f83214x == null;
            ViewTreeObserver viewTreeObserver = view.getViewTreeObserver();
            this.f83214x = viewTreeObserver;
            if (z11) {
                viewTreeObserver.addOnGlobalLayoutListener(this.f83201i);
            }
            this.o.addOnAttachStateChangeListener(this.f83202j);
        }
    }
}
