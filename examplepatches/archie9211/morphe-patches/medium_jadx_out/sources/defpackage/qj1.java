package defpackage;

import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class qj1 extends hj5 {
    public float n0;
    public final HashMap o0;
    public final HashMap p0;
    public final HashMap q0;
    public HashMap r0;
    public HashMap s0;
    public lpc t0;

    public qj1(qpc qpcVar, opc opcVar) {
        super(qpcVar, opcVar);
        this.n0 = 0.5f;
        this.o0 = new HashMap();
        this.p0 = new HashMap();
        this.q0 = new HashMap();
        this.t0 = lpc.SPREAD;
    }

    public final float t(String str) {
        HashMap map = this.s0;
        if (map == null || !map.containsKey(str)) {
            return 0.0f;
        }
        return ((Float) this.s0.get(str)).floatValue();
    }

    public final float u(String str) {
        HashMap map = this.q0;
        if (map.containsKey(str)) {
            return ((Float) map.get(str)).floatValue();
        }
        return 0.0f;
    }

    public final float v(String str) {
        HashMap map = this.r0;
        if (map == null || !map.containsKey(str)) {
            return 0.0f;
        }
        return ((Float) this.r0.get(str)).floatValue();
    }

    public final float w(String str) {
        HashMap map = this.p0;
        if (map.containsKey(str)) {
            return ((Float) map.get(str)).floatValue();
        }
        return 0.0f;
    }
}
