package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hxd {
    public static final hxd IN_IN_OUT_POSITION;
    public static final hxd NO_CONFLICT;
    public static final hxd OUT_IN_IN_POSITION;
    public static final /* synthetic */ hxd[] a;

    static {
        hxd hxdVar = new hxd("NO_CONFLICT", 0);
        NO_CONFLICT = hxdVar;
        hxd hxdVar2 = new hxd("IN_IN_OUT_POSITION", 1);
        IN_IN_OUT_POSITION = hxdVar2;
        hxd hxdVar3 = new hxd("OUT_IN_IN_POSITION", 2);
        OUT_IN_IN_POSITION = hxdVar3;
        a = new hxd[]{hxdVar, hxdVar2, hxdVar3};
    }

    public static hxd valueOf(String str) {
        return (hxd) Enum.valueOf(hxd.class, str);
    }

    public static hxd[] values() {
        return (hxd[]) a.clone();
    }
}
