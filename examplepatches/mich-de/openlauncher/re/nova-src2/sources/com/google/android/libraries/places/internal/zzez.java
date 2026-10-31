package com.google.android.libraries.places.internal;

import com.android.volley.toolbox.g;
import java.util.Map;
import jb.k;
import jb.l;
import org.json.JSONObject;

/* loaded from: classes3.dex */
final class zzez extends g {
    final /* synthetic */ Map zza;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zzez(zzfa zzfaVar, int i5, String str, JSONObject jSONObject, l lVar, k kVar, Map map) {
        super(str, null, lVar, kVar);
        this.zza = map;
    }

    @Override // jb.i
    public final Map getHeaders() {
        return this.zza;
    }
}
