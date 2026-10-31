package com.fyber.inneractive.sdk.metrics;

import java.util.HashMap;

/* loaded from: classes.dex */
public final class e implements g {

    /* renamed from: a, reason: collision with root package name */
    public Long f28549a = null;

    /* renamed from: b, reason: collision with root package name */
    public Long f28550b = null;

    /* renamed from: c, reason: collision with root package name */
    public Long f28551c = null;

    /* renamed from: d, reason: collision with root package name */
    public Long f28552d = null;

    /* renamed from: e, reason: collision with root package name */
    public Long f28553e = null;

    /* renamed from: f, reason: collision with root package name */
    public Long f28554f = null;

    /* renamed from: g, reason: collision with root package name */
    public Long f28555g = null;

    /* renamed from: h, reason: collision with root package name */
    public Long f28556h = null;

    @Override // com.fyber.inneractive.sdk.metrics.g
    public final boolean a() {
        return true;
    }

    @Override // com.fyber.inneractive.sdk.metrics.g
    public final Long b() {
        Long lValueOf = Long.valueOf(System.currentTimeMillis());
        this.f28555g = lValueOf;
        return lValueOf;
    }

    @Override // com.fyber.inneractive.sdk.metrics.g
    public final Long c() {
        Long lValueOf = Long.valueOf(System.currentTimeMillis());
        this.f28549a = lValueOf;
        return lValueOf;
    }

    @Override // com.fyber.inneractive.sdk.metrics.g
    public final Long d() {
        Long lValueOf = Long.valueOf(System.currentTimeMillis());
        this.f28552d = lValueOf;
        return lValueOf;
    }

    @Override // com.fyber.inneractive.sdk.metrics.g
    public final Long e() {
        Long lValueOf = Long.valueOf(System.currentTimeMillis());
        this.f28554f = lValueOf;
        return lValueOf;
    }

    @Override // com.fyber.inneractive.sdk.metrics.g
    public final Long f() {
        Long lValueOf = Long.valueOf(System.currentTimeMillis());
        this.f28550b = lValueOf;
        return lValueOf;
    }

    @Override // com.fyber.inneractive.sdk.metrics.g
    public final Long g() {
        Long lValueOf = Long.valueOf(System.currentTimeMillis());
        this.f28551c = lValueOf;
        return lValueOf;
    }

    @Override // com.fyber.inneractive.sdk.metrics.g
    public final Long h() {
        Long lValueOf = Long.valueOf(System.currentTimeMillis());
        this.f28556h = lValueOf;
        return lValueOf;
    }

    @Override // com.fyber.inneractive.sdk.metrics.g
    public final Long i() {
        Long lValueOf = Long.valueOf(System.currentTimeMillis());
        this.f28553e = lValueOf;
        return lValueOf;
    }

    @Override // com.fyber.inneractive.sdk.metrics.g
    public final HashMap j() {
        HashMap map = new HashMap();
        Long l9 = this.f28550b;
        if (l9 != null && this.f28549a != null) {
            map.put("sdk_init_network_req", Long.valueOf(l9.longValue() - this.f28549a.longValue()));
        }
        Long l11 = this.f28556h;
        if (l11 != null && this.f28550b != null) {
            map.put("sdk_got_response_from_markup_url", Long.valueOf(l11.longValue() - this.f28550b.longValue()));
        }
        Long l12 = this.f28552d;
        if (l12 != null && this.f28556h != null) {
            map.put("sdk_parsed_res", Long.valueOf(l12.longValue() - this.f28556h.longValue()));
        }
        Long l13 = this.f28551c;
        if (l13 != null && this.f28550b != null) {
            map.put("sdk_got_server_res", Long.valueOf(l13.longValue() - this.f28550b.longValue()));
        }
        Long l14 = this.f28552d;
        if (l14 != null && this.f28551c != null) {
            map.put("sdk_parsed_res", Long.valueOf(l14.longValue() - this.f28551c.longValue()));
        }
        Long l15 = this.f28553e;
        if (l15 != null && this.f28552d != null) {
            map.put("ad_loaded_result", Long.valueOf(l15.longValue() - this.f28552d.longValue()));
        }
        Long l16 = this.f28554f;
        if (l16 != null && this.f28553e != null) {
            map.put("publisher_notified", Long.valueOf(l16.longValue() - this.f28553e.longValue()));
        }
        Long l17 = this.f28555g;
        if (l17 != null && this.f28549a != null) {
            map.put("roundtrip", Long.valueOf(l17.longValue() - this.f28549a.longValue()));
        }
        return map;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("MetricsCollectorData{");
        if (this.f28549a != null && this.f28550b != null) {
            sb2.append(" sdk_init_network_req=");
            sb2.append(this.f28550b.longValue() - this.f28549a.longValue());
        }
        if (this.f28556h != null && this.f28550b != null) {
            sb2.append(", sdk_got_response_from_markup_url=");
            sb2.append(this.f28556h.longValue() - this.f28550b.longValue());
        }
        if (this.f28551c != null && this.f28550b != null) {
            sb2.append(", sdk_got_server_res=");
            sb2.append(this.f28551c.longValue() - this.f28550b.longValue());
        }
        if (this.f28552d != null && this.f28551c != null) {
            sb2.append(", sdk_parsed_res=");
            sb2.append(this.f28552d.longValue() - this.f28551c.longValue());
        }
        if (this.f28553e != null && this.f28552d != null) {
            sb2.append(", ad_loaded_result=");
            sb2.append(this.f28553e.longValue() - this.f28552d.longValue());
        }
        if (this.f28554f != null && this.f28553e != null) {
            sb2.append(", publisher_notified=");
            sb2.append(this.f28554f.longValue() - this.f28553e.longValue());
        }
        if (this.f28555g != null && this.f28549a != null) {
            sb2.append(", roundtrip=");
            sb2.append(this.f28555g.longValue() - this.f28549a.longValue());
        }
        sb2.append(" }");
        return sb2.toString();
    }
}
