package com.bytedance.sdk.component.zb.ycx;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
public abstract class ok {
    private List<String> sya;
    public ea ycx;

    /* renamed from: dj, reason: collision with root package name */
    private long f24183dj = 30000;

    /* renamed from: zb, reason: collision with root package name */
    public com.bytedance.sdk.component.sya.ycx.ycx f24184zb = new com.bytedance.sdk.component.sya.ycx.ycx();

    public static class ycx {

        /* renamed from: dj, reason: collision with root package name */
        String f24185dj;
        String fby;

        /* renamed from: jc, reason: collision with root package name */
        private long f24186jc;

        /* renamed from: jw, reason: collision with root package name */
        private List<String> f24187jw;

        /* renamed from: lt, reason: collision with root package name */
        ry f24188lt;
        Object lud;
        ul sya;

        /* renamed from: ul, reason: collision with root package name */
        int f24189ul;
        com.bytedance.sdk.component.zb.ycx.ycx ycx;

        /* renamed from: zb, reason: collision with root package name */
        Map<String, List<String>> f24190zb;

        public ycx() {
            this.f24186jc = 30000L;
            this.f24190zb = new HashMap();
        }

        public ycx ycx(com.bytedance.sdk.component.zb.ycx.ycx ycxVar) {
            this.ycx = ycxVar;
            return this;
        }

        public ycx zb(String str) {
            return ycx(ul.sya(str));
        }

        public ycx ycx(String str) {
            this.fby = str;
            return this;
        }

        public ycx zb(String str, String str2) {
            if (!this.f24190zb.containsKey(str)) {
                this.f24190zb.put(str, new ArrayList());
            }
            this.f24190zb.get(str).add(str2);
            return this;
        }

        public ycx(ok okVar) {
            this.f24186jc = 30000L;
            this.sya = okVar.dj();
            this.f24185dj = okVar.lud();
            this.f24190zb = okVar.lt();
            this.lud = okVar.sya();
            this.f24188lt = okVar.jc();
            this.ycx = okVar.ul();
            this.f24189ul = okVar.jw();
            this.fby = okVar.fby();
            this.f24187jw = okVar.ycx();
            this.f24186jc = okVar.zb();
        }

        public ycx ycx(int i5) {
            this.f24189ul = i5;
            return this;
        }

        public ycx ycx(Object obj) {
            this.lud = obj;
            return this;
        }

        public ycx ycx(ul ulVar) {
            this.sya = ulVar;
            return this;
        }

        public ok zb() {
            return new ok() { // from class: com.bytedance.sdk.component.zb.ycx.ok.ycx.1
                @Override // com.bytedance.sdk.component.zb.ycx.ok
                public ul dj() {
                    return ycx.this.sya;
                }

                @Override // com.bytedance.sdk.component.zb.ycx.ok
                public String fby() {
                    return ycx.this.fby;
                }

                @Override // com.bytedance.sdk.component.zb.ycx.ok
                public ry jc() {
                    return ycx.this.f24188lt;
                }

                @Override // com.bytedance.sdk.component.zb.ycx.ok
                public int jw() {
                    return ycx.this.f24189ul;
                }

                @Override // com.bytedance.sdk.component.zb.ycx.ok
                public Map lt() {
                    return ycx.this.f24190zb;
                }

                @Override // com.bytedance.sdk.component.zb.ycx.ok
                public String lud() {
                    return ycx.this.f24185dj;
                }

                @Override // com.bytedance.sdk.component.zb.ycx.ok
                public Object sya() {
                    return ycx.this.lud;
                }

                public String toString() {
                    return b.f42142b;
                }

                @Override // com.bytedance.sdk.component.zb.ycx.ok
                public com.bytedance.sdk.component.zb.ycx.ycx ul() {
                    return ycx.this.ycx;
                }

                @Override // com.bytedance.sdk.component.zb.ycx.ok
                public List<String> ycx() {
                    return ycx.this.f24187jw;
                }

                @Override // com.bytedance.sdk.component.zb.ycx.ok
                public long zb() {
                    return ycx.this.f24186jc;
                }
            };
        }

        public ycx ycx(String str, String str2) {
            return zb(str, str2);
        }

        public ycx ycx() {
            return ycx("GET", (ry) null);
        }

        private ycx ycx(String str, ry ryVar) {
            this.f24185dj = str;
            this.f24188lt = ryVar;
            return this;
        }

        public ycx ycx(ry ryVar) {
            return ycx("POST", ryVar);
        }

        public ycx ycx(List<String> list) {
            this.f24187jw = list;
            return this;
        }

        public ycx ycx(long j11) {
            this.f24186jc = j11;
            return this;
        }
    }

    public abstract ul dj();

    public ycx ea() {
        return new ycx(this);
    }

    public abstract String fby();

    public ry jc() {
        return null;
    }

    public abstract int jw();

    public abstract Map<String, List<String>> lt();

    public abstract String lud();

    public abstract Object sya();

    public abstract com.bytedance.sdk.component.zb.ycx.ycx ul();

    public List<String> ycx() {
        return this.sya;
    }

    public long zb() {
        return this.f24183dj;
    }

    public void ycx(ea eaVar) {
        this.ycx = eaVar;
    }
}
