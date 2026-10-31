package com.fyber.inneractive.sdk.external;

import b.c0;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public class ImpressionData {

    /* renamed from: a, reason: collision with root package name */
    public Pricing f27970a = new Pricing();

    /* renamed from: b, reason: collision with root package name */
    public Video f27971b;

    /* renamed from: c, reason: collision with root package name */
    public String f27972c;

    /* renamed from: d, reason: collision with root package name */
    public Long f27973d;

    /* renamed from: e, reason: collision with root package name */
    public String f27974e;

    /* renamed from: f, reason: collision with root package name */
    public String f27975f;

    /* renamed from: g, reason: collision with root package name */
    public String f27976g;

    /* renamed from: h, reason: collision with root package name */
    public String f27977h;

    /* renamed from: i, reason: collision with root package name */
    public String f27978i;

    public static class Pricing {

        /* renamed from: a, reason: collision with root package name */
        public double f27979a;

        /* renamed from: b, reason: collision with root package name */
        public String f27980b;

        public String getCurrency() {
            return this.f27980b;
        }

        public double getValue() {
            return this.f27979a;
        }

        public void setValue(double d5) {
            this.f27979a = d5;
        }

        public String toString() {
            StringBuilder sb2 = new StringBuilder("Pricing{value=");
            sb2.append(this.f27979a);
            sb2.append(", currency='");
            return c0.q(sb2, this.f27980b, "'}");
        }
    }

    public static class Video {

        /* renamed from: a, reason: collision with root package name */
        public final boolean f27981a;

        /* renamed from: b, reason: collision with root package name */
        public long f27982b;

        public Video(boolean z11, long j11) {
            this.f27981a = z11;
            this.f27982b = j11;
        }

        public long getDuration() {
            return this.f27982b;
        }

        public boolean isSkippable() {
            return this.f27981a;
        }

        public String toString() {
            StringBuilder sb2 = new StringBuilder("Video{skippable=");
            sb2.append(this.f27981a);
            sb2.append(", duration=");
            return a2.c.n(sb2, this.f27982b, AbstractJsonLexerKt.END_OBJ);
        }
    }

    public String getAdvertiserDomain() {
        return this.f27978i;
    }

    public String getCampaignId() {
        return this.f27977h;
    }

    public String getCountry() {
        return this.f27974e;
    }

    public String getCreativeId() {
        return this.f27976g;
    }

    public Long getDemandId() {
        return this.f27973d;
    }

    public String getDemandSource() {
        return this.f27972c;
    }

    public String getImpressionId() {
        return this.f27975f;
    }

    public Pricing getPricing() {
        return this.f27970a;
    }

    public Video getVideo() {
        return this.f27971b;
    }

    public void setAdvertiserDomain(String str) {
        this.f27978i = str;
    }

    public void setCampaignId(String str) {
        this.f27977h = str;
    }

    public void setCountry(String str) {
        this.f27974e = str;
    }

    public void setCpmValue(String str) throws NumberFormatException {
        double d5;
        try {
            d5 = Double.parseDouble(str);
        } catch (Exception unused) {
            d5 = 0.0d;
        }
        this.f27970a.f27979a = d5;
    }

    public void setCreativeId(String str) {
        this.f27976g = str;
    }

    public void setCurrency(String str) {
        this.f27970a.f27980b = str;
    }

    public void setDemandId(Long l9) {
        this.f27973d = l9;
    }

    public void setDemandSource(String str) {
        this.f27972c = str;
    }

    public void setDuration(long j11) {
        this.f27971b.f27982b = j11;
    }

    public void setImpressionId(String str) {
        this.f27975f = str;
    }

    public void setPricing(Pricing pricing) {
        this.f27970a = pricing;
    }

    public void setVideo(Video video) {
        this.f27971b = video;
    }

    public String toString() {
        StringBuilder sb2 = new StringBuilder("ImpressionData{pricing=");
        sb2.append(this.f27970a);
        sb2.append(", video=");
        sb2.append(this.f27971b);
        sb2.append(", demandSource='");
        sb2.append(this.f27972c);
        sb2.append("', country='");
        sb2.append(this.f27974e);
        sb2.append("', impressionId='");
        sb2.append(this.f27975f);
        sb2.append("', creativeId='");
        sb2.append(this.f27976g);
        sb2.append("', campaignId='");
        sb2.append(this.f27977h);
        sb2.append("', advertiserDomain='");
        return c0.q(sb2, this.f27978i, "'}");
    }
}
