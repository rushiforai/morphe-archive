package com.fyber.inneractive.sdk.config.global;

import android.text.TextUtils;
import java.util.HashSet;
import java.util.Iterator;
import org.json.JSONArray;

/* loaded from: classes.dex */
public final class h implements d {

    /* renamed from: a, reason: collision with root package name */
    public final HashSet f27823a = new HashSet();

    /* renamed from: b, reason: collision with root package name */
    public final boolean f27824b;

    public h(JSONArray jSONArray, boolean z11) {
        if (jSONArray != null) {
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                String strOptString = jSONArray.optString(i5);
                if (!TextUtils.isEmpty(strOptString)) {
                    this.f27823a.add(strOptString);
                }
            }
        }
        this.f27824b = z11;
    }

    @Override // com.fyber.inneractive.sdk.config.global.d
    public final boolean a(e eVar) {
        if (this.f27823a.isEmpty() || eVar.f27813c == null) {
            return false;
        }
        Iterator it = this.f27823a.iterator();
        while (it.hasNext()) {
            if (((String) it.next()).equals(eVar.f27813c.value())) {
                return !this.f27824b;
            }
        }
        return this.f27824b;
    }

    public final String toString() {
        return String.format("%s - %s include: %b", "placement_type", this.f27823a, Boolean.valueOf(this.f27824b));
    }
}
