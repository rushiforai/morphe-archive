package defpackage;

import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum x0a {
    BOOLEAN("Boolean"),
    CHAR("Char"),
    BYTE("Byte"),
    SHORT("Short"),
    INT("Int"),
    FLOAT("Float"),
    LONG("Long"),
    DOUBLE("Double");

    public static final w0a Companion;
    public static final Set<x0a> NUMBER_TYPES;
    public final n98 a;
    public final n98 b;
    public final vq6 c;
    public final vq6 d;

    static {
        x0a x0aVar = CHAR;
        x0a x0aVar2 = BYTE;
        x0a x0aVar3 = SHORT;
        x0a x0aVar4 = INT;
        x0a x0aVar5 = FLOAT;
        x0a x0aVar6 = LONG;
        x0a x0aVar7 = DOUBLE;
        Companion = new w0a();
        NUMBER_TYPES = k80.S0(new x0a[]{x0aVar, x0aVar2, x0aVar3, x0aVar4, x0aVar5, x0aVar6, x0aVar7});
    }

    x0a(String str) {
        this.a = n98.e(str);
        this.b = n98.e(str.concat("Array"));
        yw6 yw6Var = yw6.PUBLICATION;
        this.c = vx0.d0(yw6Var, new v0a(this, 0));
        this.d = vx0.d0(yw6Var, new v0a(this, 1));
    }

    public final y05 getArrayTypeFqName() {
        return (y05) this.d.getValue();
    }

    public final n98 getArrayTypeName() {
        return this.b;
    }

    public final y05 getTypeFqName() {
        return (y05) this.c.getValue();
    }

    public final n98 getTypeName() {
        return this.a;
    }
}
