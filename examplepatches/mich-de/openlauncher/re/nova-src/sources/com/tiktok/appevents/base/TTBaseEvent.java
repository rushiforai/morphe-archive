package com.tiktok.appevents.base;

import com.tiktok.util.JSON;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public class TTBaseEvent {
    public String eventId;
    public String eventName;
    public JSONObject properties;

    public static class Builder {
        public String eventId;
        public String eventName;
        public JSONObject properties = JSON.build();

        public Builder(String str) {
            this.eventName = str;
        }

        private void safeAddProperty(String str, Object obj) {
            try {
                JSON.putObject(this.properties, str, obj);
            } catch (Throwable unused) {
            }
        }

        public Builder addProperty(String str, Object obj) {
            safeAddProperty(str, obj);
            return this;
        }

        public TTBaseEvent build() {
            return new TTBaseEvent(this.eventName, this.properties, this.eventId);
        }

        public Builder addProperty(String str, String str2) {
            safeAddProperty(str, str2);
            return this;
        }

        public Builder addProperty(String str, boolean z11) {
            safeAddProperty(str, Boolean.valueOf(z11));
            return this;
        }

        public Builder(String str, String str2) {
            this.eventName = str;
            this.eventId = str2;
        }

        public Builder addProperty(String str, double d5) {
            safeAddProperty(str, Double.valueOf(d5));
            return this;
        }

        public Builder addProperty(String str, int i5) {
            safeAddProperty(str, Integer.valueOf(i5));
            return this;
        }

        public Builder addProperty(String str, long j11) {
            safeAddProperty(str, Long.valueOf(j11));
            return this;
        }
    }

    public TTBaseEvent(String str, JSONObject jSONObject, String str2) {
        this.eventName = str;
        this.properties = jSONObject;
        this.eventId = str2;
    }

    public static Builder newBuilder(String str) {
        return new Builder(str);
    }

    public static Builder newBuilder(String str, String str2) {
        return new Builder(str, str2);
    }
}
