package com.facebook.ads.redexgen.X;

import java.util.ArrayList;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.26, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public class AnonymousClass26 {
    public final String A00;
    public final ArrayList<String> A01;
    public final ArrayList<String> A02;
    public final ArrayList<String> A03;
    public final JSONObject A04;
    public final boolean A05;

    public AnonymousClass26(JSONObject jSONObject, String str, ArrayList<String> imageUrls, ArrayList<String> videoUrls, ArrayList<String> fileUrls, boolean z11) {
        this.A04 = jSONObject;
        this.A00 = str;
        this.A02 = imageUrls;
        this.A03 = videoUrls;
        this.A01 = fileUrls;
        this.A05 = z11;
    }
}
