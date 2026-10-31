package com.fyber.inneractive.sdk.config.global;

import java.util.HashSet;
import java.util.Iterator;
import org.json.JSONArray;

/* loaded from: classes.dex */
public final class i implements d {

    /* renamed from: a, reason: collision with root package name */
    public final HashSet f27825a = new HashSet();

    /* renamed from: b, reason: collision with root package name */
    public final boolean f27826b;

    public i(JSONArray jSONArray, boolean z11) {
        if (jSONArray != null) {
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                long jOptLong = jSONArray.optLong(i5);
                if (jOptLong != 0) {
                    this.f27825a.add(Long.valueOf(jOptLong));
                }
            }
        }
        this.f27826b = z11;
    }

    @Override // com.fyber.inneractive.sdk.config.global.d
    public final boolean a(e eVar) {
        if (this.f27825a.isEmpty() || eVar.f27812b == null) {
            return false;
        }
        Iterator it = this.f27825a.iterator();
        while (it.hasNext()) {
            if (((Long) it.next()).equals(eVar.f27812b)) {
                return !this.f27826b;
            }
        }
        return this.f27826b;
    }

    public final String toString() {
        return String.format("%s - %s include: %b", "pub_id", this.f27825a, Boolean.valueOf(this.f27826b));
    }
}
