package defpackage;

import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class o6f {
    public static final o6f BOOLEAN;
    public static final o6f BYTE_STRING;
    public static final o6f DOUBLE;
    public static final o6f ENUM;
    public static final o6f FLOAT;
    public static final o6f INT;
    public static final o6f LONG;
    public static final o6f MESSAGE;
    public static final o6f STRING;
    public static final /* synthetic */ o6f[] a;

    public static o6f valueOf(String str) {
        return (o6f) Enum.valueOf(o6f.class, str);
    }

    public static o6f[] values() {
        return (o6f[]) a.clone();
    }

    static {
        o6f o6fVar = new o6f(mBTDfueQiGWRV.zUS, 0);
        INT = o6fVar;
        o6f o6fVar2 = new o6f("LONG", 1);
        LONG = o6fVar2;
        o6f o6fVar3 = new o6f("FLOAT", 2);
        FLOAT = o6fVar3;
        o6f o6fVar4 = new o6f("DOUBLE", 3);
        DOUBLE = o6fVar4;
        o6f o6fVar5 = new o6f("BOOLEAN", 4);
        BOOLEAN = o6fVar5;
        o6f o6fVar6 = new o6f("STRING", 5);
        STRING = o6fVar6;
        d21 d21Var = d21.c;
        o6f o6fVar7 = new o6f("BYTE_STRING", 6);
        BYTE_STRING = o6fVar7;
        o6f o6fVar8 = new o6f("ENUM", 7);
        ENUM = o6fVar8;
        o6f o6fVar9 = new o6f("MESSAGE", 8);
        MESSAGE = o6fVar9;
        a = new o6f[]{o6fVar, o6fVar2, o6fVar3, o6fVar4, o6fVar5, o6fVar6, o6fVar7, o6fVar8, o6fVar9};
    }
}
