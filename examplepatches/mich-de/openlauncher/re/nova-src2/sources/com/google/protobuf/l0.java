package com.google.protobuf;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
public final class l0 extends v {

    /* renamed from: a, reason: collision with root package name */
    public final o1 f34887a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f34888b;

    /* renamed from: c, reason: collision with root package name */
    public final o1 f34889c;

    /* renamed from: d, reason: collision with root package name */
    public final k0 f34890d;

    public l0(o1 o1Var, Object obj, o1 o1Var2, k0 k0Var) {
        if (o1Var == null) {
            throw new IllegalArgumentException("Null containingTypeDefaultInstance");
        }
        if (k0Var.f34881c == t2.f34975e && o1Var2 == null) {
            throw new IllegalArgumentException("Null messageDefaultInstance");
        }
        this.f34887a = o1Var;
        this.f34888b = obj;
        this.f34889c = o1Var2;
        this.f34890d = k0Var;
    }

    public final Object a(Object obj) {
        k0 k0Var = this.f34890d;
        if (!k0Var.f34882d) {
            return g(obj);
        }
        if (k0Var.f34881c.f34978a != u2.ENUM) {
            return obj;
        }
        ArrayList arrayList = new ArrayList();
        Iterator it = ((List) obj).iterator();
        while (it.hasNext()) {
            arrayList.add(g(it.next()));
        }
        return arrayList;
    }

    public final o1 b() {
        return this.f34887a;
    }

    public final t2 c() {
        return this.f34890d.f34881c;
    }

    public final o1 d() {
        return this.f34889c;
    }

    public final int e() {
        return this.f34890d.f34880b;
    }

    public final boolean f() {
        return this.f34890d.f34882d;
    }

    public final Object g(Object obj) {
        k0 k0Var = this.f34890d;
        return k0Var.f34881c.f34978a == u2.ENUM ? k0Var.f34879a.findValueByNumber(((Integer) obj).intValue()) : obj;
    }

    public final Object h(Object obj) {
        return this.f34890d.f34881c.f34978a == u2.ENUM ? Integer.valueOf(((r0) obj).getNumber()) : obj;
    }
}
