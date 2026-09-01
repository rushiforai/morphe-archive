package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class llc {
    public static final llc FALSE;
    public static final llc INDEX;
    public static final llc MAP_GET_OR_DEFAULT;
    public static final llc NULL;
    public static final /* synthetic */ llc[] b;
    public final Object a;

    static {
        gy2 gy2Var = null;
        llc llcVar = new llc(0, null, "NULL");
        NULL = llcVar;
        llc llcVar2 = new llc(1, -1, "INDEX");
        INDEX = llcVar2;
        llc llcVar3 = new llc(2, Boolean.FALSE, "FALSE");
        FALSE = llcVar3;
        klc klcVar = new klc("MAP_GET_OR_DEFAULT", 3, gy2Var, gy2Var);
        MAP_GET_OR_DEFAULT = klcVar;
        b = new llc[]{llcVar, llcVar2, llcVar3, klcVar};
    }

    public llc(int i, Object obj, String str) {
        this.a = obj;
    }

    public static llc valueOf(String str) {
        return (llc) Enum.valueOf(llc.class, str);
    }

    public static llc[] values() {
        return (llc[]) b.clone();
    }

    public /* synthetic */ llc(String str, int i, Object obj, gy2 gy2Var) {
        this(i, obj, str);
    }
}
