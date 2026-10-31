package com.fyber.inneractive.sdk.metrics;

import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.r;
import java.util.HashMap;
import org.json.JSONArray;

/* loaded from: classes3.dex */
public final class c extends a {

    /* renamed from: g, reason: collision with root package name */
    public static final String f28536g = String.valueOf(24);

    /* renamed from: h, reason: collision with root package name */
    public static final String f28537h = String.valueOf(3);

    /* renamed from: i, reason: collision with root package name */
    public static final String f28538i = String.valueOf(24);

    /* renamed from: j, reason: collision with root package name */
    public static final String f28539j = String.valueOf(3);

    /* renamed from: b, reason: collision with root package name */
    public final String f28540b;

    /* renamed from: c, reason: collision with root package name */
    public final UnitDisplayType f28541c;

    /* renamed from: d, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.response.e f28542d;

    /* renamed from: e, reason: collision with root package name */
    public final InneractiveAdRequest f28543e;

    /* renamed from: f, reason: collision with root package name */
    public final JSONArray f28544f;

    public c(com.fyber.inneractive.sdk.response.e eVar, InneractiveAdRequest inneractiveAdRequest, String str, UnitDisplayType unitDisplayType, JSONArray jSONArray) {
        super("send_metric_report");
        this.f28542d = eVar;
        this.f28543e = inneractiveAdRequest;
        this.f28540b = str;
        this.f28541c = unitDisplayType;
        this.f28544f = jSONArray;
    }

    public final void a() {
        d dVar = d.f28545d;
        g gVarA = dVar.a(this.f28540b);
        HashMap mapJ = gVarA.j();
        if (!gVarA.a()) {
            IAlog.a("MetricCreativeReporter: Metric data not valid, data: %s", dVar.a(this.f28540b).toString());
            return;
        }
        dVar.f28546a.remove(this.f28540b);
        r.f31215a.execute(new b(this, gVarA, mapJ));
    }
}
