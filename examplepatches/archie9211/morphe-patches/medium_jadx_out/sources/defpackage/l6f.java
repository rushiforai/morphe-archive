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
public class l6f {
    public static final l6f BOOL;
    public static final l6f BYTES;
    public static final l6f DOUBLE;
    public static final l6f ENUM;
    public static final l6f FIXED32;
    public static final l6f FIXED64;
    public static final l6f FLOAT;
    public static final l6f GROUP;
    public static final l6f INT32;
    public static final l6f INT64;
    public static final l6f MESSAGE;
    public static final l6f SFIXED32;
    public static final l6f SFIXED64;
    public static final l6f SINT32;
    public static final l6f SINT64;
    public static final l6f STRING;
    public static final l6f UINT32;
    public static final l6f UINT64;
    public static final /* synthetic */ l6f[] c;
    public final o6f a;
    public final int b;

    static {
        l6f l6fVar = new l6f("DOUBLE", 0, o6f.DOUBLE, 1);
        DOUBLE = l6fVar;
        l6f l6fVar2 = new l6f("FLOAT", 1, o6f.FLOAT, 5);
        FLOAT = l6fVar2;
        o6f o6fVar = o6f.LONG;
        l6f l6fVar3 = new l6f("INT64", 2, o6fVar, 0);
        INT64 = l6fVar3;
        l6f l6fVar4 = new l6f("UINT64", 3, o6fVar, 0);
        UINT64 = l6fVar4;
        o6f o6fVar2 = o6f.INT;
        l6f l6fVar5 = new l6f("INT32", 4, o6fVar2, 0);
        INT32 = l6fVar5;
        l6f l6fVar6 = new l6f("FIXED64", 5, o6fVar, 1);
        FIXED64 = l6fVar6;
        l6f l6fVar7 = new l6f("FIXED32", 6, o6fVar2, 5);
        FIXED32 = l6fVar7;
        l6f l6fVar8 = new l6f("BOOL", 7, o6f.BOOLEAN, 0);
        BOOL = l6fVar8;
        z5f z5fVar = new z5f("STRING", 8, o6f.STRING, 2);
        STRING = z5fVar;
        o6f o6fVar3 = o6f.MESSAGE;
        c6f c6fVar = new c6f("GROUP", 9, o6fVar3, 3);
        GROUP = c6fVar;
        f6f f6fVar = new f6f("MESSAGE", 10, o6fVar3, 2);
        MESSAGE = f6fVar;
        i6f i6fVar = new i6f("BYTES", 11, o6f.BYTE_STRING, 2);
        BYTES = i6fVar;
        l6f l6fVar9 = new l6f("UINT32", 12, o6fVar2, 0);
        UINT32 = l6fVar9;
        l6f l6fVar10 = new l6f("ENUM", 13, o6f.ENUM, 0);
        ENUM = l6fVar10;
        l6f l6fVar11 = new l6f("SFIXED32", 14, o6fVar2, 5);
        SFIXED32 = l6fVar11;
        l6f l6fVar12 = new l6f("SFIXED64", 15, o6fVar, 1);
        SFIXED64 = l6fVar12;
        l6f l6fVar13 = new l6f("SINT32", 16, o6fVar2, 0);
        SINT32 = l6fVar13;
        l6f l6fVar14 = new l6f("SINT64", 17, o6fVar, 0);
        SINT64 = l6fVar14;
        c = new l6f[]{l6fVar, l6fVar2, l6fVar3, l6fVar4, l6fVar5, l6fVar6, l6fVar7, l6fVar8, z5fVar, c6fVar, f6fVar, i6fVar, l6fVar9, l6fVar10, l6fVar11, l6fVar12, l6fVar13, l6fVar14};
    }

    public l6f(String str, int i, o6f o6fVar, int i2) {
        this.a = o6fVar;
        this.b = i2;
    }

    public static l6f valueOf(String str) {
        return (l6f) Enum.valueOf(l6f.class, str);
    }

    public static l6f[] values() {
        return (l6f[]) c.clone();
    }

    public o6f getJavaType() {
        return this.a;
    }

    public int getWireType() {
        return this.b;
    }

    public boolean isPackable() {
        return true;
    }
}
