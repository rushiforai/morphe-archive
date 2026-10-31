package qx;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import k0.m1;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import o9.d4;
import t70.i2;
import t70.r1;

/* loaded from: classes.dex */
public final class w0 implements p, m {
    public static final long n = 15000;
    public static final int o = 20;

    /* renamed from: a, reason: collision with root package name */
    public final Context f84634a;

    /* renamed from: b, reason: collision with root package name */
    public final l f84635b;

    /* renamed from: c, reason: collision with root package name */
    public final i1 f84636c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f84637d;

    /* renamed from: e, reason: collision with root package name */
    public final LinkedList f84638e;

    /* renamed from: f, reason: collision with root package name */
    public final Map f84639f;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f84640g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f84641h;

    /* renamed from: i, reason: collision with root package name */
    public WeakReference f84642i;

    /* renamed from: j, reason: collision with root package name */
    public final Handler f84643j;

    /* renamed from: k, reason: collision with root package name */
    public final y70.d f84644k;

    /* renamed from: l, reason: collision with root package name */
    public volatile b00.z0 f84645l;

    /* renamed from: m, reason: collision with root package name */
    public volatile Object f84646m;

    public w0(Context context, l lVar) {
        this.f84634a = context;
        this.f84635b = lVar;
        i1 i1VarB = ox.f.f81065a.b(lVar);
        this.f84636c = i1VarB;
        q qVar = q.f84576a;
        synchronized (q.f84578c) {
            q.f84577b.add(this);
        }
        synchronized (i1VarB.f84521e) {
            i1VarB.f84530p.add(this);
        }
        this.f84637d = new Object();
        this.f84638e = new LinkedList();
        this.f84639f = new LinkedHashMap();
        this.f84640g = new ArrayList();
        this.f84643j = new Handler(Looper.getMainLooper());
        i2 i2VarD = t70.m0.d();
        a80.e eVar = t70.y0.f88884a;
        this.f84644k = t70.k0.a(CoroutineContext.Element.DefaultImpls.d(i2VarD, a80.d.f488c));
    }

    public static final void b(w0 w0Var, r rVar) {
        ArrayList arrayList = new ArrayList();
        synchronized (w0Var.f84637d) {
            try {
                Iterator it = w0Var.f84638e.iterator();
                if (it.hasNext()) {
                    x0 x0Var = (x0) it.next();
                    it.remove();
                    arrayList.add(new Pair(x0Var, rVar));
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (!arrayList.isEmpty()) {
            q qVar = q.f84576a;
            q.b(new k5.d(24, arrayList, w0Var));
        } else {
            synchronized (w0Var.f84637d) {
                w0Var.k(rVar);
            }
            w0Var.h();
        }
    }

    public static /* synthetic */ void m(w0 w0Var, ViewGroup viewGroup, String str, String str2, f fVar, long j11, int i5) {
        if ((i5 & 64) != 0) {
            j11 = 0;
        }
        w0Var.l(viewGroup, str, str2, fVar, null, j11);
    }

    @Override // qx.p
    public final void a() {
        this.f84646m = null;
        synchronized (this.f84637d) {
            this.f84638e.isEmpty();
        }
        i1 i1Var = this.f84636c;
        synchronized (i1Var.f84521e) {
            try {
                i1Var.f84527k.clear();
                i1Var.f84529m.clear();
                Iterator it = i1Var.f84528l.values().iterator();
                while (it.hasNext()) {
                    ((r1) it.next()).c(null);
                }
                i1Var.f84528l.clear();
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        p(null);
    }

    public final void c(View view, ViewGroup viewGroup) {
        ViewParent parent = view.getParent();
        ViewGroup viewGroup2 = parent instanceof ViewGroup ? (ViewGroup) parent : null;
        if (viewGroup2 != null) {
            viewGroup2.removeView(view);
        }
        viewGroup.removeAllViews();
        viewGroup.addView(view);
        Set set = h.f84501a;
        zy.c cVar = zy.c.f98823a;
        if (zy.c.c("ad_dismiss_paywall_enabled")) {
            Context context = viewGroup.getContext();
            m1 m1Var = new m1(context.getResources().getDisplayMetrics().density, 1);
            int iIntValue = ((Number) m1Var.invoke(22)).intValue();
            TextView textView = new TextView(context);
            textView.setText("✕");
            textView.setTextSize(12.0f);
            textView.setTypeface(null, 1);
            textView.setTextColor(-1);
            textView.setGravity(17);
            GradientDrawable gradientDrawable = new GradientDrawable();
            gradientDrawable.setCornerRadius(iIntValue / 2.0f);
            gradientDrawable.setColor(Color.argb(160, 0, 0, 0));
            textView.setBackground(gradientDrawable);
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(iIntValue, iIntValue);
            layoutParams.gravity = 8388659;
            layoutParams.setMarginStart(((Number) m1Var.invoke(6)).intValue());
            layoutParams.topMargin = ((Number) m1Var.invoke(6)).intValue();
            textView.setLayoutParams(layoutParams);
            textView.setOnClickListener(new com.instabridge.ai.chat.ui.v2.e(23, this, context));
            viewGroup.addView(textView);
        }
        viewGroup.setVisibility(0);
    }

    public final void d(x0 x0Var, r rVar) {
        rVar.f84590f = x0Var.f();
        View viewG = rVar.g(x0Var.b().getContext(), x0Var, x0Var.h());
        c(viewG, x0Var.b());
        synchronized (this.f84637d) {
            try {
                j1 j1Var = (j1) this.f84639f.put(x0Var.a(), new j1(viewG, rVar, System.nanoTime()));
                if (j1Var != null && j1Var.b() != rVar) {
                    if (j1Var.b().c() || j1Var.b().f84589e) {
                        j1Var.b().a();
                    } else {
                        this.f84636c.k(j1Var.b());
                    }
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        f fVarD = x0Var.d();
        String strA = x0Var.a();
        if (fVarD != null) {
            if (!(rVar instanceof r)) {
                rVar = null;
            }
            if (rVar != null) {
                rVar.f84591g = new n0.w(fVarD, strA);
            }
        }
        zy.c cVar = zy.c.f98823a;
        zy.c.i("ad_shown_" + this.f84635b.name(), null);
        if (fVarD != null) {
            fVarD.i(strA);
        }
    }

    public final void e() {
        zy.c cVar = zy.c.f98823a;
        int iG = zy.c.g("max_pending_ad_requests", 20);
        if (iG <= 0) {
            iG = 20;
        }
        int iE0 = kotlin.ranges.a.e0(iG, 1, 20);
        int size = this.f84638e.size();
        b70.d.E0(this.f84638e, new pu.e(25));
        while (this.f84638e.size() > iE0) {
            this.f84638e.removeFirst();
        }
        if (size - this.f84638e.size() > 0) {
            zy.c cVar2 = zy.c.f98823a;
            zy.c.i("ad_stale_requests_cleaned_" + this.f84635b.name(), null);
        }
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, java.util.List] */
    public final List f() {
        ?? r02 = this.f84646m;
        if (r02 != 0) {
            return r02;
        }
        List listA = (u0.f84616a[this.f84635b.ordinal()] == 1 && this.f84635b.a() == i.f84512d) ? EmptyList.f71733a : h.a();
        this.f84646m = listA;
        return listA;
    }

    public final r g() {
        Object next;
        Iterator it = this.f84639f.entrySet().iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (((j1) ((Map.Entry) next).getValue()).a()) {
                break;
            }
        }
        Map.Entry entry = (Map.Entry) next;
        if (entry == null) {
            return null;
        }
        this.f84639f.remove(entry.getKey());
        return ((j1) entry.getValue()).b();
    }

    public final void h() {
        b00.z0 z0Var = this.f84645l;
        if (z0Var != null) {
            n0.w wVar = new n0.w(z0Var, 10);
            if (Intrinsics.b(Looper.myLooper(), Looper.getMainLooper())) {
                wVar.invoke();
            } else {
                this.f84643j.post(new d4(wVar, 2));
            }
        }
    }

    public final void i(String str) {
        boolean z11;
        synchronized (this.f84637d) {
            try {
                j1 j1Var = (j1) this.f84639f.remove(str);
                z11 = false;
                if (j1Var != null) {
                    if (j1Var.b().c() || j1Var.b().f84589e) {
                        j1Var.b().a();
                    } else {
                        if (this.f84635b.a() == i.f84512d) {
                            k(j1Var.b());
                        } else {
                            this.f84636c.k(j1Var.b());
                        }
                        z11 = true;
                    }
                    Unit unit = Unit.f71706a;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (z11) {
            zy.c cVar = zy.c.f98823a;
            zy.c.i("ad_not_shown_" + this.f84635b.name(), null);
        }
        j();
        p(null);
    }

    public final boolean j() {
        ArrayList arrayList = new ArrayList();
        synchronized (this.f84637d) {
            try {
                Iterator it = this.f84638e.iterator();
                while (it.hasNext()) {
                    x0 x0Var = (x0) it.next();
                    r rVarO = o();
                    if (rVarO == null && (rVarO = this.f84636c.e(f())) == null) {
                        rVarO = x0Var.g() > 15000 ? g() : null;
                    }
                    if (rVarO == null) {
                        break;
                    }
                    it.remove();
                    arrayList.add(new Pair(x0Var, rVarO));
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (!arrayList.isEmpty()) {
            q qVar = q.f84576a;
            q.b(new b00.c(13, arrayList, this));
        }
        return !arrayList.isEmpty();
    }

    public final void k(r rVar) {
        if (!rVar.c() && !rVar.f84589e && !rVar.e()) {
            ArrayList arrayList = this.f84640g;
            if (arrayList.size() < 8) {
                arrayList.add(rVar);
                return;
            }
        }
        rVar.a();
    }

    public final View l(ViewGroup viewGroup, String str, String str2, f fVar, s0 s0Var, long j11) {
        Activity activity;
        Object next;
        s0 s0Var2;
        ViewGroup viewGroup2;
        String str3;
        f fVar2;
        s0 s0Var3;
        String strE = b.c0.E(str, str2);
        synchronized (this.f84637d) {
            try {
                Iterator it = this.f84638e.iterator();
                while (true) {
                    activity = null;
                    if (!it.hasNext()) {
                        next = null;
                        break;
                    }
                    next = it.next();
                    if (Intrinsics.b(((x0) next).a(), strE)) {
                        break;
                    }
                }
                x0 x0Var = (x0) next;
                if (x0Var != null) {
                    x0Var.i(viewGroup);
                    x0Var.k(fVar);
                    x0Var.j(j11);
                    return x0Var.h();
                }
                e();
                if (this.f84638e.size() >= 20) {
                    zy.c cVar = zy.c.f98823a;
                    zy.c.i("ad_pending_queue_full_" + this.f84635b.name(), null);
                    this.f84638e.removeFirst();
                }
                ui.p pVar = new ui.p(this.f84634a);
                pVar.setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
                LinkedList linkedList = this.f84638e;
                if (s0Var == null) {
                    l lVar = this.f84635b;
                    if (lVar == l.f84548j) {
                        s0Var3 = s0.f84601a;
                    } else {
                        s0Var3 = lVar.b().f84567a;
                        if (s0Var3 == null) {
                            s0Var3 = s0.f84602b;
                        }
                    }
                    s0Var2 = s0Var3;
                    str3 = str;
                    fVar2 = fVar;
                    viewGroup2 = viewGroup;
                } else {
                    s0Var2 = s0Var;
                    viewGroup2 = viewGroup;
                    str3 = str;
                    fVar2 = fVar;
                }
                linkedList.add(new x0(pVar, viewGroup2, str3, strE, s0Var2, fVar2, j11));
                j();
                Context context = viewGroup.getContext();
                while (true) {
                    if (!(context instanceof ContextWrapper)) {
                        break;
                    }
                    if (context instanceof Activity) {
                        activity = (Activity) context;
                        break;
                    }
                    context = ((ContextWrapper) context).getBaseContext();
                }
                p(activity);
                return pVar;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void n(final ViewGroup viewGroup, final String str, String str2, final s0 s0Var, final long j11) {
        final String strE = b.c0.E(str, str2);
        final Ref.ObjectRef objectRef = new Ref.ObjectRef();
        synchronized (this.f84637d) {
            r rVarE = this.f84636c.e(f());
            if (rVarE == null) {
                p(null);
                return;
            }
            objectRef.f71863a = rVarE;
            j1 j1Var = (j1) this.f84639f.remove(strE);
            if (j1Var != null) {
                this.f84636c.k(j1Var.b());
            }
            Unit unit = Unit.f71706a;
            q qVar = q.f84576a;
            q.b(new Function0() { // from class: qx.t0
                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    w0 w0Var = this.f84608a;
                    ViewGroup viewGroup2 = viewGroup;
                    String str3 = str;
                    String str4 = strE;
                    s0 s0Var2 = s0Var;
                    long j12 = j11;
                    Ref.ObjectRef objectRef2 = objectRef;
                    w0Var.getClass();
                    s0 s0Var3 = s0Var2;
                    ui.p pVar = new ui.p(w0Var.f84634a);
                    pVar.setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
                    if (s0Var3 == null) {
                        l lVar = w0Var.f84635b;
                        if (lVar == l.f84548j) {
                            s0Var3 = s0.f84601a;
                        } else {
                            s0Var3 = lVar.b().f84567a;
                            if (s0Var3 == null) {
                                s0Var3 = s0.f84602b;
                            }
                        }
                    }
                    x0 x0Var = new x0(pVar, viewGroup2, str3, str4, s0Var3, null, j12);
                    r rVar = (r) objectRef2.f71863a;
                    rVar.f84590f = str3;
                    View viewG = rVar.g(x0Var.f84648b.getContext(), x0Var, x0Var.f84647a);
                    ((r) objectRef2.f71863a).getClass();
                    w0Var.c(viewG, viewGroup2);
                    synchronized (w0Var.f84637d) {
                        w0Var.f84639f.put(str4, new j1(viewG, (r) objectRef2.f71863a, System.nanoTime()));
                        Unit unit2 = Unit.f71706a;
                    }
                    zy.c cVar = zy.c.f98823a;
                    zy.c.i("ad_shown_" + w0Var.f84635b.name(), null);
                    return Unit.f71706a;
                }
            });
            p(null);
        }
    }

    public final r o() {
        l lVar = this.f84635b;
        if (lVar.a() == i.f84512d) {
            Iterator it = this.f84640g.iterator();
            while (it.hasNext()) {
                r rVar = (r) it.next();
                it.remove();
                if (!rVar.e() && !rVar.f84589e) {
                    return rVar;
                }
                if (rVar.e()) {
                    zy.c cVar = zy.c.f98823a;
                    zy.c.i("ad_expired_" + lVar.name(), null);
                }
                rVar.a();
            }
        }
        return null;
    }

    public final void p(Activity activity) {
        int i5;
        Continuation continuation = null;
        if (this.f84635b.a() != i.f84512d) {
            if (activity != null) {
                this.f84642i = new WeakReference(activity);
            }
            if (activity == null) {
                WeakReference weakReference = this.f84642i;
                activity = weakReference != null ? (Activity) weakReference.get() : null;
                if (activity == null) {
                    ox.f fVar = ox.f.f81065a;
                    WeakReference weakReference2 = ox.f.f81070f;
                    if (weakReference2 == null || (activity = (Activity) weakReference2.get()) == null || activity.isFinishing() || activity.isDestroyed()) {
                        activity = null;
                    }
                }
            }
            this.f84636c.g(this.f84635b, activity);
            return;
        }
        boolean z11 = true;
        if (u0.f84617b[this.f84635b.a().ordinal()] == 1) {
            zy.c cVar = zy.c.f98823a;
            int iG = zy.c.g("icon_ad_batch_size", 4);
            if (t70.k0.f(this.f84644k)) {
                synchronized (this.f84637d) {
                    i5 = 0;
                    if (this.f84641h || this.f84638e.isEmpty()) {
                        z11 = false;
                    } else {
                        this.f84641h = true;
                    }
                }
                if (z11) {
                    t70.m0.t(this.f84644k, null, null, new v0(iG, this, continuation, i5), 3);
                }
            }
        }
    }
}
