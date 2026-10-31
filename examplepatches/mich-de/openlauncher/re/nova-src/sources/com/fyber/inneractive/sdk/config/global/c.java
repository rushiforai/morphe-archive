package com.fyber.inneractive.sdk.config.global;

import java.util.HashSet;
import java.util.Iterator;
import org.json.JSONArray;

/* loaded from: classes.dex */
public final class c implements d {

    /* renamed from: a, reason: collision with root package name */
    public final HashSet f27809a = new HashSet();

    /* renamed from: b, reason: collision with root package name */
    public final boolean f27810b;

    public c(JSONArray jSONArray, boolean z11) {
        if (jSONArray != null) {
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                long jOptLong = jSONArray.optLong(i5);
                if (jOptLong != 0) {
                    this.f27809a.add(Long.valueOf(jOptLong));
                }
            }
        }
        this.f27810b = z11;
    }

    @Override // com.fyber.inneractive.sdk.config.global.d
    public final boolean a(e eVar) {
        if (this.f27809a.isEmpty() || eVar.f27811a == null) {
            return false;
        }
        Iterator it = this.f27809a.iterator();
        while (it.hasNext()) {
            if (((Long) it.next()).equals(eVar.f27811a)) {
                return !this.f27810b;
            }
        }
        return this.f27810b;
    }

    public final String toString() {
        return String.format("%s - %s include: %b", "demand", this.f27809a, Boolean.valueOf(this.f27810b));
    }
}
