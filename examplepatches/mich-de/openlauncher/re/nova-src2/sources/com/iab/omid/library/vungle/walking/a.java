package com.iab.omid.library.vungle.walking;

import android.view.View;
import com.iab.omid.library.vungle.internal.e;
import com.iab.omid.library.vungle.utils.h;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.WeakHashMap;

/* loaded from: classes3.dex */
public class a {

    /* renamed from: a, reason: collision with root package name */
    private final HashMap<View, String> f35282a = new HashMap<>();

    /* renamed from: b, reason: collision with root package name */
    private final HashMap<View, C0130a> f35283b = new HashMap<>();

    /* renamed from: c, reason: collision with root package name */
    private final HashMap<String, View> f35284c = new HashMap<>();

    /* renamed from: d, reason: collision with root package name */
    private final HashSet<View> f35285d = new HashSet<>();

    /* renamed from: e, reason: collision with root package name */
    private final HashSet<String> f35286e = new HashSet<>();

    /* renamed from: f, reason: collision with root package name */
    private final HashSet<String> f35287f = new HashSet<>();

    /* renamed from: g, reason: collision with root package name */
    private final HashMap<String, String> f35288g = new HashMap<>();

    /* renamed from: h, reason: collision with root package name */
    private final HashSet<String> f35289h = new HashSet<>();

    /* renamed from: i, reason: collision with root package name */
    private final Map<View, Boolean> f35290i = new WeakHashMap();

    /* renamed from: j, reason: collision with root package name */
    private boolean f35291j;

    /* renamed from: com.iab.omid.library.vungle.walking.a$a, reason: collision with other inner class name */
    public static class C0130a {

        /* renamed from: a, reason: collision with root package name */
        private final e f35292a;

        /* renamed from: b, reason: collision with root package name */
        private final ArrayList<String> f35293b = new ArrayList<>();

        public C0130a(e eVar, String str) {
            this.f35292a = eVar;
            a(str);
        }

        public e a() {
            return this.f35292a;
        }

        public ArrayList<String> b() {
            return this.f35293b;
        }

        public void a(String str) {
            this.f35293b.add(str);
        }
    }

    public View a(String str) {
        return this.f35284c.get(str);
    }

    public C0130a b(View view) {
        C0130a c0130a = this.f35283b.get(view);
        if (c0130a != null) {
            this.f35283b.remove(view);
        }
        return c0130a;
    }

    public String c(View view) {
        if (this.f35282a.size() == 0) {
            return null;
        }
        String str = this.f35282a.get(view);
        if (str != null) {
            this.f35282a.remove(view);
        }
        return str;
    }

    public c d(View view) {
        return this.f35285d.contains(view) ? c.PARENT_VIEW : this.f35291j ? c.OBSTRUCTION_VIEW : c.UNDERLYING_VIEW;
    }

    public void e() {
        com.iab.omid.library.vungle.internal.c cVarC = com.iab.omid.library.vungle.internal.c.c();
        if (cVarC != null) {
            for (com.iab.omid.library.vungle.adsession.a aVar : cVarC.a()) {
                View viewE = aVar.e();
                if (aVar.h()) {
                    String strC = aVar.c();
                    if (viewE != null) {
                        boolean zE = h.e(viewE);
                        if (zE) {
                            this.f35289h.add(strC);
                        }
                        String strA = a(viewE, zE);
                        if (strA == null) {
                            this.f35286e.add(strC);
                            this.f35282a.put(viewE, strC);
                            a(aVar);
                        } else if (strA != "noWindowFocus") {
                            this.f35287f.add(strC);
                            this.f35284c.put(strC, viewE);
                            this.f35288g.put(strC, strA);
                        }
                    } else {
                        this.f35287f.add(strC);
                        this.f35288g.put(strC, "noAdView");
                    }
                }
            }
        }
    }

    private Boolean a(View view) {
        if (view.hasWindowFocus()) {
            this.f35290i.remove(view);
            return Boolean.FALSE;
        }
        if (this.f35290i.containsKey(view)) {
            return this.f35290i.get(view);
        }
        Map<View, Boolean> map = this.f35290i;
        Boolean bool = Boolean.FALSE;
        map.put(view, bool);
        return bool;
    }

    public String b(String str) {
        return this.f35288g.get(str);
    }

    public HashSet<String> c() {
        return this.f35286e;
    }

    public void d() {
        this.f35291j = true;
    }

    public boolean e(View view) {
        if (!this.f35290i.containsKey(view)) {
            return true;
        }
        this.f35290i.put(view, Boolean.TRUE);
        return false;
    }

    private String a(View view, boolean z11) {
        if (!view.isAttachedToWindow()) {
            return "notAttached";
        }
        if (a(view).booleanValue() && !z11) {
            return "noWindowFocus";
        }
        HashSet hashSet = new HashSet();
        while (view != null) {
            String strA = h.a(view);
            if (strA != null) {
                return strA;
            }
            hashSet.add(view);
            Object parent = view.getParent();
            view = parent instanceof View ? (View) parent : null;
        }
        this.f35285d.addAll(hashSet);
        return null;
    }

    public HashSet<String> b() {
        return this.f35287f;
    }

    public boolean c(String str) {
        return this.f35289h.contains(str);
    }

    public void a() {
        this.f35282a.clear();
        this.f35283b.clear();
        this.f35284c.clear();
        this.f35285d.clear();
        this.f35286e.clear();
        this.f35287f.clear();
        this.f35288g.clear();
        this.f35291j = false;
        this.f35289h.clear();
    }

    private void a(com.iab.omid.library.vungle.adsession.a aVar) {
        Iterator<e> it = aVar.f().iterator();
        while (it.hasNext()) {
            a(it.next(), aVar);
        }
    }

    private void a(e eVar, com.iab.omid.library.vungle.adsession.a aVar) {
        View view = eVar.c().get();
        if (view == null) {
            return;
        }
        C0130a c0130a = this.f35283b.get(view);
        if (c0130a != null) {
            c0130a.a(aVar.c());
        } else {
            this.f35283b.put(view, new C0130a(eVar, aVar.c()));
        }
    }
}
