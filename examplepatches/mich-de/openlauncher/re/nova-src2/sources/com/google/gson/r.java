package com.google.gson;

import java.util.Iterator;
import java.util.Map;

/* loaded from: classes.dex */
public final class r extends p {

    /* renamed from: a, reason: collision with root package name */
    public final hn.o f34795a = new hn.o(false);

    public final boolean equals(Object obj) {
        if (obj != this) {
            return (obj instanceof r) && ((r) obj).f34795a.equals(this.f34795a);
        }
        return true;
    }

    public final int hashCode() {
        return this.f34795a.hashCode();
    }

    public final void p(String str, p pVar) {
        if (pVar == null) {
            pVar = q.f34794a;
        }
        this.f34795a.put(str, pVar);
    }

    public final void q(Number number, String str) {
        p(str, new s(number));
    }

    public final void r(String str, Boolean bool) {
        p(str, bool == null ? q.f34794a : new s(bool));
    }

    public final void s(String str, String str2) {
        p(str, str2 == null ? q.f34794a : new s(str2));
    }

    @Override // com.google.gson.p
    /* renamed from: t, reason: merged with bridge method [inline-methods] */
    public final r c() {
        r rVar = new r();
        Iterator it = ((hn.m) this.f34795a.entrySet()).iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            rVar.p((String) entry.getKey(), ((p) entry.getValue()).c());
        }
        return rVar;
    }

    public final hn.m u() {
        return (hn.m) this.f34795a.entrySet();
    }

    public final p v(String str) {
        return (p) this.f34795a.get(str);
    }

    public final m w(String str) {
        return (m) this.f34795a.get(str);
    }

    public final r x(String str) {
        return (r) this.f34795a.get(str);
    }

    public final boolean y() {
        return this.f34795a.containsKey("ping_strategy");
    }
}
