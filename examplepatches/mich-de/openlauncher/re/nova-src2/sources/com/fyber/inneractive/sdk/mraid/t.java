package com.fyber.inneractive.sdk.mraid;

import com.fyber.inneractive.sdk.util.g1;
import com.fyber.inneractive.sdk.web.i0;
import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: classes3.dex */
public final class t extends f {
    public t(LinkedHashMap linkedHashMap, i0 i0Var, g1 g1Var) {
        super(linkedHashMap, i0Var, g1Var);
    }

    @Override // com.fyber.inneractive.sdk.mraid.f
    public final void a() {
        Map map = this.f28668b;
        this.f28669c.setOrientationProperties((map != null && map.containsKey("allowOrientationChange") && "false".equals(this.f28668b.get("allowOrientationChange"))) ? false : true, (String) this.f28668b.get("forceOrientation"));
    }

    @Override // com.fyber.inneractive.sdk.mraid.f
    public final boolean b() {
        return false;
    }
}
