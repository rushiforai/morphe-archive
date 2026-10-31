package com.bykv.vk.openvk.ycx.ycx.ycx.sya;

import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.fyber.inneractive.sdk.activities.InneractiveRichMediaVideoPlayerActivityCore;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public int f22183a;

    /* renamed from: b, reason: collision with root package name */
    public int f22184b;

    /* renamed from: c, reason: collision with root package name */
    public long f22185c;

    /* renamed from: d, reason: collision with root package name */
    public double f22186d;

    /* renamed from: e, reason: collision with root package name */
    public String f22187e;

    /* renamed from: f, reason: collision with root package name */
    public String f22188f;

    /* renamed from: g, reason: collision with root package name */
    public String f22189g;

    /* renamed from: h, reason: collision with root package name */
    public String f22190h;

    /* renamed from: i, reason: collision with root package name */
    public String f22191i;

    /* renamed from: j, reason: collision with root package name */
    public String f22192j;

    /* renamed from: k, reason: collision with root package name */
    public int f22193k;

    /* renamed from: l, reason: collision with root package name */
    public int f22194l;

    /* renamed from: m, reason: collision with root package name */
    public int f22195m = 0;
    public int n = 0;
    public int o = 0;

    /* renamed from: p, reason: collision with root package name */
    public int f22196p = 0;

    /* renamed from: q, reason: collision with root package name */
    public int f22197q = 307200;

    /* renamed from: r, reason: collision with root package name */
    public int f22198r = 1;

    public final JSONObject a() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("cover_height", this.f22183a);
            jSONObject.put("cover_url", this.f22188f);
            jSONObject.put("cover_width", this.f22184b);
            jSONObject.put("endcard", this.f22190h);
            jSONObject.put("file_hash", c());
            jSONObject.put("resolution", this.f22187e);
            jSONObject.put("size", this.f22185c);
            jSONObject.put("video_duration", this.f22186d);
            jSONObject.put(InneractiveRichMediaVideoPlayerActivityCore.VIDEO_URL, this.f22189g);
            jSONObject.put("playable_download_url", this.f22191i);
            jSONObject.put("if_playable_loading_show", this.f22195m);
            jSONObject.put("remove_loading_page_type", this.n);
            jSONObject.put("fallback_endcard_judge", this.f22193k);
            jSONObject.put("video_preload_size", b());
            jSONObject.put("reward_video_cached_type", this.o);
            jSONObject.put("execute_cached_type", this.f22196p);
            jSONObject.put("endcard_render", this.f22194l);
            jSONObject.put("replay_time", this.f22198r);
            jSONObject.put("play_speed_ratio", -1.0f);
            return jSONObject;
        } catch (Exception e3) {
            sya.ycx(e3, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOUE7Unyo9O0lE=", "becpkAyVZ8GP", "T+EHhgyyRsWK", 256);
            return jSONObject;
        }
    }

    public final int b() {
        if (this.f22197q < 0) {
            this.f22197q = 307200;
        }
        long j11 = this.f22197q;
        long j12 = this.f22185c;
        if (j11 > j12) {
            this.f22197q = (int) j12;
        }
        return this.f22197q;
    }

    public final String c() {
        if (TextUtils.isEmpty(this.f22192j)) {
            this.f22192j = rb.a.a(this.f22189g);
        }
        return this.f22192j;
    }
}
