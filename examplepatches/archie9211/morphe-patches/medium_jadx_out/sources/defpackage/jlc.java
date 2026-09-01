package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class jlc {
    public static final jlc OBJECT_PARAMETER_GENERIC;
    public static final jlc OBJECT_PARAMETER_NON_GENERIC;
    public static final jlc ONE_COLLECTION_PARAMETER;
    public static final /* synthetic */ jlc[] a;

    static {
        jlc jlcVar = new jlc("ONE_COLLECTION_PARAMETER", 0);
        ONE_COLLECTION_PARAMETER = jlcVar;
        jlc jlcVar2 = new jlc("OBJECT_PARAMETER_NON_GENERIC", 1);
        OBJECT_PARAMETER_NON_GENERIC = jlcVar2;
        jlc jlcVar3 = new jlc("OBJECT_PARAMETER_GENERIC", 2);
        OBJECT_PARAMETER_GENERIC = jlcVar3;
        a = new jlc[]{jlcVar, jlcVar2, jlcVar3};
    }

    public static jlc valueOf(String str) {
        return (jlc) Enum.valueOf(jlc.class, str);
    }

    public static jlc[] values() {
        return (jlc[]) a.clone();
    }
}
