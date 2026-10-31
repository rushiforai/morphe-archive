package com.bytedance.sdk.component.zb.ycx;

import com.bytedance.sdk.component.ul.ycx;
import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

/* loaded from: classes2.dex */
public abstract class ea implements Cloneable {

    /* renamed from: dj, reason: collision with root package name */
    public long f24168dj;
    public final ycx.zb fby;

    /* renamed from: lt, reason: collision with root package name */
    public long f24169lt;
    public TimeUnit lud;
    public TimeUnit sya;

    /* renamed from: ul, reason: collision with root package name */
    public TimeUnit f24170ul;
    public List<fby> ycx;

    /* renamed from: zb, reason: collision with root package name */
    public long f24171zb;

    public ea(ycx ycxVar) {
        this.f24171zb = ycxVar.sya;
        this.f24168dj = ycxVar.lud;
        this.f24169lt = ycxVar.f24174ul;
        List<fby> list = ycxVar.ycx;
        this.sya = ycxVar.f24172dj;
        this.lud = ycxVar.f24173lt;
        this.f24170ul = ycxVar.fby;
        this.ycx = list;
        this.fby = ycxVar.f24175zb;
    }

    public ycx sya() {
        return new ycx(this);
    }

    public ycx.zb ycx() {
        return this.fby;
    }

    public abstract zb ycx(ok okVar);

    public abstract dj zb();

    public static final class ycx {

        /* renamed from: dj, reason: collision with root package name */
        public TimeUnit f24172dj;
        public TimeUnit fby;

        /* renamed from: lt, reason: collision with root package name */
        public TimeUnit f24173lt;
        public long lud;
        public long sya;

        /* renamed from: ul, reason: collision with root package name */
        public long f24174ul;
        public final List<fby> ycx;

        /* renamed from: zb, reason: collision with root package name */
        ycx.zb f24175zb;

        public ycx() {
            this.ycx = new ArrayList();
            this.sya = h.f42227c;
            TimeUnit timeUnit = TimeUnit.MILLISECONDS;
            this.f24172dj = timeUnit;
            this.lud = h.f42227c;
            this.f24173lt = timeUnit;
            this.f24174ul = h.f42227c;
            this.fby = timeUnit;
        }

        public ycx sya(long j11, TimeUnit timeUnit) {
            this.f24174ul = j11;
            this.fby = timeUnit;
            return this;
        }

        public ycx ycx(long j11, TimeUnit timeUnit) {
            this.sya = j11;
            this.f24172dj = timeUnit;
            return this;
        }

        public ycx zb(long j11, TimeUnit timeUnit) {
            this.lud = j11;
            this.f24173lt = timeUnit;
            return this;
        }

        public ycx ycx(fby fbyVar) {
            this.ycx.add(fbyVar);
            return this;
        }

        public ycx ycx(ycx.zb zbVar) {
            this.f24175zb = zbVar;
            return this;
        }

        public ea ycx() {
            return com.bytedance.sdk.component.zb.ycx.ycx.ycx.ycx(this);
        }

        public ycx(String str) {
            this.ycx = new ArrayList();
            this.sya = h.f42227c;
            TimeUnit timeUnit = TimeUnit.MILLISECONDS;
            this.f24172dj = timeUnit;
            this.lud = h.f42227c;
            this.f24173lt = timeUnit;
            this.f24174ul = h.f42227c;
            this.fby = timeUnit;
        }

        public ycx(ea eaVar) {
            this.ycx = new ArrayList();
            this.sya = h.f42227c;
            TimeUnit timeUnit = TimeUnit.MILLISECONDS;
            this.f24172dj = timeUnit;
            this.lud = h.f42227c;
            this.f24173lt = timeUnit;
            this.f24174ul = h.f42227c;
            this.fby = timeUnit;
            this.sya = eaVar.f24171zb;
            this.f24172dj = eaVar.sya;
            this.lud = eaVar.f24168dj;
            this.f24173lt = eaVar.lud;
            this.f24174ul = eaVar.f24169lt;
            this.fby = eaVar.f24170ul;
        }
    }
}
