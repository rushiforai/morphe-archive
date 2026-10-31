package com.bytedance.sdk.component.lud.zb.sya;

import android.content.Context;
import com.bytedance.sdk.component.lud.htf;
import com.bytedance.sdk.component.lud.ok;
import com.bytedance.sdk.component.lud.pmi;
import com.bytedance.sdk.component.lud.ry;
import com.bytedance.sdk.component.lud.thx;
import com.bytedance.sdk.component.lud.wie;
import java.util.concurrent.ExecutorService;

/* loaded from: classes2.dex */
public class lud implements ry {

    /* renamed from: dj, reason: collision with root package name */
    private wie f23981dj;
    private htf fby;

    /* renamed from: jc, reason: collision with root package name */
    private boolean f23982jc;

    /* renamed from: jw, reason: collision with root package name */
    private thx f23983jw;

    /* renamed from: lt, reason: collision with root package name */
    private com.bytedance.sdk.component.lud.sya f23984lt;
    private pmi lud;
    private com.bytedance.sdk.component.lud.dj sya;

    /* renamed from: ul, reason: collision with root package name */
    private com.bytedance.sdk.component.lud.zb f23985ul;
    private ok ycx;

    /* renamed from: zb, reason: collision with root package name */
    private ExecutorService f23986zb;

    public static class ycx {

        /* renamed from: dj, reason: collision with root package name */
        private wie f23987dj;
        private htf fby;

        /* renamed from: jc, reason: collision with root package name */
        private boolean f23988jc;

        /* renamed from: jw, reason: collision with root package name */
        private thx f23989jw;

        /* renamed from: lt, reason: collision with root package name */
        private com.bytedance.sdk.component.lud.sya f23990lt;
        private pmi lud;
        private com.bytedance.sdk.component.lud.dj sya;

        /* renamed from: ul, reason: collision with root package name */
        private com.bytedance.sdk.component.lud.zb f23991ul;
        private ok ycx;

        /* renamed from: zb, reason: collision with root package name */
        private ExecutorService f23992zb;

        public ycx ycx(com.bytedance.sdk.component.lud.zb zbVar) {
            this.f23991ul = zbVar;
            return this;
        }

        public ycx ycx(boolean z11) {
            this.f23988jc = z11;
            return this;
        }

        public ycx ycx(thx thxVar) {
            this.f23989jw = thxVar;
            return this;
        }

        public ycx ycx(htf htfVar) {
            this.fby = htfVar;
            return this;
        }

        public ycx ycx(com.bytedance.sdk.component.lud.dj djVar) {
            this.sya = djVar;
            return this;
        }

        public lud ycx() {
            return new lud(this);
        }
    }

    @Override // com.bytedance.sdk.component.lud.ry
    public com.bytedance.sdk.component.lud.sya dj() {
        return this.f23984lt;
    }

    @Override // com.bytedance.sdk.component.lud.ry
    public thx lt() {
        return this.f23983jw;
    }

    @Override // com.bytedance.sdk.component.lud.ry
    public com.bytedance.sdk.component.lud.zb lud() {
        return this.f23985ul;
    }

    @Override // com.bytedance.sdk.component.lud.ry
    public com.bytedance.sdk.component.lud.dj sya() {
        return this.sya;
    }

    @Override // com.bytedance.sdk.component.lud.ry
    public boolean ul() {
        return this.f23982jc;
    }

    @Override // com.bytedance.sdk.component.lud.ry
    public ExecutorService ycx() {
        return this.f23986zb;
    }

    @Override // com.bytedance.sdk.component.lud.ry
    public htf zb() {
        return this.fby;
    }

    private lud(ycx ycxVar) {
        this.ycx = ycxVar.ycx;
        this.f23986zb = ycxVar.f23992zb;
        this.sya = ycxVar.sya;
        this.f23981dj = ycxVar.f23987dj;
        this.lud = ycxVar.lud;
        this.f23984lt = ycxVar.f23990lt;
        this.f23985ul = ycxVar.f23991ul;
        this.fby = ycxVar.fby;
        this.f23983jw = ycxVar.f23989jw;
        this.f23982jc = ycxVar.f23988jc;
    }

    public static lud ycx(Context context) {
        return new ycx().ycx();
    }
}
