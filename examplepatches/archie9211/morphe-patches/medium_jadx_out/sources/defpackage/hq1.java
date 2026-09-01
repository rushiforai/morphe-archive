package defpackage;

import android.os.Handler;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.AdapterView;
import android.widget.ListView;
import j$.util.DesugarCollections;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hq1 implements ViewTreeObserver.OnGlobalLayoutListener, ViewTreeObserver.OnScrollChangedListener, Runnable {
    public final WeakReference a;
    public ArrayList b;
    public final HashSet c;
    public final String d;

    public hq1(View view, Handler handler, HashSet hashSet, String str) {
        hashSet.getClass();
        this.a = new WeakReference(view);
        this.c = hashSet;
        this.d = str;
        handler.postDelayed(this, 200L);
    }

    public final void a(gq1 gq1Var, View view, d34 d34Var) {
        View viewA = gq1Var.a();
        if (viewA == null) {
            return;
        }
        String str = gq1Var.b;
        View.OnClickListener onClickListenerF = gue.f(viewA);
        boolean z = (onClickListenerF instanceof bq1) && ((bq1) onClickListenerF).e;
        HashSet hashSet = this.c;
        if (hashSet.contains(str) || z) {
            return;
        }
        bq1 bq1Var = null;
        if (!ec2.a.contains(dq1.class)) {
            try {
                bq1 bq1Var2 = new bq1();
                bq1Var2.a = d34Var;
                bq1Var2.b = new WeakReference(viewA);
                bq1Var2.c = new WeakReference(view);
                bq1Var2.d = gue.f(viewA);
                bq1Var2.e = true;
                bq1Var = bq1Var2;
            } catch (Throwable th) {
                ec2.a(dq1.class, th);
            }
        }
        viewA.setOnClickListener(bq1Var);
        hashSet.add(str);
    }

    public final void b(gq1 gq1Var, View view, d34 d34Var) {
        AdapterView adapterView = (AdapterView) gq1Var.a();
        if (adapterView == null) {
            return;
        }
        String str = gq1Var.b;
        AdapterView.OnItemClickListener onItemClickListener = adapterView.getOnItemClickListener();
        boolean z = (onItemClickListener instanceof cq1) && ((cq1) onItemClickListener).e;
        HashSet hashSet = this.c;
        if (hashSet.contains(str) || z) {
            return;
        }
        cq1 cq1Var = null;
        if (!ec2.a.contains(dq1.class)) {
            try {
                cq1 cq1Var2 = new cq1();
                cq1Var2.a = d34Var;
                cq1Var2.b = new WeakReference(adapterView);
                cq1Var2.c = new WeakReference(view);
                cq1Var2.d = adapterView.getOnItemClickListener();
                cq1Var2.e = true;
                cq1Var = cq1Var2;
            } catch (Throwable th) {
                ec2.a(dq1.class, th);
            }
        }
        adapterView.setOnItemClickListener(cq1Var);
        hashSet.add(str);
    }

    public final void c() {
        ArrayList arrayList = this.b;
        if (arrayList != null) {
            WeakReference weakReference = this.a;
            if (weakReference.get() != null) {
                int size = arrayList.size();
                for (int i = 0; i < size; i++) {
                    d34 d34Var = (d34) arrayList.get(i);
                    View view = (View) weakReference.get();
                    if (d34Var != null) {
                        String str = d34Var.d;
                        if (view != null) {
                            int length = str.length();
                            String str2 = this.d;
                            if (length == 0 || str.equals(str2)) {
                                List listUnmodifiableList = DesugarCollections.unmodifiableList(d34Var.b);
                                listUnmodifiableList.getClass();
                                if (listUnmodifiableList.size() <= 25) {
                                    for (gq1 gq1Var : vx0.M(view, listUnmodifiableList, 0, -1, str2)) {
                                        try {
                                            View viewA = gq1Var.a();
                                            if (viewA != null) {
                                                View viewA2 = gue.a(viewA);
                                                if (viewA2 != null && gue.a.m(viewA, viewA2)) {
                                                    HashSet hashSet = this.c;
                                                    View viewA3 = gq1Var.a();
                                                    if (viewA3 != null) {
                                                        String str3 = gq1Var.b;
                                                        boolean z = gue.g(viewA3) instanceof fsa;
                                                        if (!hashSet.contains(str3) && !z) {
                                                            fsa fsaVar = null;
                                                            if (!ec2.a.contains(gsa.class)) {
                                                                try {
                                                                    fsaVar = new fsa(d34Var, view, viewA3);
                                                                } catch (Throwable th) {
                                                                    ec2.a(gsa.class, th);
                                                                }
                                                            }
                                                            viewA3.setOnTouchListener(fsaVar);
                                                            hashSet.add(str3);
                                                        }
                                                    }
                                                } else if (!tuc.N(viewA.getClass().getName(), "com.facebook.react", false)) {
                                                    if (!(viewA instanceof AdapterView)) {
                                                        a(gq1Var, view, d34Var);
                                                    } else if (viewA instanceof ListView) {
                                                        b(gq1Var, view, d34Var);
                                                    }
                                                }
                                            }
                                        } catch (Exception unused) {
                                            ec2.a.contains(iq1.class);
                                            f94 f94Var = f94.a;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public final void onGlobalLayout() {
        c();
    }

    @Override // android.view.ViewTreeObserver.OnScrollChangedListener
    public final void onScrollChanged() {
        c();
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            xe4 xe4VarB = af4.b(f94.b());
            if (xe4VarB != null && xe4VarB.g) {
                JSONArray jSONArray = xe4VarB.h;
                ArrayList arrayList = new ArrayList();
                if (jSONArray != null) {
                    try {
                        int length = jSONArray.length();
                        for (int i = 0; i < length; i++) {
                            JSONObject jSONObject = jSONArray.getJSONObject(i);
                            jSONObject.getClass();
                            arrayList.add(gsa.h0(jSONObject));
                        }
                    } catch (IllegalArgumentException | JSONException unused) {
                    }
                }
                this.b = arrayList;
                View view = (View) this.a.get();
                if (view == null) {
                    return;
                }
                ViewTreeObserver viewTreeObserver = view.getViewTreeObserver();
                if (viewTreeObserver.isAlive()) {
                    viewTreeObserver.addOnGlobalLayoutListener(this);
                    viewTreeObserver.addOnScrollChangedListener(this);
                }
                c();
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }
}
