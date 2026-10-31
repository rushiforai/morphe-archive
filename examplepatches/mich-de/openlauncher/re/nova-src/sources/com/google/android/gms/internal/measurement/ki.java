package com.google.android.gms.internal.measurement;

import java.util.HashMap;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class ki {

    /* renamed from: e, reason: collision with root package name */
    public static final ii f32744e;

    /* renamed from: f, reason: collision with root package name */
    public static final ji f32745f;

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f32746a;

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f32747b;

    /* renamed from: c, reason: collision with root package name */
    public final ii f32748c;

    /* renamed from: d, reason: collision with root package name */
    public ji f32749d;

    static {
        int i5 = 0;
        f32744e = new ii(i5);
        f32745f = new ji(i5);
    }

    public ki(ki kiVar) {
        HashMap map = new HashMap();
        this.f32746a = map;
        HashMap map2 = new HashMap();
        this.f32747b = map2;
        map.putAll(kiVar.f32746a);
        map2.putAll(kiVar.f32747b);
        this.f32748c = kiVar.f32748c;
        this.f32749d = kiVar.f32749d;
    }

    public void a(th thVar, Object obj, fi fiVar) {
        ii iiVar = (ii) this.f32746a.get(thVar);
        if (iiVar != null) {
            iiVar.a(thVar, obj, fiVar);
        } else {
            this.f32748c.a(thVar, obj, fiVar);
        }
    }

    public void b(th thVar, Iterator it, fi fiVar) {
        ji jiVar = (ji) this.f32747b.get(thVar);
        if (jiVar != null) {
            jiVar.a(thVar, it, fiVar);
            return;
        }
        ji jiVar2 = this.f32749d;
        if (jiVar2 != null && !this.f32746a.containsKey(thVar)) {
            jiVar2.a(thVar, it, fiVar);
        } else {
            while (it.hasNext()) {
                a(thVar, it.next(), fiVar);
            }
        }
    }

    public /* synthetic */ ki() {
        this.f32746a = new HashMap();
        this.f32747b = new HashMap();
        this.f32749d = null;
        this.f32748c = gh.f32579a;
    }
}
