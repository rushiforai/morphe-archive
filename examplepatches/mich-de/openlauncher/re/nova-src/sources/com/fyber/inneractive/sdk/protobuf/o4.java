package com.fyber.inneractive.sdk.protobuf;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public abstract class o4 {
    private static final /* synthetic */ o4[] $VALUES;
    public static final o4 LAZY;
    public static final o4 LOOSE;
    public static final o4 STRICT;

    static {
        o4 o4Var = new o4() { // from class: com.fyber.inneractive.sdk.protobuf.l4
            @Override // com.fyber.inneractive.sdk.protobuf.o4
            public final Object a(w wVar) {
                return wVar.r();
            }
        };
        LOOSE = o4Var;
        o4 o4Var2 = new o4() { // from class: com.fyber.inneractive.sdk.protobuf.m4
            @Override // com.fyber.inneractive.sdk.protobuf.o4
            public final Object a(w wVar) {
                return wVar.s();
            }
        };
        STRICT = o4Var2;
        o4 o4Var3 = new o4() { // from class: com.fyber.inneractive.sdk.protobuf.n4
            @Override // com.fyber.inneractive.sdk.protobuf.o4
            public final Object a(w wVar) {
                return wVar.e();
            }
        };
        LAZY = o4Var3;
        $VALUES = new o4[]{o4Var, o4Var2, o4Var3};
    }

    public o4(String str, int i5) {
    }

    public static o4 valueOf(String str) {
        return (o4) Enum.valueOf(o4.class, str);
    }

    public static o4[] values() {
        return (o4[]) $VALUES.clone();
    }

    public abstract Object a(w wVar);
}
