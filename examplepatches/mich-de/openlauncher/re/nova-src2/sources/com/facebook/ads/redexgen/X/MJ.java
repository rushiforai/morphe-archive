package com.facebook.ads.redexgen.X;

import java.util.Collection;
import org.json.JSONObject;

/* loaded from: assets/audience_network/classes.dex */
public class MJ implements InterfaceC1704ei {
    public final /* synthetic */ C0958Hi A00;
    public final /* synthetic */ String A01;
    public final /* synthetic */ JSONObject A02;

    public MJ(JSONObject jSONObject, C0958Hi c0958Hi, String str) {
        this.A02 = jSONObject;
        this.A00 = c0958Hi;
        this.A01 = str;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1704ei
    public final String A7z() {
        return this.A01;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1704ei
    public final Collection<String> A8Q() {
        return AbstractC1705ej.A03(this.A00, this.A02);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1704ei
    public final EnumC1703eh A8w() {
        return AbstractC1705ej.A00(this.A02);
    }
}
