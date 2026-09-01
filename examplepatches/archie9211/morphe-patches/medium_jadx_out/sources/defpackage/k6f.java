package defpackage;

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
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class k6f {
    public static final k6f BOOL;
    public static final k6f BYTES;
    public static final k6f DOUBLE;
    public static final k6f ENUM;
    public static final k6f FIXED32;
    public static final k6f FIXED64;
    public static final k6f FLOAT;
    public static final k6f GROUP;
    public static final k6f INT32;
    public static final k6f INT64;
    public static final k6f MESSAGE;
    public static final k6f SFIXED32;
    public static final k6f SFIXED64;
    public static final k6f SINT32;
    public static final k6f SINT64;
    public static final k6f STRING;
    public static final k6f UINT32;
    public static final k6f UINT64;
    public static final /* synthetic */ k6f[] c;
    public final n6f a;
    public final int b;

    static {
        k6f k6fVar = new k6f("DOUBLE", 0, n6f.DOUBLE, 1);
        DOUBLE = k6fVar;
        k6f k6fVar2 = new k6f("FLOAT", 1, n6f.FLOAT, 5);
        FLOAT = k6fVar2;
        n6f n6fVar = n6f.LONG;
        k6f k6fVar3 = new k6f("INT64", 2, n6fVar, 0);
        INT64 = k6fVar3;
        k6f k6fVar4 = new k6f("UINT64", 3, n6fVar, 0);
        UINT64 = k6fVar4;
        n6f n6fVar2 = n6f.INT;
        k6f k6fVar5 = new k6f("INT32", 4, n6fVar2, 0);
        INT32 = k6fVar5;
        k6f k6fVar6 = new k6f("FIXED64", 5, n6fVar, 1);
        FIXED64 = k6fVar6;
        k6f k6fVar7 = new k6f("FIXED32", 6, n6fVar2, 5);
        FIXED32 = k6fVar7;
        k6f k6fVar8 = new k6f("BOOL", 7, n6f.BOOLEAN, 0);
        BOOL = k6fVar8;
        y5f y5fVar = new y5f("STRING", 8, n6f.STRING, 2);
        STRING = y5fVar;
        n6f n6fVar3 = n6f.MESSAGE;
        b6f b6fVar = new b6f("GROUP", 9, n6fVar3, 3);
        GROUP = b6fVar;
        e6f e6fVar = new e6f("MESSAGE", 10, n6fVar3, 2);
        MESSAGE = e6fVar;
        h6f h6fVar = new h6f("BYTES", 11, n6f.BYTE_STRING, 2);
        BYTES = h6fVar;
        k6f k6fVar9 = new k6f("UINT32", 12, n6fVar2, 0);
        UINT32 = k6fVar9;
        k6f k6fVar10 = new k6f("ENUM", 13, n6f.ENUM, 0);
        ENUM = k6fVar10;
        k6f k6fVar11 = new k6f("SFIXED32", 14, n6fVar2, 5);
        SFIXED32 = k6fVar11;
        k6f k6fVar12 = new k6f("SFIXED64", 15, n6fVar, 1);
        SFIXED64 = k6fVar12;
        k6f k6fVar13 = new k6f("SINT32", 16, n6fVar2, 0);
        SINT32 = k6fVar13;
        k6f k6fVar14 = new k6f("SINT64", 17, n6fVar, 0);
        SINT64 = k6fVar14;
        c = new k6f[]{k6fVar, k6fVar2, k6fVar3, k6fVar4, k6fVar5, k6fVar6, k6fVar7, k6fVar8, y5fVar, b6fVar, e6fVar, h6fVar, k6fVar9, k6fVar10, k6fVar11, k6fVar12, k6fVar13, k6fVar14};
    }

    public k6f(String str, int i, n6f n6fVar, int i2) {
        this.a = n6fVar;
        this.b = i2;
    }

    public static k6f valueOf(String str) {
        return (k6f) Enum.valueOf(k6f.class, str);
    }

    public static k6f[] values() {
        return (k6f[]) c.clone();
    }

    public n6f getJavaType() {
        return this.a;
    }

    public int getWireType() {
        return this.b;
    }

    public boolean isPackable() {
        return true;
    }
}
