package com.bytedance.sdk.openadsdk.dj.ycx.ycx;

import com.bytedance.sdk.openadsdk.dv.zb;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.HashMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya {

    /* renamed from: dj, reason: collision with root package name */
    public boolean f26751dj;

    /* renamed from: jw, reason: collision with root package name */
    private final HashMap<String, ycx> f26752jw;

    /* renamed from: lt, reason: collision with root package name */
    public boolean f26753lt;
    public long lud;
    public long sya;
    public boolean ycx;

    /* renamed from: zb, reason: collision with root package name */
    public boolean f26754zb;

    /* renamed from: ul, reason: collision with root package name */
    private static final sya f26750ul = new sya();
    private static final zb.ycx<sya> fby = new zb.ycx<sya>() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.ycx.sya.1
        @Override // com.bytedance.sdk.openadsdk.dv.zb.ycx
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public sya zb(String str) {
            return new sya(str);
        }
    };

    public static class zb {
        public String lud;
        public long ycx = 5000;

        /* renamed from: zb, reason: collision with root package name */
        public int f26760zb = 50;
        public long sya = 604800000;

        /* renamed from: dj, reason: collision with root package name */
        public boolean f26757dj = false;

        /* renamed from: lt, reason: collision with root package name */
        public int f26758lt = 5;

        /* renamed from: ul, reason: collision with root package name */
        public int f26759ul = 5;
        public long fby = 5000;

        public zb(String str) {
            this.lud = str;
        }

        public String toString() {
            return super.toString();
        }

        public void ycx(JSONObject jSONObject) {
            if (jSONObject == null) {
                return;
            }
            this.ycx = jSONObject.optLong("u_d_t", this.ycx);
            this.f26760zb = jSONObject.optInt("u_m_c", this.f26760zb);
            this.sya = jSONObject.optLong("e_t", this.sya);
            this.f26757dj = jSONObject.optBoolean("ena", this.f26757dj);
            this.f26758lt = jSONObject.optInt("n_e_b_u_n_d_c", this.f26758lt);
            this.f26759ul = jSONObject.optInt("b_s_e_c", this.f26759ul);
            this.fby = jSONObject.optLong("b_s_d_t", this.fby);
        }
    }

    public sya(String str) {
        this.f26752jw = new HashMap<>();
        this.sya = 86400000L;
        this.lud = 3000L;
        try {
            JSONObject jSONObject = new JSONObject(str);
            this.ycx = jSONObject.optBoolean("ena_mon", this.ycx);
            this.f26754zb = jSONObject.optBoolean("ena_wal", this.f26754zb);
            this.sya = jSONObject.optLong("mon_u_i_ms", this.sya);
            this.f26751dj = jSONObject.optBoolean("ena_dy_adj", this.f26751dj);
            this.lud = jSONObject.optLong("p_u_r_d_t", this.lud);
            this.f26753lt = jSONObject.optBoolean("s_e_u_t_p", this.f26753lt);
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("ins_confs");
            if (jSONArrayOptJSONArray != null) {
                for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                    ycx ycxVar = new ycx(jSONArrayOptJSONArray.getJSONObject(i5));
                    this.f26752jw.put(ycxVar.f26756zb, ycxVar);
                }
            }
        } catch (JSONException unused) {
        }
    }

    public static ycx ycx() {
        ycx ycxVarYcx = zb().ycx("ads");
        return ycxVarYcx != null ? ycxVarYcx : ycx.ycx;
    }

    public static sya zb() {
        sya syaVar = f26750ul;
        sya syaVar2 = (sya) com.bytedance.sdk.openadsdk.dv.lud.ycx("event_logger_config", syaVar, fby);
        return syaVar2 != null ? syaVar2 : syaVar;
    }

    private ycx ycx(String str) {
        return this.f26752jw.get(str);
    }

    public static class ycx {
        public static final ycx ycx = new ycx();

        /* renamed from: dj, reason: collision with root package name */
        private final zb f26755dj;
        private final zb lud;
        private final zb sya;

        /* renamed from: zb, reason: collision with root package name */
        public String f26756zb;

        public ycx(JSONObject jSONObject) {
            zb zbVar = new zb("applog");
            this.sya = zbVar;
            zb zbVar2 = new zb("stats");
            this.f26755dj = zbVar2;
            zb zbVar3 = new zb("track");
            this.lud = zbVar3;
            try {
                this.f26756zb = jSONObject.getString(PendingUpgradeStore.KEY_NAME);
                zbVar.ycx(jSONObject.optJSONObject("applog"));
                zbVar2.ycx(jSONObject.optJSONObject("stats"));
                zbVar3.ycx(jSONObject.optJSONObject("track"));
            } catch (JSONException unused) {
            }
        }

        public zb sya() {
            return this.lud;
        }

        public String toString() {
            return super.toString();
        }

        public zb ycx() {
            return this.sya;
        }

        public zb zb() {
            return this.f26755dj;
        }

        public ycx() {
            this.sya = new zb("applog");
            this.f26755dj = new zb("stats");
            this.lud = new zb("track");
        }
    }

    public sya() {
        this.f26752jw = new HashMap<>();
        this.sya = 86400000L;
        this.lud = 3000L;
    }
}
