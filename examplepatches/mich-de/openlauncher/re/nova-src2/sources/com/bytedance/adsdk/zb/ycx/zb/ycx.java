package com.bytedance.adsdk.zb.ycx.zb;

import a2.c;
import android.view.animation.Interpolator;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public abstract class ycx<K, A> {
    private final sya<K> lud;
    protected com.bytedance.adsdk.zb.ul.zb<A> sya;
    final List<InterfaceC0028ycx> ycx = new ArrayList(1);

    /* renamed from: dj, reason: collision with root package name */
    private boolean f23266dj = false;

    /* renamed from: zb, reason: collision with root package name */
    protected float f23269zb = 0.0f;

    /* renamed from: lt, reason: collision with root package name */
    private A f23267lt = null;

    /* renamed from: ul, reason: collision with root package name */
    private float f23268ul = -1.0f;
    private float fby = -1.0f;

    public static final class dj<T> implements sya<T> {
        private final List<? extends com.bytedance.adsdk.zb.ul.ycx<T>> ycx;
        private com.bytedance.adsdk.zb.ul.ycx<T> sya = null;

        /* renamed from: dj, reason: collision with root package name */
        private float f23270dj = -1.0f;

        /* renamed from: zb, reason: collision with root package name */
        private com.bytedance.adsdk.zb.ul.ycx<T> f23271zb = sya(0.0f);

        public dj(List<? extends com.bytedance.adsdk.zb.ul.ycx<T>> list) {
            this.ycx = list;
        }

        private com.bytedance.adsdk.zb.ul.ycx<T> sya(float f11) {
            com.bytedance.adsdk.zb.ul.ycx<T> ycxVar = (com.bytedance.adsdk.zb.ul.ycx) c.e(1, this.ycx);
            if (f11 >= ycxVar.sya()) {
                return ycxVar;
            }
            for (int size = this.ycx.size() - 2; size > 0; size--) {
                com.bytedance.adsdk.zb.ul.ycx<T> ycxVar2 = this.ycx.get(size);
                if (this.f23271zb != ycxVar2 && ycxVar2.ycx(f11)) {
                    return ycxVar2;
                }
            }
            return this.ycx.get(0);
        }

        @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.sya
        public float dj() {
            return ((com.bytedance.adsdk.zb.ul.ycx) c.e(1, this.ycx)).dj();
        }

        @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.sya
        public boolean ycx() {
            return false;
        }

        @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.sya
        public com.bytedance.adsdk.zb.ul.ycx<T> zb() {
            return this.f23271zb;
        }

        @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.sya
        public boolean ycx(float f11) {
            if (this.f23271zb.ycx(f11)) {
                return !this.f23271zb.lud();
            }
            this.f23271zb = sya(f11);
            return true;
        }

        @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.sya
        public boolean zb(float f11) {
            com.bytedance.adsdk.zb.ul.ycx<T> ycxVar = this.sya;
            com.bytedance.adsdk.zb.ul.ycx<T> ycxVar2 = this.f23271zb;
            if (ycxVar == ycxVar2 && this.f23270dj == f11) {
                return true;
            }
            this.sya = ycxVar2;
            this.f23270dj = f11;
            return false;
        }

        @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.sya
        public float sya() {
            return this.ycx.get(0).sya();
        }
    }

    public static final class lud<T> implements sya<T> {
        private final com.bytedance.adsdk.zb.ul.ycx<T> ycx;

        /* renamed from: zb, reason: collision with root package name */
        private float f23272zb = -1.0f;

        public lud(List<? extends com.bytedance.adsdk.zb.ul.ycx<T>> list) {
            this.ycx = list.get(0);
        }

        @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.sya
        public float dj() {
            return this.ycx.dj();
        }

        @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.sya
        public float sya() {
            return this.ycx.sya();
        }

        @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.sya
        public boolean ycx() {
            return false;
        }

        @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.sya
        public com.bytedance.adsdk.zb.ul.ycx<T> zb() {
            return this.ycx;
        }

        @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.sya
        public boolean ycx(float f11) {
            return !this.ycx.lud();
        }

        @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.sya
        public boolean zb(float f11) {
            if (this.f23272zb == f11) {
                return true;
            }
            this.f23272zb = f11;
            return false;
        }
    }

    public interface sya<T> {
        float dj();

        float sya();

        boolean ycx();

        boolean ycx(float f11);

        com.bytedance.adsdk.zb.ul.ycx<T> zb();

        boolean zb(float f11);
    }

    /* renamed from: com.bytedance.adsdk.zb.ycx.zb.ycx$ycx, reason: collision with other inner class name */
    public interface InterfaceC0028ycx {
        void ycx();
    }

    public static final class zb<T> implements sya<T> {
        private zb() {
        }

        @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.sya
        public float dj() {
            return 1.0f;
        }

        @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.sya
        public float sya() {
            return 0.0f;
        }

        @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.sya
        public boolean ycx() {
            return true;
        }

        @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.sya
        public com.bytedance.adsdk.zb.ul.ycx<T> zb() {
            throw new IllegalStateException("not implemented");
        }

        @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.sya
        public boolean ycx(float f11) {
            return false;
        }

        @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.sya
        public boolean zb(float f11) {
            throw new IllegalStateException("not implemented");
        }
    }

    public ycx(List<? extends com.bytedance.adsdk.zb.ul.ycx<K>> list) {
        this.lud = ycx(list);
    }

    private float jw() {
        if (this.f23268ul == -1.0f) {
            this.f23268ul = this.lud.sya();
        }
        return this.f23268ul;
    }

    public float dj() {
        if (this.f23266dj) {
            return 0.0f;
        }
        com.bytedance.adsdk.zb.ul.ycx<K> ycxVarSya = sya();
        if (ycxVarSya.lud()) {
            return 0.0f;
        }
        return (this.f23269zb - ycxVarSya.sya()) / (ycxVarSya.dj() - ycxVarSya.sya());
    }

    public float fby() {
        return this.f23269zb;
    }

    public float lt() {
        if (this.fby == -1.0f) {
            this.fby = this.lud.dj();
        }
        return this.fby;
    }

    public float lud() {
        com.bytedance.adsdk.zb.ul.ycx<K> ycxVarSya = sya();
        if (ycxVarSya == null || ycxVarSya.lud()) {
            return 0.0f;
        }
        return ycxVarSya.sya.getInterpolation(dj());
    }

    public com.bytedance.adsdk.zb.ul.ycx<K> sya() {
        com.bytedance.adsdk.zb.lud.ycx("BaseKeyframeAnimation#getCurrentKeyframe");
        com.bytedance.adsdk.zb.ul.ycx<K> ycxVarZb = this.lud.zb();
        com.bytedance.adsdk.zb.lud.zb("BaseKeyframeAnimation#getCurrentKeyframe");
        return ycxVarZb;
    }

    public A ul() {
        float fDj = dj();
        if (this.sya == null && this.lud.zb(fDj)) {
            return this.f23267lt;
        }
        com.bytedance.adsdk.zb.ul.ycx<K> ycxVarSya = sya();
        Interpolator interpolator = ycxVarSya.f23129dj;
        A aYcx = (interpolator == null || ycxVarSya.lud == null) ? ycx(ycxVarSya, lud()) : ycx(ycxVarSya, fDj, interpolator.getInterpolation(fDj), ycxVarSya.lud.getInterpolation(fDj));
        this.f23267lt = aYcx;
        return aYcx;
    }

    public abstract A ycx(com.bytedance.adsdk.zb.ul.ycx<K> ycxVar, float f11);

    public void ycx() {
        this.f23266dj = true;
    }

    public void zb() {
        for (int i5 = 0; i5 < this.ycx.size(); i5++) {
            this.ycx.get(i5).ycx();
        }
    }

    public void ycx(InterfaceC0028ycx interfaceC0028ycx) {
        this.ycx.add(interfaceC0028ycx);
    }

    public void ycx(float f11) {
        if (this.lud.ycx()) {
            return;
        }
        if (f11 < jw()) {
            f11 = jw();
        } else if (f11 > lt()) {
            f11 = lt();
        }
        if (f11 == this.f23269zb) {
            return;
        }
        this.f23269zb = f11;
        if (this.lud.ycx(f11)) {
            zb();
        }
    }

    public A ycx(com.bytedance.adsdk.zb.ul.ycx<K> ycxVar, float f11, float f12, float f13) {
        throw new UnsupportedOperationException("This animation does not support split dimensions!");
    }

    private static <T> sya<T> ycx(List<? extends com.bytedance.adsdk.zb.ul.ycx<T>> list) {
        if (list.isEmpty()) {
            return new zb();
        }
        if (list.size() == 1) {
            return new lud(list);
        }
        return new dj(list);
    }
}
