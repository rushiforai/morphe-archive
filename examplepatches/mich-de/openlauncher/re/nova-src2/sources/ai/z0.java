package ai;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Pair;
import android.util.SparseArray;
import com.instabridge.ai.tools.SharedPreferencesToolRegistrationStateStore;

/* loaded from: classes3.dex */
public final class z0 extends v1 {

    /* renamed from: z, reason: collision with root package name */
    public static final Pair f13485z = new Pair(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, 0L);

    /* renamed from: c, reason: collision with root package name */
    public SharedPreferences f13486c;

    /* renamed from: d, reason: collision with root package name */
    public SharedPreferences f13487d;

    /* renamed from: e, reason: collision with root package name */
    public x0 f13488e;

    /* renamed from: f, reason: collision with root package name */
    public final w0 f13489f;

    /* renamed from: g, reason: collision with root package name */
    public final y0 f13490g;

    /* renamed from: h, reason: collision with root package name */
    public String f13491h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f13492i;

    /* renamed from: j, reason: collision with root package name */
    public long f13493j;

    /* renamed from: k, reason: collision with root package name */
    public final w0 f13494k;

    /* renamed from: l, reason: collision with root package name */
    public final v0 f13495l;

    /* renamed from: m, reason: collision with root package name */
    public final y0 f13496m;
    public final tm.o n;
    public final v0 o;

    /* renamed from: p, reason: collision with root package name */
    public final w0 f13497p;

    /* renamed from: q, reason: collision with root package name */
    public final w0 f13498q;

    /* renamed from: r, reason: collision with root package name */
    public boolean f13499r;

    /* renamed from: s, reason: collision with root package name */
    public final v0 f13500s;

    /* renamed from: t, reason: collision with root package name */
    public final v0 f13501t;

    /* renamed from: u, reason: collision with root package name */
    public final w0 f13502u;

    /* renamed from: v, reason: collision with root package name */
    public final y0 f13503v;

    /* renamed from: w, reason: collision with root package name */
    public final y0 f13504w;

    /* renamed from: x, reason: collision with root package name */
    public final w0 f13505x;

    /* renamed from: y, reason: collision with root package name */
    public final tm.o f13506y;

    public z0(m1 m1Var) {
        super(m1Var);
        this.f13494k = new w0(this, "session_timeout", 1800000L);
        this.f13495l = new v0(this, "start_new_session", true);
        this.f13497p = new w0(this, "last_pause_time", 0L);
        this.f13498q = new w0(this, SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID, 0L);
        this.f13496m = new y0(this, "non_personalized_ads");
        this.n = new tm.o(this, "last_received_uri_timestamps_by_source");
        this.o = new v0(this, "allow_remote_dynamite", false);
        this.f13489f = new w0(this, "first_open_time", 0L);
        sg.w.e("app_install_time");
        this.f13490g = new y0(this, "app_instance_id");
        this.f13500s = new v0(this, "app_backgrounded", false);
        this.f13501t = new v0(this, "deep_link_retrieval_complete", false);
        this.f13502u = new w0(this, "deep_link_retrieval_attempts", 0L);
        this.f13503v = new y0(this, "firebase_feature_rollouts");
        this.f13504w = new y0(this, "deferred_attribution_cache");
        this.f13505x = new w0(this, "deferred_attribution_cache_timestamp", 0L);
        this.f13506y = new tm.o(this, "default_event_parameters");
    }

    @Override // ai.v1
    public final boolean E() {
        return true;
    }

    public final SharedPreferences H() {
        D();
        F();
        sg.w.h(this.f13486c);
        return this.f13486c;
    }

    public final SharedPreferences I() {
        D();
        F();
        if (this.f13487d == null) {
            m1 m1Var = (m1) this.f13368a;
            String strValueOf = String.valueOf(m1Var.f13133a.getPackageName());
            o0 o0Var = m1Var.f13138f;
            m1.l(o0Var);
            m0 m0Var = o0Var.n;
            String strConcat = strValueOf.concat("_preferences");
            m0Var.b(strConcat, "Default prefs file");
            this.f13487d = m1Var.f13133a.getSharedPreferences(strConcat, 0);
        }
        return this.f13487d;
    }

    public final SparseArray J() {
        Bundle bundleJ0 = this.n.J0();
        int[] intArray = bundleJ0.getIntArray("uriSources");
        long[] longArray = bundleJ0.getLongArray("uriTimestamps");
        if (intArray == null || longArray == null) {
            return new SparseArray();
        }
        if (intArray.length != longArray.length) {
            o0 o0Var = ((m1) this.f13368a).f13138f;
            m1.l(o0Var);
            o0Var.f13190f.a("Trigger URI source and timestamp array lengths do not match");
            return new SparseArray();
        }
        SparseArray sparseArray = new SparseArray();
        for (int i5 = 0; i5 < intArray.length; i5++) {
            sparseArray.put(intArray[i5], Long.valueOf(longArray[i5]));
        }
        return sparseArray;
    }

    public final a2 K() {
        D();
        return a2.c(H().getInt("consent_source", 100), H().getString("consent_settings", "G1"));
    }

    public final void L(boolean z11) {
        D();
        o0 o0Var = ((m1) this.f13368a).f13138f;
        m1.l(o0Var);
        o0Var.n.b(Boolean.valueOf(z11), "App measurement setting deferred collection");
        SharedPreferences.Editor editorEdit = H().edit();
        editorEdit.putBoolean("deferred_analytics_collection", z11);
        editorEdit.apply();
    }

    public final boolean M(long j11) {
        return j11 - this.f13494k.f() > this.f13497p.f();
    }
}
