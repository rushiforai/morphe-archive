package com.bytedance.sdk.openadsdk.dj.lud.zb;

import com.bykv.vk.openvk.ycx.ycx.ycx.sya.a;
import com.bykv.vk.openvk.ycx.ycx.ycx.sya.b;
import com.bytedance.sdk.openadsdk.core.model.tn;

/* loaded from: classes2.dex */
public class syc {

    /* renamed from: dj, reason: collision with root package name */
    private a f26546dj;
    private tn lud;
    private int sya;
    private long ycx;

    /* renamed from: zb, reason: collision with root package name */
    private String f26547zb;

    public static class ycx {

        /* renamed from: dj, reason: collision with root package name */
        private boolean f26548dj;

        /* renamed from: ea, reason: collision with root package name */
        private int f26549ea;
        private int fby;

        /* renamed from: jc, reason: collision with root package name */
        private int f26550jc;

        /* renamed from: jw, reason: collision with root package name */
        private int f26551jw;
        private boolean lud;

        /* renamed from: ok, reason: collision with root package name */
        private int f26553ok;
        private b xkz;
        private long ycx = 0;

        /* renamed from: zb, reason: collision with root package name */
        private long f26556zb = 0;
        private long sya = 0;

        /* renamed from: lt, reason: collision with root package name */
        private long f26552lt = 0;

        /* renamed from: ul, reason: collision with root package name */
        private boolean f26555ul = false;

        /* renamed from: ry, reason: collision with root package name */
        private boolean f26554ry = false;

        private void dy() {
            long j11 = this.sya;
            if (j11 > 0) {
                long j12 = this.ycx;
                if (j12 > j11) {
                    long j13 = j12 % j11;
                    this.ycx = j13;
                    if (j13 == 0) {
                        this.ycx = j11;
                    }
                }
            }
        }

        public long dj() {
            return this.sya;
        }

        public boolean ea() {
            return this.f26554ry;
        }

        public int fby() {
            return this.f26550jc;
        }

        public int jc() {
            return this.f26553ok;
        }

        public int jw() {
            return this.f26549ea;
        }

        public int lt() {
            return this.f26551jw;
        }

        public int lud() {
            return this.fby;
        }

        public boolean ok() {
            return this.f26555ul;
        }

        public b ry() {
            return this.xkz;
        }

        public long sya() {
            return this.f26556zb;
        }

        public boolean syc() {
            return this.lud;
        }

        public int ul() {
            long j11 = this.sya;
            if (j11 <= 0) {
                return 0;
            }
            return Math.min((int) ((this.ycx * 100) / j11), 100);
        }

        public boolean xkz() {
            return this.f26548dj;
        }

        public long ycx() {
            return this.f26552lt;
        }

        public long zb() {
            return this.ycx;
        }

        public void dj(long j11) {
            this.sya = j11;
            dy();
        }

        public void sya(long j11) {
            this.f26556zb = j11;
        }

        public void ycx(long j11) {
            this.f26552lt = j11;
        }

        public void zb(long j11) {
            this.ycx = j11;
            dy();
        }

        public void sya(int i5) {
            this.f26550jc = i5;
        }

        public void ycx(int i5) {
            this.fby = i5;
        }

        public void dj(int i5) {
            this.f26553ok = i5;
        }

        public void sya(boolean z11) {
            this.lud = z11;
        }

        public void ycx(boolean z11) {
            this.f26555ul = z11;
        }

        public void zb(int i5) {
            this.f26551jw = i5;
        }

        public void ycx(b bVar) {
            this.xkz = bVar;
        }

        public void zb(boolean z11) {
            this.f26548dj = z11;
        }
    }

    public syc(long j11, String str, int i5, a aVar, tn tnVar) {
        this.ycx = j11;
        this.f26547zb = str;
        this.sya = i5;
        this.f26546dj = aVar;
        this.lud = tnVar;
    }

    public a dj() {
        return this.f26546dj;
    }

    public tn lud() {
        return this.lud;
    }

    public int sya() {
        return this.sya;
    }

    public long ycx() {
        return this.ycx;
    }

    public String zb() {
        return this.f26547zb;
    }
}
