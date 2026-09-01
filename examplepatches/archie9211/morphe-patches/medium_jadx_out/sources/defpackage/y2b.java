package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class y2b {
    public static final y2b CANON_EQ;
    public static final y2b COMMENTS;
    public static final y2b DOT_MATCHES_ALL;
    public static final y2b IGNORE_CASE;
    public static final y2b LITERAL;
    public static final y2b MULTILINE;
    public static final y2b UNIX_LINES;
    public static final /* synthetic */ y2b[] c;
    public static final /* synthetic */ i04 d;
    public final int a;
    public final int b;

    static {
        y2b y2bVar = new y2b("IGNORE_CASE", 0, 2);
        IGNORE_CASE = y2bVar;
        y2b y2bVar2 = new y2b("MULTILINE", 1, 8);
        MULTILINE = y2bVar2;
        y2b y2bVar3 = new y2b("LITERAL", 2, 16);
        LITERAL = y2bVar3;
        y2b y2bVar4 = new y2b("UNIX_LINES", 3, 1);
        UNIX_LINES = y2bVar4;
        y2b y2bVar5 = new y2b("COMMENTS", 4, 4);
        COMMENTS = y2bVar5;
        y2b y2bVar6 = new y2b("DOT_MATCHES_ALL", 5, 32);
        DOT_MATCHES_ALL = y2bVar6;
        y2b y2bVar7 = new y2b("CANON_EQ", 6, 128);
        CANON_EQ = y2bVar7;
        y2b[] y2bVarArr = {y2bVar, y2bVar2, y2bVar3, y2bVar4, y2bVar5, y2bVar6, y2bVar7};
        c = y2bVarArr;
        d = new i04(y2bVarArr);
    }

    public y2b(String str, int i, int i2) {
        this.a = i2;
        this.b = i2;
    }

    public static g04 getEntries() {
        return d;
    }

    public static y2b valueOf(String str) {
        return (y2b) Enum.valueOf(y2b.class, str);
    }

    public static y2b[] values() {
        return (y2b[]) c.clone();
    }

    public int getMask() {
        return this.b;
    }

    public int getValue() {
        return this.a;
    }
}
