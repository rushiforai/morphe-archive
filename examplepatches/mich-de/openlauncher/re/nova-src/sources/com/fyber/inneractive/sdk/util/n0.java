package com.fyber.inneractive.sdk.util;

import android.app.Activity;
import android.content.Context;
import android.graphics.Rect;
import android.util.Pair;
import android.view.View;
import android.view.ViewTreeObserver;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.WeakHashMap;

/* loaded from: classes3.dex */
public final class n0 {

    /* renamed from: b, reason: collision with root package name */
    public final WeakHashMap f31207b = new WeakHashMap();

    /* renamed from: a, reason: collision with root package name */
    public final WeakHashMap f31206a = new WeakHashMap();

    /* renamed from: c, reason: collision with root package name */
    public final j f31208c = new j(16, new i0());

    /* renamed from: d, reason: collision with root package name */
    public final j f31209d = new j(16, new j0());

    /* JADX WARN: Removed duplicated region for block: B:11:0x003a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(Context context, View view, m0 m0Var) {
        IAlog.a("%strackView called with context: %s view: %s", "IAVisibilityTracker: ", context, view);
        if (context == null) {
            throw new IllegalStateException("View must be attached to an Activity context");
        }
        Context applicationContext = context.getApplicationContext();
        WeakHashMap weakHashMap = (WeakHashMap) this.f31207b.get(applicationContext);
        if (weakHashMap == null) {
            weakHashMap = new WeakHashMap();
            this.f31207b.put(applicationContext, weakHashMap);
            if (context instanceof Activity) {
                Activity activity = (Activity) context;
                View decorView = activity.getWindow() != null ? activity.getWindow().getDecorView() : view.getRootView();
                ViewTreeObserver viewTreeObserver = decorView.getViewTreeObserver();
                if (viewTreeObserver != null && viewTreeObserver.isAlive()) {
                    k0 k0Var = new k0(this, applicationContext);
                    viewTreeObserver.addOnPreDrawListener(k0Var);
                    this.f31206a.put(applicationContext, new Pair(viewTreeObserver, k0Var));
                }
            }
        }
        weakHashMap.put(view, m0Var);
        b();
    }

    public final void b(Context context) {
        WeakHashMap weakHashMap;
        if (context == null || (weakHashMap = (WeakHashMap) this.f31207b.get(context)) == null) {
            return;
        }
        j jVar = this.f31209d;
        Object objPoll = jVar.f31196a.poll();
        if (objPoll == null) {
            objPoll = jVar.f31197b.a();
        }
        HashSet hashSet = (HashSet) objPoll;
        hashSet.addAll(weakHashMap.keySet());
        Iterator it = hashSet.iterator();
        while (it.hasNext()) {
            View view = (View) it.next();
            m0 m0Var = (m0) weakHashMap.get(view);
            if (m0Var != null) {
                j jVar2 = this.f31208c;
                Object objPoll2 = jVar2.f31196a.poll();
                if (objPoll2 == null) {
                    objPoll2 = jVar2.f31197b.a();
                }
                Rect rect = (Rect) objPoll2;
                m0Var.a((view == null || view.getParent() == null || !view.isShown() || !view.getGlobalVisibleRect(rect)) ? 0.0f : (rect.width() * rect.height()) / (view.getWidth() * view.getHeight()), rect);
                this.f31208c.f31196a.offer(rect);
            }
        }
        hashSet.clear();
        this.f31209d.f31196a.offer(hashSet);
    }

    public final void a(View view) {
        IAlog.a("%sunTrackView called with view", "IAVisibilityTracker: ");
        if (view == null) {
            IAlog.a("%sunTrackView called with a null view!", "IAVisibilityTracker: ");
            return;
        }
        Context context = view.getContext();
        if (context == null) {
            IAlog.a("%sview.getContext() returned null!", "IAVisibilityTracker: ");
            return;
        }
        Map map = (Map) this.f31207b.get(context);
        if (map != null) {
            if (map.remove(view) != null) {
                if (IAlog.f31163a <= 2) {
                    IAlog.e("removeViewFromContext found view for removal!", new Object[0]);
                }
                if (map.isEmpty()) {
                    this.f31207b.remove(context);
                    a(context);
                }
            }
        } else {
            Iterator it = new HashSet(this.f31207b.keySet()).iterator();
            while (it.hasNext()) {
                Context context2 = (Context) it.next();
                WeakHashMap weakHashMap = (WeakHashMap) this.f31207b.get(context2);
                if (weakHashMap != null && weakHashMap.remove(view) != null) {
                    if (IAlog.f31163a <= 2) {
                        IAlog.e("removeViewFromContext found view for removal!", new Object[0]);
                    }
                    if (weakHashMap.isEmpty()) {
                        this.f31207b.remove(context2);
                        a(context2);
                    }
                }
            }
        }
        b();
    }

    public final void b() {
        for (Context context : this.f31207b.keySet()) {
            IAlog.a("%stracking context: %s", "IAVisibilityTracker: ", context);
            WeakHashMap weakHashMap = (WeakHashMap) this.f31207b.get(context);
            if (weakHashMap != null) {
                Iterator it = weakHashMap.keySet().iterator();
                while (it.hasNext()) {
                    IAlog.a("%stracking view: %s", "IAVisibilityTracker: ", (View) it.next());
                }
            }
        }
    }

    public final void a() {
        this.f31207b.clear();
        Iterator it = this.f31206a.keySet().iterator();
        while (it.hasNext()) {
            Pair pair = (Pair) this.f31206a.get((Context) it.next());
            if (pair != null && ((ViewTreeObserver) pair.first).isAlive()) {
                ((ViewTreeObserver) pair.first).removeOnPreDrawListener((ViewTreeObserver.OnPreDrawListener) pair.second);
            }
        }
        this.f31206a.clear();
    }

    public final void a(Context context) {
        Pair pair = (Pair) this.f31206a.get(context);
        if (pair != null) {
            if (((ViewTreeObserver) pair.first).isAlive()) {
                ((ViewTreeObserver) pair.first).removeOnPreDrawListener((ViewTreeObserver.OnPreDrawListener) pair.second);
            }
            this.f31206a.remove(context);
        }
    }
}
