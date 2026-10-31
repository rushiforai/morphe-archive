package com.iab.omid.library.bytedance2.walking;

import android.os.Handler;
import android.os.Looper;
import android.view.View;
import com.iab.omid.library.bytedance2.processor.a;
import com.iab.omid.library.bytedance2.utils.f;
import com.iab.omid.library.bytedance2.utils.h;
import com.iab.omid.library.bytedance2.walking.a;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public class TreeWalker implements a.InterfaceC0122a {

    /* renamed from: i, reason: collision with root package name */
    private static TreeWalker f35104i = new TreeWalker();

    /* renamed from: j, reason: collision with root package name */
    private static Handler f35105j = new Handler(Looper.getMainLooper());

    /* renamed from: k, reason: collision with root package name */
    private static Handler f35106k = null;

    /* renamed from: l, reason: collision with root package name */
    private static final Runnable f35107l = new b();

    /* renamed from: m, reason: collision with root package name */
    private static final Runnable f35108m = new c();

    /* renamed from: b, reason: collision with root package name */
    private int f35110b;

    /* renamed from: h, reason: collision with root package name */
    private long f35116h;

    /* renamed from: a, reason: collision with root package name */
    private List<TreeWalkerTimeLogger> f35109a = new ArrayList();

    /* renamed from: c, reason: collision with root package name */
    private boolean f35111c = false;

    /* renamed from: d, reason: collision with root package name */
    private final List<com.iab.omid.library.bytedance2.weakreference.a> f35112d = new ArrayList();

    /* renamed from: f, reason: collision with root package name */
    private com.iab.omid.library.bytedance2.walking.a f35114f = new com.iab.omid.library.bytedance2.walking.a();

    /* renamed from: e, reason: collision with root package name */
    private com.iab.omid.library.bytedance2.processor.b f35113e = new com.iab.omid.library.bytedance2.processor.b();

    /* renamed from: g, reason: collision with root package name */
    private com.iab.omid.library.bytedance2.walking.b f35115g = new com.iab.omid.library.bytedance2.walking.b(new com.iab.omid.library.bytedance2.walking.async.c());

    public interface TreeWalkerNanoTimeLogger extends TreeWalkerTimeLogger {
        void onTreeProcessedNano(int i5, long j11);
    }

    public interface TreeWalkerTimeLogger {
        void onTreeProcessed(int i5, long j11);
    }

    public class a implements Runnable {
        public a() {
        }

        @Override // java.lang.Runnable
        public void run() {
            TreeWalker.this.f35115g.b();
        }
    }

    public class b implements Runnable {
        @Override // java.lang.Runnable
        public void run() throws JSONException {
            TreeWalker.getInstance().l();
        }
    }

    public class c implements Runnable {
        @Override // java.lang.Runnable
        public void run() {
            if (TreeWalker.f35106k != null) {
                TreeWalker.f35106k.post(TreeWalker.f35107l);
                TreeWalker.f35106k.postDelayed(TreeWalker.f35108m, 200L);
            }
        }
    }

    private void d() {
        a(f.b() - this.f35116h);
    }

    private void e() {
        this.f35110b = 0;
        this.f35112d.clear();
        this.f35111c = false;
        Iterator<com.iab.omid.library.bytedance2.adsession.a> it = com.iab.omid.library.bytedance2.internal.c.c().a().iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            } else if (it.next().e()) {
                this.f35111c = true;
                break;
            }
        }
        this.f35116h = f.b();
    }

    public static TreeWalker getInstance() {
        return f35104i;
    }

    private void i() {
        if (f35106k == null) {
            Handler handler = new Handler(Looper.getMainLooper());
            f35106k = handler;
            handler.post(f35107l);
            f35106k.postDelayed(f35108m, 200L);
        }
    }

    private void k() {
        Handler handler = f35106k;
        if (handler != null) {
            handler.removeCallbacks(f35108m);
            f35106k = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void l() throws JSONException {
        e();
        f();
        d();
    }

    public void addTimeLogger(TreeWalkerTimeLogger treeWalkerTimeLogger) {
        if (this.f35109a.contains(treeWalkerTimeLogger)) {
            return;
        }
        this.f35109a.add(treeWalkerTimeLogger);
    }

    public void f() throws JSONException {
        TreeWalker treeWalker;
        this.f35114f.e();
        long jB = f.b();
        com.iab.omid.library.bytedance2.processor.a aVarA = this.f35113e.a();
        if (this.f35114f.b().size() > 0) {
            Iterator<String> it = this.f35114f.b().iterator();
            while (it.hasNext()) {
                String next = it.next();
                JSONObject jSONObjectA = aVarA.a(null);
                a(next, this.f35114f.a(next), jSONObjectA);
                com.iab.omid.library.bytedance2.utils.c.b(jSONObjectA);
                HashSet<String> hashSet = new HashSet<>();
                hashSet.add(next);
                this.f35115g.a(jSONObjectA, hashSet, jB);
            }
        }
        if (this.f35114f.c().size() > 0) {
            JSONObject jSONObjectA2 = aVarA.a(null);
            treeWalker = this;
            treeWalker.a(null, aVarA, jSONObjectA2, com.iab.omid.library.bytedance2.walking.c.PARENT_VIEW, false);
            com.iab.omid.library.bytedance2.utils.c.b(jSONObjectA2);
            treeWalker.f35115g.b(jSONObjectA2, treeWalker.f35114f.c(), jB);
            if (treeWalker.f35111c) {
                Iterator<com.iab.omid.library.bytedance2.adsession.a> it2 = com.iab.omid.library.bytedance2.internal.c.c().a().iterator();
                while (it2.hasNext()) {
                    it2.next().a(treeWalker.f35112d);
                }
            }
        } else {
            treeWalker = this;
            treeWalker.f35115g.b();
        }
        treeWalker.f35114f.a();
    }

    public void g() {
        k();
    }

    public void h() {
        i();
    }

    public void j() {
        g();
        this.f35109a.clear();
        f35105j.post(new a());
    }

    public void removeTimeLogger(TreeWalkerTimeLogger treeWalkerTimeLogger) {
        if (this.f35109a.contains(treeWalkerTimeLogger)) {
            this.f35109a.remove(treeWalkerTimeLogger);
        }
    }

    private void a(long j11) {
        if (this.f35109a.size() > 0) {
            for (TreeWalkerTimeLogger treeWalkerTimeLogger : this.f35109a) {
                treeWalkerTimeLogger.onTreeProcessed(this.f35110b, TimeUnit.NANOSECONDS.toMillis(j11));
                if (treeWalkerTimeLogger instanceof TreeWalkerNanoTimeLogger) {
                    ((TreeWalkerNanoTimeLogger) treeWalkerTimeLogger).onTreeProcessedNano(this.f35110b, j11);
                }
            }
        }
    }

    private boolean b(View view, JSONObject jSONObject) throws JSONException {
        String strD = this.f35114f.d(view);
        if (strD == null) {
            return false;
        }
        com.iab.omid.library.bytedance2.utils.c.a(jSONObject, strD);
        com.iab.omid.library.bytedance2.utils.c.a(jSONObject, Boolean.valueOf(this.f35114f.f(view)));
        this.f35114f.d();
        return true;
    }

    private void a(View view, com.iab.omid.library.bytedance2.processor.a aVar, JSONObject jSONObject, com.iab.omid.library.bytedance2.walking.c cVar, boolean z11) {
        aVar.a(view, jSONObject, this, cVar == com.iab.omid.library.bytedance2.walking.c.PARENT_VIEW, z11);
    }

    @Override // com.iab.omid.library.bytedance2.processor.a.InterfaceC0122a
    public void a(View view, com.iab.omid.library.bytedance2.processor.a aVar, JSONObject jSONObject, boolean z11) throws JSONException {
        com.iab.omid.library.bytedance2.walking.c cVarE;
        TreeWalker treeWalker;
        if (h.d(view) && (cVarE = this.f35114f.e(view)) != com.iab.omid.library.bytedance2.walking.c.UNDERLYING_VIEW) {
            JSONObject jSONObjectA = aVar.a(view);
            com.iab.omid.library.bytedance2.utils.c.a(jSONObject, jSONObjectA);
            if (b(view, jSONObjectA)) {
                treeWalker = this;
            } else {
                boolean z12 = z11 || a(view, jSONObjectA);
                if (this.f35111c && cVarE == com.iab.omid.library.bytedance2.walking.c.OBSTRUCTION_VIEW && !z12) {
                    this.f35112d.add(new com.iab.omid.library.bytedance2.weakreference.a(view));
                }
                treeWalker = this;
                treeWalker.a(view, aVar, jSONObjectA, cVarE, z12);
            }
            treeWalker.f35110b++;
        }
    }

    private void a(String str, View view, JSONObject jSONObject) throws JSONException {
        com.iab.omid.library.bytedance2.processor.a aVarB = this.f35113e.b();
        String strB = this.f35114f.b(str);
        if (strB != null) {
            JSONObject jSONObjectA = aVarB.a(view);
            com.iab.omid.library.bytedance2.utils.c.a(jSONObjectA, str);
            com.iab.omid.library.bytedance2.utils.c.b(jSONObjectA, strB);
            com.iab.omid.library.bytedance2.utils.c.a(jSONObject, jSONObjectA);
        }
    }

    private boolean a(View view, JSONObject jSONObject) throws JSONException {
        a.C0124a c0124aC = this.f35114f.c(view);
        if (c0124aC == null) {
            return false;
        }
        com.iab.omid.library.bytedance2.utils.c.a(jSONObject, c0124aC);
        return true;
    }
}
