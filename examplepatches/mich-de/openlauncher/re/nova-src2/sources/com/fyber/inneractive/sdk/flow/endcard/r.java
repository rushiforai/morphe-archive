package com.fyber.inneractive.sdk.flow.endcard;

import com.fyber.inneractive.sdk.flow.y0;
import org.json.JSONArray;

/* loaded from: classes3.dex */
public final class r extends c {
    public r(y0 y0Var, com.fyber.inneractive.sdk.model.vast.c cVar, int i5) {
        super(y0Var, cVar, i5);
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final void a(JSONArray jSONArray) {
        this.f28056b = jSONArray;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final n c() {
        return new u(this);
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final boolean k() {
        JSONArray jSONArray = this.f28056b;
        return jSONArray != null && jSONArray.length() > 0;
    }
}
