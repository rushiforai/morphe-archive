package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o32 {
    public final boolean a;
    public final Map b;
    public final aq0 c;
    public final v5e d;
    public final wz7 e;
    public final kv2 f;
    public final zp0 g;
    public final fm0 h;

    public o32(boolean z, Map map, aq0 aq0Var, v5e v5eVar, wz7 wz7Var, kv2 kv2Var, zp0 zp0Var, fm0 fm0Var) {
        aq0Var.getClass();
        v5eVar.getClass();
        kv2Var.getClass();
        zp0Var.getClass();
        this.a = z;
        this.b = map;
        this.c = aq0Var;
        this.d = v5eVar;
        this.e = wz7Var;
        this.f = kv2Var;
        this.g = zp0Var;
        this.h = fm0Var;
    }

    public static o32 a(o32 o32Var, aq0 aq0Var, v5e v5eVar, int i) {
        o32Var.getClass();
        boolean z = (i & 2) != 0 ? o32Var.a : true;
        Map map = o32Var.b;
        if ((i & 8) != 0) {
            aq0Var = o32Var.c;
        }
        aq0 aq0Var2 = aq0Var;
        if ((i & 16) != 0) {
            v5eVar = o32Var.d;
        }
        v5e v5eVar2 = v5eVar;
        o32Var.getClass();
        wz7 wz7Var = o32Var.e;
        o32Var.getClass();
        kv2 kv2Var = o32Var.f;
        zp0 zp0Var = o32Var.g;
        o32Var.getClass();
        fm0 fm0Var = o32Var.h;
        o32Var.getClass();
        o32Var.getClass();
        aq0Var2.getClass();
        v5eVar2.getClass();
        kv2Var.getClass();
        zp0Var.getClass();
        return new o32(z, map, aq0Var2, v5eVar2, wz7Var, kv2Var, zp0Var, fm0Var);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o32)) {
            return false;
        }
        o32 o32Var = (o32) obj;
        return this.a == o32Var.a && this.b.equals(o32Var.b) && this.c == o32Var.c && this.d == o32Var.d && this.e.equals(o32Var.e) && this.f == o32Var.f && this.g == o32Var.g && this.h.equals(o32Var.h);
    }

    public final int hashCode() {
        return (this.h.hashCode() + ((this.g.hashCode() + ((this.f.hashCode() + ((this.e.hashCode() + ((this.d.hashCode() + ((this.c.hashCode() + ((this.b.hashCode() + ((38347 + (this.a ? 1231 : 1237)) * 31)) * 31)) * 31)) * 961)) * 961)) * 31)) * 961)) * 31;
    }

    public final String toString() {
        return "Core(needsClearTextHttp=false, enableDeveloperModeWhenDebuggable=" + this.a + ", firstPartyHostsWithHeaderTypes=" + this.b + ", batchSize=" + this.c + ", uploadFrequency=" + this.d + ", proxy=null, proxyAuth=" + this.e + ", encryption=null, site=" + this.f + ", batchProcessingLevel=" + this.g + ", persistenceStrategyFactory=null, backpressureStrategy=" + this.h + ", uploadSchedulerStrategy=null)";
    }
}
