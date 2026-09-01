package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class g9f {
    public static final g9f LIST;
    public static final g9f MAP;
    public static final g9f OBJ;
    public static final g9f POLY_OBJ;
    public static final /* synthetic */ g9f[] a;
    public static final /* synthetic */ i04 b;
    public final char begin;
    public final char end;

    static {
        g9f g9fVar = new g9f("OBJ", 0, '{', '}');
        OBJ = g9fVar;
        g9f g9fVar2 = new g9f("LIST", 1, '[', ']');
        LIST = g9fVar2;
        g9f g9fVar3 = new g9f("MAP", 2, '{', '}');
        MAP = g9fVar3;
        g9f g9fVar4 = new g9f("POLY_OBJ", 3, '[', ']');
        POLY_OBJ = g9fVar4;
        g9f[] g9fVarArr = {g9fVar, g9fVar2, g9fVar3, g9fVar4};
        a = g9fVarArr;
        b = new i04(g9fVarArr);
    }

    public g9f(String str, int i, char c, char c2) {
        this.begin = c;
        this.end = c2;
    }

    public static g04 getEntries() {
        return b;
    }

    public static g9f valueOf(String str) {
        return (g9f) Enum.valueOf(g9f.class, str);
    }

    public static g9f[] values() {
        return (g9f[]) a.clone();
    }
}
