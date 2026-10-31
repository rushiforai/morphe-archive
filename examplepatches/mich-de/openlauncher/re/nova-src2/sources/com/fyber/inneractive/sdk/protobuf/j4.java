package com.fyber.inneractive.sdk.protobuf;

/* JADX WARN: Enum visitor error
jadx.core.utils.exceptions.JadxRuntimeException: Init of enum field 'INT64' uses external variables
	at jadx.core.dex.visitors.EnumVisitor.createEnumFieldByConstructor(EnumVisitor.java:451)
	at jadx.core.dex.visitors.EnumVisitor.processEnumFieldByRegister(EnumVisitor.java:395)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromFilledArray(EnumVisitor.java:324)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromInsn(EnumVisitor.java:262)
	at jadx.core.dex.visitors.EnumVisitor.convertToEnum(EnumVisitor.java:151)
	at jadx.core.dex.visitors.EnumVisitor.visit(EnumVisitor.java:100)
 */
/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* loaded from: classes3.dex */
public class j4 {
    private static final /* synthetic */ j4[] $VALUES;
    public static final j4 BOOL;
    public static final j4 BYTES;
    public static final j4 DOUBLE;
    public static final j4 ENUM;
    public static final j4 FIXED32;
    public static final j4 FIXED64;
    public static final j4 FLOAT;
    public static final j4 GROUP;
    public static final j4 INT32;
    public static final j4 INT64;
    public static final j4 MESSAGE;
    public static final j4 SFIXED32;
    public static final j4 SFIXED64;
    public static final j4 SINT32;
    public static final j4 SINT64;
    public static final j4 STRING;
    public static final j4 UINT32;
    public static final j4 UINT64;
    private final k4 javaType;
    private final int wireType;

    static {
        j4 j4Var = new j4("DOUBLE", 0, k4.DOUBLE, 1);
        DOUBLE = j4Var;
        j4 j4Var2 = new j4("FLOAT", 1, k4.FLOAT, 5);
        FLOAT = j4Var2;
        k4 k4Var = k4.LONG;
        j4 j4Var3 = new j4("INT64", 2, k4Var, 0);
        INT64 = j4Var3;
        j4 j4Var4 = new j4("UINT64", 3, k4Var, 0);
        UINT64 = j4Var4;
        k4 k4Var2 = k4.INT;
        j4 j4Var5 = new j4("INT32", 4, k4Var2, 0);
        INT32 = j4Var5;
        j4 j4Var6 = new j4("FIXED64", 5, k4Var, 1);
        FIXED64 = j4Var6;
        j4 j4Var7 = new j4("FIXED32", 6, k4Var2, 5);
        FIXED32 = j4Var7;
        j4 j4Var8 = new j4("BOOL", 7, k4.BOOLEAN, 0);
        BOOL = j4Var8;
        f4 f4Var = new f4(k4.STRING);
        STRING = f4Var;
        final k4 k4Var3 = k4.MESSAGE;
        j4 j4Var9 = new j4(k4Var3) { // from class: com.fyber.inneractive.sdk.protobuf.g4
            @Override // com.fyber.inneractive.sdk.protobuf.j4
            public final boolean c() {
                return false;
            }
        };
        GROUP = j4Var9;
        j4 j4Var10 = new j4(k4Var3) { // from class: com.fyber.inneractive.sdk.protobuf.h4
            @Override // com.fyber.inneractive.sdk.protobuf.j4
            public final boolean c() {
                return false;
            }
        };
        MESSAGE = j4Var10;
        final k4 k4Var4 = k4.BYTE_STRING;
        j4 j4Var11 = new j4(k4Var4) { // from class: com.fyber.inneractive.sdk.protobuf.i4
            @Override // com.fyber.inneractive.sdk.protobuf.j4
            public final boolean c() {
                return false;
            }
        };
        BYTES = j4Var11;
        j4 j4Var12 = new j4("UINT32", 12, k4Var2, 0);
        UINT32 = j4Var12;
        j4 j4Var13 = new j4("ENUM", 13, k4.ENUM, 0);
        ENUM = j4Var13;
        j4 j4Var14 = new j4("SFIXED32", 14, k4Var2, 5);
        SFIXED32 = j4Var14;
        j4 j4Var15 = new j4("SFIXED64", 15, k4Var, 1);
        SFIXED64 = j4Var15;
        j4 j4Var16 = new j4("SINT32", 16, k4Var2, 0);
        SINT32 = j4Var16;
        j4 j4Var17 = new j4("SINT64", 17, k4Var, 0);
        SINT64 = j4Var17;
        $VALUES = new j4[]{j4Var, j4Var2, j4Var3, j4Var4, j4Var5, j4Var6, j4Var7, j4Var8, f4Var, j4Var9, j4Var10, j4Var11, j4Var12, j4Var13, j4Var14, j4Var15, j4Var16, j4Var17};
    }

    public j4(String str, int i5, k4 k4Var, int i11) {
        this.javaType = k4Var;
        this.wireType = i11;
    }

    public static j4 valueOf(String str) {
        return (j4) Enum.valueOf(j4.class, str);
    }

    public static j4[] values() {
        return (j4[]) $VALUES.clone();
    }

    public final k4 a() {
        return this.javaType;
    }

    public final int b() {
        return this.wireType;
    }

    public boolean c() {
        return !(this instanceof f4);
    }

    public j4(String str, int i5, k4 k4Var, int i11, int i12) {
        this.javaType = k4Var;
        this.wireType = i11;
    }
}
