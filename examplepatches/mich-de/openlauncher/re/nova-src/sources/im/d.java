package im;

import gm.g;
import java.util.Date;
import java.util.HashMap;

/* loaded from: classes.dex */
public final class d implements hm.b {

    /* renamed from: f, reason: collision with root package name */
    public static final b f61642f;

    /* renamed from: g, reason: collision with root package name */
    public static final b f61643g;

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f61645a;

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f61646b;

    /* renamed from: c, reason: collision with root package name */
    public final a f61647c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f61648d;

    /* renamed from: e, reason: collision with root package name */
    public static final a f61641e = new a();

    /* renamed from: h, reason: collision with root package name */
    public static final c f61644h = new c();

    /* JADX WARN: Type inference failed for: r0v1, types: [im.b] */
    /* JADX WARN: Type inference failed for: r0v2, types: [im.b] */
    static {
        final int i5 = 0;
        f61642f = new gm.f() { // from class: im.b
            @Override // gm.b
            public final void encode(Object obj, Object obj2) {
                switch (i5) {
                    case 0:
                        ((g) obj2).a((String) obj);
                        break;
                    default:
                        ((g) obj2).g(((Boolean) obj).booleanValue());
                        break;
                }
            }
        };
        final int i11 = 1;
        f61643g = new gm.f() { // from class: im.b
            @Override // gm.b
            public final void encode(Object obj, Object obj2) {
                switch (i11) {
                    case 0:
                        ((g) obj2).a((String) obj);
                        break;
                    default:
                        ((g) obj2).g(((Boolean) obj).booleanValue());
                        break;
                }
            }
        };
    }

    public d() {
        HashMap map = new HashMap();
        this.f61645a = map;
        HashMap map2 = new HashMap();
        this.f61646b = map2;
        this.f61647c = f61641e;
        this.f61648d = false;
        map2.put(String.class, f61642f);
        map.remove(String.class);
        map2.put(Boolean.class, f61643g);
        map.remove(Boolean.class);
        map2.put(Date.class, f61644h);
        map.remove(Date.class);
    }

    @Override // hm.b
    public final hm.b a(Class cls, gm.d dVar) {
        this.f61645a.put(cls, dVar);
        this.f61646b.remove(cls);
        return this;
    }
}
