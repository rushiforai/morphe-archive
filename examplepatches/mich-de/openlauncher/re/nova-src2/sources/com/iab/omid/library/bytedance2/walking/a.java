package com.iab.omid.library.bytedance2.walking;

import android.view.View;
import com.iab.omid.library.bytedance2.internal.e;
import com.iab.omid.library.bytedance2.utils.h;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.WeakHashMap;

/* loaded from: classes3.dex */
public class a {

    /* renamed from: a, reason: collision with root package name */
    private final HashMap<View, String> f35118a = new HashMap<>();

    /* renamed from: b, reason: collision with root package name */
    private final HashMap<View, C0124a> f35119b = new HashMap<>();

    /* renamed from: c, reason: collision with root package name */
    private final HashMap<String, View> f35120c = new HashMap<>();

    /* renamed from: d, reason: collision with root package name */
    private final HashSet<View> f35121d = new HashSet<>();

    /* renamed from: e, reason: collision with root package name */
    private final HashSet<String> f35122e = new HashSet<>();

    /* renamed from: f, reason: collision with root package name */
    private final HashSet<String> f35123f = new HashSet<>();

    /* renamed from: g, reason: collision with root package name */
    private final HashMap<String, String> f35124g = new HashMap<>();

    /* renamed from: h, reason: collision with root package name */
    private final Map<View, Boolean> f35125h = new WeakHashMap();

    /* renamed from: i, reason: collision with root package name */
    private boolean f35126i;

    /* renamed from: com.iab.omid.library.bytedance2.walking.a$a, reason: collision with other inner class name */
    public static class C0124a {

        /* renamed from: a, reason: collision with root package name */
        private final e f35127a;

        /* renamed from: b, reason: collision with root package name */
        private final ArrayList<String> f35128b = new ArrayList<>();

        public C0124a(e eVar, String str) {
            this.f35127a = eVar;
            a(str);
        }

        public e a() {
            return this.f35127a;
        }

        public ArrayList<String> b() {
            return this.f35128b;
        }

        public void a(String str) {
            this.f35128b.add(str);
        }
    }

    private Boolean b(View view) {
        if (view.hasWindowFocus()) {
            this.f35125h.remove(view);
            return Boolean.FALSE;
        }
        if (this.f35125h.containsKey(view)) {
            return this.f35125h.get(view);
        }
        Map<View, Boolean> map = this.f35125h;
        Boolean bool = Boolean.FALSE;
        map.put(view, bool);
        return bool;
    }

    public View a(String str) {
        return this.f35120c.get(str);
    }

    public C0124a c(View view) {
        C0124a c0124a = this.f35119b.get(view);
        if (c0124a != null) {
            this.f35119b.remove(view);
        }
        return c0124a;
    }

    public String d(View view) {
        if (this.f35118a.size() == 0) {
            return null;
        }
        String str = this.f35118a.get(view);
        if (str != null) {
            this.f35118a.remove(view);
        }
        return str;
    }

    public c e(View view) {
        return this.f35121d.contains(view) ? c.PARENT_VIEW : this.f35126i ? c.OBSTRUCTION_VIEW : c.UNDERLYING_VIEW;
    }

    public boolean f(View view) {
        if (!this.f35125h.containsKey(view)) {
            return true;
        }
        this.f35125h.put(view, Boolean.TRUE);
        return false;
    }

    private String a(View view) {
        if (!view.isAttachedToWindow()) {
            return "notAttached";
        }
        if (b(view).booleanValue()) {
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
        this.f35121d.addAll(hashSet);
        return null;
    }

    public String b(String str) {
        return this.f35124g.get(str);
    }

    public HashSet<String> c() {
        return this.f35122e;
    }

    public void d() {
        this.f35126i = true;
    }

    public void e() {
        com.iab.omid.library.bytedance2.internal.c cVarC = com.iab.omid.library.bytedance2.internal.c.c();
        if (cVarC != null) {
            for (com.iab.omid.library.bytedance2.adsession.a aVar : cVarC.a()) {
                View viewC = aVar.c();
                if (aVar.f()) {
                    String adSessionId = aVar.getAdSessionId();
                    if (viewC != null) {
                        String strA = a(viewC);
                        if (strA == null) {
                            this.f35122e.add(adSessionId);
                            this.f35118a.put(viewC, adSessionId);
                            a(aVar);
                        } else if (strA != "noWindowFocus") {
                            this.f35123f.add(adSessionId);
                            this.f35120c.put(adSessionId, viewC);
                            this.f35124g.put(adSessionId, strA);
                        }
                    } else {
                        this.f35123f.add(adSessionId);
                        this.f35124g.put(adSessionId, "noAdView");
                    }
                }
            }
        }
    }

    public void a() {
        this.f35118a.clear();
        this.f35119b.clear();
        this.f35120c.clear();
        this.f35121d.clear();
        this.f35122e.clear();
        this.f35123f.clear();
        this.f35124g.clear();
        this.f35126i = false;
    }

    public HashSet<String> b() {
        return this.f35123f;
    }

    private void a(com.iab.omid.library.bytedance2.adsession.a aVar) {
        Iterator<e> it = aVar.d().iterator();
        while (it.hasNext()) {
            a(it.next(), aVar);
        }
    }

    private void a(e eVar, com.iab.omid.library.bytedance2.adsession.a aVar) {
        View view = eVar.c().get();
        if (view == null) {
            return;
        }
        C0124a c0124a = this.f35119b.get(view);
        if (c0124a != null) {
            c0124a.a(aVar.getAdSessionId());
        } else {
            this.f35119b.put(view, new C0124a(eVar, aVar.getAdSessionId()));
        }
    }
}
