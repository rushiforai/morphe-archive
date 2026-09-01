package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xqc {
    public static final xqc LIFETIME_EARNINGS_ASC;
    public static final xqc LIFETIME_EARNINGS_DESC;
    public static final xqc PUBLISHED_AT_ASC;
    public static final xqc PUBLISHED_AT_DESC;
    public static final xqc READ_COUNT_ASC;
    public static final xqc READ_COUNT_DESC;
    public static final xqc VIEW_COUNT_ASC;
    public static final xqc VIEW_COUNT_DESC;
    public static final /* synthetic */ xqc[] a;
    public static final /* synthetic */ i04 b;

    static {
        xqc xqcVar = new xqc("PUBLISHED_AT_DESC", 0);
        PUBLISHED_AT_DESC = xqcVar;
        xqc xqcVar2 = new xqc("PUBLISHED_AT_ASC", 1);
        PUBLISHED_AT_ASC = xqcVar2;
        xqc xqcVar3 = new xqc("READ_COUNT_DESC", 2);
        READ_COUNT_DESC = xqcVar3;
        xqc xqcVar4 = new xqc("READ_COUNT_ASC", 3);
        READ_COUNT_ASC = xqcVar4;
        xqc xqcVar5 = new xqc("VIEW_COUNT_DESC", 4);
        VIEW_COUNT_DESC = xqcVar5;
        xqc xqcVar6 = new xqc("VIEW_COUNT_ASC", 5);
        VIEW_COUNT_ASC = xqcVar6;
        xqc xqcVar7 = new xqc("LIFETIME_EARNINGS_DESC", 6);
        LIFETIME_EARNINGS_DESC = xqcVar7;
        xqc xqcVar8 = new xqc("LIFETIME_EARNINGS_ASC", 7);
        LIFETIME_EARNINGS_ASC = xqcVar8;
        xqc[] xqcVarArr = {xqcVar, xqcVar2, xqcVar3, xqcVar4, xqcVar5, xqcVar6, xqcVar7, xqcVar8};
        a = xqcVarArr;
        b = new i04(xqcVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static xqc valueOf(String str) {
        return (xqc) Enum.valueOf(xqc.class, str);
    }

    public static xqc[] values() {
        return (xqc[]) a.clone();
    }
}
