package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rfc {
    public static final rfc THUMB;
    public static final rfc TRACK;
    public static final /* synthetic */ rfc[] a;
    public static final /* synthetic */ i04 b;

    static {
        rfc rfcVar = new rfc("THUMB", 0);
        THUMB = rfcVar;
        rfc rfcVar2 = new rfc("TRACK", 1);
        TRACK = rfcVar2;
        rfc[] rfcVarArr = {rfcVar, rfcVar2};
        a = rfcVarArr;
        b = new i04(rfcVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static rfc valueOf(String str) {
        return (rfc) Enum.valueOf(rfc.class, str);
    }

    public static rfc[] values() {
        return (rfc[]) a.clone();
    }
}
