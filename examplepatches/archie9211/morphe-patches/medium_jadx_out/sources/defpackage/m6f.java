package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m6f {
    public static final m6f BOOLEAN;
    public static final m6f BYTE_STRING;
    public static final m6f DOUBLE;
    public static final m6f ENUM;
    public static final m6f FLOAT;
    public static final m6f INT;
    public static final m6f LONG;
    public static final m6f MESSAGE;
    public static final m6f STRING;
    public static final /* synthetic */ m6f[] a;

    static {
        m6f m6fVar = new m6f("INT", 0);
        INT = m6fVar;
        m6f m6fVar2 = new m6f("LONG", 1);
        LONG = m6fVar2;
        m6f m6fVar3 = new m6f("FLOAT", 2);
        FLOAT = m6fVar3;
        m6f m6fVar4 = new m6f("DOUBLE", 3);
        DOUBLE = m6fVar4;
        m6f m6fVar5 = new m6f("BOOLEAN", 4);
        BOOLEAN = m6fVar5;
        m6f m6fVar6 = new m6f("STRING", 5);
        STRING = m6fVar6;
        c21 c21Var = f21.b;
        m6f m6fVar7 = new m6f("BYTE_STRING", 6);
        BYTE_STRING = m6fVar7;
        m6f m6fVar8 = new m6f("ENUM", 7);
        ENUM = m6fVar8;
        m6f m6fVar9 = new m6f("MESSAGE", 8);
        MESSAGE = m6fVar9;
        a = new m6f[]{m6fVar, m6fVar2, m6fVar3, m6fVar4, m6fVar5, m6fVar6, m6fVar7, m6fVar8, m6fVar9};
    }

    public static m6f valueOf(String str) {
        return (m6f) Enum.valueOf(m6f.class, str);
    }

    public static m6f[] values() {
        return (m6f[]) a.clone();
    }
}
