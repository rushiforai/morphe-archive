package com.iab.omid.library.vungle.walking;

import android.os.Handler;
import android.os.Looper;
import android.view.View;
import com.iab.omid.library.vungle.internal.k;
import com.iab.omid.library.vungle.processor.a;
import com.iab.omid.library.vungle.utils.f;
import com.iab.omid.library.vungle.utils.h;
import com.iab.omid.library.vungle.walking.a;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public class TreeWalker implements a.InterfaceC0128a {

    /* renamed from: i, reason: collision with root package name */
    private static TreeWalker f35268i = new TreeWalker();

    /* renamed from: j, reason: collision with root package name */
    private static Handler f35269j = new Handler(Looper.getMainLooper());

    /* renamed from: k, reason: collision with root package name */
    private static Handler f35270k = null;

    /* renamed from: l, reason: collision with root package name */
    private static final Runnable f35271l = new b();

    /* renamed from: m, reason: collision with root package name */
    private static final Runnable f35272m = new c();

    /* renamed from: b, reason: collision with root package name */
    private int f35274b;

    /* renamed from: h, reason: collision with root package name */
    private long f35280h;

    /* renamed from: a, reason: collision with root package name */
    private List<TreeWalkerTimeLogger> f35273a = new ArrayList();

    /* renamed from: c, reason: collision with root package name */
    private boolean f35275c = false;

    /* renamed from: d, reason: collision with root package name */
    private final List<com.iab.omid.library.vungle.weakreference.a> f35276d = new ArrayList();

    /* renamed from: f, reason: collision with root package name */
    private com.iab.omid.library.vungle.walking.a f35278f = new com.iab.omid.library.vungle.walking.a();

    /* renamed from: e, reason: collision with root package name */
    private com.iab.omid.library.vungle.processor.b f35277e = new com.iab.omid.library.vungle.processor.b();

    /* renamed from: g, reason: collision with root package name */
    private com.iab.omid.library.vungle.walking.b f35279g = new com.iab.omid.library.vungle.walking.b(new com.iab.omid.library.vungle.walking.async.c());

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
            TreeWalker.this.f35279g.b();
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
            if (TreeWalker.f35270k != null) {
                TreeWalker.f35270k.post(TreeWalker.f35271l);
                TreeWalker.f35270k.postDelayed(TreeWalker.f35272m, 200L);
            }
        }
    }

    private void d() {
        a(f.b() - this.f35280h);
    }

    private void e() {
        this.f35274b = 0;
        this.f35276d.clear();
        this.f35275c = false;
        Iterator<com.iab.omid.library.vungle.adsession.a> it = com.iab.omid.library.vungle.internal.c.c().a().iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            } else if (it.next().g()) {
                this.f35275c = true;
                break;
            }
        }
        this.f35280h = f.b();
    }

    public static TreeWalker getInstance() {
        return f35268i;
    }

    private void i() {
        if (f35270k == null) {
            Handler handler = new Handler(Looper.getMainLooper());
            f35270k = handler;
            handler.post(f35271l);
            f35270k.postDelayed(f35272m, 200L);
        }
    }

    private void k() {
        Handler handler = f35270k;
        if (handler != null) {
            handler.removeCallbacks(f35272m);
            f35270k = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void l() throws JSONException {
        e();
        f();
        d();
        k.b().a();
    }

    public void addTimeLogger(TreeWalkerTimeLogger treeWalkerTimeLogger) {
        if (this.f35273a.contains(treeWalkerTimeLogger)) {
            return;
        }
        this.f35273a.add(treeWalkerTimeLogger);
    }

    public void f() throws JSONException {
        TreeWalker treeWalker;
        this.f35278f.e();
        long jB = f.b();
        com.iab.omid.library.vungle.processor.a aVarA = this.f35277e.a();
        if (this.f35278f.b().size() > 0) {
            Iterator<String> it = this.f35278f.b().iterator();
            while (it.hasNext()) {
                String next = it.next();
                JSONObject jSONObjectA = aVarA.a(null);
                a(next, this.f35278f.a(next), jSONObjectA);
                com.iab.omid.library.vungle.utils.c.c(jSONObjectA);
                HashSet<String> hashSet = new HashSet<>();
                hashSet.add(next);
                this.f35279g.a(jSONObjectA, hashSet, jB);
            }
        }
        if (this.f35278f.c().size() > 0) {
            JSONObject jSONObjectA2 = aVarA.a(null);
            treeWalker = this;
            treeWalker.a(null, aVarA, jSONObjectA2, com.iab.omid.library.vungle.walking.c.PARENT_VIEW, false);
            com.iab.omid.library.vungle.utils.c.c(jSONObjectA2);
            treeWalker.f35279g.b(jSONObjectA2, treeWalker.f35278f.c(), jB);
            if (treeWalker.f35275c) {
                Iterator<com.iab.omid.library.vungle.adsession.a> it2 = com.iab.omid.library.vungle.internal.c.c().a().iterator();
                while (it2.hasNext()) {
                    it2.next().a(treeWalker.f35276d);
                }
            }
        } else {
            treeWalker = this;
            treeWalker.f35279g.b();
        }
        treeWalker.f35278f.a();
    }

    public void g() {
        k();
    }

    public void h() {
        i();
    }

    public void j() {
        g();
        this.f35273a.clear();
        f35269j.post(new a());
    }

    public void removeTimeLogger(TreeWalkerTimeLogger treeWalkerTimeLogger) {
        if (this.f35273a.contains(treeWalkerTimeLogger)) {
            this.f35273a.remove(treeWalkerTimeLogger);
        }
    }

    private void a(long j11) {
        if (this.f35273a.size() > 0) {
            for (TreeWalkerTimeLogger treeWalkerTimeLogger : this.f35273a) {
                treeWalkerTimeLogger.onTreeProcessed(this.f35274b, TimeUnit.NANOSECONDS.toMillis(j11));
                if (treeWalkerTimeLogger instanceof TreeWalkerNanoTimeLogger) {
                    ((TreeWalkerNanoTimeLogger) treeWalkerTimeLogger).onTreeProcessedNano(this.f35274b, j11);
                }
            }
        }
    }

    private boolean b(View view, JSONObject jSONObject) throws JSONException {
        String strC = this.f35278f.c(view);
        if (strC == null) {
            return false;
        }
        com.iab.omid.library.vungle.utils.c.a(jSONObject, strC);
        com.iab.omid.library.vungle.utils.c.a(jSONObject, Boolean.valueOf(this.f35278f.e(view)));
        com.iab.omid.library.vungle.utils.c.b(jSONObject, Boolean.valueOf(this.f35278f.c(strC)));
        this.f35278f.d();
        return true;
    }

    private void a(View view, com.iab.omid.library.vungle.processor.a aVar, JSONObject jSONObject, com.iab.omid.library.vungle.walking.c cVar, boolean z11) {
        aVar.a(view, jSONObject, this, cVar == com.iab.omid.library.vungle.walking.c.PARENT_VIEW, z11);
    }

    @Override // com.iab.omid.library.vungle.processor.a.InterfaceC0128a
    public void a(View view, com.iab.omid.library.vungle.processor.a aVar, JSONObject jSONObject, boolean z11) throws JSONException {
        com.iab.omid.library.vungle.walking.c cVarD;
        TreeWalker treeWalker;
        if (h.f(view) && (cVarD = this.f35278f.d(view)) != com.iab.omid.library.vungle.walking.c.UNDERLYING_VIEW) {
            JSONObject jSONObjectA = aVar.a(view);
            com.iab.omid.library.vungle.utils.c.a(jSONObject, jSONObjectA);
            if (b(view, jSONObjectA)) {
                treeWalker = this;
            } else {
                boolean z12 = z11 || a(view, jSONObjectA);
                if (this.f35275c && cVarD == com.iab.omid.library.vungle.walking.c.OBSTRUCTION_VIEW && !z12) {
                    this.f35276d.add(new com.iab.omid.library.vungle.weakreference.a(view));
                }
                treeWalker = this;
                treeWalker.a(view, aVar, jSONObjectA, cVarD, z12);
            }
            treeWalker.f35274b++;
        }
    }

    private void a(String str, View view, JSONObject jSONObject) throws JSONException {
        com.iab.omid.library.vungle.processor.a aVarB = this.f35277e.b();
        String strB = this.f35278f.b(str);
        if (strB != null) {
            JSONObject jSONObjectA = aVarB.a(view);
            com.iab.omid.library.vungle.utils.c.a(jSONObjectA, str);
            com.iab.omid.library.vungle.utils.c.b(jSONObjectA, strB);
            com.iab.omid.library.vungle.utils.c.a(jSONObject, jSONObjectA);
        }
    }

    private boolean a(View view, JSONObject jSONObject) throws JSONException {
        a.C0130a c0130aB = this.f35278f.b(view);
        if (c0130aB == null) {
            return false;
        }
        com.iab.omid.library.vungle.utils.c.a(jSONObject, c0130aB);
        return true;
    }
}
