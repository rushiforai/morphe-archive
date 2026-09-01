package defpackage;

import j$.util.concurrent.ConcurrentHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mb6 implements kud {
    public static final lb6 c;
    public static final lb6 d;
    public final o72 a;
    public final ConcurrentHashMap b = new ConcurrentHashMap();

    static {
        int i = 0;
        c = new lb6(i);
        d = new lb6(i);
    }

    public mb6(o72 o72Var) {
        this.a = o72Var;
    }

    @Override // defpackage.kud
    public final jud a(ch5 ch5Var, kxd kxdVar) {
        kb6 kb6Var = (kb6) kxdVar.c().getAnnotation(kb6.class);
        if (kb6Var == null) {
            return null;
        }
        return b(this.a, ch5Var, kxdVar, kb6Var, true);
    }

    public final jud b(o72 o72Var, ch5 ch5Var, kxd kxdVar, kb6 kb6Var, boolean z) {
        jud judVarA;
        Object objG = o72Var.c(kxd.a(kb6Var.value()), true).g();
        boolean zNullSafe = kb6Var.nullSafe();
        if (objG instanceof jud) {
            judVarA = (jud) objG;
        } else if (objG instanceof kud) {
            kud kudVar = (kud) objG;
            if (z) {
                kud kudVar2 = (kud) this.b.putIfAbsent(kxdVar.c(), kudVar);
                if (kudVar2 != null) {
                    kudVar = kudVar2;
                }
            }
            judVarA = kudVar.a(ch5Var, kxdVar);
        } else {
            if (!(objG instanceof ac6)) {
                throw new IllegalArgumentException("Invalid attempt to bind an instance of " + objG.getClass().getName() + " as a @JsonAdapter for " + kxdVar.toString() + ". @JsonAdapter value must be a TypeAdapter, TypeAdapterFactory, JsonSerializer or JsonDeserializer.");
            }
            wsd wsdVar = new wsd((ac6) objG, ch5Var, kxdVar, z ? c : d, zNullSafe);
            zNullSafe = false;
            judVarA = wsdVar;
        }
        return (judVarA == null || !zNullSafe) ? judVarA : judVarA.a();
    }
}
