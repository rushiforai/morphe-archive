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
/* JADX INFO: loaded from: classes.dex */
public class j6f {
    public static final j6f BOOL;
    public static final j6f BYTES;
    public static final j6f DOUBLE;
    public static final j6f ENUM;
    public static final j6f FIXED32;
    public static final j6f FIXED64;
    public static final j6f FLOAT;
    public static final j6f GROUP;
    public static final j6f INT32;
    public static final j6f INT64;
    public static final j6f MESSAGE;
    public static final j6f SFIXED32;
    public static final j6f SFIXED64;
    public static final j6f SINT32;
    public static final j6f SINT64;
    public static final j6f STRING;
    public static final j6f UINT32;
    public static final j6f UINT64;
    public static final /* synthetic */ j6f[] c;
    public final m6f a;
    public final int b;

    static {
        j6f j6fVar = new j6f("DOUBLE", 0, m6f.DOUBLE, 1);
        DOUBLE = j6fVar;
        j6f j6fVar2 = new j6f("FLOAT", 1, m6f.FLOAT, 5);
        FLOAT = j6fVar2;
        m6f m6fVar = m6f.LONG;
        j6f j6fVar3 = new j6f("INT64", 2, m6fVar, 0);
        INT64 = j6fVar3;
        j6f j6fVar4 = new j6f("UINT64", 3, m6fVar, 0);
        UINT64 = j6fVar4;
        m6f m6fVar2 = m6f.INT;
        j6f j6fVar5 = new j6f("INT32", 4, m6fVar2, 0);
        INT32 = j6fVar5;
        j6f j6fVar6 = new j6f("FIXED64", 5, m6fVar, 1);
        FIXED64 = j6fVar6;
        j6f j6fVar7 = new j6f("FIXED32", 6, m6fVar2, 5);
        FIXED32 = j6fVar7;
        j6f j6fVar8 = new j6f("BOOL", 7, m6f.BOOLEAN, 0);
        BOOL = j6fVar8;
        x5f x5fVar = new x5f("STRING", 8, m6f.STRING, 2);
        STRING = x5fVar;
        m6f m6fVar3 = m6f.MESSAGE;
        a6f a6fVar = new a6f("GROUP", 9, m6fVar3, 3);
        GROUP = a6fVar;
        d6f d6fVar = new d6f("MESSAGE", 10, m6fVar3, 2);
        MESSAGE = d6fVar;
        g6f g6fVar = new g6f("BYTES", 11, m6f.BYTE_STRING, 2);
        BYTES = g6fVar;
        j6f j6fVar9 = new j6f("UINT32", 12, m6fVar2, 0);
        UINT32 = j6fVar9;
        j6f j6fVar10 = new j6f("ENUM", 13, m6f.ENUM, 0);
        ENUM = j6fVar10;
        j6f j6fVar11 = new j6f("SFIXED32", 14, m6fVar2, 5);
        SFIXED32 = j6fVar11;
        j6f j6fVar12 = new j6f("SFIXED64", 15, m6fVar, 1);
        SFIXED64 = j6fVar12;
        j6f j6fVar13 = new j6f("SINT32", 16, m6fVar2, 0);
        SINT32 = j6fVar13;
        j6f j6fVar14 = new j6f("SINT64", 17, m6fVar, 0);
        SINT64 = j6fVar14;
        c = new j6f[]{j6fVar, j6fVar2, j6fVar3, j6fVar4, j6fVar5, j6fVar6, j6fVar7, j6fVar8, x5fVar, a6fVar, d6fVar, g6fVar, j6fVar9, j6fVar10, j6fVar11, j6fVar12, j6fVar13, j6fVar14};
    }

    public j6f(String str, int i, m6f m6fVar, int i2) {
        this.a = m6fVar;
        this.b = i2;
    }

    public static j6f valueOf(String str) {
        return (j6f) Enum.valueOf(j6f.class, str);
    }

    public static j6f[] values() {
        return (j6f[]) c.clone();
    }

    public m6f getJavaType() {
        return this.a;
    }

    public int getWireType() {
        return this.b;
    }

    public boolean isPackable() {
        return true;
    }
}
